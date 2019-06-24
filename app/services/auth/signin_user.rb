class SigninUser
  include Interactor

  def call

    context.user = User.find_for_authentication(email: user_email)

    unless context.user
      context.fail! errors: { user_email: ['not found'] }, code: :unauthorized
    end

    unless context.user.valid_password?(user_params[:password])
      context.fail! errors: { password: ['is invalid'] }, code: :unauthorized
    end

    if context.user.present?
      context.user.update_tracked_fields!(request)
    end
  end

  private

  def user_params
    context.params.require(:user).permit(:email, :password)
  end

  def user_email
    user_params[:email].downcase.delete(" \t\r\n")
  end

  def request
    context.request
  end
end
