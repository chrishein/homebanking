class AddHomeContentToAppSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :home_content, :text
  end
end
