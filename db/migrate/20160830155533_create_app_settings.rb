class CreateAppSettings < ActiveRecord::Migration
  def change
    create_table :app_settings do |t|
      t.string :app_title
      t.string :logo

      t.timestamps null: false
    end
  end
end
