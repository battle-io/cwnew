module Users

  class ShowPresenter

    # Attributes
    attr_reader :user

    def initialize( user )
      @user = user
    end

    # Instance Methods

    def leaderboard_entries

      user_bot_count = user.bots.count
      next_user_bot_count = user_bot_count <= 0 ? 0 : user_bot_count - 1
      last_user_bot_count = user_bot_count <= 1 ? 0 : user_bot_count - 2

      user_like_count = user.likes.count
      next_user_like_count = user_like_count <= 0 ? 0 : user_like_count - 1
      last_user_like_count = user_like_count <= 1 ? 0 : user_like_count - 2

      return [
        { :name => Faker::Name.name , :bot_count => ( 30 - rand(5) )     , :like_count => ( 200 - rand(50) ) },
        { :name => Faker::Name.name , :bot_count => ( 25 - rand(5) )     , :like_count => ( 150 - rand(50) ) },
        { :name => user_full_name   , :bot_count => user.bots.count      , :like_count => user.likes.count , :me? => true },
        { :name => Faker::Name.name , :bot_count => next_user_bot_count  , :like_count => next_user_like_count },
        { :name => Faker::Name.name , :bot_count => last_user_bot_count  , :like_count => last_user_like_count }
      ]
    end

    def user_bots
      bot_hashes = []
      user.bots.order( :updated_at => :desc ).each do |bot|
        bot_hash = {}
        bot_hash[:title] = bot.title
        bot_hash[:game_title] = bot.game.title
        bot_hash[:bot_id] = bot.id
        bot_hashes << bot_hash
      end
      bot_hashes
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

