#!/usr/bin/python
# -*- coding: utf8 -*-
"""
wget http://people.duke.edu/~ccc14/pcfb/_downloads/ls_orchid.fasta
wget ftp://ftp.expasy.org/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.dat.gz
"""
from Bio import Entrez
from Bio import Medline
from Bio import SeqIO
from Bio.Alphabet import IUPAC
from Bio.Data import CodonTable
from Bio.Seq import Seq
from Bio.SeqUtils import GC
import os.path

DATAROOT = "/media/d/soft/gene"


def simple():
    my_seq = Seq("AGTACACTGGT")
    print my_seq.complement()
    print my_seq.reverse_complement()


def simple2():
    my_seq = Seq("AGTACACTGGT", IUPAC.unambiguous_dna)
    print my_seq.alphabet
    print my_seq[4:12]
    print my_seq[::-1]
    print my_seq.count("A")
    print GC(my_seq)
    print my_seq.transcribe()
    print my_seq.translate()


def translate():
    messenger_rna = Seq("AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG", IUPAC.unambiguous_rna)
    print messenger_rna.translate()


def fasta():
    filepath = os.path.join(DATAROOT, "ls_orchid.fasta")
    for seq_record in SeqIO.parse(filepath, "fasta"):
        print seq_record.id
        print repr(seq_record.seq)
        print len(seq_record)


def codon_table():
    standard_table = CodonTable.unambiguous_dna_by_id[1]
    mito_table = CodonTable.unambiguous_dna_by_id[2]
    print standard_table
    print mito_table


def entrez():
    """
    IMPORTANT NOTE:
    http://people.duke.edu/~ccc14/pcfb/biopython/BiopythonEntrez.html
    """
    Entrez.email = "adam.richards@stat.duke.edu"
    Entrez.tool = "MyLocalScript"

    # What databases do I have access to
    handle = Entrez.einfo()
    record = Entrez.read(handle)
    print record["DbList"]

    # What if I want info about a database
    handle = Entrez.einfo(db="pubmed")
    record = Entrez.read(handle)
    print record["DbInfo"]["Description"]
    print record["DbInfo"]["Count"]
    print record["DbInfo"]["LastUpdate"]
    for field in record["DbInfo"]["FieldList"]:
        print "%(Name)s, %(FullName)s, %(Description)s" % field

    # How do I search a db for a given term
    handle = Entrez.esearch(db="pubmed", term="biopython")
    record = Entrez.read(handle)
    print record["IdList"]

    # More sample
    handle = Entrez.esearch(db="nucleotide", term="Cypripedioideae[Orgn] AND matK[Gene]")
    record = Entrez.read(handle)
    print record["Count"]
    print record["IdList"]

    # Get all journals that have `computational` as a term
    handle = Entrez.esearch(db="journals", term="computational")
    record = Entrez.read(handle)
    print record["Count"]
    print record["IdList"]

    # I have a term now I want the item itself
    handle = Entrez.efetch(db="nucleotide", id="186972394", rettype="gb", retmode="text")
    record = SeqIO.read(handle, "genbank")
    handle.close()
    print record

    handle = Entrez.efetch(db="pubmed", id="21210977")
    print handle.read()


def efetch():
    Entrez.email = "A.N.Other@example.com"
    handle = Entrez.efetch(db="nucleotide", id="186972394", rettype="gb", retmode="text")
    print handle.read()


def pubmed():
    # Get the count of papers about orchid only in database pubmed
    Entrez.email = "A.N.Other@example.com"     # Always tell NCBI who you are
    handle = Entrez.egquery(term="orchid")
    record = Entrez.read(handle)
    for row in record["eGQueryResult"]:
        if row["DbName"] == "pubmed":
            print "The count of papers about orchid in database pubmed:", row["Count"]

    # Get the list of ids of above
    handle = Entrez.esearch(db="pubmed", term="orchid", retmax=100)
    record = Entrez.read(handle)
    idlist = record["IdList"]
    print "The id list of papers about orchid in database pubmed:", idlist
    print

    # Search papers author by "Liu ZJ" from pubmed
    handle = Entrez.efetch(db="pubmed", id=idlist, rettype="medline",
                           retmode="text")
    records = Medline.parse(handle)
    search_author = "Liu ZJ"
    for record in records:
        if "AU" not in record:
            continue
        if search_author in record["AU"]:
            print "Author %s found." % search_author
            print "title:", record.get("TI", "?")
            print "authors:", record.get("AU", "?")
            print "source:", record.get("SO", "?")
            print


def genbank():
    """
    检索Opuntia (多刺的梨型仙人掌)获得所有满足要求的GIs（GenBank标志符）
    """
    # 首先我们看看有多少个记录
    from Bio import Entrez
    Entrez.email = "A.N.Other@example.com"     # Always tell NCBI who you are
    handle = Entrez.egquery(term="Opuntia AND rpl16")
    record = Entrez.read(handle)
    for row in record["eGQueryResult"]:
        if row["DbName"] == "nuccore":
            print row["Count"]

    # 下载GenBank identifiers的列表
    handle = Entrez.esearch(db="nuccore", term="Opuntia AND rpl16")
    record = Entrez.read(handle)
    gi_list = record["IdList"]

    # 使用这些GIs来下载GenBank records
    handle = Entrez.efetch(db="nuccore", id=gi_list, rettype="gb", retmode="text")

    # 看原始的 GenBank 文件
    text = handle.read()
    print text

    # # 将GenBank 数据转化成 SeqRecord 对象，包括 SeqFeature 对象
    # # 逐个查看这些record来寻找我们感兴趣的信息
    # records = SeqIO.parse(handle, "gb")
    # for record in records:
    #     print "%s, length %i, with %i features" \
    #         % (record.name, len(record), len(record.features))


def lineage():
    """
    查看物种的谱系关系
    找出Cyripedioideae兰花家族的谱系
    """
    Entrez.email = "A.N.Other@example.com"     # Always tell NCBI who you are
    handle = Entrez.esearch(db="Taxonomy", term="Cypripedioideae")
    record = Entrez.read(handle)

    handle = Entrez.efetch(db="Taxonomy", id=record["IdList"][0], retmode="xml")
    records = Entrez.read(handle)
    # 再次，这个record保存了许多的信息：records[0].keys()

    # 我们可以直接从这个record获得谱系信息：
    print records[0]["Lineage"]
    # 这个record数据包含的信息远远超过在这里显示的，如查看 "LineageEx" 而不是
    # "Lineage" 相关的信息，谱系里面的 NCBI taxon 标识号信息。


def history_seq():
    """
    利用 history 来搜索和下载序列
    """
    Entrez.email = "history.user@example.com"
    search_handle = Entrez.esearch(db="nucleotide", term="Opuntia[orgn] and rpl16",
                                   usehistory="y")
    search_results = Entrez.read(search_handle)
    search_handle.close()

    gi_list = search_results["IdList"]
    count = int(search_results["Count"])
    assert count == len(gi_list)

    # 得到两个额外的信息， WebEnv 会话cookie 和 QueryKey
    webenv = search_results["WebEnv"]
    query_key = search_results["QueryKey"]

    batch_size = 3
    filepath = os.path.join(DATAROOT, "orchid_rpl16.fasta")
    out_handle = open(filepath, "w")
    for start in range(0, count, batch_size):
        end = min(count, start+batch_size)
        print "Going to download record %i to %i" % (start+1, end)
        fetch_handle = Entrez.efetch(db="nucleotide", rettype="fasta", retmode="text",
                                     retstart=start, retmax=batch_size,
                                     webenv=webenv, query_key=query_key)
        data = fetch_handle.read()
        fetch_handle.close()
        out_handle.write(data)
    out_handle.close()


def history_review():
    """
    利用history来搜索和下载综述
    """
    Entrez.email = "history.user@example.com"
    search_results = Entrez.read(Entrez.esearch(db="pubmed",
                                                term="Opuntia[ORGN]",
                                                reldate=365, datetype="pdat",
                                                usehistory="y"))
    count = int(search_results["Count"])
    print "Found %i results" % count

    batch_size = 10
    filepath = os.path.join(DATAROOT, "recent_orchid_papers.txt")
    out_handle = open(filepath, "w")
    for start in range(0, count, batch_size):
        end = min(count, start+batch_size)
        print "Going to download record %i to %i" % (start+1, end)
        fetch_handle = Entrez.efetch(db="pubmed",
                                     rettype="medline", retmode="text",
                                     retstart=start, retmax=batch_size,
                                     webenv=search_results["WebEnv"],
                                     query_key=search_results["QueryKey"])
        data = fetch_handle.read()
        fetch_handle.close()
        out_handle.write(data)
    out_handle.close()


def history_paper():
    """
    搜索引用文章
    """
    Entrez.email = "A.N.Other@example.com"
    pmid = "14630660"
    results = Entrez.read(Entrez.elink(dbfrom="pubmed", db="pmc",
                                       LinkName="pubmed_pmc_refs", from_uid=pmid))
    pmc_ids = [link["Id"] for link in results[0]["LinkSetDb"][0]["Link"]]
    print pmc_ids

    results2 = Entrez.read(Entrez.elink(dbfrom="pmc", db="pubmed", LinkName="pmc_pubmed",
                                        from_uid=",".join(pmc_ids)))
    pubmed_ids = [link["Id"] for link in results2[0]["LinkSetDb"][0]["Link"]]
    print pubmed_ids


def main():
    fasta()


if __name__ == '__main__':
    main()
