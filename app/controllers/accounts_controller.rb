class AccountsController < ApplicationController
    before_action :set_account, only: [:show, :destroy]

  # GET /accounts
  def index
    # get current user todos
    @accounts = current_user.accounts
    json_response(@accounts)
  end
  # POST /accounts
  def create
    @account = current_user.accounts.create!
    json_response(@account, :created)
  end
  # GET /accounts/:id
  def show
    json_response(@account)
  end

  # # PUT /accounts/:id
  # def update
  #   @account.update(account_params)
  #   head :no_content
  # end

  # DELETE /accounts/:id
  def destroy
    @account.destroy
    head :no_content
  end

  private

  # def account_params
  #   # whitelist params
  #   params.permit(:created_by)
  # end

  def set_account
    @account = Account.find(params[:id])
  end
end