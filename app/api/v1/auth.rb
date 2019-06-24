class V1::Auth < Grape::API
  namespace :auth do

    desc 'User Sign up'
    params do
      requires :user, type: Hash do
        requires :email
        requires :user_name, type: String
        requires :password
      end
    end
    post 'signup', jbuilder: 'auth/signup' do
      @result = RegisterUser.call(params: clean_params, request: request)
      status @result.code
    end



    desc 'Simple authorization'
    params do
      requires :user, type: Hash do
        requires :email, allow_blank: false
        requires :password,  allow_blank: false
      end
    end
    post 'signin', jbuilder: 'auth/signin' do
      @result = SigninUser.call(params: clean_params, request: request)
      status @result.code
    end



    desc 'Check Email Presence'
    params do
      requires :email, type: String
    end
    get 'email-presence', jbuilder: 'auth/presence' do
      @presence = User.find_for_authentication(email: params[:email]).present?
      status :ok
    end

  end
end
