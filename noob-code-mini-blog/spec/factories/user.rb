FactoryBot.define do
    factory :user, class: User do
      title { Faker::Quote.yoda }
      description { Faker::Lorem.characters(number: 15) }
      category_id { 1 }
      user_id { 1 }
  
      trait :with_comments do
        after(:create) do |post|
          2.times do
            post.comments << create(:comment)
          end
        end
      end
    end
  end
  