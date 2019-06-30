class V1::Rooms < Grape::API

  before do
    authenticate!
  end

  resource :rooms do

    desc 'Adds a new chat room'
    params do
      requires :token, type: String
      requires :room_name, type: String
    end
    post '', jbuilder: 'rooms/create' do
      # debugger
      @room = Room.create(room_name: clean_params[:room_name], user_id: current_user.id)
      # @room = current_user.rooms.create(room_name: clean_params[:room_name])
      @room.users << current_user
    end


    desc 'Returns a list of rooms available'
    params do
      requires :token, type: String
    end
    get '', jbuilder: 'rooms/index' do
      @rooms = Room.all
      show_error!('records not found', 404) if @rooms.blank?
      status :ok
    end


    desc 'Returns info for a given room'
    params do
      requires :token, type: String
      requires :id,    type: Integer
    end
    get ':id', jbuilder: 'rooms/show' do
      @room = Room.find(params[:id])
      status :ok
    end


    desc 'Removes specific chat room (by room creator)'
    params do
      requires :token, type: String
      requires :id,    type: Integer
    end
    delete ':id' do
      @room = current_user.rooms.find(params[:id])
      @room.destroy
      # @user = User.find_by(id: params[:id])
      # show_error!('Record not found', 404) if @user.blank?
      # @user.destroy!
      status :ok
      { "result": "room removed successfully" }
    end



    desc 'Adds specific user to a given chat room'
    params do
      requires :token, type: String
      requires :id,    type: Integer
    end
    post ':id/join' do
      @room = Room.find(params[:id])
      @room.users << current_user
      @room.users = @room.users.uniq

      status :ok
      { "result": "user successfully joined the room" }
    end


    desc 'Removes specific user from a given chat room'
    params do
      requires :token, type: String
      requires :id,    type: Integer
    end
    post ':id/leave' do
      @room = Room.find(params[:id])
      @room.user_ids = @room.user_ids.reject{ |k| k == current_user.id }

      status :ok
      { "result": "user successfully left the room" }
    end

  end
end
