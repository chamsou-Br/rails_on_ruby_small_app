class Invitation < ApplicationRecord
    has_many :transactions
    belongs_to :seller
end
