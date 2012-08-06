FactoryGirl.define do
  factory :program do
    user  { User.first || user }
    name  'Program Name'
    description  'Program Description'
  end
end
