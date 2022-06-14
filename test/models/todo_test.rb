require "test_helper"

class TodoTest < ActiveSupport::TestCase
  setup do
    @todo = Todo.new
    @cat_todo = todos(:cat_task)
    @fish_todo = todos(:fish_task)
  end


  test "should save todo" do
    assert @todo.save
  end

  test "should find todo" do
    @todo.title = "Make dinner"
    @todo.completed = false
    @todo.save

    expected_todo = Todo.find(@todo.id)
    assert_equal(expected_todo.title, @todo.title)
    assert_equal(expected_todo.completed, @todo.completed)
  end

  test "should delete todo" do
    @todo.save
    assert_difference("Todo.count", -1) do
      @todo.destroy
    end

  end

  test "should update todo" do

    cat_update_title = "Feed Misty"
    @cat_todo.update({
      title: cat_update_title
    })
    assert_equal(cat_update_title, @cat_todo.title)
  end

  test "should be completed when true" do
    @cat_todo = todos(:cat_task)
    assert_equal(@cat_todo.get_todo_status(), "Completed")
  end

  test "should be in progress when false" do
    assert_equal(@fish_todo.get_todo_status(), "In Progress")
  end
end
