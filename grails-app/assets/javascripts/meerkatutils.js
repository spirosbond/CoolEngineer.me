// This is a manifest file that'll be compiled into meerkatutils.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-3.3.1.min
//= require_self

/**
 * Create an async call to a controller and returns an HTML template
 * @param elem Element that was clicked
 * @param url Contorller and action via \${createLink}
 * @param type Specifies the type of request. (GET or POST)
 * @param params H hash map with the parameters
 * @param sucFun A function to run on success
 * @param errFun A function to run on error
 * @return The function for the ajax call
 */
function meerkatRemoteFunction(elem, url, type, params, sucFun, errFun) {
    elem.classList.add('running');
    $.ajax({
        url: url,
        data: params,
        type: type,
        dataType: "html",
        success: function(resp){
            setTimeout(function(){elem.classList.remove('running');},1000);
            sucFun(resp);
        },
        error:  function(resp){
            // setTimeout(function(){elem.classList.remove('running');},1000);
            errFun(resp);
        }
    });
}

