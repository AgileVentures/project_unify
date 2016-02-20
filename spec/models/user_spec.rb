require 'rails_helper'

RSpec.describe User, type: :model do

  it 'should be of class User' do
    expect(subject.class).to eq User
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :user_name }
  end

  describe 'Fixtures' do

    it 'should have valid Fixture Factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end

  end

end
