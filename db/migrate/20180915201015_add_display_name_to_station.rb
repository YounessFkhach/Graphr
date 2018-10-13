class AddDisplayNameToStation < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :display_name, :string
  end
end
