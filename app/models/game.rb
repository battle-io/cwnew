class Game < ActiveRecord::Base

  # Relations
  has_many :bots

  # Validations
  validates_presence_of :title

end

