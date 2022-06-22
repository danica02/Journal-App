require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should not save task without title" do
    @task = Task.new(title: nil)
    assert_not @task.save
  end
end
