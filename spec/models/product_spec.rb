require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save  product' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', price: 100, quantity: 10, category: @category)
      expect(@product).to be_valid
    end

    it 'should not save a product without name' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: nil, price: 100, quantity: 10, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should not save a product without price' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', quantity: 10, category: @category)
      expect(@product).to_not be_valid
      # puts @product.errors.full_messages
    end

    it 'should not save a product without a q' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', price: 100, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should not save a product without a category' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', price: 100, quantity: 10, category: nil)
      expect(@product).to_not be_valid
    end
  end
end