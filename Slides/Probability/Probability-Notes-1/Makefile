all:
	Rscript -e 'rmarkdown::render("Probability-Notes-1.Rmd")'


pdf:
	Rscript -e 'rmarkdown::render("Probability-Notes-1.Rmd", output_format="beamer_presentation")'


ioProbability-Notes-1:
	Rscript -e 'rmarkdown::render("Probability-Notes-1.Rmd", output_format="ioProbability-Notes-1_presentation")'

slidy:
	Rscript -e 'rmarkdown::render("Probability-Notes-1.Rmd", output_format="slidy_presentation")'


clean:
	rm Probability-Notes-1.pdf Probability-Notes-1.html
