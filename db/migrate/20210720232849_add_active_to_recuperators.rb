class AddActiveToRecuperators < ActiveRecord::Migration[6.1]
  def change
    add_column :recuperators, :active, :boolean
  end
end
