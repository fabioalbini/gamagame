class GameQuestion < ApplicationRecord
  belongs_to :game
  belongs_to :question

  validates :answer, presence: true, on: :update
end