require 'test_helper'

class IncrivelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get incrivel_index_url
    assert_response :success
  end

end
