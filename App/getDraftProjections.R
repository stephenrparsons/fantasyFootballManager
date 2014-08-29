library(XML)
library(plyr)

qb <- readHTMLTable("http://www.fantasypros.com/nfl/projections/qb.php", stringsAsFactors = FALSE)$data
rb <- readHTMLTable("http://www.fantasypros.com/nfl/projections/rb.php", stringsAsFactors = FALSE)$data
wr <- readHTMLTable("http://www.fantasypros.com/nfl/projections/wr.php", stringsAsFactors = FALSE)$data
te <- readHTMLTable("http://www.fantasypros.com/nfl/projections/te.php", stringsAsFactors = FALSE)$data
k  <- readHTMLTable("http://www.fantasypros.com/nfl/projections/k.php",  stringsAsFactors = FALSE)$data
d  <- readHTMLTable("http://games.espn.go.com/ffl/tools/projections?leagueId=0&slotCategoryId=16", stringsAsFactors = FALSE)$playertable_0

colnames(d) <- d[1,]
d <- d[-1,][c("PLAYER, TEAM POS", "PTS")]
colnames(d) <- c("Player", "FPTS")
d[,1] <- sapply(d[,1], function(elem) unlist(strsplit(elem, ' '))[1])

qb$POS <- "QB"
rb$POS <- "RB"
wr$POS <- "WR"
te$POS <- "TE"
k$POS  <- "K"
d$POS  <- "D/ST"

players <- rbind.fill(qb, rb, wr, te, k, d)
players <- players[,c("Player", "POS", "FPTS")]
players$FPTS <- as.numeric(players$FPTS)
players <- players[order(-players$FPTS),]

saveRDS(players, "players.rds")
