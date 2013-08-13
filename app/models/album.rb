class Album < ActiveRecord::Base
  attr_accessible :description, :name, :users_id

  def to_param
    "#{id}-#{name}"
  end
end
