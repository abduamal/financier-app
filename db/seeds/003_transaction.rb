require 'faker'

5.times do
    Transaction.create(
        amount: Faker::Commerce.price,
        category: Faker::Commerce.department,
        description: Faker::Commerce.product_name,
        date: Faker::Date.backward(days: 23)
    )
end
