// 📌 In-Class Lab Exercise (LW3): Library Book Management System - 5 points

// Task Description:
// Write a Dart script to manage a library book collection using classes and collection methods (.where, .fold).

// Requirements:
// 1. Create class Book:
// • Properties: title (String), author (String), price (double), isBorrowed (bool, default false)

// 2. Create class Library:
// • Private field: List<Book> _books = []
// • Method addBook(Book book): Adds a book to library
// • Method getAvailableBooks(): Uses .where() to filter and return books where isBorrowed == false
// • Method getTotalValue(): Uses .fold() to calculate and return total price of all books in library

// 3. Main Execution:
// • Create a Library instance, add 3-4 sample books, print available books and total collection value


class Book {
  String title;
  String author;
  double price;
  bool isBorrowed = false;

  Book({
    required this.title,
    required this.author,
    required this.price,
    this.isBorrowed = false,
  });
}

class Library {
  List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  List<Book> getAvailableBooks() {
      return _books.where((book) => book.isBorrowed == false).toList();
    }

  double getTotalValue() {
    return _books.fold(0.0, (total, book) => total + book.price);
  }
}

void main() {
  Library myLibrary = Library();

  myLibrary.addBook(Book(title: "1984", author: "George Orwell", price: 15.99));
  myLibrary.addBook(Book(title: "To Kill a Mockingbird", author: "Harper Lee", price: 12.49));
  myLibrary.addBook(Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", price: 10.99, isBorrowed: true));
  myLibrary.addBook(Book(title: "Pride and Prejudice", author: "Jane Austen", price: 9.99));

  print('Available Books:');
  for (var book in myLibrary.getAvailableBooks()) {
    print('- ${book.title} by ${book.author} (\$${book.price})');
  }
  print('\nTotal value of Collection: ${myLibrary.getTotalValue()}');
}



// 🏠 Homework 3: Digital E-Commerce Media Store - 5 points

// Task Description:
// Build an Object-Oriented Domain Model for a Digital Media Store using abstract classes, mixins, and collection methods.

// Requirements:
// 1. Abstract Class MediaItem:
// • Properties: id (String), title (String), price (double)
// • Abstract method: String getDetails()

// 2. Subclasses Audiobook and EBook:
// • Audiobook: inherits MediaItem, adds durationHours (double), narrator (String)
// • EBook: inherits MediaItem, adds fileSizeMB (double), author (String)
// • Implement getDetails() in both subclasses

// 3. Mixin Downloadable:
// • Method: void download(String title) -> prints downloading message
// • Apply Downloadable mixin to both Audiobook and EBook using 'with'

// 4. Class ShoppingCart:
// • Private field: List<MediaItem> _items = []
// • Method addItem(MediaItem item): adds item to cart
// • Method calculateTotalWithTax({double taxRate = 0.12}): uses .fold() to sum prices and add 12% tax
// • Method filterByMaxPrice(double maxPrice): uses .where() to filter items <= maxPrice
// • Method printReceipt(): prints items details and calls download() for Downloadable items



abstract class MediaItem {
  String id;
  String title;
  double price;

  MediaItem(this.id, this.title, this.price);

  String getDetails();
}

class Audiobook extends MediaItem with Downloadable {
  double durationHours;
  String narrator;

  Audiobook(String id, String title, double price, this.durationHours, this.narrator)
      : super(id, title, price);

  @override
  String getDetails() {
    return "Audiobook: $title by $narrator, Duration: ${durationHours}h, Price: \$${price}";
  }
}

class EBook extends MediaItem with Downloadable {
  double fileSizeMB;
  String author;

  EBook(String id, String title, double price, this.fileSizeMB, this.author)
      : super(id, title, price);

  @override
  String getDetails() {
    return "EBook: $title by $author, File Size: ${fileSizeMB}MB, Price: \$${price}";
  }
}

mixin Downloadable on MediaItem {
  void download() {
    print("Downloading $title...");
  }
}

class ShoppingCart {
  List<MediaItem> _items = [];

  void addItem(MediaItem item) {
    _items.add(item);
  }

  double calculateTotalWithTax({double taxRate = 0.12}) {
    double total = _items.fold(0.0, (sum, item) => sum + item.price);
    return total * (1 + taxRate);
  }

  List<MediaItem> filterByMaxPrice(double maxPrice) {
    return _items.where((item) => item.price <= maxPrice).toList();
  }

  void printReceipt() {
    print("Receipt:");
    for (var item in _items) {
      print(item.getDetails());
      if (item is Downloadable) {
        item.download(); 
      }
    }
    double totalWithTax = calculateTotalWithTax();
    print("Total with Tax: \$${totalWithTax.toStringAsFixed(2)}");
  }
  void main() {
    ShoppingCart cart = ShoppingCart();

    cart.addItem(Audiobook("A1", "The Great Gatsby", 10.99, 5.5, "F. Scott Fitzgerald"));
    cart.addItem(EBook("E1", "1984", 8.99, 2.0, "George Orwell"));
    cart.addItem(Audiobook("A2", "To Kill a Mockingbird", 12.49, 6.0, "Harper Lee"));
    cart.addItem(EBook("E2", "Pride and Prejudice", 9.99, 1.5, "Jane Austen"));

    print("Available items in the cart:");
    for (var item in cart._items) {
      print("- ${item.title} (\$${item.price})");
    }

    print("\nTotal value of the cart with tax: \$${cart.calculateTotalWithTax().toStringAsFixed(2)}");

    print("\nItems filtered by max price of \$10:");
    for (var item in cart.filterByMaxPrice(10)) {
      print("- ${item.title} (\$${item.price})");
    }

    print("\nPrinting receipt:");
    cart.printReceipt();
  }
}