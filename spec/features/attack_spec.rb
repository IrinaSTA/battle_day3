feature 'attack' do
  scenario 'Can see confirmation message' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content("Jack attacked Jill!")
  end

  scenario 'Reduces opponents score by 10' do
    sign_in_and_play
    expect { click_button('Attack') }.to change{ Game.instance.player2.score }.by(-10)
  end

  scenario 'Players can take turns attacking, get confirmation' do
    sign_in_and_play
    click_button('Attack')
    click_button('Attack')
    expect(page).to have_content("Jill attacked Jack!")
  end

  scenario 'Second attack reduces second player\'s score by 10' do
    sign_in_and_play
    click_button('Attack')
    expect { click_button('Attack') }.to change { Game.instance.player1.score }.by(-10)
  end

end
