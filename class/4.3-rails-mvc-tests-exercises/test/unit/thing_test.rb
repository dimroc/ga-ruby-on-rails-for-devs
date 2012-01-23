require 'test_helper'

class ThingTest < ActiveSupport::TestCase
  
  setup do
    @thing = things(:first)
  end
     
  test "create!" do
    assert_difference(lambda { Thing.count }, 1) do
      Thing.create! name: "New Thing"
    end
  end

  test "find" do
    thing = Thing.find(@thing.id)
    assert_equal things(:first).id, thing.id
  end

  test "update_attributes" do
    assert @thing.update_attributes({description: "updated"})
    assert_equal Thing.find(@thing.id).description, "updated"
  end

  test "destroy" do
    assert_difference(lambda { Thing.count }, -1) do
      Thing.first.destroy
    end
  end

  test "name is required" do
    assert ! Thing.new.valid?
    assert Thing.new({name: "name"}).valid?
  end

  test "name is unique" do
    assert ! Thing.new({name: @thing.name}).valid?
  end

end
