
require_relative '../google_books/google_books'
require_relative '../response_filter/response_filter'

class Search

  attr_reader :books_api
  attr_reader :filter

  def initialize(books_api = GoogleBooks.new, filter = ResponseFilter.new)
    @books_api = books_api
    @filter = filter
  end

  def for(keyword)
    keyword = "nothing" if(keyword.empty?)
    
    response = books_api.search(keyword)
    filter.for(response)
  end

end
