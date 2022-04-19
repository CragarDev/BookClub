package com.cragardev.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.cragardev.bookclub.models.Book;
import com.cragardev.bookclub.repostories.BookRepository;



@Service
public class BookService {
	
	// Book Repo
	
	private final BookRepository bookRepo;

	public BookService(BookRepository bookRepo) {
		super();
		this.bookRepo = bookRepo;
	}
	
	
	//
	// Find All Books
	//
	public List<Book> allBooks() {
		return bookRepo.findAll();
	}
	
	//
	// Create Book
	//
	public Book createBook(Book book) {
		return bookRepo.save(book);
		
	}
	
	//
	// Find One Book
	//
	public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}
	
	//
	// Update Book
	//
	public Book updateBook(Book book) {
		return bookRepo.save(book);
		
	}
	
	
	//
	// Delete Book
	//
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
		
	}

}
