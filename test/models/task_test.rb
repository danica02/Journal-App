require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should not save task without title" do
    @task = Task.new(title: nil)
    assert_not @task.save
  end

  test "shoud not save if existing task title on same category id" do
    task = Task.new(title: "Test", category_id:1)
    assert task.save
    task = Task.new(title: "Test", category_id:1)
    assert_not task.save
  end
end
