FactoryBot.define do
  factory :purchase_destination do
    # user_id        { 3 }
    # item_id        { 3 }
    token {"tok_abcdefghijk00000000000000000"}
    post_code           {"587-0063"}
    prefecture_id       { 28 }
    city                { "堺市美原区大饗" }
    address             { "86-11" }
    building_name       { "" }
    phone_number        { "08097845254"}
    # purchase_id         {  }

    # assosiation :user
    # assosiation :item
  end
end
