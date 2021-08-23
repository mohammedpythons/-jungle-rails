require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "validates to create name, price, and quantity" do
      @category = Category.create(name: "moe")
      @product = Product.create(name: "test", quantity: 23, price: 30, category: @category)

      expect(@product).to be
    end

    it "validates name" do
      @category = Category.create(name: "moe")
      @product = Product.create(name: nil, quantity: 23, price: 30, category: @category)
      expect(@product.errors.full_messages.first).to eq(["Name can't be blank"].first)
    end

    it "validates qantity" do
      @category = Category.create(name: "moe")
      @product = Product.create(name: "test2",price: 30, quantity: nil,  category: @category)
      expect(@product.errors.full_messages.first).to eq(["Quantity can't be blank"].first)
    end

    it "validates price" do
      @category = Category.create(name: "moe")
      @product = Product.create(name: "test2", price: nil, quantity: 30, category: @category)
      puts "this is the message#{@product.errors.full_messages}"
      expect(@product.errors.full_messages).to  eq []
    end

    it "validates price" do
      @category = Category.create(name: "moe")
      @product = Product.create(name: "test2", quantity: 30, price: nil, category: nil)
      expect(@product.errors.full_messages.first).to eq(["Category can't be blank"].first)
    end


  end
end