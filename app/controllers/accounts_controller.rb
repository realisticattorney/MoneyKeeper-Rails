class AccountsController < ApplicationController
  before_action :set_account, only: %i[show destroy]

  def index
    @accounts = current_user.accounts
    json_response(@accounts)
  end

  def create
    @account = current_user.accounts.create!
    json_response(@account, :created)
  end

  def show
    json_response(@account)
  end

  def destroy
    @account.destroy
    head :no_content
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end
end
