require 'test_helper'

class RrsControllerTest < ActionController::TestCase
  setup do
    @rr = rrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rr" do
    assert_difference('Rr.count') do
      post :create, rr: { response: @rr.response, url: @rr.url }
    end

    assert_redirected_to rr_path(assigns(:rr))
  end

  test "should show rr" do
    get :show, id: @rr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rr
    assert_response :success
  end

  test "should update rr" do
    put :update, id: @rr, rr: { response: @rr.response, url: @rr.url }
    assert_redirected_to rr_path(assigns(:rr))
  end

  test "should destroy rr" do
    assert_difference('Rr.count', -1) do
      delete :destroy, id: @rr
    end

    assert_redirected_to rrs_path
  end
end
