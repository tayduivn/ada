/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function initDoc()
{
    createDataTable();
    initToolTips();
}
function createDataTable()
{
    var datatable = $j('#course_instance_Table').dataTable({
        "bJQueryUI": true,
        "oLanguage": 
         {
            "sUrl": HTTP_ROOT_DIR + "/js/include/jquery/dataTables/dataTablesLang.php"
         },
         "aoColumnDefs": [
            {
               "aTargets": [ 0 ], 
                "bVisible":false,
            },
            {
               "aTargets": [ 1 ], 
               "sClass": "Name_Column", 
            },
            {
               "aTargets": [ 2 ], 
               "sClass": "Status_Column", 
            },
            {
               "aTargets": [ 3 ], 
               "sClass": "Date_Column", 
            },
            {
               "aTargets": [ 4 ],    
               "sClass": "Levell_Column", 
            },
            {
               "aTargets": [ 5 ],    
               "sClass": "Code_Column", 
            },
            {
               "aTargets": [ 6 ],    
               "sClass": "Certificate_Column", 
            }
           
         
        ],
        
    });
}
 function  initToolTips()
 {
    $j('.tooltip').tooltip({

        show : {
                effect : "slideDown",
                delay : 300,
                duration : 100
        },
        hide : {
                effect : "slideUp",
                delay : 100,
                duration : 100
        },
        position : {
                my : "center bottom-5",
                at : "center top"
        },
        content: function() {
        return $j(this).attr('title');
        }
   });
  
    
 }
function saveStatus(selectedValue)
{
    alert(selectedValue.value);
}
