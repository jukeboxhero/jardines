class Proposal < ApplicationRecord
  enum status: [ :pending, :rejected, :approved ]
end
