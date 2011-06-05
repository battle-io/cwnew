module Users

  class ShowPresenter

    # Attributes
    attr_reader :user

    def initialize( user )
      @user = user
    end

    # Instance Methods

    def leaderboard_entries
      # entry_objects = user.relative_leaderboard
      return [
        { :name => Faker::Name.name , :bot_count => ( 30 - rand(5) )  , :like_count => ( 200 - rand(50) ) },
        { :name => Faker::Name.name , :bot_count => ( 25 - rand(5) )  , :like_count => ( 150 - rand(50) ) },
        { :name => user_full_name   , :bot_count => user.bots.count   , :like_count => user.likes.count   },
        { :name => Faker::Name.name , :bot_count => ( 10 - rand(5) )  , :like_count => ( 75  - rand(25) ) },
        { :name => Faker::Name.name , :bot_count => rand(5)           , :like_count => rand(50)           }
      ]
    end

    def user_full_name
      user.github_data["user_info"]["name"]
    end

    def user_github_username
      user.github_data["extra"]["user_hash"]["login"]
    end

    def user_gravatar_url
      "//gravatar.com/avatar/#{ user.github_data["extra"]["user_hash"]["gravatar_id"] }"
    end

  end

end

