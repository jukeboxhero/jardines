class Vote < ApplicationRecord
  belongs_to :proposal
  belongs_to :user
  belongs_to :residence
  enum status: [:pending, :rejected, :approved]
end
