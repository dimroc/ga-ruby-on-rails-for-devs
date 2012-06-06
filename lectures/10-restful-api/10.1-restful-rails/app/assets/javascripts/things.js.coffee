$(document).ready ->
  $('input#thing_term')
    .autocomplete({
      source: '/things.json',
      select: ( event, ui ) ->
        row = $("tr[id=#{ui.item.thing.id}]")
        row.addClass("selected")
        false
    })
      .data("autocomplete")._renderItem = (ul, item) ->
        $("<li></li>")
          .data("item.autocomplete", item)
          .append("<a>#{item.thing.name}</a>")
          .appendTo(ul);

