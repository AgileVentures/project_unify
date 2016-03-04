require 'rails_helper'

describe Api::V1::SessionsController do

  let(:user) { FactoryGirl.build(:user) }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }

  describe 'POST /apr/v1/users/sign_in' do

    before { user.save }

    describe 'user log in' do
      it 'valid credentials returns user & token' do
        post '/api/v1/users/sign_in', {user:{email:"#{user.email}", password:"#{user.password}"}}, headers


        #{'X-User-Email' => user.email, 'X-User-Token' => user.authentication_token, 'HTTP_ACCEPT' => 'application/json' }

        expect(response_json).to eq('message' => 'success',
                                     'user' => {
                                        'id' => user.id,
                                        'user_name' => user.user_name,
                                        'email' => user.email,
                                        'mentor' => false,
                                        'token' => user.authentication_token
                                    })
        expect(user.authentication_token).to_not be nil
      end

      it 'invalid password returns error message' do
        post '/api/v1/users/sign_in', {user:{email:"#{user.email}", password:'wrong_password'}}, headers
        expect(response_json).to eq('error' => 'Invalid email or password.')
        expect(response.status).to eq 401
      end

      it 'invalid email returns error message' do
        post '/api/v1/users/sign_in', {user:{email:'wrong@email.com', password:"#{user.password}"}}, headers
        expect(response_json).to eq('error' => 'Invalid email or password.')
        expect(response.status).to eq 401
      end
    end

  end
end