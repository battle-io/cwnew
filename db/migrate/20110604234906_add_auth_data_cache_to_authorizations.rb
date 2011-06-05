class AddAuthDataCacheToAuthorizations < ActiveRecord::Migration

  def self.up
    add_column :authorizations , :auth_data_cache , :text
  end

  def self.down
    remove_column :authorizations , :auth_data_cache
  end

end

