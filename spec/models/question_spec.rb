require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "relations" do
    it "has many games_questions" do
      expect(Question.reflect_on_association(:games_questions)).to_not eq(nil)
    end

    it "has many games" do
      expect(Question.reflect_on_association(:games)).to_not eq(nil)
    end
  end

  it "fetches questions in a random order" do
    6.times { create(:question) }
    combinations = Array.new(10) { Question.at_random(3).pluck(:title) }
    unique_combinations = combinations.uniq

    expect(unique_combinations.size).to be >= 3
  end
end
