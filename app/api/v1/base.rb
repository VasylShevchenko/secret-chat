class V1::Base < Grape::API
  version 'v1', using: :path

  include ActionController::HttpAuthentication::Token

  rescue_from Pundit::NotAuthorizedError, Pundit::NotDefinedError do
    show_error!('Access Denied', 403)
  end
  rescue_from ActiveRecord::RecordNotFound do |exception|
    show_error!(exception, 404)
  end

  helpers Pundit


  helpers do
    def clean_params
      ActionController::Parameters.new(params)
    end

    def user_auth_by_token!
      auth_token = AuthToken.find_by_token(params[:token])
      auth_token&.user
    end

    def current_user
      @current_user ||= user_auth_by_token!
    end

    def authenticate!
      show_error!('Unauthorized', 401) unless current_user
    end

    def show_error!(message, code)
      error!( { errors: { error: [message] } }, code)
    end

  end

  files = Dir[Rails.root.join('app', 'api', 'v1', '*')]
              .reject { |a| a.eql?(__FILE__) }.select { |a| a =~ /\.rb$/ }

  files.each { |a| mount ('V1::' << File.basename(a, '.rb').camelize).constantize }

  add_swagger_documentation add_version: true, api_version: 'v1', base_path: '/api'

end
