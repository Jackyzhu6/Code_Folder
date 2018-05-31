library(rjson)
library(RCurl)
url <- "https://telemetry-cdn.playbattlegrounds.com/bluehole-pubg/pc-as/2018/05/29/11/58/88999294-6337-11e8-a25f-0a586463ed02-telemetry.json"
req <- httr::GET(url, httr::add_headers(Authorization = token, Accept = "application/vnd.api+json"))
json <- httr::content(req, as = "text")
json <- fromJSON(json)

event_type <- sapply(json,function(x) x$`_T`)
match_id <- json[[1]]$MatchId
match_ping_quality <- json[[1]]$PingQuality
match_start_time <- json[[1]]$`_D`
match_start_time <- gsub("T"," ",match_start_time)
match_start_time0 <- as.POSIXct(match_start_time,format = "%Y-%m-%d %H:%M:%S")
match_start_time_second <- as.numeric(unlist(strsplit(gsub("\\+00:00","",match_start_time),split = ":"))[3])
xx <- which(event_type == "LogPlayerLogin")
login_id <- sapply(xx,function(z) json[[z]]$accoutId)
