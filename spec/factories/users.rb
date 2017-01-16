FactoryGirl.define do
  factory :user do
    email 'user1@client1.com'
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now
    role 'user'
  end

  factory :admin, class: User do
    email 'admin@admin.com'
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now
    role 'admin'
  end
end
