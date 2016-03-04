require 'rails_helper'

describe Api::V1::UsersController do

  let(:user) { FactoryGirl.create(:user) }

  let(:headers) { {'X-User-Email': user.email, 'X-User-Token': user.authentication_token, HTTP_ACCEPT: 'application/json'} }
  let(:no_headers) { {HTTP_ACCEPT: 'application/json'} }
  describe 'POST /apr/v1/users/sign_in' do
    before { FactoryGirl.create_list(:user, 3) }

    describe 'GET /api/v1/users' do
      it 'should return list of users' do
        get '/api/v1/users', {}, headers
        collection = []
        User.all.each do |user|
          collection << {id: user.id,
                         user_name: user.user_name,
                         created_at: user.created_at,
                         profile: api_v1_user_url(user)}
        end
        expected_response = {users: collection}
        expect(response_json).to eq JSON.parse(expected_response.to_json)
      end

      it 'should require authentication' do
        get '/api/v1/users', {}, no_headers
        expect(response_json['error']).to eq 'You need to sign in or sign up before continuing.'
        expect(response.status).to eq 401
      end


    end
  end
end

