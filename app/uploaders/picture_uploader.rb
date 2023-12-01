class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # Define your image versions, processing, etc. as needed
  # Example:
  version :thumbnail do
    resize_to_fit 150, 150
  end
end
