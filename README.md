fantasyFootballManager
======================

This package helps me make decisions for my ESPN fantasy football team, because I don't know anything about football.

The processing pulls projections from [FantasyPros](https://www.fantasypros.com/) for QB, RB, WR, TE, K and from [ESPN](http://games.espn.com/ffl/tools/projections?leagueId=0&slotCategoryId=16) for D. It then calculates [Value Over Replacement (VOR)](http://fantasyfootballanalytics.net/2013/04/win-your-snake-draft-calculating-value.html) for each player using [R](https://www.r-project.org/).

The interface [(live demo)](http://stephenrparsons.github.io/fantasyFootballManager/) sorts every available prospect by VOR using modified [csv-to-html-table](https://github.com/derekeder/csv-to-html-table). Left clicking on an available player puts them on the Taken list, shift-clicking adds them to My Team.