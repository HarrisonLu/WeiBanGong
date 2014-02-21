$(document).ready(function($) {
    $.fn.typeahead.Constructor.prototype.blur = function() {
        var that = this;
        setTimeout(function() {that.hide()}, 250);
    };

    $('#contacts_search').typeahead({
        source:function(query, process) {
            var parameter = {query: query};
            $.post('/contacts/search', parameter, function (data) {
                console.log(data);
                process(data);
            });
        },

        updater: function(item) {
            window.navigate("/contacts/")
            return item;
        }

    })
})
