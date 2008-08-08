class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :content_type
      t.binary :data, :limit => 2.megabytes

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
