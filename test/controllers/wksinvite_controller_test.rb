require 'test_helper'

class WksinviteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wksinvite_index_url
    assert_response :success
  end

end
