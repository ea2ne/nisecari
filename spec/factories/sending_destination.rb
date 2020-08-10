FactoryBot.define do

  factory :sending_destination do
    destination_first_name        {"jjj"}
    destination_family_name       {"jjj"}
    destination_first_name_kana	  {"あああああ"}
    destination_family_name_kana	{"あああああ"}
    post_code	                    {"0000000"}
    prefecture_code               {"00000000"}
    city	                        {"あああああ"}
    house_number                  {"00000000"}
  end
end