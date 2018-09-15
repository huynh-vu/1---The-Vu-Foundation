cd "C:\Users\stock9\The Vu Foundation Dropbox\3 - Gulf Bay Marine\website-gh-pages\website-gh-pages"
rscript raise_starbucks.r
rscript stocks.r
git add .
git commit -m "updated website"
git push

osascript -e 'tell application "Terminal" to quit' &
pause
exit

