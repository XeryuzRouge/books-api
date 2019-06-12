require 'json'

class Response

  attr_reader :content

  def initialize(api_response_body)
    @content = JSON.parse(api_response_body)
  end

  def library
    # '{"hello" : "goodbye"}'
    print("JSON?: " + getBooks(content))
    result = getBooks(content)
  end

  private

  def getBooks(elements)
    result = ""

    elements.each do |element, content|
      if(element == "items")
      result += bookshelf(content)
      end
    end
    result
  end

  def bookshelf(books)
    result = open_json
    
    books.each do |book|
      result += volume_info(book)
    end

    result = close_json(result)
    result
  end

  def volume_info(elements)
    result = ''
    elements.each do |element, info|
      if(element == "volumeInfo")

        info.each do |element, value|
          if(element == "title")
            result += title(value)
          elsif(element == "pageCount")
            result += pages_count(value)
          end
        end

        result = result.chomp(', ') if(result[-2,2] == ", ")

        result += "}, "
      end
    end

    return result
  end

  def open_json
    return '{"Books" : ['
  end

  def close_json(json)
    json = json.chomp(', ')
    json += ']}'
    return json
  end

  def title(value)
    return '{"Title" : "' + value + '", '
  end

  def pages_count(value)
    return '"Pages" : "' + value.to_s + '"'
  end

end
