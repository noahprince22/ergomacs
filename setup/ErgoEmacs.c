/* Copyright (C) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009
     Free Software Foundation, Inc.

This file is part of GNU Emacs.

GNU Emacs is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

GNU Emacs is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.  */


/*
  Main ErgoEmacs program to start Emacs with its console window hidden.

  Based on code of runemacs.exe.
*/

#include <windows.h>
#include <string.h>
#include <malloc.h>
#include <stdio.h>
#include <shlobj.h>

int WINAPI
WinMain (HINSTANCE hSelf, HINSTANCE hPrev, LPSTR cmdline, int nShow)
{
  STARTUPINFO start;
  SECURITY_ATTRIBUTES sec_attrs;
  PROCESS_INFORMATION child;
  int wait_for_child = FALSE;
  DWORD priority_class = NORMAL_PRIORITY_CLASS;
  DWORD ret_code = 0;
  char *new_cmdline;
  char *p;
  char emacs_dir[MAX_PATH];
  char bin_dir[MAX_PATH];

  if (!GetModuleFileName (NULL, emacs_dir, MAX_PATH))
    goto error;
  if ((p = strrchr (emacs_dir, '\\')) == NULL)
    goto error;
  *p = 0;

  new_cmdline = alloca ((MAX_PATH+2)*3 + strlen (cmdline) + 1024);

  /* Quote executable name in case of spaces in the path. */
  *new_cmdline = '"';
  strcpy (new_cmdline + 1, emacs_dir);
  strcat (new_cmdline, "\\bin\\emacs.exe\" ");

  /* Add some arguments to the command line.  */
  {
    /* Put ErgoEmacs as the window caption.  */
    strcat (new_cmdline, " --title ErgoEmacs");

    /* Avoid to load ~/.emacs before ErgoEmacs's init.el.  */
    strcat (new_cmdline, " --no-init-file");

    /* Load the init.el file first and then the customized user ~/.emacs file.   */
    strcat (new_cmdline, " --load \"");
    strcat (new_cmdline, emacs_dir);
    strcat (new_cmdline, "\\ergoemacs\\init.el\"");

    strcat (new_cmdline, " --eval \"(if (file-exists-p \\\"~/.emacs\\\") (load-file \\\"~/.emacs\\\"))\"");
  }

  /* Append original arguments if any; first look for arguments we
     recognise (-wait, -high, and -low), and apply them ourselves.  */
  while (cmdline[0] == '-' || cmdline[0] == '/')
    {
      if (strncmp (cmdline+1, "wait", 4) == 0)
	{
	  wait_for_child = TRUE;
	  cmdline += 5;
	}
      else if (strncmp (cmdline+1, "high", 4) == 0)
	{
	  priority_class = HIGH_PRIORITY_CLASS;
	  cmdline += 5;
	}
      else if (strncmp (cmdline+1, "low", 3) == 0)
	{
	  priority_class = IDLE_PRIORITY_CLASS;
	  cmdline += 4;
	}
      else
	break;
      /* Look for next argument.  */
      while (*++cmdline == ' ');
    }

  /* Add the original arguments specified by the user (maybe a file to open).  */
  strcat (new_cmdline, " ");
  strcat (new_cmdline, cmdline);

  /* ErgoEmacs: Setup enviroment variables.  */
  {
    DWORD nchars = 1024 * MAX_PATH;
    char *buf = alloca (nchars);

    /* Get PATH enviroment variable */
    GetEnvironmentVariable ("PATH", buf, nchars);

    /* Add to PATH "C:\Program Files\ErgoEmacs\bin" */
    snprintf (buf + strlen (buf), nchars - strlen (buf), ";%s\\bin", emacs_dir);
    SetEnvironmentVariable ("PATH", buf);

    /* If HOME is not set, set it as "C:\Documents and Settings\username" */
    if (!GetEnvironmentVariable ("HOME", buf, nchars) || !*buf)
      {
	HRESULT hr = SHGetFolderPath (NULL, CSIDL_PROFILE, NULL, 0, buf);
	if (SUCCEEDED (hr))
	  {
	    SetEnvironmentVariable ("HOME", buf);
	  }
      }

    free (buf);
  }

  /* Set emacs_dir variable.  */
  *p = 0;
  for (p = emacs_dir; *p; p++)
    if (*p == '\\') 
      *p = '/';
  SetEnvironmentVariable ("emacs_dir", emacs_dir);

  memset (&start, 0, sizeof (start));
  start.cb = sizeof (start);
  start.dwFlags = STARTF_USESHOWWINDOW | STARTF_USECOUNTCHARS;
  start.wShowWindow = SW_HIDE;
  /* Ensure that we don't waste memory if the user has specified a huge
     default screen buffer for command windows.  */
  start.dwXCountChars = 80;
  start.dwYCountChars = 25;

  sec_attrs.nLength = sizeof (sec_attrs);
  sec_attrs.lpSecurityDescriptor = NULL;
  sec_attrs.bInheritHandle = FALSE;
  
  if (CreateProcess (NULL, new_cmdline, &sec_attrs, NULL, TRUE, priority_class,
		     NULL, NULL, &start, &child))
    {
      if (wait_for_child)
	{
	  WaitForSingleObject (child.hProcess, INFINITE);
	  GetExitCodeProcess (child.hProcess, &ret_code);
	}
      CloseHandle (child.hThread);
      CloseHandle (child.hProcess);
    }
  else
    goto error;
  return (int) ret_code;

error:
  MessageBox (NULL, "Could not start Emacs.", "Error", MB_ICONSTOP);
  return 1;
}
