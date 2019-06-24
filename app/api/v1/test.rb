class V1::Test < Grape::API

  before do
    authenticate!
  end

  resource :test do

    desc 'Desc'
    params do
      requires :token, type: String
      requires :some, type: String
    end
    get :some, jbuilder: 'test/get_something' do
      @some = clean_params[:some]
    end

  end
end
