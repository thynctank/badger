class SwitchToDragonfly < ActiveRecord::Migration
  def self.up
    rename_column :badges, :image, :image_uid
  end

  def self.down
    rename_column :badges, :image_uid, :image
  end
end
