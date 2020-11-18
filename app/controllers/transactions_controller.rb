class TransactionsController < ApplicationController
    before_action :set_account
    def index
        #get all the transactions tied to a specific account
        @transactions = @account.transactions
    end

    def show
        set_transaction
        render :'transactions/show'
    end

    def new
        @transaction = Transaction.new
    end
    
    def create
        @transaction = Transaction.new(transaction_params)
        @transaction.account = Account.find_or_create_by(account_params)
        if (@account.update_balance(@transaction) != 'You have reached your credit limit...') && @employee.valid?
            @transaction.save
            redirect_to @transaction
        else
            flash.now[:messages] = @transaction.errors.full_messages[0]
            render :new
        end
         
    end

    def edit
        set_transaction
    end

    def update
        set_transaction
        @transaction.update(transaction_params)

        if @transaction.save
            redirect_to @transaction
        else
            render :edit
        end
    end

    def destroy
        # can't just delete a transaction you made?
    end

    private

    def set_account
        @account = Account.find_or_create_by(params[:id])
    end

    def set_transaction
        @transaction = Transaction.find(params[:id])
    end

    def transaction_params
        params.require(:transaction).permit(:account_id, :amount, :category, :description, :date)
    end
    
    def account_params
        params.require(:account).permit(:user_id, :name, :description, :credit_limit, :balance, :account_number, :status)
    end

end
