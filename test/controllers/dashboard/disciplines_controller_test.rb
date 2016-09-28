require 'test_helper'

class Dashboard::DisciplinesControllerTest < ActionController::TestCase
  setup do
    @dashboard_discipline = dashboard_disciplines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dashboard_disciplines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dashboard_discipline" do
    assert_difference('Dashboard::Discipline.count') do
      post :create, dashboard_discipline: {  }
    end

    assert_redirected_to dashboard_discipline_path(assigns(:dashboard_discipline))
  end

  test "should show dashboard_discipline" do
    get :show, id: @dashboard_discipline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dashboard_discipline
    assert_response :success
  end

  test "should update dashboard_discipline" do
    patch :update, id: @dashboard_discipline, dashboard_discipline: {  }
    assert_redirected_to dashboard_discipline_path(assigns(:dashboard_discipline))
  end

  test "should destroy dashboard_discipline" do
    assert_difference('Dashboard::Discipline.count', -1) do
      delete :destroy, id: @dashboard_discipline
    end

    assert_redirected_to dashboard_disciplines_path
  end
end
