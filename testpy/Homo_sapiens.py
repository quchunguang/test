#!/usr/bin/python
# encoding: utf-8
"""
sudo pip install biopython

cd ~/Download/gene
wget ftp://ftp.ncbi.nlm.nih.gov/gene/DATA/ASN_BINARY/Mammalia/Homo_sapiens.ags.gz
gunzip Homo_sapiens.ags.gz
sudo apt-get install ncbi-tools-bin
gene2xml -b T -i Homo_sapiens.ags -o Homo_sapiens.xml
python ~/test/testpy/Homo_sapiens.py
"""
from Bio import Entrez
import os.path


DATAROOT = "/media/d/soft/gene"

def main():
    filepath = os.path.join(DATAROOT, "Homo_sapiens.xml")
    handle = open(filepath)
    records = Entrez.parse(handle)

    for record in records:
        status = record['Entrezgene_track-info']['Gene-track']['Gene-track_status']
        if status.attributes['value'] == 'discontinued':
            continue
        geneid = record['Entrezgene_track-info']['Gene-track']['Gene-track_geneid']
        genename = record['Entrezgene_gene']['Gene-ref']['Gene-ref_locus']
        print geneid, genename

if __name__ == '__main__':
    main()
