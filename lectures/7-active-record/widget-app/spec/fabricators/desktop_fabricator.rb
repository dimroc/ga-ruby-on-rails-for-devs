Fabricator(:desktop) do
  os { Faker::Lorem.word }
end

Fabricator(:desktop_with_widgets, from: :desktop) do
  widgets { [Fabricate(:widget), Fabricate(:widget)] }
end
