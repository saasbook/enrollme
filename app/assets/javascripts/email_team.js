EmailTeam = {
    setup: function() {
        // add invisible 'div' to end of page:
        $('<div id="dialog"></div>').
            hide().
            appendTo($('body'));
        $(document).on('click', '.email_team', EmailTeam.getDialog)
    },

    getDialog: function() {
        $.ajax({type: 'GET',
                url: $(this).attr('href'),
                timeout: 5000,
                success: EmailTeam.showDialog,
                error: function(jqXHR, textStatus, errorThrown) { alert(jqXHR.textStatus); }
               });
        return(false);
    },

    showDialog: function(data) {
        $('#dialog').
            html(data).
            show();

        $('div.row').css({'opacity': '0.4'});

        // make the Close link in the hidden element work
        $('#closeLink').click(EmailTeam.hideDialog);
        return(false);  // prevent default link action
    },

    hideDialog: function() {
        $('#dialog').hide(); 
        $('div.row').css({'opacity': '1'});
        return(false);
    },
}
$(EmailTeam.setup);