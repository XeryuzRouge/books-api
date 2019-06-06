
require 'httparty'

class GoogleBooks

  attr_reader :base_url

  def initialize
    @base_url = "https://www.googleapis.com/books/v1/volumes?q="
  end

  def look_for(keyword)
    HTTParty.get(base_url + keyword + "&maxResults=2")
  end

end
