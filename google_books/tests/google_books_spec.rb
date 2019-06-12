
require_relative '../google_books'

RSpec.describe GoogleBooks do

  let(:google_books) { GoogleBooks.new }

  it "should send request and receive response from Google Books API" do
    response = google_books.search("anything")
    parsed = JSON.parse response.body

    expect(response.code).to eq 200
    expect(valid_json?(response.body)).to eq true
    expect(response.body.include?('"kind": "books#volumes"')).to eq true
  end

  it "should send Google Books API response to the React acceptable format" do
    response = google_books.search("harry potter")
    books = reactFormat(JSON.parse response.body)

    expect(books.fromList[0]).to eq "Harry Potter y la piedra filosofal"
  end

  it "should receive missing query error when no search is requested" do
    response = google_books.search("")
    parsed = JSON.parse response.body

    expect(response.code).to eq 400
    expect(valid_json?(response.body)).to eq true
    expect(response.body.include?('"Missing query."')).to eq true
  end

  def valid_json?(json)
    JSON.parse(json)
    return true
    rescue JSON::ParserError => e
    return false
  end

  def reactFormat(json)
    books = Books.new
    json["items"].each do |item|
      books.add(item["volumeInfo"]["title"])
    end

    return books
  end

  def firstBook
    return "Harry Potter y la piedra filosofal"
  end

end

class Books

  attr_reader :list

  def initialize
    @list = Array.new
  end

  def add(item)
    @list.push(item)
  end

  def fromList
    return @list
  end
end
