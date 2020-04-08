class Building < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  has_many :interventions
  has_many :batteries
  has_many :building_details
end
