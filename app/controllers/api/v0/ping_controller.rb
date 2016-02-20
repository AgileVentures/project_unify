class Api::V0::PingController < ApiController

  api :GET, "/ping/", "Respond with 'Pong'"
  description "Responds with a message containing the word 'Pong'"
  formats %w(json text)
  example " 'message': 'Pnng' "
  def index
    respond_to do |format|
      format.json { render json: JSON.parse('{"message":"Pong"}').to_json }
      format.text { render text: 'Pong' }
    end

  end

end
