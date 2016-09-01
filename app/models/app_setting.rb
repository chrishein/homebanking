class AppSetting < ActiveRecord::Base
  include Bootsy::Container
  mount_uploader :logo, LogoUploader

  attr_accessor :remove_logo

  before_update do |app_setting|
    app_setting.remove_logo! if app_setting.remove_logo == '1'
  end

  def self.settings
    first
  end
end
