/**
 * NewsControllerTest class used to test the NewsController class feature.
 * Created By: Arun Kumar
 * Created Date: 16/05/2022
 * LastModifiedDate : 17/05/2022
 */
@isTest
public with sharing class NewsControllerTest {
    @isTest
    public static void calloutTest(){
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        String res = NewsController.getNews();
        
        System.assertEquals(res.substring(1, 14), '"status":"ok"');
    }
    
}