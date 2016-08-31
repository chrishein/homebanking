class AppSetting < ActiveRecord::Base
  include Bootsy::Container
  mount_uploader :logo, LogoUploader

  def self.settings
    first
  end
end
