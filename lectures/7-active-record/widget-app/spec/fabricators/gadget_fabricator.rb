Fabricator(:gadget) do
  name { sequence { |i| "Gadget #{i}"} }
  type { %w(HeaderGadget SidebarGadget).sample }
  dock_index { rand(5) }
  widget
end

Fabricator(:gadget_with_controls, from: :gadget) do
  controls! { [Fabricate(:control), Fabricate(:control)] }
end

Fabricator(:sidebar_gadget, from: :gadget) do
  type { "SidebarGadget" }
end

Fabricator(:header_gadget, from: :gadget) do
  type { "HeaderGadget" }
  dock_index { nil }
end
