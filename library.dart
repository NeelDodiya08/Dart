import 'dart:async';

class Library {
  final Map<String, bool> books = {
    'Flutter Basics': true,
    'Dart Programming': true,
    'Python Guide': false,
  };

  Future<String?> searchBook(String bookName) async {
    await Future.delayed(Duration(seconds: 1));

    for (String book in books.keys) {
      if (book.toLowerCase() == bookName.toLowerCase()) {
        print("Book found: $book");
        return book;
      }
    }

    print("Book not found!");
    return null;
  }

  Future<bool> checkAvailability(String bookName) async {
    await Future.delayed(Duration(seconds: 1));

    bool available = books[bookName] ?? false;

    if (available) {
      print("Book is available.");
    } else {
      print("Book is not available.");
    }

    return available;
  }

  Future<void> issueBook(String bookName) async {
    await Future.delayed(Duration(seconds: 1));

    if (books[bookName] == true) {
      books[bookName] = false;
      print("Book issued successfully: $bookName");
      print("Book status updated to: Issued");
    } else {
      print("Cannot issue book. It is unavailable.");
    }
  }

  Future<void> returnBook(String bookName) async {
    await Future.delayed(Duration(seconds: 1));

    if (books.containsKey(bookName)) {
      if (books[bookName] == false) {
        books[bookName] = true;
        print("Book returned successfully: $bookName");
        print("Return details: Book received by library.");
        print("Book status updated to: Available");
      } else {
        print("This book has not been issued.");
      }
    } else {
      print("Book not found in the library.");
    }
  }

  Future<void> showStatus(String bookName) async {
    await Future.delayed(Duration(seconds: 1));

    if (books.containsKey(bookName)) {
      String status =
      books[bookName]! ? "Available" : "Issued";
      print("Current book status: $status");
    } else {
      print("Book not found.");
    }
  }
}

Future<void> runLibrarySystem() async {
  Library library = Library();

  String bookName = "Flutter Basics";

  print("===== Library Book Management System =====");
  print("Searching for: $bookName");

  String? book = await library.searchBook(bookName);

  if (book != null) {
    bool available = await library.checkAvailability(book);

    if (available) {
      await library.issueBook(book);
      await library.showStatus(book);
      await library.returnBook(book);
      await library.showStatus(book);
    }
  }

  print("===== Library Operations Completed =====");
}