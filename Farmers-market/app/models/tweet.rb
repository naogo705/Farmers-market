class Tweet < ApplicationRecord
  validates :text, :image, presence: true
  belongs_to :user
  has_many :comments
  has_many :favorites, dependent: :destroy
end
