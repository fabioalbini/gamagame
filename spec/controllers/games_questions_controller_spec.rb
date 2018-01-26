require 'rails_helper'

RSpec.describe GamesQuestionsController, type: :controller do
  let (:game) { create(:game_with_questions, user_session: session.id) }

  describe '#edit' do
    it 'responds successfully' do
      get :edit, params: { id: game.games_questions.first }

      expect(response).to be_success
    end

    it 'blocks an user to change a question already answered' do
      game_question = game.games_questions.first
      game_question.answer = '1'
      game_question.save

      get :edit, params: { id: game.games_questions.first }

      expect(response).to be_redirect
      expect(session['flash']['flashes']['error']).to eq('You cannot change an answer')
    end

    it 'blocks an user from skipping a question' do
      get :edit, params: { id: game.games_questions.second }

      expect(response).to be_redirect
      expect(session['flash']['flashes']['error']).to eq("This is not the question you're supposed to answer")
    end

    it 'blocks an user to play a game from another user' do
      forbidden_game = create(:game_with_questions)

      get :edit, params: { id: forbidden_game.games_questions.first }

      expect(response).to be_redirect
      expect(session['flash']['flashes']['error']).to eq("You don't have access to this game")
    end
  end

  describe '#update' do
    it 'responds successfully when a question is answered' do
      game_question = game.games_questions.first
      game_question.answer = '1'

      patch :update, params: { id: game_question, game_question: game_question.attributes }

      game_question.reload

      expect(response).to be_redirect
      expect(session['flash']).to be_nil
      expect(game_question.answer).to eq(1)
    end

    it 'blocks an user to change a question already answered' do
      game_question = game.games_questions.first
      game_question.answer = '1'
      game_question.save

      game_question.answer = '2'

      patch :update, params: { id: game_question, game_question: game_question.attributes }

      game_question.reload

      expect(response).to be_redirect
      expect(session['flash']['flashes']['error']).to eq('You cannot change an answer')
      expect(game_question.answer).to eq(1)
    end

    it 'blocks an user from skipping a question' do
      game_question = game.games_questions.second

      patch :update, params: { id: game_question, game_question: game_question.attributes }

      expect(response).to be_redirect
      expect(session['flash']['flashes']['error']).to eq("This is not the question you're supposed to answer")
    end

    it 'blocks an user to play a game from another user' do
      forbidden_game = create(:game_with_questions)
      game_question = forbidden_game.games_questions.first

      patch :update, params: { id: game_question, game_question: game_question.attributes }

      expect(response).to be_redirect
      expect(session['flash']['flashes']['error']).to eq("You don't have access to this game")
    end

    it "can't allow an update request with a blank answer" do
      game_question = game.games_questions.first
      game_question.answer = ''

      patch :update, params: { id: game_question, game_question: game_question.attributes }

      expect(response).to be_success
      expect(session['flash']).to be_nil
      expect(response).to render_template(:edit)
    end
  end
end
