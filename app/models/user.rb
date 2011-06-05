class User < ActiveRecord::Base

  # Relations
  has_many :authorizations
  has_many :bots
  has_many :liked , :class_name => "Like"

  # Instance Methods

  def github_data
    github_auth = authorizations.where( :provider => :github ).first
    return github_auth.auth_data_cache if github_auth
    nil
  end

  def likes
    likes_array = []
    bots.each { |b| likes_array.concat b.likes }
    likes_array
  end

end

