require 'haml'

s = %q{

!!!

%html{ "xmlns" => "http://www.w3.org/1999/xhtml", "xml:lang" => "en"}

  %head
    %title HAML Example

  %body

    / a paragraph of class intro
    
    %p.intro
      An Introduction to HAML
      
    / a div with id=links
    
    #links

      %a{ href: "http://generalassemb.ly" } GeneralAssemb.ly

}

e = Haml::Engine.new s

puts e.render


