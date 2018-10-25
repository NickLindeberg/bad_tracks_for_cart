require 'rails_helper'

describe 'user index' do
  it 'user can see all songs' do
    song_1, song_2 = create_list(:song, 2)

    visit songs_path

    expect(page).to have_content("All Songs")
    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Plays: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Plays: #{song_2.play_count}")
  end
end
