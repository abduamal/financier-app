class TransactionsController < ApplicationController
    before_action :set_account
    before_action :set_transaction, only:[:show, :edit, :update, :destroy]

    def index
        #get all the transactions tied to a specific account
        @transactions = @account.transactions
    end

    def show
        render :'transactions/show'
    end

    def new
        #create a transaction object associated with a specific account instance from the set_account method
        @transaction = @account.transactions.build
    end
    
    def create
        @transaction = @account.transactions.build(transaction_params)
        if @account.update_balance(@transaction) != 'You have reached your credit limit...'
            @transaction.save
            redirect_to account_transactions_path(@account)
        else
            flash.now[:alert] = "Your entry was invalid."
            render :new
        end
    end

    def edit
    end

    def update
        @transaction.update(transaction_params)

        if @transaction.save
            redirect_to account_transactions_path(@account)
        else
            render :edit
        end
    end

    def destroy
        # can't just delete a transaction you made?
        # @transaction.destroy
        # redirect_to account.transactions_path(@account)
    end

    private

    def set_account
        @account = Account.find(params[:account_id])
    end

    def set_transaction
        @transaction = @account.transactions.find(params[:id])
    end

    def transaction_params
        params.require(:transaction).permit(:account_id, :amount, :category, :description, :date)
    end
    
    def account_params
        params.require(:account).permit(:user_id, :name, :description, :credit_limit, :balance, :account_number, :status)
    end

end
