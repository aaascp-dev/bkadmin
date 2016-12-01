require 'test_helper'

class GlassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @glass = glasses(:one)
  end

  test "should get index" do
    get glasses_url
    assert_response :success
  end

  test "should get new" do
    get new_glass_url
    assert_response :success
  end

  test "should create glass" do
    assert_difference('Glass.count') do
      post glasses_url, params: { glass: {  } }
    end

    assert_redirected_to glass_url(Glass.last)
  end

  test "should show glass" do
    get glass_url(@glass)
    assert_response :success
  end

  test "should get edit" do
    get edit_glass_url(@glass)
    assert_response :success
  end

  test "should update glass" do
    patch glass_url(@glass), params: { glass: {  } }
    assert_redirected_to glass_url(@glass)
  end

  test "should destroy glass" do
    assert_difference('Glass.count', -1) do
      delete glass_url(@glass)
    end

    assert_redirected_to glasses_url
  end
end
