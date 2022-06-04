/**
 * NewsController class used to call the NewsAPI.org API to get the bcc news articles
 * Created By: Arun Kumar
 * Created Date: 16/05/2022
 * LastModifiedDate : 17/05/2022
 */
public with sharing class NewsController {

    /**
     * getNews method to calls api to get the news articles.
     */
    @AuraEnabled(cacheable=true)
    public static String getNews(){
        
        String endpointURL = 'v2/top-headlines?sources=bbc-news&sortBy=popularity';

        try{
            
            //HTTP GET request to call the NewsAPI
            HttpRequest req = new HttpRequest();

            //Set the method type GET
            req.setMethod('GET');

            //Set the base URL from Salesforce named crdentials (NewsAPI) and append the url to fetch the information
            req.setEndpoint('callout:NewsAPI'+'/'+endpointURL);

            //Add the API Key in the header from named credential (NewsAPI) using merge field
            req.setHeader('X-Api-Key', '{!$Credential.Password}');

            req.setHeader('Accept','application/json');

            //Send the request
            HttpResponse res = new Http().send(req);
            System.debug('res'+ res.getBody());
            //return the reponse body.
            return res.getBody();
        }
        catch(Exception e){
            system.debug('Exception has occured! ' + e.getMessage());
            
            throw new AuraHandledException(e.getMessage());
            
        }
    }
}