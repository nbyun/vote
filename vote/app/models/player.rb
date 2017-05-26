class Player < ApplicationRecord
  acts_as_paranoid
  has_one :player_picture, dependent: :destroy
  has_many :tickets, dependent: :destroy
end
