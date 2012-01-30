Fabricator(:webpage) do
  url { Faker::Internet.http_url }
end

Fabricator(:webpage_with_widgets, from: :webpage) do
  widgets { [Fabricate(:widget), Fabricate(:widget)] }
end
