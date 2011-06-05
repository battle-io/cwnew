class Bot < ActiveRecord::Base

  # Relations
  has_many   :bot_gists
  belongs_to :game
  has_many   :likes
  belongs_to :user

  # Validations
  validates_presence_of :title , :game_id , :user_id

end

