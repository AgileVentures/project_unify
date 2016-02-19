require 'rails_helper'

describe AdminUser, :type => :model do
    
  it 'require the email' do
    admin  = build(:admin_user, email: "")
    expect(admin).to_not be_valid
  end
    
end