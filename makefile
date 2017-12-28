TEX = gkiarcv

default: $(TEX).tex 
	docker run -ti -v ${PWD}:/data gkiar/gkiarcv /data
	open $(TEX).pdf &

clean:
	$(RM) -f *.aux *.blg *.dvi *.log *.toc *.lof *.lot *.cb *.bbl $(TEX).ps *~ *.run.xml;

