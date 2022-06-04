@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
      
        System.assertEquals('callout:NewsAPI/v2/top-headlines?sources=bbc-news&sortBy=popularity', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"status":"ok","totalResults":1,"articles":[{"source":{"id":"bbc-news","name":"BBC News"},"author":"BBC News","title":"Perseverance: Nasa rover begins key drive to find life on Mars","description":"The Perseverance robot climbs a slope that could record evidence of ancient Martian biology.","url":"http://www.bbc.co.uk/news/science-environment-61470537","urlToImage":"https://ichef.bbci.co.uk/news/1024/branded_news/17A28/production/_124780869_pia24836_perseverance_selfie_at_rochette_figure_3_croppedcloseup.jpg","publishedAt":"2022-05-17T09:52:21.3249798Z","content":"Jonathan AmosScience correspondent@BBCAmoson Twitter\r\nImage source, NASA/JPL-Caltech/MSSS\r\nImage caption, Perseverance is drilling rocks and storing samples for later return to Earth laboratories\r\nNa… [+5878 chars]"}]}');
        res.setStatusCode(200);
        return res;
    }
}