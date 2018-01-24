FactoryBot.define do
  factory :game do
    user_session "1234567890"

    factory :game_with_questions do
      transient do
        questions_count 10
      end

      after(:build) do |game, evaluator|
        evaluator.questions_count.times do
          question = build(:question)
          game.games_questions << build(:game_question, game: game, question: question)
        end
      end
    end
  end
end
