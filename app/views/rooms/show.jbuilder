json.partial! 'rooms/room', room: @room
json.users do
  json.array! @room.users.each do |user|
    json.partial! 'users/user', user: user
  end
end
