class User < ActiveRecord::Base

  # Relations
  has_many :authorizations
  has_many :bots
  has_many :likes_given , :class_name => "Like"
  has_many :likes , :through => :bots

  # Instance Methods

  def github_data
    github_auth = authorizations.where( :provider => :github ).first
    return github_auth.auth_data_cache if github_auth
    nil
  end

end

