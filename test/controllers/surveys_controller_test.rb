require 'test_helper'

class SurveysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get surveys_new_url
    assert_response :success
  end

end
