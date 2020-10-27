class Account < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_many :payments
    validates :name, :account_number, presence: true
    validates :account_number, length: { is: 9, wrong_length: "Please enter a %{count} digit account number." }
    validates :credit_limit, length: { minimum: 1, message: "Please enter a credit limit."}
end
