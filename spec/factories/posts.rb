FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Post Title #{n}" }
    sequence(:body) { |n| "Post Body #{n}" }
    association :author, factory: :user
  end
end
