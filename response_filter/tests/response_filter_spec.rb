
require_relative '../response_filter'
require_relative 'fake_response'

RSpec.describe ResponseFilter do

  let(:response_filter) { ResponseFilter.new }
  let(:expected_response) { ExpectedResponse.new }
  let(:incoming_response) { FakeIncomingResponse.new }

  it "should filter a response" do
    incoming_response.for("boats")
    response_filtered = response_filter.handle(incoming_response)

    expect(valid_json?(response_filtered)).to eq true
    expect(response_filtered).to eq expected_response.for("boats")
  end

  def valid_json?(json)
    JSON.parse(json)
    return true
  rescue JSON::ParserError => e
    return false
  end

end

class ExpectedResponse

  def for(keyword)
    return response(keyword)
  end

  def response(keyword)
    response  = '{"kind":"books", "totalItems":3, "items": [{"title":"boats","image":["Jean-Pierre Serre"]}, {"title":"Big boats","image":["Jean-Pierre Serre second"]}, {"title":"small boats","image":["Jean-Pierre Serre third"]}]}'

    return response
  end
end

class FakeIncomingResponse

  attr_reader :keyword

  def for(keyword)
    @keyword = keyword
  end

  def body
    return '{
        "kind": "books",
        "totalItems": 3,
        "items": [
          {
            "title": "' + @keyword + '",
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
          },{
            "title": "Big ' + @keyword + '",
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
          },{
            "title": "small ' + @keyword + '",
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
