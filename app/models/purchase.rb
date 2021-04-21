class Purchase < ApplicationRecord
  has_many :delivery
  belongs_to :user
  belongs_to :item
end
