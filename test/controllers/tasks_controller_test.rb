require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:user)
    @category = categories(:category)
    @task = tasks(:task)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_category_task_url(@category, @task)
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post category_tasks_url(@category), params: { task: { date: @task.date, notes: "Task2 Note", title: "Task2" } }
    end

    assert_redirected_to category_path(@category)
  end

  test "should show task" do
    get category_task_url(@category, @task)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_task_url(@category, @task)
    assert_response :success
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete category_task_url(@category, @task)
    end

    assert_redirected_to category_url(@category)
  end
end
