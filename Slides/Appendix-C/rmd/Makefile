all:
	Rscript -e 'rmarkdown::render("appc.Rmd")'


pdf:
	Rscript -e 'rmarkdown::render("appc.Rmd", output_format="beamer_presentation")'


ioappc:
	Rscript -e 'rmarkdown::render("appc.Rmd", output_format="ioappc_presentation")'

slidy:
	Rscript -e 'rmarkdown::render("appc.Rmd", output_format="slidy_presentation")'


clean:
	rm appc.pdf appc.html
