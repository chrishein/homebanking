class ImportAccountMovementsController < ApplicationController
  authorize_resource :class => false

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

    begin
      AccountMovement.import(@account,
                             params[:import_account_movements][:file])
    rescue => e
      redirect_to new_account_import_account_movement_path(@account),
        :alert => e.message
        return
    end

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: t('.notice') }
    end
  end
end
