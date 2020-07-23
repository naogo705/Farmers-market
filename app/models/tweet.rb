class Tweet < ApplicationRecord
  validates :text, :image, presence: true
  belongs_to :user
  has_many :comments
end
