FactoryGirl.define do
  factory :product do
    title {Faker::Name.name}
    price {rand(1..20)}
    sale_price {price}
  end
end
