package com.eval.coronakit.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.eval.coronakit.entity.CoronaKit;
import com.eval.coronakit.entity.KitDetail;
import com.eval.coronakit.entity.ProductMaster;
import com.eval.coronakit.service.CoronaKitService;
import com.eval.coronakit.service.KitDetailService;
import com.eval.coronakit.service.ProductService;

@Controller

@RequestMapping("/user")
public class UserController {
	@Autowired
	HttpSession session;

	@Autowired
	ProductService productService;

	@Autowired
	CoronaKitService coronaKitService;

	@Autowired
	KitDetailService kitDetailService;

	@RequestMapping("/home")
	public String home() {
		return "user-home";
	}

	@RequestMapping("/show-list")
	public String showList(Model model) {
		model.addAttribute("products", productService.getAllProducts());
		return "show-all-item-user";
	}

	@RequestMapping("/add-to-cart/{productId}")
	public String showKit(@PathVariable("productId") int productId) {
		String view = "redirect:/user/show-kit";
		@SuppressWarnings("unchecked")
		Map<Integer, KitDetail> userKit = (Map<Integer, KitDetail>) session.getAttribute("cart");
		if (userKit == null) {
			userKit = new HashMap<Integer, KitDetail>();
			session.setAttribute("cart", userKit);
		}

		if (userKit.containsKey(productId)) {
			KitDetail kit = userKit.get(productId);
			int newQty = kit.getQuantity() + 1;
			kit.setQuantity(newQty);
			kit.setAmount(productService.getProductById(productId).getCost() * newQty);
		} 
		else {
			ProductMaster product = productService.getProductById(productId);
			if (product != null) {
				KitDetail kit = new KitDetail();
				kit.setProductId(productId);
				kit.setQuantity(1);
				kit.setAmount(product.getCost());
				userKit.put(productId, kit);
			}else {
				view = "redirect:/custom-error";
			}
		}
		return view;
	}

	@RequestMapping("/show-kit")
	public String showKit(Model model) {
		@SuppressWarnings("unchecked")
		Map<Integer, KitDetail> userKit = (Map<Integer, KitDetail>) session.getAttribute("cart");
		if (userKit != null) {
			List<ProductMaster> prod = new ArrayList<ProductMaster>();
			userKit.forEach((k, v) -> prod.add(productService.getProductById(k)));
			model.addAttribute("products", prod);
		}
		return "show-cart";
	}

	@RequestMapping("/delete/{itemId}")
	public String deleteItem(@PathVariable("itemId") int itemId) {
		@SuppressWarnings("unchecked")
		Map<Integer, KitDetail> userKit = (Map<Integer, KitDetail>) session.getAttribute("cart");
		if (userKit != null) {
			if (userKit.containsKey(itemId)) {
				userKit.remove(itemId);
			}
		}
		return "redirect:/user/show-kit";
	}

	@RequestMapping("/checkout")
	public String checkout(Model model) {
		return "checkout-address";
	}

	@RequestMapping(value = "/finalize")
	public String finalizeOrder(@RequestParam("address") String address,@RequestParam("contact") String contact,@RequestParam("email") String email, Model model) {
		String username = null;
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) 
		{
		   UserDetails userPrincipal = (UserDetails)authentication.getPrincipal(); 
		   username =  userPrincipal.getUsername();
		 }
		@SuppressWarnings("unchecked")
		HashMap<Integer, KitDetail> userKit = (HashMap<Integer, KitDetail>) session.getAttribute("cart");
		if (userKit != null) 
		{
			int totalAmount = 0;
			for (KitDetail kit : userKit.values()) 
			{
				totalAmount += kit.getAmount();
			}
			CoronaKit finalCoronaKit = new CoronaKit();
			finalCoronaKit.setDeliveryAddress(address);
			finalCoronaKit.setOrderDate(LocalDateTime.now().toString());
			finalCoronaKit.setTotalAmount(totalAmount);
			finalCoronaKit = coronaKitService.saveKit(finalCoronaKit);
			for (KitDetail kit : userKit.values()) {
				kit.setCoronaKitId(finalCoronaKit.getId());
				kitDetailService.addKitItem(kit);
			}
			
			model.addAttribute("username", username);
			model.addAttribute("totalAmount", totalAmount);
			model.addAttribute("address", address);
			model.addAttribute("email", email);
			model.addAttribute("contact", contact);
			
			List<ProductMaster> prod = new ArrayList<ProductMaster>();
			userKit.forEach((k, v) -> prod.add(productService.getProductById(k)));
			model.addAttribute("product", prod);
			model.addAttribute("kit", userKit);
			
		}
		return "show-summary";
	}

}
