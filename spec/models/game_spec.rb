require 'rails_helper'

RSpec.describe Game, type: :model do

  describe "relations" do
    it "has many games_questions" do
      expect(Game.reflect_on_association(:games_questions)).to_not eq(nil)
    end

    it "has many questions" do
      expect(Game.reflect_on_association(:questions)).to_not eq(nil)
    end
  end

  it "fetches the current unfinished game for a given session" do
    game = create(:game_with_questions, user_session: "1234")
    expect(Game.current("1234")).to eq(game)
  end

  it "returns nil as the current game when there are no unfinished games" do
    game = build(:game_with_questions, user_session: "1234")
    game.games_questions.each do |game_question|
      game_question.answer = "1"
    end
    game.save

    expect(Game.current("1234")).to eq(nil)
  end

  it "returns a score of 10 when all answers are correct" do
    game = build(:game_with_questions)
    game.games_questions.each do |game_question|
      game_question.answer = "1"
    end
    game.save

    expect(game.score).to eq(10)
  end

  it "returns a score of 0 when all answers are wrong" do
    game = build(:game_with_questions)
    game.games_questions.each do |game_question|
      game_question.answer = "4"
    end
    game.save

    expect(game.score).to eq(0)
  end

  it "returns a score of 5 when half of the answers are correct" do
    game = build(:game_with_questions)
    5.times do |i|
      game.games_questions[i].answer = "1"
    end
    game.save

    expect(game.score).to eq(5)
  end

  it "fetches the next unanswered question" do
    game = build(:game_with_questions)
    5.times do |i|
      game.games_questions[i].answer = "1"
    end
    game.save

    expect(game.next_game_question).to eq(game.games_questions[5])
  end

  it "returns nil as the next question when all questions are already answered" do
    game = build(:game_with_questions)
    game.games_questions.each do |game_question|
      game_question.answer = "4"
    end
    game.save

    expect(game.next_game_question).to eq(nil)
  end

  it "returns true when the game belongs to the informed session" do
    game = build(:game, user_session: "1234")
    expect(game.belongs_to_session?("1234")).to eq(true)
  end

  it "returns false when the game doesn't belong to the informed session" do
    game = build(:game, user_session: "1234")
    expect(game.belongs_to_session?("0000")).to eq(false)
  end
end
