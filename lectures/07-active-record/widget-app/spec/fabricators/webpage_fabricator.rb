Fabricator(:webpage) do
  url { Faker::Internet.http_url }
end

Fabricator(:webpage_with_widgets, from: :webpage) do
  # The '!' bang is needed to eagerly persist the list before assignment
  # Otherwise, it will hold a list of unsaved models
  widgets! { [Fabricate(:widget_with_gadgets), Fabricate(:widget_with_gadgets)] }
end
