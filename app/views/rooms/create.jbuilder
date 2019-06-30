if @room.errors.present?
  json.errors @room.errors
else
  json.partial! 'rooms/room', room: @room if @room
end

