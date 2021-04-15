class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :derivery_fee, :shipping_area, :shipping_day, :status, :user
  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :explanation, :category_id, :status_id, :shipping_day_id, :shipping_area_id, :delivery_fee_id, :price, :user_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, allow_blank: true
  validates :price, format: { with: /\A[0-9]+\z/ }, allow_blank: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id, :status_id
  end
end
