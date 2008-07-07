class CreateBans < ActiveRecord::Migration
  def self.up
    create_table :bans do |t|
      t.string :banned_ip
      t.timestamps
    end
  end

  def self.down
    drop_table :bans
  end
end
