FactoryBot.define do
  factory :item do
    user
    name        { Faker::Name.name }
    explanation { Faker::Lorem.sentence }
    price       { 1000 }
    category_id { 2 }
    status_id   { 2 }
    delivery_fee_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/task.jpeg'), filename: 'task_image.jpeg')
    end
  end
end
