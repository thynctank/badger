class Badge < ActiveRecord::Base
  image_accessor :image
  
  validates_presence_of :name, :image_uid
  validates_uniqueness_of :name
end
