class Message < ApplicationRecord
  belongs_to :author_id
  belongs_to :parent_id
end
