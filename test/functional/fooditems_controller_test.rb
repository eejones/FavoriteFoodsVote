require 'test_helper'

class FooditemsControllerTest < ActionController::TestCase
  setup do
    @fooditem = fooditems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fooditems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fooditem" do
    assert_difference('Fooditem.count') do
      post :create, :fooditem => { :name => @fooditem.name, :score => @fooditem.score, :totalvotes => @fooditem.totalvotes }
    end

    assert_redirected_to fooditem_path(assigns(:fooditem))
  end

  test "should show fooditem" do
    get :show, :id => @fooditem
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fooditem
    assert_response :success
  end

  test "should update fooditem" do
    put :update, :id => @fooditem, :fooditem => { :name => @fooditem.name, :score => @fooditem.score, :totalvotes => @fooditem.totalvotes }
    assert_redirected_to fooditem_path(assigns(:fooditem))
  end

  test "should destroy fooditem" do
    assert_difference('Fooditem.count', -1) do
      delete :destroy, :id => @fooditem
    end

    assert_redirected_to fooditems_path
  end
end
