FactoryBot.define do
  factory :comment do
    association :user
    association :post
    text { 'Comment Text' }
  end
end
