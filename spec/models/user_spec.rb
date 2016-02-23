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

  describe 'Skills tags' do
    let(:user) {create(:user)}

    it 'adds a single skill' do
      user.skill_list.add('java-script')
      expect(user.skill_list).to include /java-script/
    end

    it 'adds multiple skills' do
      user.skill_list.add('java-script', 'ruby', 'dev ops')
      expect(user.skill_list).to eq ['java-script', 'ruby', 'dev ops']
    end
  end

  describe 'unify' do
    let(:user_1) {User.create(user_name: 'Thomas')}
    let(:user_2) {User.create(user_name: 'Anders')}
    let(:user_3) {User.create(user_name: 'Kalle')}

    before do
      user_1.skill_list.add('java-script, testing, ruby', parse: true)
      user_2.skill_list.add('java-script, java, html', parse: true)
      user_3.skill_list.add('java, html', parse: true)
      user_1.save
      user_2.save
    end

    it 'unifies by skill' do
      expect(user_1.unify).to include(user_2)
    end

    it 'does not unify if no common skill' do
      expect(user_1.unify).not_to include(user_3)
    end

  end

end
