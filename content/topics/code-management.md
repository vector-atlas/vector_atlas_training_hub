---
title: Code management
description: Keeping track of your code with version control, using git and GitHub from RStudio or the command line.
weight: 60
---

So you've written some code, now you want to make sure you manage it in a way that allows you to not be overwhelmed.

You save your file `script.R`. Then you make some changes but you want to keep the other one just in case, so you have `script2.R`. You make more changes, try some other things, and eventually you have 27 scripts up to `copy_script9_alternate_with_other_plots2.R`

Instead you can use version control to manage this process, keep annotated records of changes and *control* the *version* you are using. This is called version control.

The most common contemporary method is using software called [git](https://git-scm.com) to keep track of changes and allow you to go back in time as needs be.

Git is usually also connected to a cloud service like [GitHub](https://github.com), [GitLab](https://about.gitlab.com), or [Bitbucket](https://bitbucket.org), which allows users to back up code remotely for additional security and allowing easy collaboration on projects.

## Version control with git in RStudio

{{< resource title="Happy Git and GitHub for the useR" url="https://happygitwithr.com" authors="Jenny Bryan" level="beginner" >}}
A great starting point for version control for users of R in RStudio and GitHub — this will have you up and running in no time. Much of the principles and processes will work for other git cloud development platforms as well (gitlab or bitbucket).
{{< /resource >}}

## Version control with git — any platform

{{< resource title="Git is my lab book" url="https://git-is-my-lab-book.net/" authors="Rob Moss and support acts" level="intermediate" >}}
This is a general guide to using git, and takes you through some of the processes of managing code in git, though primarily through the command line / terminal using direct git commands. Consider starting with the [Topical Guides](https://git-is-my-lab-book.net/guides/). Written by some collaborators at the University of Melbourne.
{{< /resource >}}
