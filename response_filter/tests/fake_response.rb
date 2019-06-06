
class FakeResponse

  def for(keyword)
    return '{
        "kind": "books",
        "totalItems": 3,
        "items": [
          {
            "title": "' + keyword + '",
            "authors": [
              "Jean-Pierre Serre"
            ],
            "industryIdentifiers": [
              {
                "type": "ISBN_10",
                "identifier": "4571245203"
              },
              {
              "type": "ISBN_13",
              "identifier": "9783540442370"
              }
            ],
            "imageLink": "http://books.google.com/books/content?id=MOAqeoYlBMQC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
          }, {
            "title": "Big ' + keyword + '",
            "authors": [
              "Jean-Pierre Serre second"
            ],
            "industryIdentifiers": [
              {
                "type": "ISBN_10",
                "identifier": "3540442375"
              },
              {
              "type": "ISBN_13",
              "identifier": "5461257841059"
              }
            ],
            "imageLink": "http://books.google.com/books/content?id=MOAqeoYlBMQC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
          }, {
            "title": "small ' + keyword + '",
            "authors": [
              "Jean-Pierre Serre third"
            ],
            "industryIdentifiers": [
              {
                "type": "ISBN_10",
                "identifier": "3045704512"
              },
              {
              "type": "ISBN_13",
              "identifier": "9764001245316"
              }
            ],
            "imageLink": "http://books.google.com/books/content?id=MOAqeoYlBMQC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
          }
        ]
      }'

  end

end
