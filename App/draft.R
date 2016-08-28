library(XML)
library(plyr)

# get league data
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

# Define league size and starting lineup structure
leaguePlayers <- 10

startingQBs <- 1
startingRBs <- 1.5
startingWRs <- 2.5
startingTEs <- 1
startingKs  <- 1
startingDs  <- 1

players$RV <- 0

# Calculate RV (Replacement Value) for each position
players[players$POS == "QB",]$RV <- mean(players[players$POS == "QB",][1:(leaguePlayers * startingQBs),]$FPTS)
players[players$POS == "RB",]$RV <- mean(players[players$POS == "RB",][1:(leaguePlayers * startingRBs),]$FPTS)
players[players$POS == "WR",]$RV <- mean(players[players$POS == "WR",][1:(leaguePlayers * startingWRs),]$FPTS)
players[players$POS == "TE",]$RV <- mean(players[players$POS == "TE",][1:(leaguePlayers * startingTEs),]$FPTS)
players[players$POS == "K" ,]$RV <- mean(players[players$POS == "K" ,][1:(leaguePlayers * startingKs ),]$FPTS)
players[players$POS == "D/ST",]$RV <- mean(players[players$POS == "D/ST",][1:(leaguePlayers * startingDs ),]$FPTS)

# Calculate VOR (Value Over Replacement) for each position
players$VOR <- players$FPTS - players$RV

# Order by descending VOR
players <- players[order(-players$VOR),]

write.csv(players, file="players.csv")
