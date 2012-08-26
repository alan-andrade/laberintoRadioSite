FactoryGirl.define do

  factory :program do
    name  'Program Name'
    description  'Program Description'
    space
    before(:create) do |program|
      program.users << FactoryGirl.create(:user)
    end
  end

end
