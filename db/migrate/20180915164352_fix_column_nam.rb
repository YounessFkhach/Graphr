class FixColumnNam < ActiveRecord::Migration[5.1]
  def change
    rename_column :records, :pryrano, :pyrano
  end
end
