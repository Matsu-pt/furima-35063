FactoryBot.define do
  factory :purchase_delivery do
    postal_code { '123-4567' }
    shipping_area_id { 2 }
    municipality { '市区町村' }
    address { '番地1-1-1'}
    phone_number { '09099990000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
