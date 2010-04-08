#include <security/pam_appl.h>
#include <security/pam_misc.h>
#include <stdio.h>
{
	struct pam_conv pamc;
	/* Set up the PAM conversation. */
	pamc.appdata_ptr = NULL;
	pam_start ("su", getenv ("USER"), &pamc, &pamh);
	/* Authenticate the user. */
	if (pam_authenticate (pamh, 0) != PAM_SUCCESS)
		fprintf (stderr, "Authentication failed!\n");
	else
		fprintf (stderr, "uthentication OK.\n");
	/* All done. */
	pam_end (pamh, 0);
	return 0;
}
