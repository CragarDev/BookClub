package com.cragardev.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cragardev.bookclub.models.Book;
import com.cragardev.bookclub.models.LoginUser;
import com.cragardev.bookclub.models.User;
import com.cragardev.bookclub.services.BookService;
import com.cragardev.bookclub.services.UserService;



@Controller
public class HomeController {

	
	//
	// Inject the services
	//
	private final UserService userService;
	private final BookService bookService;
	
	
	
	//
	// service constructors
	//
	
	public HomeController(UserService userService, BookService bookService) {
		super();
		this.userService = userService;
		this.bookService = bookService;
	}



	//
    // ========= /, Landing, home, index page 1 ===========
    //
	@GetMapping("/")
    public String index() {
//		System.out.println("****************************");

        return "index.jsp";
    }
	


	//
	// ========= /, Landing, home, index page 1 ===========
	//
	@GetMapping("/home")
	public String home() {
		
		return "index.jsp";
	}
	
	
	//
	// ========= dashboard page  ===========
	//
	@GetMapping("/dashboard")
	public String dashboard(
			Model model,
			HttpSession session,
			RedirectAttributes redirectAttributes) {
		
		// check to see if user is logged in

		if (session.getAttribute("user_id") == null) {
			// if not in session, redirect to login
			return "redirect:/createError";
		}
		
		// Get users info to show them logged in
		model.addAttribute("user", userService.findUser((Long)session.getAttribute("user_id")));
		
		// Send all the books to the JSP using Model model
		model.addAttribute("books", bookService.allBooks());
		
		// Send all our users to the JSP using Model model
		model.addAttribute("users", userService.allUsers());
		
		return "dashboard.jsp";
	}
	
	
	
	//
	// ========= oneBookDetails page  ===========
	//
	@GetMapping("/oneBookDetails/{id}") // don't forget the id....
	public String oneBookDetails(
			@PathVariable(value = "id") Long id,
			Model model,
			HttpSession session) {
		
//		System.out.println("*********************************");
//		System.out.println(id);
//		System.out.println("*********************************");
		
		// check to see if user is logged in
		if (session.getAttribute("user_id") == null) {
			// if not in session, redirect to login
			return "redirect:/createError";
		}
		
		// send Plant to JSP
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		
		// Get users info to show them logged in
		model.addAttribute("logged_user", userService.findUser((Long)session.getAttribute("user_id")));
			
		return "oneBookDetails.jsp";
	}
	
	
	//
	// ========= One User Details page ===========
	//
	@GetMapping("/oneUserDetails/{id}")
	public String oneUserDetails(
			@PathVariable(value = "id") Long id,
			Model model,
			HttpSession session) {

		// check to see if user is logged in
		if (session.getAttribute("user_id") == null) {
			// if not in session, redirect to login
			return "redirect:/createError";
		}
		
		model.addAttribute("LoggedUser", userService.findUser((Long)session.getAttribute("user_id"))); 
		
		// send User to JSP
		User user = userService.findUser(id);
		model.addAttribute("user", user);

			
		return "oneUserDetails.jsp";
	}
	
	
	
	// ------------------------------------------------ CREATE NEW BOOK -----------
	//
	// ========= createNewBook page  ===========
	//
	@GetMapping("/createNewBook")
	public String createNewBook(@ModelAttribute("book") Book book,
			Model model,
			HttpSession session) {
		
		// check to see if user is logged in

		if (session.getAttribute("user_id") == null) {
			// if not in session, redirect to login
			return "redirect:/createError";
		}
		
		// send all Users to the JSP
		model.addAttribute("allUsers", userService.allUsers());
		
		// get logged in user id from session to grab that users info
		Long user_id = (Long) session.getAttribute("user_id");
		
		// send logged in User to JSP
		User user = userService.findUser(user_id);
		model.addAttribute("user", user);

		return "createNewBook.jsp";
	}
	
	//
	// ========= Create New Book PROCESS ===========
	//
	@PostMapping("/createNewBook")
	public String createNewBookProcess(
			@Valid @ModelAttribute("book") Book book,
			BindingResult result,
			Model model) {
		
		/// check to see if input is valid
		if (result.hasErrors()) {
			model.addAttribute("book", book);
			model.addAttribute("allUsers", userService.allUsers());
			return "createNewBook.jsp";
		} else {
			bookService.createBook(book);
			return "redirect:/dashboard";
		}
	}
	
	//
	// ========= updateBook page  ===========
	//
	@GetMapping("/updateBook/{id}")
	public String updateBook(
			@PathVariable("id") Long id,
			@ModelAttribute("book") Book book,
			Model model, HttpSession session) {
		
		// check to see if user is logged in
		if (session.getAttribute("user_id") == null) {
			// if not in session, redirect to login
			return "redirect:/createError";
		}
		
		// add all users to the JSP
		model.addAttribute("allUsers", userService.allUsers());
		
		// add the book to update to the JSP
		model.addAttribute("book", bookService.findBook(id));

		
		return "updateBook.jsp";
	}
	

	//
	// ========= Update Book PROCESS ===========
	//
	@RequestMapping(value = "/updateBook/{id}", method = RequestMethod.PUT)
	public String updateBookProcess(
			@Valid 
			@ModelAttribute("book") Book book,
			BindingResult result,
			Model model) {

		if (result.hasErrors()) {
			model.addAttribute("allUsers", userService.allUsers());
			return "updateBook.jsp";
		} else {

			bookService.updateBook(book);
			return "redirect:/dashboard";
		}
	}
	
	// ---------------------------------------- DELETE ----------
	//
	// ========= Delete PROCESS ===========
	//
	@GetMapping("/deleteBook/{id}") // add an Id
	public String deleteBook(@PathVariable("id") Long id) {

		bookService.deleteBook(id);

		return "redirect:/dashboard";
	}

    
	// **************************************************************************************************************
    //
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  LOGIN REGISTRATION  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //
    // **************************************************************************************************************
    

	@GetMapping("/login")
	public String login(Model model, HttpSession session) {

		// Bind empty User and LoginUser objects to the JSP
		// to capture the form input
		session.invalidate();
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}

	@PostMapping("/login")
	public String loginProcess(
			@Valid @ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result,
			Model model,
			HttpSession session) {

		// Add once service is implemented:
		// User user = userServ.login(newLogin, result);
		User user = userService.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.
		session.setAttribute("user_id", user.getId());

		return "redirect:/dashboard";
	}

	@PostMapping("/register")
	public String registerProcess(
			@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result,
			Model model,
			HttpSession session) {

		// TO-DO Later -- call a register method in the service
		// to do some extra validations and create a new user!
		userService.register(newUser, result);

		if (result.hasErrors()) {
			// Be sure to send in the empty LoginUser before
			// re-rendering the page.
			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.

		session.setAttribute("user_id", newUser.getId());

		return "redirect:/dashboard";
	}

	// Log out user
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";

	}
	

	//
	// ================== ERRORS ==========================
	//
	@RequestMapping("/createError")
	public String flashMessages(RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("error", "Please log in or Register!");
		return "redirect:/login";
	}

    
    
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	
	
	
	
	
	
	
}
