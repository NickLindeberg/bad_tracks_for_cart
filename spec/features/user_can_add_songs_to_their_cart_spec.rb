require 'rails_helper'

RSpec.describe "When a user adds songs to their cart" do
  it "a message is displayed" do
    artist = Artist.create(name: 'Rick Astley')
    song = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)

    visit songs_path

    click_button "Add Song"

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")
  end

  it "the message correctly increments for multiple songs" do
    artist = Artist.create(name: 'Rick Astley')
    song = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)

    visit songs_path

    click_button "Add Song"
    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")

    click_button "Add Song"

    expect(page).to have_content("You now have 2 copies of #{song.title} in your cart.")
  end

  scenario "the total number of songs in the cart increments" do
    song = Song.create(title: "Song 1")

    visit songs_path

    expect(page).to have_content("Cart: 0")

    click_button "Add Song"

    expect(page).to have_content("Cart: 1")
  end
end
