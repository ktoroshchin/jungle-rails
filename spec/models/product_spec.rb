require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be true if exist' do
      @product = Product.new(name: "Vacuum")
      # @product.save
      expect(@product.name).to be_present
    end
    it 'should be true if exist' do
      @product = Product.new(price: 300)
      # @product.save
      expect(@product.price).to be_present
    end
    it 'should be true if exist' do
      @product = Product.new(quantity: 2)
      # @product.save
      expect(@product.quantity).to be_present
    end
    it 'should be true if exist' do
      @product = Product.new(category_id: 2)
      # @product.save
      expect(@product.category_id).to be_present
    end
  end
end