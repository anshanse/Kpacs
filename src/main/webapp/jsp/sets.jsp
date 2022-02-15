<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="../grid/codebase/suite.js"></script>
        <link rel="stylesheet" href="../grid/codebase/suite.css">
        <style type="text/css">
            html, body {
                height:100%;
                padding: 10px 0 0 0;
                margin: 0px 10px 0px 10px;
                overflow:hidden;
            }
            .dhx-filter .dhx_layout,
            .dhx-filter .dhx_layout .dhx_layout-cell {
                background-color: #a6a6a6;
            }
            .remove-button {
                cursor: pointer;
                color: red;
            }
            .custom_form .dhx_layout-cell.dhx_layout-rows {
                overflow-y: scroll;
                margin-bottom: 15px;
                flex-grow: 1 !important;
            }

        </style>
    </head>
    <body>
        <!-- filter container -->
<div id="filter_container" style=" width: 100%; background-color: #a6a6a6"></div>
        <!-- component container -->
<div id="layout" style="height: 100%;"></div>

<link rel="stylesheet" href="https://snippet.dhtmlx.com/codebase/assets/css/auxiliary_controls.css">

<!-- component container -->
<section class="dhx_sample-container">
  <form id="form" style="height: 100%; margin: 0 10px;"></form>
  <!--<form id="form-settings" style="height: 100%; margin: 0 10px;"></form>-->
</section>

<!-- datasets -->
<script>
	const toolbarData = [
        {
            id: "add",
            type: "button",
            circle: true,
            value: "Add a new row",
            size: "small",
            icon: "mdi mdi-plus",
            full: true
        },
        {
            type: "spacer"
        },
       
    ];
    
    const editToolbarData = [
        {
            id: "close",
            icon: "dxi dxi-close",
            circle: true
        }
    ]
    
    
    //add form
    var jsondata = ${datakpacs};
    console.log("76", jsondata);
    var checkBoxRows = jsondata.map(({id, title})=>{return {id, text: title, type: "checkbox"}});
        console.log("78", checkBoxRows);
    const editFormConfig = {
        padding: 0,
        css: "custom_form",
        rows: [
            {
                id: "id",
                type: "input",
                name: "id",
                hidden: true
            },
            {
                type: "input",
                name: "title",
                label: "Title"
            },
            //checkbox
            {
                rows: checkBoxRows
            },
            //end checkbox
            {
                align: "end",
                cols: [
                    {
                        id: "apply-button",
                        type: "button",
                        text: "Apply",              
                        icon: "mdi mdi-check",
                        circle: true,
                    }
                ]
            }
            
        ]
    }
</script>



<!--  filter dataset -->
        <script>
            const filterFormConfig = {
                padding: "8px 12px 0",
                cols: [
                    {
                        type: "input",
                        name: "id",
                        label: "Id",
                        padding: "8px",
                        placeholder: "Type something",
                    },
                    {
                        type: "combo", // Input controls have initial width while Combo controls don't have
                        width: 300,
                        name: "title",
                        label: "Title",
                        padding: "8px",
                        itemHeight: 50,
                        placeholder: "Select something",
                    },
                    {
                        type: "datepicker",
                        name: "creationDate",
                        label: "Creation Date",
                        dateFormat: "%d-%m-%Y",
                        padding: "8px",
                        placeholder: "Select date",
                        editable: true
                    },
                    {
                        padding: "32px 8px 0",
                        cols: [
                            {
                                name: "search-button",
                                type: "button",
                                icon: "mdi mdi-magnify",
                                text: "Search",
                                circle: true
                            },
                            {
                                name: "clear",
                                type: "button",
                                text: "clear",
                                view: "link",
                                padding: "0 16px",
                                circle: true
                            }
                        ]
                    },
        ]
    };
</script>

<style>
	.dhx_demo-filter .dhx_layout1,
	.dhx_demo-filter .dhx_layout1 .dhx_layout-cell {
		background-color: #a6a6a6;
	}
</style>

<!-- icons -->
<link rel="stylesheet" href="//cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" />

<script>
            //Layout initialization
            const layoutfilter = new dhx.Layout(null, {
                rows: [
                    {
                        id: "filter",
                        height: "content",
                        css: "dhx-filter"
                    },
                    {
                        type: "space",
                        rows: [
                            {id: "grid"}
                        ]
                    }
                ]
            });

// initializing Form for data filtering
            const filterForm = new dhx.Form("filter_container", filterFormConfig);
// assign a handler to the Click event of the button with the id="search-button"
// pressing the Search button will get all data entered in the fields of the editing form and filter the data of Grid by the specified criteria
            filterForm.getItem("search-button").events.on("click", function () {
                const filterData = filterForm.getValue();
                grid.data.filter(function (item) {
                    let check = true;
                    // check the data from the editing form
                    // the filter will be applied to the grid data, if the fields in the editing form are not empty and satisfy a value in the grid data
                    for (const key in filterData) {
                        if (filterData[key] !== "" && !RegExp(filterData[key], "i").exec(item[key])) {
                            check = false;
                        }
                    }
                    return check;
                });
            });
            filterForm.getItem("clear").events.on("click", function () {
                filterForm.clear();
                grid.data.filter();
            });
        </script>

<!-- styles for "Edit" and "Delete" buttons -->
<style>
  	body {
        margin: 0;
    }
	.action-buttons {
		display: flex;
		justify-content: space-evenly;
      	width: 100%;
	}
	.dhx_demo-grid .remove-button {
		cursor: pointer;
		color: red;
	}
</style>
<!-- css template for DHTMLX Toolbar -->
<!-- the latest version is available here: https://snippet.dhtmlx.com/toolbar_template_a -->
<!-- you can find more css templates here: https://dhtmlx.com/docs/products/dhtmlxSuite/styling -->
<style>
	.toolbar_template_a.dhx_toolbar {
		background-color: #a6a6a6;
	}

	.toolbar_template_a.dhx_toolbar .dhx_navbar .dhx_button .dhx_button__icon {
		color: #fff;
	}

	.toolbar_template_a.dhx_toolbar .dhx_navbar .dhx_button.dhx_button--color_secondary .dhx_button__icon {
		color: rgba(255, 255, 255, 0.5);
	}

	.toolbar_template_a.dhx_toolbar .dhx_button--view_link.dhx_button--color_secondary:focus,
	.toolbar_template_a.dhx_toolbar .dhx_button--view_link.dhx_button--color_secondary:hover {
		background-color: rgba(223, 223, 223, 0.25);
	}


	.toolbar_template_a.dhx_toolbar .dhx_button--view_link.dhx_button--color_secondary:active {
		background-color: rgba(223, 223, 223, 0.15);
	}

	.toolbar_template_a.dhx_toolbar .dhx_toolbar-button {
		color: #fff;
	}

	.toolbar_template_a.dhx_toolbar .dhx_toolbar-button:hover,
	.toolbar_template_a.dhx_toolbar .dhx_toolbar-button:focus {
		background-color: rgba(223, 223, 223, 0.2);
	}

	.toolbar_template_a.dhx_toolbar .dhx_toolbar-button:active {
		background-color: rgba(223, 223, 223, 0.15);
	}

	.toolbar_template_a.dhx_toolbar .dhx_toolbar-button .dhx_toolbar-button__icon,
	.toolbar_template_a.dhx_toolbar .dhx_toolbar-button .dhx_toolbar-button__caret {
		color: rgba(255, 255, 255, 0.5);
	}

	.toolbar_template_a .dhx_toolbar-button--active,
	.toolbar_template_a .dhx_toolbar-button:active {
		background-color: rgba(255, 255, 255, 0.2);
	}

	.toolbar_template_a .dhx_toolbar-button--disabled *,
	.toolbar_template_a dhx_toolbar-button:disabled * {
		color: rgb(255, 255, 255, 0.5);
	}

	.toolbar_template_a .dhx_toolbar-button--disabled:hover,
	.toolbar_template_a .dhx_toolbar-button:disabled:hover {
		background-color: transparent;
	}

	.toolbar_template_a.dhx_toolbar .dhx_toolbar__item--separator {
		background: rgba(255, 255, 255, 0.3);
	}

	.toolbar_template_a.dhx_toolbar .dhx_form-group .dhx_input {
		color: #fff;
		-webkit-box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.4);
		box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.4);
		background-color: transparent;
	}

	.toolbar_template_a.dhx_toolbar .dhx_form-group .dhx_input::-webkit-input-placeholder {
		color: rgba(255, 255, 255, 0.7);
	}

	.toolbar_template_a.dhx_toolbar .dhx_form-group .dhx_input::-moz-placeholder {
		color: rgba(255, 255, 255, 0.7);
	}

	.toolbar_template_a.dhx_toolbar .dhx_form-group .dhx_input:-ms-input-placeholder {
		color: rgba(255, 255, 255, 0.7);
	}

	.toolbar_template_a.dhx_toolbar .dhx_form-group .dhx_input::-ms-input-placeholder {
		color: rgba(255, 255, 255, 0.7);
	}

	.toolbar_template_a.dhx_toolbar .dhx_form-group .dhx_input::placeholder {
		color: rgba(255, 255, 255, 0.7);
	}

	.toolbar_template_a.dhx_toolbar .dhx_form-group .dhx_input:focus {
		-webkit-box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.6);
		box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.6);
	}

    .toolbar_template_a.dhx_toolbar .dhx_toolbar-button-image {
        background-color: #ededed;
    }

	.toolbar_template_a--context-menu .dhx_menu {
		background-color: #30333d;
	}

	.toolbar_template_a--context-menu .dhx_menu-button {
		color: #fff;
	}

	.toolbar_template_a--context-menu .dhx_menu-button:hover:not(:disabled) {
		background-color: rgba(0, 0, 0, 0.07);
	}

	.toolbar_template_a--context-menu .dhx_menu-button--active:not(:disabled),
	.toolbar_template_a--context-menu .dhx_menu-button:active:not(:disabled),
	.toolbar_template_a--context-menu .dhx_menu-button:focus:not(:disabled) {
		color: #65a6e7;
		background-color: rgba(0, 0, 0, 0.15);
	}

	.toolbar_template_a--context-menu .dhx_menu-button--active:not(:disabled) .dhx_menu-button__icon,
	.toolbar_template_a--context-menu .dhx_menu-button:active:not(:disabled) .dhx_menu-button__icon,
	.toolbar_template_a--context-menu .dhx_menu-button:focus:not(:disabled) .dhx_menu-button__icon {
		color: inherit;
	}

	.toolbar_template_a--context-menu .dhx_menu-button__icon {
		color: rgba(255, 255, 255, 0.7);
	}
</style>
<!-- end of code for toolbar_template_a -->

<!-- icons -->
<link rel="stylesheet" href="//cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" />
<script>
    var jsondata = ${datakpacset};
    var dataset = jsondata.map(el=>{return {...el, id: el.id.toString()};});
</script>

<script>
    // Layout initialization
const layout = new dhx.Layout("layout", {
    cols: [
        {
            rows: [
                {
                    id: "toolbar",
                    height: "content"
                    
                },
                {
                    type: "space",
                    rows: [
                        {
                            id: "grid"
                        }
                    ]
                }
            ]
        }
    ]
});

// Toolbar initialization
const toolbar = new dhx.Toolbar(null, {
    css: "toolbar_template_a"
});
// loading structure into Toolbar
toolbar.data.parse(toolbarData);
// assign the handler to the Click event of the button with the id="add"
// pressing the Add button will add a new item to the grid and open the form for editing this item
toolbar.events.on("click", function (id) {
    if (id === "add") {
        openEditor();
    }
});

// initializing Grid for data vizualization

const grid = new dhx.Grid(null, {
    css: "dhx_demo-grid",
    columns: [
        { id: "id", gravity: 0.15, header: [{ text: "Id" }] },
        { id: "title", gravity: 1, header: [{ text: "Title" }] },
        {
            id: "action", gravity: 0.2, header: [{ text: "", align: "center" }],
            htmlEnable: true, align: "center",
            template: function () {
                return "<span class='action-buttons'><a class='remove-button'>Delete</a></span>"
            }
        }
    ],
    autoWidth: true,
    data : dataset,
    selection: "row",
    eventHandlers: {
        onclick: {
            "remove-button": function (e, data) {
                var location = "/sets/delete/" + data.row.id;
                window.location.replace(location);
            }
        }
    }
});

grid.events.on("cellDblClick", function(row,column){
        console.log("435", row.id);
        var location = "/sets/" + row.id;
        window.location.replace(location);
});

const titlesList = [...new Set(dataset.map(function (item) {
        if (item.title) {
            return item.title;
        }
    }))];
    // get an item with name:"authors"
    // get the Combo widget of the item
    // and add an array of authors with unique values and their IDs returned via the map cycle to the Combo widget
    filterForm.getItem("title").getWidget().data.add(titlesList.map(function (item) {
        return { id: item, value: item };
    }));

// attaching widgets to Layout cells
layoutfilter.getCell("filter").attach(filterForm);

// initializing Widnow for the editing form
const editWindow = new dhx.Window({
    width: 440,
    height: 480,
    modal: true
});

// initializing Form for the editing form
const editForm = new dhx.Form("form", editFormConfig);
// assign a handler to the Click event of the button with the id="apply-button"
// pressing the Apply button will get all data of the form, update data of the edited item, and close the editing form
editForm.getItem("apply-button").events.on("click", function () {
    const newData = editForm.getValue();
    console.log("476", newData);
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/sets/add", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify(newData));
    closeEditor();
});

// initializing the function that opens the editing form for a Grid item returned by its id 
// and fills the form fields with the data of the item
function openEditor() {
    editWindow.show();
}

// initializing the function that closes the editing form and clears it
function closeEditor() {
    editForm.clear();
    editWindow.hide();
    document.location.reload();
}

// attaching widgets to Layout cells
layout.getCell("toolbar").attach(toolbar);
layout.getCell("grid").attach(grid);

// attaching Form to Window
editWindow.attach(editForm);

</script>
    </body>
</html>
