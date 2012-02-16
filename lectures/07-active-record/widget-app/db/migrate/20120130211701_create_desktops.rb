class CreateDesktops < ActiveRecord::Migration
  def change
    create_table :desktops do |t|
      t.string :os

      t.timestamps
    end
  end
end
