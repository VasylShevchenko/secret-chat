# if @result.success?
#   json.user do
#     json.partial! 'users/user', user: @result.user
#   end
# else
#   json.errors @result.errors
# end
if @user.errors.present?
  json.errors @user.errors
else
  json.partial! 'users/auth', user: @user if @user
end
