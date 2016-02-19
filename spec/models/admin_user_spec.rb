require 'rails_helper'

describe AdminUser, :type => :model do
    
  it 'should be of class AdminUser' do
    expect(subject.class).to eq AdminUser
  end
  
  it 'should be valid' do
    expect(FactoryGirl.create(:admin_user)).to be_valid
  end
  
  it 'should have an email address' do
    expect(FactoryGirl.build(:admin_user, email: "")).to_not be_valid
  end
  
  it 'should not have an invalid email address' do
    emails = ['asdf@ ds.com', '@example.com', 'test me @yahoo.com', 'asdf@example', 'ddd@.d. .d', 'ddd@.d' ]
    emails.each do |email|
      expect(FactoryGirl.build(:admin_user, email: email)).to_not be_valid 
    end
  end
  
  it 'should have a valid email address' do
    emails = ['asdf@ds.com', 'hello@example.uk', 'test1234@yahoo.si', 'asdf@example.eu' ]
    emails.each do |email|
      expect(FactoryGirl.build(:admin_user, email: email)).to be_valid 
    end      
  end
 
  it 'should have a password' do
    expect(FactoryGirl.build(:admin_user, password: "")).to_not be_valid
  end
  
  it 'should not have a password shorter than 6 chars' do
    expect(FactoryGirl.build(:admin_user, password: "aaa")).to_not be_valid
  end
  
  it 'should have a unique email address' do
    expect(FactoryGirl.create(:admin_user, email: "admin@admin.com")).to be_valid
    expect(FactoryGirl.build(:admin_user, email: "admin@admin.com")).to_not be_valid
  end
  
  describe '#login_column' do
    it 'should return a email column' do
      expect(AdminUser.login_column).to eq :email    
    end
  end
end