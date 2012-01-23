require "test_helper"

class ThingsControllerTest < ActionController::TestCase

    # controller

    test "create" do
      assert_difference lambda { Thing.count }, 1 do
        post :create, thing: { name: "new thing" }
      end
      assert_redirected_to thing_path assigns(:thing)
    end

    test "index" do
      get :index
      assert_response :success
      assert_equal assigns(:things), Thing.all
    end

    test "new" do
      get :new
      assert_response :success
      assert assigns(:thing).is_a?(Thing)
    end

    test "edit" do
      get :edit,  id: things(:first).id
      assert_response :success
      assert_equal assigns(:thing), things(:first)
    end

    test "show" do
      get :show, id: things(:first).id
      assert_response :success
      assert_equal assigns(:thing), things(:first)
    end

    test "update" do
      put :update, id: things(:first).id, thing: { description: "updated" }
      assert_equal Thing.find(things(:first).id).description, "updated"
      assert_redirected_to thing_path things(:first)
    end

    test "destroy" do
      assert_difference lambda { Thing.count }, -1 do
        delete :destroy, id: things(:first).id
      end
      assert_redirected_to things_path
    end

    # view

    test "index view" do
      get :index
      assert_select "table  th", "Name"
      Thing.all.each do |thing|
        assert_select "table tr td", thing.name
        assert_select "table tr td a", text: "Edit", href: edit_thing_path(thing)
        assert_select "table tr td a", text: "Destroy", href: "/things/#{thing.id}", method: :destroy
      end
      assert_select "a", text: "New Thing", href: new_thing_path
    end
    
    test "edit view" do
      thing = things(:first)
      get :edit, id: thing.id
      assert_select "form[action=/things/#{thing.id}]" do
        assert_select "input#thing_name"
        assert_select "input#thing_description"
      end
    end

    test "show view" do
      thing = things(:first)
      get :show, id: thing.id
      assert_select "h1", thing.name
      assert_select "h2", thing.description
      assert_select "a", text: "Edit", href: edit_thing_path(@thing)
      assert_select "a", text: "Back", href: things_path
    end
    
    # route

    test "route index" do
      assert_routing "/things", { controller: "things", action: "index" }
    end

    test "route new" do
      assert_routing "/things/new", { controller: "things", action: "new" }
    end

    test "route show" do
      assert_routing "/things/1", { controller: "things", action: "show", id: "1" }
    end

    test "route edit" do
      assert_routing "/things/1/edit", { controller: "things", action: "edit", id: "1" }
    end

    test "route update" do
      assert_routing({ method: "PUT", path: "/things/1" }, { controller: "things", action: "update", id: "1" })
    end

    test "route destroy" do
      assert_routing({ method: "DELETE", path: "/things/1" }, { controller: "things", action: "destroy", id: "1" })
    end

    test "route create" do
      assert_routing({ method: "POST", path: "/things" }, { controller: "things", action: "create" })
    end

end

