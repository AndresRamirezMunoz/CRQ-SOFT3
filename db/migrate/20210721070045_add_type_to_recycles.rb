class AddTypeToRecycles < ActiveRecord::Migration[6.1]
  def change
    add_reference :recycles, :type, null: false, foreign_key: true
  end
end
