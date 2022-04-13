require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject{
    described_class.new(firstname: 'Bob', lastname: 'John', email: 'bobjohn@gmail.com', password: 'bob111', password_confirmation: 'bob111')
  }

  describe 'user validations' do
    it "is valid with firstname, lastname, email and same password and password_confirmation " do
      expect(subject).to be_valid
    end
    
    it "is not valid without first name " do
      subject.firstname= nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Firstname can't be blank"
    end

    it "is not valid without last name " do
      subject.lastname= nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Lastname can't be blank"
    end

    it "is not valid without email " do
      subject.email= nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Email can't be blank"
    end

    it "is not valid without a password " do
      subject.password= nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Password can't be blank"
    end

    it "is not valid without password confirmation" do
      subject.password_confirmation= nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to include "Password confirmation can't be blank"
    end
  end

  describe 'password should match password confirmation' do
    it "is not valid if password and password confirmation are not the same" do
      subject.password_confirmation= 'bob123'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to include "doesn't match Password"
    end
  end

  describe 'Email uniqueness and is not case sensitive' do 
    it "is not valid if email is existing" do
      user = User.new(firstname: 'Bobb', lastname: 'John', email: 'bobjohn@gmail.com', password: '12345', password_confirmation: '12345')
      user.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Email has already been taken"
    end

    it "is not valid if email is same but different cases" do
      user = User.new(firstname: 'Bobb', lastname: 'John', email: 'BobJohn@gmail.com', password: '12345', password_confirmation: '12345')
      user.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Email has already been taken"
    end
  end

  describe 'Password minimum length' do
    it "is not valid if password length is less than 5" do
      subject.password= '1234'
      subject.password_confirmation= '1234'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Password is too short (minimum is 5 characters)"
    end
  end

  
  describe '.authenticate_with_credentials' do
    it "is valid with the correct email and password" do
      user = User.new(firstname: 'Bobb', lastname: 'John', email: 'bobjohn@gmail.com', password: '12345', password_confirmation: '12345')
      user.save
      result = User.authenticate_with_credentials('bobjohn@gmail.com','12345')
      expect(result).to_not eq(nil)
    end

    it "is not valid with wrong password" do
      user = User.new(firstname: 'Bobb', lastname: 'John', email: 'bobjohn@gmail.com', password: '12345', password_confirmation: '12345')
      user.save
      result = User.authenticate_with_credentials('bobjohn@gmail.com','12346')
      expect(result).to be(nil)
    end

    it "is not valid with wrong email" do
      user = User.new(firstname: 'Bobb', lastname: 'John', email: 'bobjohn@gmail.com', password: '12345', password_confirmation: '12345')
      user.save
      result = User.authenticate_with_credentials('bob@gmail.com','12345')
      expect(result).to be(nil)
    end

    it "is valid if email address input includes spaces" do
      user = User.new(firstname: 'Bobb', lastname: 'John', email: 'bobjohn@gmail.com', password: '12345', password_confirmation: '12345')
      user.save
      result = User.authenticate_with_credentials(' bobjohn@gmail.com ','12345')
      expect(result).to_not eq(nil)
    end

    it "is valid if email address in wrong case" do
      user = User.new(firstname: 'Bobb', lastname: 'John', email: 'bobjohn@gmail.com', password: '12345', password_confirmation: '12345')
      user.save
      result = User.authenticate_with_credentials('BOBjohn@gmail.com','12345')
      expect(result).to_not eq(nil)
    end
  
  end

end
