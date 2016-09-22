$(document).ready(function() {
  function formatAgendaItem (item) {
    if (item.loading) return item.text;

    var markup = item.identifier + ': ' + item.title + ' (' + item.from_organization.name + ')';

    return markup;
  }

  function formatAgendaItemSelection (item) {
    return item.identifier;
  }

  $("#deputation_agenda_item_id").select2({
    theme: "bootstrap",
    ajax: {
      url: 'https://toronto-ocd-api.herokuapp.com/bills/',
      dataType: 'json',
      delay: 250,
      data: function(params) {
        return {
          title__icontains: params.term,
          page: params.page
        };
      },
      processResults: function(data, params) {
        params.page = params.page || 1;

        return {
          results: data.results,
          pagination: {
            more: (params.page * data.meta.per_page) < data.meta.total_count
          }
        };
      },
      cache: true
    },
    escapeMarkup: function(markup) { return markup; },
    minimumInputLength: 1,
    templateResult: formatAgendaItem,
    templateSelection: formatAgendaItemSelection
  });
});
