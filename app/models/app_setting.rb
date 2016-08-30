class AppSetting < ActiveRecord::Base

  mount_uploader :logo, LogoUploader

  def self.settings
    first
  end
end
