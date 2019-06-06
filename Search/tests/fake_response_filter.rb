
class FakeResponseFilter

  attr_reader :results

  def handle(response)
    return results
  end

  def set_next_results(mocked_results)
    @results = mocked_results
  end

end
