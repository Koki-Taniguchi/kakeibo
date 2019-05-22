require 'test_helper'

class RecodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recode = recodes(:one)
  end

  test "should get index" do
    get recodes_url
    assert_response :success
  end

  test "should get new" do
    get new_recode_url
    assert_response :success
  end

  test "should create recode" do
    assert_difference('Recode.count') do
      post recodes_url, params: { recode: { category: @recode.category, date: @recode.date, name: @recode.name } }
    end

    assert_redirected_to recode_url(Recode.last)
  end

  test "should show recode" do
    get recode_url(@recode)
    assert_response :success
  end

  test "should get edit" do
    get edit_recode_url(@recode)
    assert_response :success
  end

  test "should update recode" do
    patch recode_url(@recode), params: { recode: { category: @recode.category, date: @recode.date, name: @recode.name } }
    assert_redirected_to recode_url(@recode)
  end

  test "should destroy recode" do
    assert_difference('Recode.count', -1) do
      delete recode_url(@recode)
    end

    assert_redirected_to recodes_url
  end
end
