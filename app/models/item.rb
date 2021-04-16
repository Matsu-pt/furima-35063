class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :status

  with_options presence: true do
    validates :image, :name, :explanation, :category_id, :status_id, :shipping_day_id, :shipping_area_id, :delivery_fee_id,
              :price, :user_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    allow_blank: true
  validates :price, format: { with: /\A[0-9]+\z/ }, allow_blank: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id, :status_id
  end
end
