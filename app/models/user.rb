class User < ActiveRecord::Base

  # Relations
  has_many :authorizations

  # Instance Methods

  def github_data
    github_auth = authorizations.where( :provider => :github ).first
    return github_auth.auth_data_cache if github_auth
    nil
  end

end

