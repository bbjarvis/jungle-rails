require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validation" do
    
    it "product with all four fields set will save" do
      @category = Category.new
      @product = Product.new
      @product.category = @category
      @product.name = "Foghat"
      @product.price = 100
      @product.quantity = 50
      @product.save!
      expect(@product.category).to be_present
      expect(@product.name).to be_present
      expect(@product.price).to be_present
      expect(@product.quantity).to be_present

    end
    # validates :name, precense: true
    it "returns error if name is blank" do
      @category = Category.new
      @product = Product.new
      @product.category = @category
      @product.name = nil
      @product.price = 100
      @product.quantity = 50
      @product.validate
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end
    # validates :price, presence: true
    it "returns error if price is blank" do
      @category = Category.new
      @product = Product.new
      @product.category = @category
      @product.name = "Foghat"
      @product.price = nil
      @product.quantity = 50
      @product.validate
      expect(@product.errors.full_messages).to eq([
        "Price cents is not a number",
        "Price is not a number",
        "Price can't be blank"])
    end
    # validates :quantity, presence: true
    it "returns error if quantity is blank" do
      @category = Category.new
      @product = Product.new
      @product.category = @category
      @product.name = "Foghat"
      @product.price = 100
      @product.quantity = nil
      @product.validate
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    # validates :category, presence: true
    it "returns error if category is blank" do
      @category = Category.new
      @product = Product.new
      @product.category = nil
      @product.name = "Foghat"
      @product.price = 100
      @product.quantity = 50
      @product.validate
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end
  end
end
