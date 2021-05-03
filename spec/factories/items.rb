FactoryBot.define do
  factory :item do
    name                { 'test' }
    description         { 'あいうえお' }
    price               { 300 }
    category_id         { 3 }
    status_id           { 3 }
    prefecture_id       { 3 }
    shipping_cost_id    { 3 }
    shipping_day_id     { 3 }
                 
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
