class AccountsController < ApplicationController
    def index
        @accounts = Account.all
    end

    def show
        set_account
        render :'accounts/show'
    end

    def new
        @account = Account.new
    end

    def create
        @account = Account.new(account_params)

        if @account.save
            redirect_to @account
        else
            render :new
        end
    end

    def edit
        set_account
    end

    def update
        set_account
        @account.update(account_params)

        if @account.save
            redirect_to @account
        else
            render :edit
        end
    end
    
    def destroy
        set_account
        @account.destroy
        flash[:notice] = "Account Deleted"
        redirect_to accounts_path
    end

    private

    def account_params
        params.require(:account).permit(:user_id, :name, :description, :credit_limit, :balance, :account_number, :status)
    end

    def set_account
        @account = Account.find(params[:account_id])
    end
end
