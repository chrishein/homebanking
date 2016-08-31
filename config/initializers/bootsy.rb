Bootsy.setup do |config|
  config.image_versions_available = [:original]
end

module Bootsy
  class ImageUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave

    process resize_to_limit: [1160, 2000]

    version :large do
      process resize_to_fit: [
        700, 700
      ]
    end

    version :medium do
      process resize_to_fit: [
        300, 300
      ]
    end

    version :small do
      process resize_to_fit: [
        150, 150
      ]
    end

    version :thumb do
      process resize_to_fill: [60, 60]
    end

    def extension_white_list
      %w(jpg jpeg gif png)
    end
  end
end
