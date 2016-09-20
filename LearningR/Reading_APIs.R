#Application Programming Interfaces
myapp = oauth_app("twitter",
                  key="yourConsumerKeyHere", secret = "yourConsumerSecretHere")
sig = sign_oauth1.0(myapp,
                    token = "yourTokenHere",
                     token_secret = "yourTokenSecretHere")
homeTL = GET("http://api.twitter.com/1.1/statuses/home_timeline.json", sig)
#Converting the json object
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]