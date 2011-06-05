class CreateBotGists < ActiveRecord::Migration
  def self.up
    create_table :bot_gists do |t|
      t.text :gist_embed_code
      t.references :bot
      t.timestamps
    end
  end

  def self.down
    drop_table :bot_gists
  end
end
