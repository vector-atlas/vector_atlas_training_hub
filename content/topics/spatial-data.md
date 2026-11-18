---
title: Working with spatial data
description: Working with raster and vector spatial data in R (with terra and sf) and in QGIS.
weight: 40
---

## Spatial data in R

{{< see-also page="/topics/map-intro-course" anchor="map-spatial-r" title="Spatial Data in R (MAP)" level="beginner" >}}

{{< resource title="Spatial data with `terra`" url="https://rspatial.org/spatial/index.html#" authors="Robert Hijmans and others" level="intermediate" >}}
The `terra` package is the most powerful modern method to work with raster data in R (and replaces the deprecated `raster` package), and can also be used with vector\* data. This is a step-through guide to working with spatial data using `terra`. For a broader introduction to spatial data in R, this page forms just one section of [rspatial.org](https://rspatial.org), which has a wider range of resources that may be helpful for beginners in spatial data science.

\*Where we indicate vector\* with a \* we mean vector as a [spatial data form, i.e., points, lines, polygons](https://gisgeography.com/spatial-data-types-vector-raster/), not vector as in disease vector like a mosquito.
{{< /resource >}}

{{< resource title="Simple Features for R" url="https://r-spatial.github.io/sf/articles/sf1.html" authors="Edzer Pebesma" level="intermediate" >}}
The `sf` or Simple Features package is another powerful modern tool for working with vector\* data in R. This guide explains what simple features are and the fundamentals of how the package works, but also [links to a series of increasingly detailed articles](https://r-spatial.github.io/sf/articles/) on the use of `sf`, as well as the package reference manual.
{{< /resource >}}

## Spatial data in QGIS

{{< see-also page="/topics/map-intro-course" anchor="map-qgis" title="Spatial Data in QGIS (MAP)" level="beginner" >}}

{{< resource title="Spatial Data in QGIS (QGIS)" url="https://docs.qgis.org/3.28/en/docs/user_manual/introduction/getting_started.html" level="beginner" >}}
QGIS is a free, open-source, and well supported Geographic Information System in which users can manipulate and analyse spatial vector\* and raster data. This Getting Started article steps the user through installation and basic loading of data. It forms Chapter 5 of the full [QGIS User Guide](https://docs.qgis.org/3.28/en/docs/user_manual/index.html).

While analysis of spatial data in R is generally our recommendation because it is easily repeatable and modifiable, this does need the overhead of skill development to use R effectively, which may not always be practical for all users. QGIS is an excellent tool for quick plotting and exploration of spatial data and will suit many user needs.
{{< /resource >}}
