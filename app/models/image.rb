class Image < ActiveRecord::Base
  attr_accessible :description, :name, :path, :image, :remote_image_url
  mount_uploader :image, ImageUploader
end
