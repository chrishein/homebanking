class AppSettingsController < ApplicationController
  authorize_resource
  before_action :set_app_setting, only: [:edit, :update]

  # GET /app_settings/1/edit
  def edit
  end

  # PATCH/PUT /app_settings/1
  # PATCH/PUT /app_settings/1.json
  def update
    respond_to do |format|
      if @app_setting.update(app_setting_params)
        format.html { redirect_to edit_app_settings_path, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @app_setting }
      else
        format.html { render :edit }
        format.json { render json: @app_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_setting
      @app_setting = AppSetting.settings
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_setting_params
      params.require(:app_setting).permit(:app_title, :logo)
    end
end
