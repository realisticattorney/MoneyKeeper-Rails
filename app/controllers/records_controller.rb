class RecordsController < ApplicationController
    before_action :set_account
    before_action :set_account_record, only: [:show, :update, :destroy]

  def index
    json_response(@account.records)
  end

  def show
    json_response(@record)
  end

  def create
    @account.records.create!(record_params)
    json_response(@account.records.last, :created)
  end

  def update
    @record.update(record_params)
    head :no_content
  end

  def destroy
    @record.destroy
    head :no_content
  end

  private

  def record_params
    params.permit(:amount, :flow_direction, :pending, :description, :frequency, :time_span, :category, :savings)
  end

  def set_account
    @account = Account.find(params[:account_id])
  end

  def set_account_record
    @record = @account.records.find_by!(id: params[:id]) if @account
  end
end