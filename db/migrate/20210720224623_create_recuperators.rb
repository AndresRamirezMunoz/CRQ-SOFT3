class CreateRecuperators < ActiveRecord::Migration[6.1]
  def change
    create_table :recuperators do |t|
      t.string :nit
      t.string :fullname
      t.string :phone
      t.string :adress

      t.timestamps
    end
  end
end
