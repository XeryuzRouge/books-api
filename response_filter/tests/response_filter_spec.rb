
require_relative '../response_filter'
require_relative 'google_books_response'
require_relative 'react_format'

RSpec.describe ResponseFilter do

  let(:filter) { ResponseFilter.new }

  let(:react_format) { ReactFormat.new }
  let(:books_api) { GoogleBooksResponse.new }

  it "should filter Google Books response to React JSON format" do
    books_api.set_for("trees")

    response_to_react = filter.for(books_api)

    expect(valid_json?(response_to_react)).to eq true
    expect(response_to_react).to eq react_format.for("trees")
  end

  it "should not validate fields" do
    books_api.set_for("")

    response_to_react = filter.for(books_api)

    expect(valid_json?(response_to_react)).to eq true
    expect(response_to_react).to eq react_format.for("")
  end

  def valid_json?(json)
    JSON.parse(json)
    return true
    rescue JSON::ParserError => e
      return false
  end

end
