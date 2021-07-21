class Type < ApplicationRecord
  has_many :appointments
  has_many :recycles
end
