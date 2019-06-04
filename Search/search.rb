
class Search

  attr_reader :books_api
  attr_reader :response_filter

  def initialize(books_api, response_filter)
    @books_api = books_api
    @response_filter = response_filter
  end

  def for(keyword)
    response = books_api.look_for(keyword)
    response_filter.handle(response)
  end

end
