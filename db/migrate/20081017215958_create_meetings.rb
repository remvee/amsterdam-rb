class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
      t.datetime :start_at
      t.string :blurp
      t.string :gmaps_url

      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
