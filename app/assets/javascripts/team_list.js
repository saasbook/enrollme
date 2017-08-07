$(document).ready(function() {
    var search_text = '^(?=.*\\b' + $.trim($('#search').val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$';
    var search_reg = RegExp(search_text, 'i');
    var current_sort = 'desc';
    
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
                //console.log($(current_search_cell).find('a').text())
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
            num_members_val = 'nothing'
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
    
    filterTable();
    
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
    
    function sortTable(order, child) {
        var asc = (order == 'asc');
        var tbody = $('#teams tbody');
        var trows = $('#teams tbody tr');
    
        trows.sort(function(a, b) {
            if (asc) {
                var cell_a_val = parseInt($(a).find('td:nth-child(' + child + ')').text());
                var cell_b_val = parseInt($(b).find('td:nth-child(' + child + ')').text());
                return cell_a_val - cell_b_val;
            } else {
                var cell_a_val = parseInt($(a).find('td:nth-child(' + child + ')').text());
                var cell_b_val = parseInt($(b).find('td:nth-child(' + child + ')').text());
                return cell_b_val - cell_a_val;
            }
        }).appendTo(tbody);
    }
    
    $('#users_count_header').click(function(){
        if (current_sort == 'desc') {
            sortTable('asc', 2);
            current_sort = 'asc'
        } else {
            sortTable('desc', 2)
            current_sort = 'desc'
        }
        if ($('#users_count_arrow').text() == '\u25BC') {
            $('#users_count_arrow').text('\u25B2')
        }
        else {
            $('#users_count_arrow').text('\u25BC')
        }
    });
    
    $("#pending_requests_header").click(function(){
        if (current_sort == 'desc') {
            sortTable('asc', 3);
            current_sort = 'asc'
        } else {
            sortTable('desc', 3)
            current_sort = 'desc'
        }
        if ($('#pending_requests_arrow').text() == '\u25BC') {
            $('#pending_requests_arrow').text('\u25B2')
        }
        else {
            $('#pending_requests_arrow').text('\u25BC')
        }
    });
    
    $(".checks").each(function() {
        var elt = $(this).parent();
        var elt_child =$(this);
        elt_child.click(function() {
            if (elt.css("background-color") == "rgb(44, 62, 80)") {
                elt.css("background-color", "#149c82");
                elt.css("border-color", "#149c82");
            } else {
                elt.css("background-color", "#2c3e50");
                elt.css("border-color", "#2c3e50");
            }
        });
    });
});