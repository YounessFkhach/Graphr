class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.datetime  :date
      t.float     :temperature
      t.float     :humidite
      t.float     :pryrano
      t.float     :v_vent
      t.float     :d_vent
      t.float     :precipitation
      t.float     :vpd
      t.float     :eto_index

      t.references :station

      t.timestamps
    end
  end
end
