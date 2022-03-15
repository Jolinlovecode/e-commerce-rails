require "rails_helper"

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      cat1 = Category.create name: 'Apparel'
      @product=cat1.products.create({
        name:  'Women\'s Zebra pants',
        quantity: 18,
        price: 12499
      })
    end 

    it "product should be valid" do
      expect(@product).to be_valid
    end

    it 'Product Validations product should not be valid when name is nil' do
      @product.name=nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages) == "Name can't be blank"
    end

    it 'Product Validations product should not be valid when price is nil' do
      @product.price_cents=nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages) == "Price cents is not a number"
    end

    it 'Product Validations product should not be valid when quantity is nil' do
      @product.quantity=nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages) == "Quantity can't be blank"
    end
    
    it 'Product Validations product should not be valid when category is nil' do
      @product.category=nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages) == "Category can't be blank"
    end

  end
end