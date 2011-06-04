class Authorization < ActiveRecord::Base

  # Attributes
  attr_reader :auth_data_cache

  # Relations
  belongs_to :user

  # Validations
  validates_presence_of   :user_id , :uid , :provider
  validates_uniqueness_of :uid , :scope => :provider

  # Class Methods

  def self.find_or_create_by_omniauth_hash( omniauth_hash = {} )
    return nil unless omniauth_hash["uid"]

    # grab our auth object
    auth = find_or_create_by_uid omniauth_hash["uid"]

    # specify attributes and save
    auth.build_user.save! unless auth.user.present?
    auth.provider = omniauth_hash["provider"]
    auth.save

    auth
  end

end
