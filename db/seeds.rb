# The create! method is just like the create method,
# except it raises an exception
# for an invalid user rather than returning false

50.times do |x|
  password = 'password'

  User.create!(
    name:     Faker::Pokemon.name,
    email:    Faker::Internet.email,
    password: password,
    password_confirmation: password
  )
end
