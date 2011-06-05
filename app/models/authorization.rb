class Authorization < ActiveRecord::Base

  # Relations
  belongs_to :user

  # Validations
  validates_presence_of   :user_id , :uid , :provider
  validates_uniqueness_of :uid , :scope => :provider

  # Class Methods

  def self.find_or_create_by_omniauth_hash!( omniauth_hash = {} )
    return nil unless omniauth_hash["uid"]

    # grab our auth object
    auth = find_by_uid omniauth_hash["uid"]

    if auth
      auth.auth_data_cache = ActiveSupport::JSON.encode omniauth_hash
      auth.save
      return auth
    end

    # specify attributes and save
    auth = new
    auth.uid = omniauth_hash["uid"]
    auth.provider = omniauth_hash["provider"]
    auth.user = User.create!
    auth.auth_data_cache = ActiveSupport::JSON.encode omniauth_hash
    auth.save!

    auth
  end

  # Instance Methods

  def auth_data_cache
    ActiveSupport::JSON.decode( attributes["auth_data_cache"] || "" )
  end

end

