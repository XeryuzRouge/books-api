
class GoogleBooksResponse

  attr_reader :keyword

  def set_for(keyword)
    @keyword = keyword
  end

  def body
    return '{' +
    '"kind": "books#volumes", "totalItems": 2, "items": [' +
      '{' +
        '"kind": "books#volume",' +
        '"volumeInfo": {' +
          '"title": "' + @keyword + '",' +
          '"authors": [' +
            '"Jean-Pierre Serre"' +
          '],' +
          '"industryIdentifiers": [' +
            '{' +
              '"type": "ISBN_10",' +
              '"identifier": "4571245203"' +
            '},' +
            '{' +
            '"type": "ISBN_13",' +
            '"identifier": "9783540442370"' +
            '}' +
          '],' +
          '"imageLinks": {' +
            '"thumbnail": "http://books.google.com/books/content?id=MOAqeoYlBMQC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"' +
          '}' +
        '}' +
      '}, ' +
      '{' +
          '"kind": "books#volume",' +
          '"volumeInfo": {' +
            '"title": "Big ' + @keyword + '",' +
            '"authors": [' +
              '"Jon-Pierre Serre"' +
            '],' +
            '"industryIdentifiers": [' +
              '{' +
                '"type": "ISBN_10",' +
                '"identifier": "4571245204"' +
              '},' +
              '{' +
              '"type": "ISBN_13",' +
              '"identifier": "9783540442371"' +
              '}' +
            '],' +
            '"imageLinks": {' +
              '"thumbnail": "http://books.google.com/books/content?id=MOAqeoYlBMQC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"' +
            '}' +
          '}' +
        '}' +
      ']' +
    '}'
  end

end
