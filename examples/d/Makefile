all: gff3 fastq

DMDFLAGS=-O -release -inline
GDCFLAGS=-O3 -frelease -finline -fno-assert -fno-bounds-check -lpthread

gff3: gff3.rl
	ragel -D gff3.rl -G2
	dmd gff3.d $(DMDFLAGS)

gff3-gdc: gff3.rl
	ragel -D gff3.rl -G2
	gdc gff3.d $(GDCFLAGS) -o gff3

fastq: fastq.rl
	ragel -D fastq.rl -G2
	dmd fastq.d $(DMDFLAGS)

fastq-gdc: fastq.rl
	ragel -D fastq.rl -G2
	gdc fastq.d $(GDCFLAGS) -o fastq

clean:
	rm fastq.d fastq.o fastq gff3.d gff3.o gff3
