require 'faker'

5.times do
    Account.create(
        name: Faker::DcComics.hero,
        description: Faker::Business.credit_card_type,
        credit_limit: Faker::Number.number(digits: 5),
        account_number: Faker::Bank.account_number(digits: 9)  
    )
end