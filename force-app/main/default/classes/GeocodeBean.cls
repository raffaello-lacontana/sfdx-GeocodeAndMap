public class GeocodeBean {
    
    @AuraEnabled public List<Results> results {get;set;}
    @AuraEnabled public String status {get;set;}	//OK
    
    public class Results {
        @AuraEnabled public List<Address_components> address_components {get;set;}
        @AuraEnabled public String formatted_address {get;set;}	//Corso Garibaldi, 71, 20121 Milano, Italia
        @AuraEnabled public Geometry geometry {get;set;}
        @AuraEnabled public boolean partial_match {get;set;}
        @AuraEnabled public String place_id {get;set;}	//ChIJeehXskvBhkcRSbL2KbaCxJY
        @AuraEnabled public List<String> types {get;set;}
    }
    
    public class Address_components {
        @AuraEnabled public String long_name {get;set;}	//71
        @AuraEnabled public String short_name {get;set;}	//71
        @AuraEnabled public List<String> types {get;set;}
    }
    
    public class Geometry {
        @AuraEnabled public Location location {get;set;}
        @AuraEnabled public String location_type {get;set;}	//ROOFTOP
        @AuraEnabled public Viewport viewport {get;set;}
    }
    
    public class Location {
        @AuraEnabled public Double lat {get;set;}	//45.4750687
        @AuraEnabled public Double lng {get;set;}	//9.183375
    }
    
    public class Viewport {
        @AuraEnabled public Northeast northeast {get;set;}
        @AuraEnabled public Southwest southwest {get;set;}
    }
    
    public class Northeast {
        @AuraEnabled public Double lat {get;set;}	//45.4764176802915
        @AuraEnabled public Double lng {get;set;}	//9.184723980291503
    }
    
    public class Southwest {
        @AuraEnabled public Double lat {get;set;}	//45.47371971970851
        @AuraEnabled public Double lng {get;set;}	//9.182026019708498
    }
}