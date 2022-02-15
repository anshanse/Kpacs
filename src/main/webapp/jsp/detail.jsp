<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="../grid/codebase/suite.js"></script>
        <link rel="stylesheet" href="../grid/codebase/suite.css">
        <link rel="stylesheet" href="../jsp/detail_style_customisation.css">
        <link rel="stylesheet" href="//cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" />
    </head>
    <body>
        <!-- filter container -->
<div id="filter_container" style=" width: 100%; background-color: #ededed"></div>
        <!-- component container -->
<div id="layout" style="height: 100%;"></div>

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
    
    const editFormConfig = {
        padding: 0,
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
            {
                type: "input",
                name: "description", 
                label: "Description" 
            },
            {
                type: "datepicker",
                name: "creationDate",
                label: "Creation date",
                dateFormat: "%d-%m-%Y"
            },
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




<script>
    console.log("362", ${datakpacs});
    var jsondata = ${datakpacs};
    console.log("364", jsondata);
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
//        const newId = grid.data.add({
//            title: "",
//            description: "",
//            creationDate: ""
//        });
        openEditor();
    }
});

// initializing Grid for data vizualization

const grid = new dhx.Grid(null, {
    css: "dhx_demo-grid",
    columns: [
        { id: "id", gravity: 0.25, header: [{ text: "Id" }] },
        { id: "title", gravity: 1, header: [{ text: "Title" }] },
        { id: "description", header: [{ text: "Description" }] },
        { id: "creationDate", gravity: 0.5, header: [{ text: "Creation Date", align: "left" }]},
        {
            id: "action", gravity: 0.3, header: [{ text: "", align: "center" }],
            htmlEnable: true, align: "center",
            template: function () {
                return "<span class='action-buttons'><a class='remove-button'>Delete</a></span>"
            }
        }
    ],
    autoWidth: true,
    data : dataset,
    eventHandlers: {
        onclick: {
            "remove-button": function (e, data) {
                var location = "/kpacs/delete/" + data.row.id;
                            window.location.replace(location);
            }
        }
    }
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
    height: 360,
    modal: true
});

// initializing Form for the editing form
const editForm = new dhx.Form(null, editFormConfig);
// assign a handler to the Click event of the button with the id="apply-button"
// pressing the Apply button will get all data of the form, update data of the edited item, and close the editing form
editForm.getItem("apply-button").events.on("click", function () {
    const newData = editForm.getValue();
    //console.log("466", newData);
    //newData.id = null;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/kpacs/add", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify(newData));
//#################
//        const newData = editForm.getValue();
//    console.log("468", newData.id);
//    console.log("469", newData);
//    if (newData.id) {
//        newData.id = null;
//        console.log("476", newData);
//        grid.data.update(newData.id, { ...newData })
//        grid.scrollTo(newData.id, "title");
//    }
    //################
    closeEditor();
});

// initializing the function that opens the editing form for a Grid item returned by its id 
// and fills the form fields with the data of the item
function openEditor() {
    editWindow.show();
//    const item = grid.data.getItem(id);
//    if (item) {
//        editForm.setValue(item);
//    }
}

// initializing the function that closes the editing form and clears it
function closeEditor() {
    editForm.clear();
    editWindow.hide();
    window.location.replace(location);
}

// attaching widgets to Layout cells
layout.getCell("toolbar").attach(toolbar);
layout.getCell("grid").attach(grid);

// attaching Form to Window
editWindow.attach(editForm);

</script>
    </body>
</html>
