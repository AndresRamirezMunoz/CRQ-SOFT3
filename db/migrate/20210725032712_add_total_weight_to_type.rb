class AddTotalWeightToType < ActiveRecord::Migration[6.1]
  def change
    add_column :types, :totalWeight, :integer
  end
end
