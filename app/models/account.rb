class Account < ApplicationRecord
    belongs_to :user, optional: true
    has_many :transactions
    has_many :payments
    validates :name, :account_number, presence: true
    # validates :account_number, length: { is: 9, wrong_length: "Please enter a %{count} digit account number." }
    validates :credit_limit, length: { minimum: 1, message: "Please enter a credit limit."}


    def update_balance(transaction)
        if self.balance < credit_limit
            self.balance = self.balance + transaction.amount
            self.save
        else
            return 'You have reached your credit limit...'
        end
    end

    def update_status
        #something to change the status of an account from open to closed
    end
end
