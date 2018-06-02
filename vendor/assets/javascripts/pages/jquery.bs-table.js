/**
 * Theme: Ubold Admin Template
 * Author: Coderthemes
 * bootstrap tables
 */



$(document).ready(function () {


    // BOOTSTRAP TABLE - CUSTOM TOOLBAR
    // =================================================================
    // Require Bootstrap Table
    // http://bootstrap-table.wenzhixin.net.cn/
    // =================================================================
    var $table = $('#demo-custom-toolbar'), $remove = $('#demo-delete-row');


    $table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
        $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    });

    $remove.click(function () {
        var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
            return row.id
        });
        $table.bootstrapTable('remove', {
            field: 'id',
            values: ids
        });
        $remove.prop('disabled', true);
    });


});

/**
 * Hack for table loading issue - ideally this should be fixed in plugin code itself.
 */
$(window).on('load', function () {
   $('[data-toggle="table"]').show();
});

// Sample format for Invoice Column.
// =================================================================
function invoiceFormatter(value, row) {
    return '<a href="#" class="btn-link" > Order #' + value + '</a>';
}

// Sample Format for User Name Column.
// =================================================================
function nameFormatter(value, row) {
    return '<a href="#" class="btn-link" > ' + value + '</a>';
}

// Sample Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<span class="text-muted"> ' + value + '</span>';
}


// Sample Format for Order Status Column.
// =================================================================
function statusFormatter(value, row) {
    var labelColor;
    if (value == "Cartão Disponível") {
        labelColor = "success";
    } else if (value == "Unpaid") {
        labelColor = "warning";
    } else if (value == "Shipped") {
        labelColor = "info";
    } else if (value == "Cartão Usado") {
        labelColor = "danger";
    }
    console.log(row);
    var id = row.id;
    return '<a href="javascript:void(0)" onclick="alterarStatus('+id+')"><div class="label label-table label-' + labelColor + '"> ' + value +  '</div></a>';
}

function alterarStatus(a){
 



        const ipAPI = 'https://api.ipify.org?format=json'

        swal.queue([{
          title: 'Alterar Status',
          showCancelButton: true,
          confirmButtonText: 'Confirmar',
          cancelButtonText: 'Cancelar',
          text:
            'Alternar entre Cartão Disponível/Cartão Usado ',
          showLoaderOnConfirm: true,
          preConfirm: () => {
            return fetch(ipAPI)
              .then(response => response.json())
              .then(data => swal(
                  'Good job!',
                  'Feito!',
                  'success'
                ))
              .catch(() => {
                swal.insertQueueStep({
                  type: 'error',
                  title: 'Não foi possível fazer sua alteração.'
                })
              })
          }

        }]).catch(swal.noop);

       
}

// Sort Price Column
// =================================================================
function priceSorter(a, b) {
    a = +a.substring(1); // remove $
    b = +b.substring(1);
    if (a > b) return 1;
    if (a < b) return -1;
    return 0;
}


