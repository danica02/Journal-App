require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "should not save category without name" do
    @category = Category.new(name: nil)
    assert_not @category.save
  end

end
