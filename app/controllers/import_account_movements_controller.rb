class ImportAccountMovementsController < ApplicationController
  def new
    @account = Account.find(params[:account_id])
    @import_account_movements = ImportAccountMovements.new
    @import_account_movements.account_id = @account.id
  end

  def create
    @account = Account.find(params[:account_id])

    if params[:import_account_movements][:remove_existent_movements] == "1"
      @account.account_movements = []
    end
    AccountMovement.import(@account,
                           params[:import_account_movements][:file].tempfile)

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Movements were successfully imported.' }
    end
  end
end
