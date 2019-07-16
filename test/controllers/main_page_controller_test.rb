require 'test_helper'

class MainPageControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get main_page_dashboard_url
    assert_response :success
  end

end
