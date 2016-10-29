require 'test_helper'

class HomeworkResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homework_results_index_url
    assert_response :success
  end

end
