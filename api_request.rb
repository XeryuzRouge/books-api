require 'httparty'

class APIRequest

  def self.book_search(book_name)
    response = HTTParty.get('https://www.googleapis.com/books/v1/volumes?q=' + book_name)
    response.body
  end

end
