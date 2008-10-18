class ImproveGmapsField < ActiveRecord::Migration
  def self.up
    add_column :meetings, :gmap, :text
    remove_column :meetings, :gmaps_url
  end

  def self.down
    remove_column :meetings, :gmap
    add_column :meetings, :gmaps_url, :string
  end
end
