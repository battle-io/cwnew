class Like < ActiveRecord::Base

  # Relations
  belongs_to :bot
  belongs_to :user

  # Validations
  validates_presence_of :bot_id , :user_id

end

