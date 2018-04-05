module Api
  module V1
    class UserResource < JSONAPI::Resource
      attributes :first_name, :last_name
    end
  end
end