class Account < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_many :payments
end