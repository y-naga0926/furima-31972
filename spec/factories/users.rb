FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'abc000000' }
    password_confirmation { 'abc000000' }
    family_name           { "ぜんかく" }
    first_name            { "ぜんかく" }
    family_name_kana      { "ゼンカクカナ" }
    first_name_kana       { "ゼンカクカナ" }
    birth_day             { "2020-01-01" }
  end
end