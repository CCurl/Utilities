#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
//#include "Shared.h"
//#include "forth-vm.h"
//#include "string.h"
//#include "logger.h"

char input_fn[256];

// *********************************************************************
void process_arg(char *arg)
{
    strcpy(input_fn, arg);
}

// *********************************************************************
int main(int argc, char **argv)
{
    strcpy(input_fn, "");

    for (int i = 1; i < argc; i++)
    {
        char *cp = argv[i];
        process_arg(cp);
    }

	if (strlen(input_fn) > 0)
    {
        char buf[8];
        FILE *fp = fopen(input_fn, "rb+");
        if (fp)
        {
            fseek(fp, SEEK_SET, 0);
            int num = fread(buf, 1, 1, fp);
            fseek(fp, SEEK_SET, 0);
            fwrite(buf, 1, 1, fp);
            fclose(fp);
        }
        else
        {
            fp = fopen(input_fn, "wb");
            fclose(fp);
        }
	}
    else
    {
        printf("usage: touch <file-path>");
    }

    return 0;
}
