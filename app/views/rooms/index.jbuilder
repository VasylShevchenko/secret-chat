if @rooms.present?
  json.total @rooms.count
  json.rooms do
    json.array! @rooms.each do |rooms|
      json.partial! 'rooms/room', room: rooms

      json.users do
        json.array! rooms.users.each do |user|
          json.partial! 'users/user', user: user
        end
      end

    end
  end
end


