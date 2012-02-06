Fabricator(:user) do
  name { Fabricate.sequence(:name) { |i| "User #{i}" } }
  email { Fabricate.sequence(:email) { |i| "user_#{i}@example.com" } }
  password "password"
end
