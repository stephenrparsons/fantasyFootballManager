function init_tables(options) {

    options = options || {};
    var csv_path = options.csv_path || "";
    var csv_options = options.csv_options || {};
    var datatables_options = {
	"paging": true,
	"columnDefs": [
	    {
		"render": function (data, type, row) {
		    return parseFloat(data).toFixed(2);
		},
		"targets": [5]
	    },
	    { "visible": false, "targets": [3,4] }
	],
	"order": [[5, "desc" ]],
    };

    $("#" + 'prospects-container').html("<table class='table table-striped table-condensed' id='prospects-table'></table>");
    $("#" + 'taken-container').html("<table class='table table-striped table-condensed' id='taken-table'></table>");
    $("#" + 'my-team-container').html("<table class='table table-striped table-condensed' id='my-team-table'></table>");

    $.when($.get(csv_path)).then(
	function(data){      
	    var csv_data = $.csv.toArrays(data, csv_options);

	    var table_head = "<thead><tr>";

	    for (head_id = 0; head_id < csv_data[0].length; head_id++) {
		table_head += "<th>" + csv_data[0][head_id] + "</th>";
	    }

	    table_head += "</tr></thead>";
	    $('#prospects-table').append(table_head);
	    $('#prospects-table').append("<tbody></tbody>");
	    $('#taken-table').append(table_head);
	    $('#taken-table').append("<tbody></tbody>");
	    $('#my-team-table').append(table_head);
	    $('#my-team-table').append("<tbody></tbody>");

	    for (row_id = 1; row_id < csv_data.length; row_id++) { 
		var row_html = "<tr>";

		for (col_id = 0; col_id < csv_data[row_id].length; col_id++) {
		    row_html += "<td>" + csv_data[row_id][col_id] + "</td>";
		}
		
		row_html += "</tr>";
		$('#prospects-table tbody').append(row_html);
	    }

	    var prospectsTable = $("#prospects-table").DataTable(datatables_options);
	    var takenTable = $("#taken-table").DataTable(datatables_options);
	    var myTeamTable = $("#my-team-table").DataTable(datatables_options);

	    prospectsTable.on('mousedown', 'tbody tr', function(e) {
		var $row = $(this);
		var addRow = prospectsTable.row($row);
		if(e.shiftKey) {
		    myTeamTable.row.add(addRow.data()).draw();
		} else {
		    takenTable.row.add(addRow.data()).draw();
		}
		addRow.remove().draw();
	    });

	});
}
