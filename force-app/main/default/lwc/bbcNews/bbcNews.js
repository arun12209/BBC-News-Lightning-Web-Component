import { LightningElement, wire, track } from 'lwc';
import getNews from '@salesforce/apex/NewsController.getNews';

export default class BbcNews extends LightningElement {
    @track newsArticles = [];
    @track errorMessage = '';
    //constructor 
    constructor(){
        super();
        this.handleLoad();
    }
    // handleLoad method => used to get the news articles from bbc news ( NewsAPI.org ) 
    handleLoad() {
        getNews()
            .then(result => {
                if(result){
                    let res = JSON.parse(result);
                    console.log(JSON.stringify(res));
                    for(let i=0; i<res.articles.length; i++){
                        let obj = {
                                title : res.articles[i].title,
                                url : res.articles[i].url,
                                imgURL:res.articles[i].urlToImage,
                                publishedAt: res.articles[i].publishedAt,
                                description : res.articles[i].description,
                                rank : i+1
                            };
                        this.newsArticles.push(obj);
                    }  
                }
            })
            .catch(error => {
                this.errorMessage = error.body.message;
            });
    }
}