feature 'display hit points' do

  scenario 'Can see player 2s hit points' do
    sign_in_and_play
    expect(page).to have_content(Game.instance.player2.score)
  end

  scenario 'Can see player 1s hit points' do
    sign_in_and_play
    expect(page).to have_content(Game.instance.player1.score)
  end

end
