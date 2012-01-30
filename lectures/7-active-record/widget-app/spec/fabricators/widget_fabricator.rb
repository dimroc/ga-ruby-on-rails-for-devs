Fabricator(:widget) do
  name { sequence { |i| "Widget #{i}" } }
end

Fabricator(:widget_with_gadgets, from: :widget) do
  gadgets! { [Fabricate(:gadget_with_controls), Fabricate(:gadget_with_controls)] }
end
