class Image < ActiveRecord::Base
  attr_accessible :description, :name, :path, :image, :remote_image_url, :users_id, :albums_id
  mount_uploader :image, ImageUploader
end
