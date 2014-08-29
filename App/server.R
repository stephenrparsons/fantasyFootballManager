source("calculateVOR.R")

team <- readRDS("data/team.rds")
players <- readRDS("data/players.rds")

shinyServer(function(input, output) {
    output$team <- renderDataTable({
        team
    })
})
