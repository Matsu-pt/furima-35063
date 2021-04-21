class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :shipping_area_id, :municipality, :address, :build, :phone_number, :purchase,
                :token

  with_options presence: true do
    validates :item_id, :user_id, :municipality, :address, :phone_number
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :postal_code
    validates :token
  end

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ },  allow_blank: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }, allow_blank: true

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address,
                    build: build, phone_number: phone_number, purchase: purchase)
  end
end
