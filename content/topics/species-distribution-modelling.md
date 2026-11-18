---
title: Modelling species' distributions
description: Good habits for species distribution modelling, models for disease vectors, and boosted regression trees.
weight: 50
---

{{< resource title="Species Distribution Modelling" url="https://rspatial.org/sdm/index.html" authors="Robert Hijmans and Jane Elith" level="intermediate" >}}
A step-by-step guide to learn many good habits for species distribution modelling and how to practically do so in R, written by leading lights in the field. This guide takes you through all steps from the basic concepts, to data collection and preparation, to model fitting, evaluation and prediction.

The modelling method used in this guide is a relatively simple Generalised Linear Model, however the workflow that the guide teaches is vital to master before using other methods.
{{< /resource >}}

{{< resource title="Species Distribution Modelling for Vectors Course" url="https://github.com/idem-lab/vector_sdm_course" authors="Nick Golding and Gerry Ryan" level="advanced" >}}
*Yes — here we mean disease vectors, not spatial ones*. This course is intended to be taught in person, and is focussed on developing understanding of key concepts around data biases and how they apply in particular to modelling the distribution of vectors. The course covers a range of modelling methods such as GLMs, MaxEnt, and Multispecies Poisson Point-Process models.

Although users may follow the course materials using the [broad course outline](https://github.com/idem-lab/vector_sdm_course/blob/master/course_structure.md) at present, we intend to update materials to make it easier to follow-through independently as well.
{{< /resource >}}

{{< resource title="Boosted Regression Trees" url="https://rspatial.org/raster/sdm/9_sdm_brt.html" authors="Jane Elith and John Leathwick" level="advanced" >}}
Boosted Regression Trees (BRTs) are a powerful method for fitting non-linear interacting relationships, including for modelling species' distributions. This is a guide to fitting BRTs using the `dismo` package in R. This guide is a companion to the very accessible journal article [A Working Guide to Boosted Regression Trees](https://doi.org/10.1111/j.1365-2656.2008.01390.x), and jives well with the code from the Hijmans and Elith guide listed above. NB: the code in the final section, [Spatial Prediction](https://rspatial.org/raster/sdm/9_sdm_brt.html#spatial-prediction), is based on the deprecated `raster` package. It should work largely as-is by replacing `raster` with `terra` in the code.
{{< /resource >}}
