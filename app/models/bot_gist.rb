class BotGists < ActiveRecord::Base

  # Relations
  belongs_to :bot

  # Validations
  validates_presence_of :gist_embed_code

end

