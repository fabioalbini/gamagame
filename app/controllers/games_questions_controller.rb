class GamesQuestionsController < ApplicationController

  def edit
    @game_question = GameQuestion.find(params[:id])
    @question = @game_question.question
  end

  def update
    @game_question = GameQuestion.find(params[:id])
    @question = @game_question.question

    if @game_question.update(game_question_params)
      next_game_question = @game_question.game.next_game_question
      redirect_user(next_game_question)
    else
      render :edit
    end
  end

  private

  def redirect_user(next_game_question)
    if next_game_question.nil?
      render :edit
    else
      redirect_to edit_game_question_path(next_game_question)
    end
  end

  def game_question_params
    params.require(:game_question).permit(:answer)
  end
end