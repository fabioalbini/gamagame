class Question < ApplicationRecord
  has_many :games_questions, class_name: 'GameQuestion'
  has_many :games, through: :games_questions

  scope :at_random, -> (limit) { order('RANDOM()').limit(limit) }
end
