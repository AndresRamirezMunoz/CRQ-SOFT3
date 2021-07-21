class AddRecuperatorToRecycles < ActiveRecord::Migration[6.1]
  def change
    add_reference :recycles, :recuperator, null: false, foreign_key: true
  end
end
