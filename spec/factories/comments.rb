FactoryGirl.define do
  factory :comment do
    # product {rand(Product.count).ceil}
    body {Faker::Hipster.sentence}
    star {rand(5).ceil}
    # user {rand(User.count).ceil}
  end
end
