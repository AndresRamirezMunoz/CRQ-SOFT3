class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :type
  belongs_to :recuperator

  paginates_per 10
end
