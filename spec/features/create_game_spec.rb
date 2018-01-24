require 'rails_helper'

RSpec.describe 'start a new game', type: :feature do
  before(:all) do
    10.times do
      create(:question, answer: '1')
    end
  end

  scenario 'returns a perfect score of 10', js: true do
    visit '/'

    click_on 'Start'

    10.times do
      choose 'Option 1'
      click_on 'Next'
    end

    expect(Game.last.score).to eq(10)
  end

  scenario 'returns a score of 0', js: true do
    visit '/'

    click_on 'Start'

    10.times do
      choose 'Option 4'
      click_on 'Next'
    end

    expect(Game.last.score).to eq(0)
  end
end
