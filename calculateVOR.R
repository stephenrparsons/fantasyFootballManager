# Define league size and starting lineup structure
leaguePlayers <- 10

startingQBs <- 1
startingRBs <- 1.5
startingWRs <- 2.5
startingTEs <- 1
startingKs  <- 1
startingDs  <- 1

# Read in projections
players <- readRDS("data/players.rds")
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

# Set up empty team
team <- data.frame(matrix(NA, 16, 2))
team[1,1] <- "QB"
team[2,1] <- "RB"
team[3,1] <- "RB/WR"
team[4:5,1] <- "WR"
team[6,1] <- "TE"
team[7,1] <- "D/ST"
team[8,1] <- "K"
team[9:16,1] <- "Bench"

print(team)
