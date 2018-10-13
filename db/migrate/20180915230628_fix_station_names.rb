class FixStationNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :stations, :name, :ui_name
    rename_column :stations, :display_name, :name

  end
end
