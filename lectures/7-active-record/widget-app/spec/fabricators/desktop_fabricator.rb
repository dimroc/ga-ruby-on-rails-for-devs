Fabricator(:desktop) do
  os { Faker::Lorem.word }
end

Fabricator(:desktop_with_widgets, from: :desktop) do
  # The '!' bang is needed to eagerly persist the list before assignment
  widgets! { [Fabricate(:widget_with_gadgets), Fabricate(:widget_with_gadgets)] }
end
