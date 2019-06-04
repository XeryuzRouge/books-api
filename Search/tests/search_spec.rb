
require_relative '../search'
require_relative 'books_api'
require_relative 'fake_response_handler'

RSpec.describe Search do

  let(:books_api) { BooksAPI.new }
  let(:response_handler) { FakeResponseHandler.new }
  let(:search) { Search.new(books_api, response_handler) }

  it "should send keyword to BooksAPI" do
    search.for("Ham")
    expect(books_api.last_search_requested).to eq "Ham"
  end

  it "should do a search with a keyword" do
    trees_results =
        '{"Big trees": {"Pages": 300", "MoreInfo": "big trees are cool" }, ' +
        '"Small trees": {"Pages": "200"}}'

    response_handler.set_next_results(trees_results)

    response = search.for("trees")
    expect(response).to eq trees_results
  end

end
