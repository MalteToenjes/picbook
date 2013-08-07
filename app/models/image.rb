class Image < ActiveRecord::Base
  attr_accessible :description, :name, :image, :remote_image_url, :users_id, :albums_id
  mount_uploader :image, ImageUploader

  def to_param
    "#{id}-#{name}"
  end

end
