require 'test_helper'

class ProjectMembersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_member" do
    assert_difference('ProjectMember.count') do
      post :create, :project_member => { }
    end

    assert_redirected_to project_member_path(assigns(:project_member))
  end

  test "should show project_member" do
    get :show, :id => project_members(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => project_members(:one).id
    assert_response :success
  end

  test "should update project_member" do
    put :update, :id => project_members(:one).id, :project_member => { }
    assert_redirected_to project_member_path(assigns(:project_member))
  end

  test "should destroy project_member" do
    assert_difference('ProjectMember.count', -1) do
      delete :destroy, :id => project_members(:one).id
    end

    assert_redirected_to project_members_path
  end
end
