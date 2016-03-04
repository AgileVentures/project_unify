require 'rails_helper'

describe Api::V0::PingController do
  let(:user) {FactoryGirl.build(:user)}

  describe 'GET /v0/ping' do

    before { user.save }

    it 'should return Pong' do
      #@request.env['X-User-Email'] = user.email
      #@request.env['X-User-Token'] = user.authentication_token
      get '/api/v0/ping', {}, {'X-User-Email' => user.email, 'X-User-Token' => user.authentication_token }
      binding.pry
      expect(response.status).to eq 200
      expect(response_json['message']).to eq 'Pong'
    end

  end
end