for i in {1..1000}
do
  	cd desktop/projects/website
	rscript raise_starbucks.r
	git add .
	git commit -m "updated raise rates"
	git push
  	sleep 900s
done


