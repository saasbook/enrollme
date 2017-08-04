var $team_rows = $('#teams tr');

console.log($team_rows)

$(document).ready(function() {
    $('#search').keyup(function() {
        
        var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
        reg = RegExp(val, 'i'),
        text;
        
        $('#teams tr').each(function(){
            $current_row = $(this)
            $(this).find('td:nth-child(1)').each(function() {
                $current_cell = $(this)
                $current_row.show().filter(function() {
                    text = $current_cell.context.textContent.replace(/\s+/g, ' ');
                    return !reg.test(text);
                }).hide();
            });
        });
    });
});