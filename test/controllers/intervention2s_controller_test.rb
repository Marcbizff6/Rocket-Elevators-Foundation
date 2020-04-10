require 'test_helper'

class Intervention2sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intervention2 = intervention2s(:one)
  end

  test "should get index" do
    get intervention2s_url
    assert_response :success
  end

  test "should get new" do
    get new_intervention2_url
    assert_response :success
  end

  test "should create intervention2" do
    assert_difference('Intervention2.count') do
      post intervention2s_url, params: { intervention2: { column_id: @intervention2.column_id } }
    end

    assert_redirected_to intervention2_url(Intervention2.last)
  end

  test "should show intervention2" do
    get intervention2_url(@intervention2)
    assert_response :success
  end

  test "should get edit" do
    get edit_intervention2_url(@intervention2)
    assert_response :success
  end

  test "should update intervention2" do
    patch intervention2_url(@intervention2), params: { intervention2: { column_id: @intervention2.column_id } }
    assert_redirected_to intervention2_url(@intervention2)
  end

  test "should destroy intervention2" do
    assert_difference('Intervention2.count', -1) do
      delete intervention2_url(@intervention2)
    end

    assert_redirected_to intervention2s_url
  end
end
