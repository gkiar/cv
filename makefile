TEX = gkiarcv

default: $(TEX).tex 
	docker run -ti -v ${PWD}:/data  --entrypoint /build.sh gkiar/gkiarcv /data
	open $(TEX).pdf &

clean:
	$(RM) -f *.aux *.blg *.dvi *.log *.toc *.lof *.lot *.cb *.bbl $(TEX).ps *~;

check:
	@echo "Passing the check will cause make to report Error 1.";
	$(LATEX) $(TEX)  | grep -i undefined;
