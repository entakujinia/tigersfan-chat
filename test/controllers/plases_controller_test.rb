require 'test_helper'

class PlasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plases_index_url
    assert_response :success
  end

end
