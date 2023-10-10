FactoryBot.define do
  factory :post do
    title { 'Sample Post' }
    text { 'This is the post content.' }
    association :author, factory: :user
  end
end
