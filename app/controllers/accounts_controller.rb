require 'will_paginate/array'

class AccountsController < ApplicationController
  load_and_authorize_resource
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    if !params[:client_id].nil?
      @client = Client.find(params[:client_id])
      @accounts = @client.accounts.paginate(page: params[:page], per_page: 50)
    elsif current_user.clients.empty?
      flash[:error] = "You have no clients or accounts associated to your user"
      @accounts = [].paginate(page: params[:page], per_page: 50)
    else
      @accounts = current_user.accounts.paginate(page: params[:page], per_page: 50)
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: t('.notice') }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  def download
    @account = Account.find(params[:account_id])

    if current_user.accounts.include? @account
      @account_movements = @account.account_movements
      respond_to do |format|
        format.xlsx do
          p = Axlsx::Package.new
          wb = p.workbook
          wb.add_worksheet(name: "Account Movements") do |sheet|
            sheet.add_row ["Movement Date", "Concept", "Credit", "Debit", "Balance"]
            @account_movements.each do |m|
              sheet.add_row [m.movement_date, m.concept, m.credit, m.debit, m.balance]
            end
          end
          send_data p.to_stream.read, type: "application/xlsx", filename: "#{@account.to_s}.xlsx"
        end
      end
    else
      format.html { redirect_to accounts_url, error: 'Account is not associated with current user.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :currency, :client_id)
    end
end
