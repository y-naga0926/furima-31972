FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + "1a"}
    password_confirmation { password }
    family_name           { "ぜんかく" }
    first_name            { "ぜんかく" }
    family_name_kana      { "ゼンカクカナ" }
    first_name_kana       { "ゼンカクカナ" }
    birth_day             { "2020-01-01" }
  end

  # factory :buyer, class: User do
  #   nickname              { Faker::Name.initials(number: 2) }
  #   email                 { Faker::Internet.free_email }
  #   password              { Faker::Internet.password(min_length: 6) }
  #   password_confirmation { password }
  #   family_name           { "ぜんかく" }
  #   first_name            { "ぜんかく" }
  #   family_name_kana      { "ゼンカクカナ" }
  #   first_name_kana       { "ゼンカクカナ" }
  #   birth_day             { "2020-01-01" }
  # end
end