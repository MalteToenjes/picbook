class Image < ActiveRecord::Base
  attr_accessible :description, :name, :path, :image, :remote_image_url, :users_id, :albums_id, :permalink
  mount_uploader :image, ImageUploader

  def to_param
    "#{id}-#{name}"
  end

end
