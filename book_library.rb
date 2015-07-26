class Library
  attr_accessor :shelves

  def initialize shelves
    @shelves = shelves
  end

  def library_list
    @shelves.each_with_index do |shelf, i|
      puts "Shelf ##{i}"
      shelf.shelf_list
      puts
    end
  end


end

class Shelf
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end

  def remove_book(book)
    @books.delete(book)
  end

  def shelf_list
    @books.each do |book|
      puts book
    end
  end
end


class Book
  attr_accessor :book_title, :book_author, :shelf, :book_list

  def initialize book_title, book_author, shelf
    @book_title = book_title
    @book_author = book_author
    enshelf(shelf)
    @book_list = []
  end

  def to_s
    "#{@book_title} by #{@book_author}"
  end

  def enshelf(shelf)
    shelf.add_book(self)
    @shelf = shelf
  end

  def unshelf(shelf)
    shelf.remove_book(self)
    @shelf = nil
  end
end

shelf1 = Shelf.new
shelf2 = Shelf.new

harry_potter = Book.new("Harry Potter", "J.K. Rowling", shelf1)
hubger_games = Book.new("Hunger Games", "Suzane Collins", shelf1)
twilight = Book.new("Twilight", "Stephanie Meyer", shelf1)
mocking_bird = Book.new("How To Kill A Mockingbird", "Harper Lee", shelf2)
shades_grey = Book.new("50 Shades Of Grey", "E L James", shelf2)


puts 'Welcome to my book library!'
puts 'Adding files to the library shelves'

puts 'Shelf 1'
shelf1.shelf_list
puts ''

puts 'Shelf 2'
shelf2.shelf_list
puts ''

puts 'Adding test to Shelf 1'
shelf1.add_book("test")
shelf1.shelf_list
puts ''

puts 'Removing Test & Harry Potter from Shelf1'
shelf1.remove_book(harry_potter)
shelf1.remove_book("test")
puts ''

puts 'Printing books left'

library = Library.new([shelf1, shelf2])
puts
library.library_list


