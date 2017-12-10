class CreateGamesQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :games_questions do |t|
      t.references :game, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :answer
    end
  end
end
