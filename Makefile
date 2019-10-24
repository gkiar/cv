TEX = gkiarcv

default:
	lualatex ${TEX} && biber ${TEX} && lualatex ${TEX} && lualatex ${TEX}

docker: $(TEX).tex
	# docker run -ti -v ${PWD}:/data gkiar/gkiarcv /data
	docker run -ti --rm -v ${PWD}:/data gkiar/cv:compiled /data

quick: 
	lualatex ${TEX}

open:
	open $(TEX).pdf &

clean:
	$(RM) -f ${TEX}{.aux,.blg,.dvi,.log,.toc,.lof,.lot,.cb,.bbl,.ps,,.run.xml,.fls,.fdb_latexmk};

