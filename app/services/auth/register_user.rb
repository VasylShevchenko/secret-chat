class RegisterUser
  include Interactor

  def call
    check_email = User.find_by(email: params_email)
    context.fail! errors: 'User already registered', code: 302 if check_email.present?

    # check_user_name = User.find_by(user_name: params_user_name)
    # context.fail! errors: 'User name already registered', code: 302 if check_user_name.present?

    context.user = User.new(user_params)
    context.user.update_tracked_fields(request)

    unless context.user.save
      context.fail! errors: context.user.errors,
                    code: :unauthorized
    end
  end

  private

  def user_params
    context.params.require(:user)
           .permit(:email, :user_name, :password)
  end

  def request
    context.request
  end

  def params_email
    context.params['user']['email'].downcase
  end

  # def params_user_name
  #   context.params['user']['user_name'].strip
  # end
end
