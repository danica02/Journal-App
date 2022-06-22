require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "should not save category without name" do
    @category = Category.new(name: nil)
    assert_not @category.save
  end

  test "shoud not save if existing name on same user" do
    category = Category.new(name: "Test", user_id:1)
    assert category.save
    category = Category.new(name: "Test", user_id:1)
    assert_not category.save
  end

end
