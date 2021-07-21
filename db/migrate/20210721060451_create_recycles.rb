class CreateRecycles < ActiveRecord::Migration[6.1]
  def change
    create_table :recycles do |t|
      t.string :weight

      t.timestamps
    end
  end
end
