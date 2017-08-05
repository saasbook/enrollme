$(document).ready(function() {
    var search_text = '';
    var search_reg = RegExp('');
    
    function showRows(search, search_cell, num_members, num_members_cell, waitlist, waitlist_cell) {
        $('#teams tbody tr').each(function(){
            $current_row = $(this)
            
            var current_search_cell;
            var current_num_members_cell;
            var current_waitlist_cell;
            
            $(this).find('td:nth-child(' + search_cell + ')').each(function() {
                current_search_cell = $(this)
            });
            
            $(this).find('td:nth-child(' + num_members_cell + ')').each(function() {
                current_num_members_cell = $(this)
            });
            
            $(this).find('td:nth-child(' + waitlist_cell + ')').each(function() {
                current_waitlist_cell = $(this)
            });
            
            
            $current_row.show().filter(function() {
                console.log($(current_search_cell).find('a').text())
                var current_search_text = $(current_search_cell).find('a').text().replace(/\s+/g, ' ');
                var current_num_members_text = current_num_members_cell.text().replace(/\s+/g, ' ');
                var current_waitlist_text = current_waitlist_cell.text().replace(/\s+/g, ' ');
                return !((search.test(current_search_text)) && (num_members.test(current_num_members_text)) && (waitlist.test(current_waitlist_text)));
            }).hide();
        });
    }
    
    function filterTable() {
        var num_members_val = '';
        if ($('#num_members_1').is(':checked')) {
            num_members_val = '1';
        }
        
        if ($('#num_members_2').is(':checked')) {
            if (num_members_val == '') {
                num_members_val = '2'
            } else {
                num_members_val += '|2';
            }
        }
        
        if ($('#num_members_3').is(':checked')) {
            if (num_members_val == '') {
                num_members_val = '3'
            } else {
                num_members_val += '|3';
            }
        }
        
        if ($('#num_members_4').is(':checked')) {
            if (num_members_val == '') {
                num_members_val = '4'
            } else {
                num_members_val += '|4';
            }
        }
        
        if ($('#num_members_5').is(':checked')) {
            if (num_members_val == '') {
                num_members_val = '5'
            } else {
                num_members_val += '|5';
            }
        }
        
        if ($('#num_members_6').is(':checked')) {
            if (num_members_val == '') {
                num_members_val = '6'
            } else {
                num_members_val += '|6';
            }
        }
        
        if (num_members_val == '') {
            num_members_val = ''
        }
        
        var num_members_reg = RegExp(num_members_val)
        
        var waitlist_val = ''
        
        if ($('#waitlisted_yes').is(':checked')) {
            waitlist_val = 'Yes'
        }
        
        if ($('#waitlisted_no').is(':checked')) {
            if (waitlist_val == '') {
                waitlist_val = 'No'
            } else {
                waitlist_val += '|No'
            }
        }
        
        if (waitlist_val == '') {
            waitlist_val = 'nothing'
        }
        
        var waitlist_reg = RegExp(waitlist_val)
        
        showRows(search_reg, 1, num_members_reg, 2, waitlist_reg, 4)
    }
    
    $('#search').keyup(function() {
        
        search_text = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$';
        search_reg = RegExp(search_text, 'i');
        filterTable();
    });
    
    
    $('#waitlisted_yes').click(function() {
        filterTable()
    });
    
    $('#waitlisted_no').click(function() {
        filterTable()
    });
    
    
    $('#num_members_1').click(function() {
        filterTable()
    });
    
    $('#num_members_2').click(function() {
        filterTable()
    });
    
    $('#num_members_3').click(function() {
        filterTable()
    });
    
    $('#num_members_4').click(function() {
        filterTable()
    });
    
    $('#num_members_5').click(function() {
        filterTable()
    });
    
    $('#num_members_6').click(function() {
        filterTable()
    });
    
});