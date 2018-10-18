feature 'Switch turns' do
  context 'seeing the current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content("Jack's turn")
    end

    scenario 'after player 1 attacks' do
      sign_in_and_play
      click_button "Attack"
      expect(page).to_not have_content("Jack's turn")
      expect(page).to have_content("Jill's turn")
    end
  end
end
