class CreateBadges < ActiveRecord::Migration
  def self.up
    create_table :badges do |t|
      t.string :image
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :badges
  end
end
