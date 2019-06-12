
require_relative '../google_books'

RSpec.describe GoogleBooks do

  let(:google_books) { GoogleBooks.new }

  it "should send a request and receive a response from Google Books API" do
    response = google_books.search("Anything")

    expect(response.code).to eq 200
    expect(valid_json?(response.body)).to eq true
    expect(response.body.include?('"kind": "books#volumes"')).to eq true
  end

  it "should receive missing query error when no search is requested" do
    response = google_books.search("")

    expect(response.code).to eq 400
    expect(response.body.include?('"Missing query."')).to eq true
  end

  def valid_json?(json)
    JSON.parse(json)
    return true
    rescue JSON::ParserError => e
    return false
  end

end
