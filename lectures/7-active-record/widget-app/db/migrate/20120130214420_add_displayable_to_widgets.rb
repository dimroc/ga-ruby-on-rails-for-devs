class AddDisplayableToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :displayable_id, :integer

    add_column :widgets, :displayable_type, :string

  end
end
