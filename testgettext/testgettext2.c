#include <stdio.h>
#include <libintl.h>
#include <locale.h>
#define _(string) gettext (string) 
#define LOCALEDIR "language"

int main(void)
{
	setlocale (LC_ALL, "");
	textdomain ("testgettext");
	bindtextdomain ("testgettext", LOCALEDIR);

	printf(_("File 2: My number is %d, My name is %s\n"), 2, "Kevin Qu");
	return 0;
}
