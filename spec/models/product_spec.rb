require 'rails_helper'

RSpec.describe Product, type: :model do
 # We're using `describe` in here to define a group of test examples for
 # model validations
 describe "validations" do

   # you use `it` or `specify` to define a test example. The first arguement
   # to `it` is a string that describes what you want to test. You write your
   # test within a block you pass to the `it`
   it "requires a title" do
     # GIVEN: campaign with no title
     p = Product.new

     # WHEN: we validate the campaign
     validation_outcome = p.valid?

     # THEN: validation_outcome is false
     expect(validation_outcome).to eq(false)
   end

   it "requires a price" do
     # GIVEN: campaign with no goal
     p = Product.new

     # WHEN: we validate the campaign
     p.valid?
     # puts ">>>>>>>> #{c.errors.inspect}"
     # THEN: There is an error on :goal
     expect(p.errors).to have_key(:price)
   end

   it "requires a unique title" do
     p = Product.new title: "hello", price:11, sale_price:5
     p.save
     p1 = Product.new title: "hello", price: 11, sale_price:5
     p1.valid?
     expect(p1.errors).to have_key(:title)
   end

   it "sale_price is present" do
      p = Product.new title: "hello", price:11
      p.valid?
      puts p.errors.full_messages
      expect(p.errors).to have_key(:sale_price)
   end

   it "is no input for sale_price set it equal price" do
      p = Product.new title: "hello", price:11
      puts p.price
      p.valid?
      # p.default_price
      expect(p.sale_price).to eq(p.price)
   end

   it "sale_price must be greater than price" do
     p = Product.new title: "hello", price:11, sale_price:20
     p.valid?
     puts p.errors.full_messages
     expect(p.errors).to have_key(:sale_price)
   end

   it "is on sale return true" do
     p = Product.new title: "hello", price:11, sale_price:5
     expect(p.on_sale?).to eq(true)
   end

   it "is not on sale return false" do
     p = Product.new title: "hello", price:11, sale_price:11
     p.default_price
     expect(p.on_sale?).to eq(false)
   end
 end
end
