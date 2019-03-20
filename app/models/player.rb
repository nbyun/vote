class Player < ApplicationRecord
  acts_as_paranoid
  #include Mongoid::Document
  #mount_uploader :avatar, AvatarUploader
  #has_one :player_picture, dependent: :destroy
  has_many :tickets, dependent: :destroy

  #searchable do
  #  text :name
  #end
end
