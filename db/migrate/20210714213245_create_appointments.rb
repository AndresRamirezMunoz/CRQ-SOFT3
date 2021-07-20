class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :adress
      t.string :phone
      t.datetime :date
      t.boolean :athonme

      t.timestamps
    end
  end
end
