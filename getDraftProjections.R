library(XML)

qb <- readHTMLTable("http://www.fantasypros.com/nfl/projections/qb.php", stringsAsFactors = FALSE)$data
rb <- readHTMLTable("http://www.fantasypros.com/nfl/projections/rb.php", stringsAsFactors = FALSE)$data
wr <- readHTMLTable("http://www.fantasypros.com/nfl/projections/wr.php", stringsAsFactors = FALSE)$data
te <- readHTMLTable("http://www.fantasypros.com/nfl/projections/te.php", stringsAsFactors = FALSE)$data
k  <- readHTMLTable("http://www.fantasypros.com/nfl/projections/k.php",  stringsAsFactors = FALSE)$data

print(head(qb))
print(head(rb))
print(head(wr))
print(head(te))
print(head(k ))
