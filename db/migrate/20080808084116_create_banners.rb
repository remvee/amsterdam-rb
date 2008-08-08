class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string :owner
      t.integer :image_id
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
