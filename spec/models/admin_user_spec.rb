require 'rails_helper'

describe AdminUser, :type => :model do
    
  before(:each) do 
    @admin  = build(:admin_user)
  end
  
  it 'should be valid' do
     expect(@admin).to be_valid
  end
  it 'should have an email address' do
    @admin.email = ""
    expect(@admin).to_not be_valid
  end
  
  it 'should not have an invalid email address' do
    emails = ['asdf@ ds.com', '@example.com', 'test me @yahoo.com', 'asdf@example', 'ddd@.d. .d', 'ddd@.d' ]
    emails.each do |email|
      @admin.email = email
      expect(@admin).to_not be_valid 
    end
  end
  
  it 'should have a valid email address' do
    emails = ['asdf@ds.com', 'hello@example.uk', 'test1234@yahoo.si', 'asdf@example.eu' ]
    emails.each do |email|
      @admin.email = email
      expect(@admin).to be_valid 
    end      
  end
 
  it 'should have a password' do
    admin = build(:admin_user, password: "")
    expect(admin).to_not be_valid
  end
  
  it 'should not have a password shorter than 6 chars' do
    admin = build(:admin_user, password: "aaa")
    expect(admin).to_not be_valid
  end
  
  describe '#login_column' do
    it 'should return a email column' do
      expect(AdminUser.login_column).to eq :email    
    end
  end
end