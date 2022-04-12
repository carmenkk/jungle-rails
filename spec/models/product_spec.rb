require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    let(:category) {
      Category.create(name: "newCategory")
    }
    subject {
      category.products.create(name: "test", price_cents: 500, quantity: 20,)
    }

    it "is valid when create a product" do
      expect(subject).to be_valid
    end

  
    it "is not valid with no name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Name can't be blank"
    end

  
    it "is not valid with no price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Price can't be blank"
    end

    it "is not valid with no quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Quantity can't be blank"
    end

    it "is not valid with no category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Category can't be blank"
    end

  end
end