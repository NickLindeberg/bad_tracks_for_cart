FactoryBot.define do
  factory :song do
    sequence(:title) {|n| "Song #{n}"}
    sequence(:length) {|n| 10*n}
    sequence(:play_count) {|n| 100*n}
    artist
  end
end
