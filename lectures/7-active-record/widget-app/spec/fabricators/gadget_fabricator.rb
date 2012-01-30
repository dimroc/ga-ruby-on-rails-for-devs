Fabricator(:gadget) do
  name { sequence { |i| "Gadget #{i}"} }
  widget
end

Fabricator(:gadget_with_controls, from: :gadget) do
  controls! { [Fabricate(:control), Fabricate(:control)] }
end
