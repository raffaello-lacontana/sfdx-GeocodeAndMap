public with sharing class GeocodeUtils {

    @AuraEnabled
    public static Object googleGeocode(String googleApiKey, String address) {
        String addressEncoded = EncodingUtil.urlEncode(address, 'UTF-8');
        String endpointUrl = 'https://maps.googleapis.com/maps/api/geocode/json?language=it&key=' + googleApiKey + '&address=' + addressEncoded;
        
        System.debug('endpointUrl' + endpointUrl);
        
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        req.setEndpoint(endpointUrl);
        req.setMethod('GET');
		res = http.send(req);
        
        return System.JSON.deserializeUntyped(res.getBody());
    }
}