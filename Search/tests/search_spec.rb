
require_relative '../search'

RSpec.describe Search do

  let(:books_api) { FakeBooksAPI.new }
  let(:search) { Search.new(books_api) }

  it "should receive and send a search request" do
    search.for("common search request")

    expect(books_api.request_received).to eq "common search request"
  end

  it "should send nothing if keyword is empty" do
    results = search.for("")

    expect(books_api.request_received).to eq "nothing"
  end

  it "should return search results" do
    results = search.for("answers")

    expect(results).to eq "answers results"
  end

end

class FakeBooksAPI

  attr_reader :last_request

  def search(keyword)
    @last_request = keyword
    
    keyword + " results"
  end

  def request_received
    last_request
  end

end
