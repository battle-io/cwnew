class CreateBots < ActiveRecord::Migration
  def self.up
    create_table :bots do |t|
      t.string     :title
      t.text       :description
      t.string     :repo
      t.references :game
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :bots
  end
end
