Fabricator(:control) do
  name { sequence { |i| "Control #{i}" } }
end
