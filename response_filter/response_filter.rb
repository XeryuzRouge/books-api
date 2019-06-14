
class ResponseFilter

  def for(google_response)
    filtered(google_response.body)
  end

  private

  def filtered(response)
    response = JSON.parse(response)
    results = main_info(response)

    return results.to_json
  end

  def main_info(response)
    filtered_response = Hash.new

    filtered_response[:kind] = "books"
    filtered_response[:totalItems] = response['totalItems']
    filtered_response[:items] = books_list(response)

    return filtered_response
  end

  def books_list(response)
    books = Array.new

    response['items'].each do |book_info|
      book = Hash.new

      volume_info = book_info['volumeInfo']

      book[:title] = volume_info['title']
      book[:authors] = volume_info['authors']
      book[:ISBN] = industry_identifier(volume_info['industryIdentifiers'])
      book[:image] = volume_info['imageLinks']['thumbnail']

      books << book
    end

    return books
  end

  def industry_identifier(identifiers)
    identifiers.each do |identifier_info|
      return identifier_info['identifier'] if(identifier_info['type'] == "ISBN_13") 
    end
  end

end
