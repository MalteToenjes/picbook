class Album < ActiveRecord::Base
  attr_accessible :description, :name, :users_id
end
