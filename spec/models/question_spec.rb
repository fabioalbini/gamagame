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
end
