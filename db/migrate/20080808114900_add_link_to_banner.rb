class AddLinkToBanner < ActiveRecord::Migration
  def self.up
    add_column :banners, :link, :string
  end

  def self.down
    remove_column :banners, :link
  end
end
