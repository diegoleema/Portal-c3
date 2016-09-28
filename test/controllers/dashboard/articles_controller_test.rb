require 'test_helper'

class Dashboard::ArticlesControllerTest < ActionController::TestCase
  setup do
    @dashboard_article = dashboard_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dashboard_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dashboard_article" do
    assert_difference('Dashboard::Article.count') do
      post :create, dashboard_article: {  }
    end

    assert_redirected_to dashboard_article_path(assigns(:dashboard_article))
  end

  test "should show dashboard_article" do
    get :show, id: @dashboard_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dashboard_article
    assert_response :success
  end

  test "should update dashboard_article" do
    patch :update, id: @dashboard_article, dashboard_article: {  }
    assert_redirected_to dashboard_article_path(assigns(:dashboard_article))
  end

  test "should destroy dashboard_article" do
    assert_difference('Dashboard::Article.count', -1) do
      delete :destroy, id: @dashboard_article
    end

    assert_redirected_to dashboard_articles_path
  end
end
