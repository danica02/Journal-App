require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should not save task without title" do
    @task = Task.new(title: nil)
    assert_not @task.save
  end

  test "shoud not save if existing name on same user" do
    task = Task.new(title: "Test", category_id:1)
    assert category.save
    category = Category.new(title: "Test", category_id:1)
    assert_not category.save
  end
end
