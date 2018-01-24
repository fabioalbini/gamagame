require 'rails_helper'

RSpec.describe 'Games', type: :request do
  before(:all) do
    10.times do
      create(:question, answer: '1')
    end
  end

  after(:all) do
    Question.delete_all
  end

  describe 'POST /games' do
    it 'creates a game' do
      expect {
        post games_path
      }.to change(Game, :count).by(1)

      expect(response).to have_http_status(:redirect)
    end

    it 'avoids a new game if unfinished game exists' do
      post games_path
      expect {
        post games_path
      }.to change(Game, :count).by(0)

      expect(response).to have_http_status(:redirect)
    end

    it 'continues the same game after a page refresh' do
      post games_path

      first_question_location = response.location

      post games_path

      new_question_location = response.location

      expect(first_question_location).to match(%r(games_questions/[0-9]{1,}/edit))
      expect(first_question_location).to eq(new_question_location)
    end
  end
end
