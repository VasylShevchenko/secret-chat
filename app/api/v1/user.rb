class V1::User < Grape::API

  before do
    authenticate!
  end

  resource :users do

    desc 'Returns a list of existing users'
    params do
      requires :token, type: String
    end
    get '', jbuilder: 'users/index' do
      @users = User.all
      show_error!('records not found', 404) if @users.blank?
      status :ok
    end



    desc 'Delete User by ID'
    params do
      requires :token, type: String
      requires :id,    type: Integer
    end
    delete ':id' do
      @user = User.find_by(id: params[:id])
      show_error!('Record not found', 404) if @user.blank?
      @user.destroy!
      status :ok
ra    end


    desc 'Get User by ID'
    params do
      requires :token, type: String
      requires :id, type: String
    end
    get ':id', jbuilder: 'users/show' do
      @user = User.find_by(id: params[:id])
      show_error!('Record not found', 404) if @user.blank?

      status :ok
    end

    desc 'User update'
    params do
      requires :token, type: String
      requires :user, type: Hash do
        optional :email
        optional :user_name, type: String
        optional :password
      end
    end
    post '/update', jbuilder: 'users/update' do
      authenticate!

      user_params = clean_params.require(:user).permit(:email, :user_name, :password )
      @user = current_user
      @user.update_attributes(user_params)
    end



  end
end
