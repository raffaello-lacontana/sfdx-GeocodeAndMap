({ 
    search_old : function(component, event, helper) { 
    	var xmlHttp = new XMLHttpRequest();
        /*var searchString = 'https://nominatim.openstreetmap.org/search/';
    	searchString += component.find("searchString").get("v.value");
        searchString += '?format=json&addressdetails=1&limit=10&polygon_svg=1';*/
        var url = 'https://maps.googleapis.com/maps/api/geocode/json?language=it';
        url += '&key=AIzaSyDd8YHPTNdMQXSTFfoIEd0S7AiZv82R5l8';
        url += '&address=' + component.find("searchString").get("v.value");
        
    	xmlHttp.open( "GET", url, true );
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
    },
    
   	search : function(component, event, helper) {
        var googleApiKey = component.get("v.googleApiKey");
        var address = component.find("searchString").get("v.value");
        
        var action = component.get("c.googleGeocode");
        action.setParams({ googleApiKey : googleApiKey, address : address });
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
            	var res = response.getReturnValue();
                console.log(res);
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    }
})