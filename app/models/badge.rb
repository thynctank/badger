class Badge < ActiveRecord::Base
  validates_presence_of :name, :image
  validates_uniqueness_of :name
end
