class API < Grape::API
  include ActionView::Helpers

  prefix 'api'
  format :json
  formatter :json, Grape::Formatter::Jbuilder

  mount V1::Base
end
