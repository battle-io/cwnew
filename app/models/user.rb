class User < ActiveRecord::Base
  has_many :authorizations

  def github_data
    github_auth = authorizations.where( :provider => :github ).first
    return github_auth.auth_data_cache if github_auth
    nil
  end

end

