FactoryBot.define do
    factory :user do
        name { Faker::Superhero.name }
        email { 'foo@bar.com' }
        password { 'foobar' }
    end
end