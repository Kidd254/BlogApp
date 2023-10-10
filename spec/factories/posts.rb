FactoryBot.define do
  factory :post do
    title { 'Sample Post' }
    body { 'Sample Post Body' } # Add the body attribute
    association :author, factory: :user
  end
end
