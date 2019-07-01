class V1::Message < Grape::API

  before do
    authenticate!
  end

  resource :message do

    desc 'Sends a message from specific user to a given chat room'
    params do
      requires :token, type: String
      requires :message, type: String
      requires :room_id, type: Integer
      requires :user_id, type: Integer
    end
    post 'message' do
      @room = current_user.rooms.find(clean_params[:room_id])
      @room.messages.create(message: clean_params[:message], user_id: current_user.id)

      status :ok
      { "result": "message successfully sent" }
    end

  end
end
