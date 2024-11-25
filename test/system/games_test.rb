require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  # grille de 10 lettres
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector ".letter-square", count: 10
  end

  # mot pas dans la grille
  # test "Submitting a random word that is not in the grid shows an error message" do
  #   letters = ["A", "B", "C", "D", "Z", "C", "D", "Y", "F", "G"]
  #   visit new_url
  #   fill_in "letters", with: letters.join(" ")
  #   fill_in "word", with: "TEST"
  #   click_on "Play"
  #   assert_text "Sorry but TEST can't be built out of"
  # end

  # mot pas en anglais
  # test "Submitting a non-English word shows an error message" do
  #   letters = ["M", "I", "E", "L", "A", "B", "C", "F", "G", "H"]
  #   visit new_url
  #   fill_in "letters", with: letters.join(" ")
  #   fill_in "word", with: "MIEL"
  #   click_on "Play"
  #   assert_text "Sorry but MIEL does not seem to be a valid English word..."
  # end

  # mot valide
  # test "Submitting a valid word shows a congratulations message" do
  #   letters = ["D", "U", "N", "E", "A", "B", "C", "F", "G", "H"]
  #   visit new_url
  #   fill_in "letters", with: letters.join(" ")
  #   fill_in "word", with: "DUNE"
  #   click_on "Play"
  #   assert_text "Congratulations! DUNE is a valid English word!"
  # end
end
