public with sharing class GeocodeUtils {

    @AuraEnabled
    public static GeocodeBean googleGeocode(String googleApiKey, String address) {
        String addressEncoded = EncodingUtil.urlEncode(address, 'UTF-8');
        String endpointUrl = 'https://maps.googleapis.com/maps/api/geocode/json?language=it&key=' + googleApiKey + '&address=' + addressEncoded;
        
        System.debug('endpointUrl' + endpointUrl);
        
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        req.setEndpoint(endpointUrl);
        req.setMethod('GET');

        try {
            if(!Test.isRunningTest()) {
                res = http.send(req);
            } else {
                res.setBody(GeocodeBeanTest.getJson());
            }
        } catch(System.CalloutException e) {
            System.debug('Exception: ' + e);
        }


        GeocodeBean bean = (GeocodeBean) System.JSON.deserialize(res.getBody(), GeocodeBean.class);
        
        /*if(bean.results.size() == 1) {
        	acc.Normalizzato_Via__c = '';
            acc.Normalizzato_Civico__c = '';
            acc.Normalizzato_CAP__c = '';
            acc.Normalizzato_Citta__c = '';
            acc.Normalizzato_Amministrativo_Liv_1__c = '';
            acc.Normalizzato_Amministrativo_Liv_2__c = '';
            acc.Normalizzato_Codice_Nazione__c = '';
            acc.Normalizzato_Indirizzo_esteso__c = '';
            acc.Normalizzato_Coordinate__Latitude__s = null;
            acc.Normalizzato_Coordinate__Longitude__s = null;
            
            for(GeocodeBean.Address_components comp : bean.results[0].address_components) {
                if((new Set<String>(comp.types)).contains('route')) {
                    acc.Normalizzato_Via__c = comp.short_name;
                }
                if((new Set<String>(comp.types)).contains('street_number')) {
                    acc.Normalizzato_Civico__c = comp.short_name;
                }
                if((new Set<String>(comp.types)).contains('locality')) {
                    acc.Normalizzato_Citta__c = comp.short_name;
                }
                if((new Set<String>(comp.types)).contains('postal_code')) {
                    acc.Normalizzato_CAP__c = comp.short_name;
                }
                if((new Set<String>(comp.types)).contains('administrative_area_level_1')) {
                    acc.Normalizzato_Amministrativo_Liv_1__c = comp.short_name;
                }
                if((new Set<String>(comp.types)).contains('administrative_area_level_2')) {
                    acc.Normalizzato_Amministrativo_Liv_2__c = comp.short_name;
                }
                if((new Set<String>(comp.types)).contains('country')) {
                    acc.Normalizzato_Codice_Nazione__c = comp.short_name;
                }	    
            }
            acc.Normalizzato_Indirizzo_esteso__c = bean.results[0].formatted_address;
            acc.Normalizzato_Coordinate__Latitude__s = bean.results[0].geometry.location.lat;
            acc.Normalizzato_Coordinate__Longitude__s = bean.results[0].geometry.location.lng;
            acc.Ultima_normalizzazione__c = System.now();
        }
        acc.Ultimo_tentativo_normalizzazione__c = System.now();
		update acc;*/
        return bean;
    }
}