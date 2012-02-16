class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|
      t.string :name
      t.integer :gadget_id

      t.timestamps
    end
  end
end
