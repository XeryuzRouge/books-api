
class Search

  attr_reader :books_api
  attr_reader :response_handler

  def initialize(books_api, response_handler)
    @books_api = books_api
    @response_handler = response_handler
  end

  def for(keyword)
    response = books_api.lookFor(keyword)
    response_handler.handle(response)
  end

end
