require 'faker'

5.times do 
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.unique.last_name,
        email: Faker::Internet.unique.free_email,
        password: '12345678',
        password_confirmation: '12345678'

    )
end