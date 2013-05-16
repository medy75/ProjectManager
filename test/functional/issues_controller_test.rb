require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  setup do
    @issue = issues(:one)
    @project = projects(:one)
    @update = {
      :title => "Lorem Ipsum",
      :description => "Lorem Ipsum description",
      :status => "sprintlog",
      :label => "test",
      :estimate => 3,
      :points_estimate => 3,
      :project_id => @project.id
    }
  end

  test "should get index" do
    get :index, :project_id => @project.id
    assert_response :success
    assert_not_nil assigns(:issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue" do
    assert_difference('Issue.count') do
      post :create, :project_id => @project, :issue => {:description => @issue.description, :estimate => @issue.estimate, :label => @issue.label, :status => @issue.status, :title => @issue.title }
    end
    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should show issue" do
    get :show, :id => @issue
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, :id => @issue, :project_id => @project
    assert_response :success
  end

  test "should update issue" do
    put :update, :project_id => @project, :id => @issue, :issue => { :description => @issue.description, :estimate => @issue.estimate, :label => @issue.label, :status => @issue.status, :title => @issue.title }
    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should destroy issue" do
    assert_difference('Issue.count', -1) do
      delete :destroy, :id => @issue, :project_id => @project
    end

    assert_redirected_to issues_path
  end
end
