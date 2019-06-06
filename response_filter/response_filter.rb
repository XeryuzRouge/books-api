
require 'json'

class ResponseFilter

  def handle(response)
    return filtered(response.body)
  end

  private

  def filtered(response)
    response = JSON.parse(response)

    results = main_info(response)
    results += books_list(response)

    results += ']}'

    return results
  end

  def main_info(response)
    results = '{'
    results += '"kind":"books", '
    results += '"totalItems":' + response['totalItems'].to_s + ', '
  end

  def books_list(response)
    list = '"items": ['
    books = ""

      response['items'].each do |item|
        book = Hash.new

        book[:title] = item['title']
        book[:image] = item['authors']

        books += (book.to_json).to_s
        books += ", "
      end

      list += books.chomp(", ")

      return list

    end

end
