
require_relative '../google_books/google_books'

class Search

  attr_reader :books_api

  def initialize(books_api = GoogleBooks.new)
    @books_api = books_api
  end

  def for(keyword)
    keyword = "nothing" if(keyword.empty?)
    
    books_api.search(keyword)
  end

end
