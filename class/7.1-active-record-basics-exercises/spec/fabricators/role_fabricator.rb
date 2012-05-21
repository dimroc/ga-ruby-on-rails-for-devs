Fabricator(:role) do
  name { Faker::Lorem.word }
  department { Faker::Lorem.word }
end
