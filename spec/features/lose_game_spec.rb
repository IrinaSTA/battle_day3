feature 'lose game' do
  scenario 'display confirmation method when game is lost' do
    sign_in_and_play
    11.times { click_button('Attack') }
    expect(page).to have_content("Jill lost! Game over.")
  end
end
