class Question < ApplicationRecord

  # answerはone-to-many
  has_many :answers,dependent: :destroy
  # バリデートかけられる
  validates :name,presence: true
  validates :title ,presence: true
  validates :content ,presence: true
end
