module Api
  module V1
    class ApiController < JSONAPI::ResourceController
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!
    end
  end
end