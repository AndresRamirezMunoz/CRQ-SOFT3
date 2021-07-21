class AddRecuperatorToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_reference :appointments, :recuperator, null: false, foreign_key: true
  end
end
