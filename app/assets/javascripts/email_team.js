EmailTeam = {
    setup: function() {
        // add invisible 'div' to end of page:
        $('<div id="dialog"></div>').
            hide().
            appendTo($('.container'));
        $(document).on('click', '.email_team', EmailTeam.getDialog)
    },

    getDialog: function() {
        $.ajax({type: 'GET',
                url: $(this).attr('href'),
                timeout: 5000,
                success: EmailTeam.showDialog,
                error: function() { alert('Error!'); }
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

// $( ".email_team" ).dialog({
//     autoOpen: false,
//     show: {
//       effect: "blind",
//       duration: 1000
//     },
//     hide: {
//       effect: "explode",
//       duration: 1000
//     }
//   });

//   $( ".email_team" ).on( "click", function() {
//     $( "#dialog" ).dialog( "open" );
//     alert("oy")
//   });