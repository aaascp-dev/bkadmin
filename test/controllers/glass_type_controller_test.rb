require 'test_helper'

class GlassTypeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get glass_type_index_url
    assert_response :success
  end

end
