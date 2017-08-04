var $team_rows = $('#teams tr');

console.log($team_rows)

$(document).ready(function() {
    $('#search').keyup(function() {
        
        var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
        reg = RegExp(val, 'i'),
        text;
        
        
        $('#teams tr td:nth-child(1)').each(function(){
            $current_row = $(this).parent()
             console.log($(this.textContent))
             $team_members = $(this)
             console.log('column: ' + $team_members.context)
             console.log('row: ' + $current_row.context)
             $(this).show().filter(function() {
            text = $team_members.textContent;
            return !reg.test(text);
        }).hide();
    })
    });
});