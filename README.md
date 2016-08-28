fantasyFootballManager
======================

This package helps me make decisions for my ESPN fantasy football team, because I don't know anything about football.

The processing pulls projections from [FantasyPros](https://www.fantasypros.com/) for QB, RB, WR, TE, K and from [ESPN](http://games.espn.com/ffl/tools/projections?leagueId=0&slotCategoryId=16) for D. It then calculates [Value Over Replacement (VOR)](http://fantasyfootballanalytics.net/2013/04/win-your-snake-draft-calculating-value.html) for each player using [R](https://www.r-project.org/).

The interface [(live demo)](http://stephenrparsons.github.io/fantasyFootballManager/) sorts every available prospect by VOR using modified [csv-to-html-table](https://github.com/derekeder/csv-to-html-table).

Personally, when drafting, I typically take the available player with the highest VOR, as long as there is still a spot for their position on my team. This strategy has led to strong drafts for me, so my team often performs well in the early season. Unfortunately since I know next to nothing about the players beyond this, my team usually falls apart throughout the season as players get injured or improve/worsen their performance and I do not know how to deal with this.

Controls
--------

Click on a prospect: marks as Taken by another team.
Shift-click on a prospect: marks as My Team (when you draft a player).
Click on a Taken player: returns to Prospects table.
Click on a My Team player: returns to Prospects table.