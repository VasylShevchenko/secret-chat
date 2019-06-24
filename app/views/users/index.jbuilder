# if @result.success?
#   json.total @result.total
#   json.users do
#     json.array! @result.users do |user|
#       json.partial! 'users/user', user: user
#     end
#   end
# else
#   json.errors @result.errors
# end
#

if @users.present?
  json.total @users.count
  json.users do
    json.array! @users.each do |user|
      json.partial! 'users/user', user: user
    end
  end
end
