class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name, :null => false
      t.string :permalink, :null => false
      t.text   :content
      t.string :author, :null => false      
      t.timestamps
    end
    Page.create_versioned_table
  end

  def self.down
    drop_table :pages
  end
end

