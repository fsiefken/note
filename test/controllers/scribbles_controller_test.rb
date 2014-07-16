require 'test_helper'

class ScribblesControllerTest < ActionController::TestCase
  setup do
    @scribble = scribbles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scribbles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scribble" do
    assert_difference('Scribble.count') do
      post :create, scribble: { content: @scribble.content, created: @scribble.created, published: @scribble.published, tags: @scribble.tags, title: @scribble.title }
    end

    assert_redirected_to scribble_path(assigns(:scribble))
  end

  test "should show scribble" do
    get :show, id: @scribble
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scribble
    assert_response :success
  end

  test "should update scribble" do
    patch :update, id: @scribble, scribble: { content: @scribble.content, created: @scribble.created, published: @scribble.published, tags: @scribble.tags, title: @scribble.title }
    assert_redirected_to scribble_path(assigns(:scribble))
  end

  test "should destroy scribble" do
    assert_difference('Scribble.count', -1) do
      delete :destroy, id: @scribble
    end

    assert_redirected_to scribbles_path
  end
end
