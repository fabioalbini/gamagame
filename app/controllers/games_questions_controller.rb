class GamesQuestionsController < ApplicationController
  before_action :set_game_question
  before_action :set_question
  before_action :authorize_game_question

  def edit
  end

  def update
    if @game_question.update(game_question_params)
      redirect_user(@game_question)
    else
      render :edit
    end
  end

  private

  def redirect_user(game_question)
    next_game_question = game_question.game.next_game_question
    if next_game_question.nil?
      redirect_to game_path(game_question.game)
    else
      redirect_to edit_game_question_path(next_game_question)
    end
  end

  def game_question_params
    params.require(:game_question).permit(:answer)
  end

  def set_game_question
    @game_question = GameQuestion.find(params[:id])
  end

  def set_question
    @question = @game_question.question
  end

  def authorize_game_question
    error_message = authorization_error_message
    redirect_to new_game_path, flash: { error: error_message } if error_message.present?
  end

  def current_question?
    games_questions = @game_question.game.games_questions
    games_questions.unanswered.first == @game_question
  end

  def authorization_error_message
    if !@game_question.game.belongs_to_session?(session.id)
      return "You don't have access to this game"
    elsif @game_question.answer.present?
      return "You cannot change an answer"
    elsif !current_question?
      return "This is not the question you're supposed to answer"
    end
  end
end
