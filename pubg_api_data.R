library(rjson)
library(RCurl)
key <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJiNjQ2MzcyMC00NjZjLTAxMzYtNDBiNC0zNWY1ZjZhMzEzYTIiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTI3NzA4MTQ3LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6InB1Ymdfc3RhdF8xLTAifQ.dqYh97zqiKsdjpoP0HOZa-oRY81F7enuERUuWF-qgbQ"
token <- paste("Bearer", key)
url <- "https://api.playbattlegrounds.com/shards/pc-as/players?filter[playerNames]=17_shou"
req <- httr::GET(url, httr::add_headers(Authorization = token, Accept = "application/vnd.api+json"))
json <- httr::content(req, as = "text")
fromJSON(json)





url <- "https://api.playbattlegrounds.com/shards/$platform-region-shard/matches/bcd0566e-1140-4de1-baae-e22e2f9f1562"
req <- httr::GET(url, httr::add_headers(Authorization = token, Accept = "application/vnd.api+json"))
json <- httr::content(req, as = "text")
json <- fromJSON(json)

url <- "https://telemetry-cdn.playbattlegrounds.com/bluehole-pubg/pc-as/2018/05/29/11/58/88999294-6337-11e8-a25f-0a586463ed02-telemetry.json"
req <- httr::GET(url, httr::add_headers(Authorization = token, Accept = "application/vnd.api+json"))
json <- httr::content(req, as = "text")
json <- fromJSON(json)

