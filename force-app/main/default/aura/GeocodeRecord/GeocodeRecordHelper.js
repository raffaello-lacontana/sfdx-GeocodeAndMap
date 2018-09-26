({ 
    search : function(component, event, helper) { 
    	var xmlHttp = new XMLHttpRequest();
        var searchString = 'https://nominatim.openstreetmap.org/search/';
    	searchString += component.find("searchString").get("v.value");
        searchString += '?format=json&addressdetails=1&limit=10&polygon_svg=1';
    	console.log(searchString);
    	xmlHttp.open( "GET", searchString, true );
	    xmlHttp.setRequestHeader('Content-Type', 'application/json');
		xmlHttp.responseType = 'text';
		xmlHttp.onload = function () {
    	    console.log("onload");
        	console.log(xmlHttp.readyState);
        	console.log(xmlHttp.status);
    		if (xmlHttp.readyState === 4) {
    	    	if (xmlHttp.status === 200) {
	            	console.log(xmlHttp.response);
            		//console.log(xmlHttp.responseText);
		        }
	    	}
		};
	    xmlHttp.send( null );
	    console.log("Request sent");
    }
})