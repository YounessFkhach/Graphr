class FixStationNames2 < ActiveRecord::Migration[5.1]
  def change
    rename_column :stations, :ui_name, :display_name
  end
end
