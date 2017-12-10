class GamesController < ApplicationController
  def new
  end

  def create
    current_game = Game.current(session.id)
    if current_game.present?
      redirect_to edit_game_question_path(current_game.next_game_question), flash: { error: "You're already playing a game" }
      return
    end

    @game = prepare_game
    redirect_to edit_game_question_path(@game.games_questions.first), flash: { success: "Welcome to Gama Game!" }
  end

  def show
    @game = Game.find(params[:id])
    @score = @game.score
  end

  private

  def prepare_game
    game = Game.create(user_session: session.id)
    Question.at_random(10).each do |question|
      GameQuestion.create(game_id: game.id, question_id: question.id)
    end
    game
  end
end