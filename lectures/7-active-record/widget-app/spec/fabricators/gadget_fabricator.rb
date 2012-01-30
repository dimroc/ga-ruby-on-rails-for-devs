Fabricator(:gadget) do
  name { sequence { |i| "Gadget #{i}"} }
  type { %w(HeaderGadget SidebarGadget).sample }
  widget
end

Fabricator(:gadget_with_controls, from: :gadget) do
  controls! { [Fabricate(:control), Fabricate(:control)] }
end
