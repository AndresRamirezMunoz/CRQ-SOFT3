class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :adress, :string
    add_column :users, :phone, :string
  end
end
