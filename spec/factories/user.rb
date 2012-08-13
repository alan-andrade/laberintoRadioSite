FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password             'mySecretPassword'
    password_salt        Authlogic::Random.hex_token
    crypted_password     {|u| Authlogic::CryptoProviders::Sha512.encrypt(u.password + u.password_salt) }
    persistence_token    Authlogic::Random.hex_token
    single_access_token  Authlogic::Random.friendly_token
    perishable_token     Authlogic::Random.friendly_token

    trait :with_profile do
      profile
    end
  end
end
