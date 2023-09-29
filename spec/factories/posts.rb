FactoryBot.define do
  factory :post do
    title { 'Sample Post' }
    association :author, factory: :user
  end
end
