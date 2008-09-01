require "lib/roxml"

class Book
  include ROXML

  xml_attribute :isbn, :from => 'ISBN'
  xml_text :title
  xml_text :description, :as => :cdata
  xml_text :author
end

class Author
  include ROXML

  xml_attribute :role
  xml_text :text, :as => :text_content
end

class BookWithAuthors
  include ROXML

  xml_attribute :isbn
  xml_text :title
  xml_text :description, :as => :cdata
  xml_text :authors, :as => :array, :from => 'author'
end

class BookWithAuthorTextAttribute
  include ROXML

  xml_attribute :isbn
  xml_text :title
  xml_text :description, :as => :cdata
  xml_object :author, Author
end

class Contributor
  include ROXML

  xml_attribute :role
  xml_text :name
end

class BookWithContributions
  include ROXML

  xml_name :book
  xml_attribute :isbn
  xml_text :title
  xml_text :description
  xml_object :contributions, Contributor, :as => :array, :in => "contributions"
end

class BookWithContributors
  include ROXML

  xml_name :book
  xml_attribute :isbn
  xml_text :title
  xml_text :description
  xml_object :contributors, Contributor, :as => :array
end

class NamelessBook
  include ROXML

  xml_attribute :isbn
  xml_text :title
  xml_text :description
  xml_object :contributors, Contributor, :as => :array
end

class Publisher
  include ROXML

  xml_text :name
end

class BookWithPublisher
  include ROXML

  xml_name :book
  xml_attribute :isbn
  xml_text :title
  xml_text :description
  xml_object :publisher, Publisher
end

class BookPair
  include ROXML

  xml_attribute :isbn
  xml_text :title
  xml_text :description
  xml_text :author
  xml_object :book, Book
end

class Library
  include ROXML

  xml_text :name
  xml_object :books, BookWithContributions, :as => :array
end

class UppercaseLibrary
  include ROXML

  xml_name :library
  xml_text :name, :from => 'NAME'
  xml_object :books, BookWithContributions, :as => :array, :from => 'BOOK'
end

class LibraryWithNamelessBooks
  include ROXML

  xml_text :name
  xml_object :books, NamelessBook, :as => :array
end

class Person
  include ROXML

  xml_text :name, :as => :text_content
end