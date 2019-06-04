
class BooksAPI

  attr_reader :searching_word

  def last_search_requested
    searching_word
  end

  def look_for(keyword)
    @searching_word = keyword
    return keyword
  end

end
