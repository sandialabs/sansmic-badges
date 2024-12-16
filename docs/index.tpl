=======
sansmic
=======
.. |nbsp| unicode:: 0xA0 
   :trim:

.. grid::

   .. grid-item-card:: Project overview

      .. image:: https://img.shields.io/github/license/sandialabs/sansmic
         :alt: GitHub License


      .. image:: /_static/badges/Contributor%20Covenant-2.1-4baaaa.svg
         :alt: Contributor Covenant badge
         :target: https://github.com/sandialabs/sansmic/blob/main/CODE_OF_CONDUCT.md


      .. image:: https://www.bestpractices.dev/projects/9399/badge
         :alt: Best Practices badge
         :target: https://www.bestpractices.dev/projects/9399


      .. image:: https://api.scorecard.dev/projects/github.com/sandialabs/sansmic/badge
         :alt: Scorecard badge
         :target: https://scorecard.dev/viewer/?uri=github.com/sandialabs/sansmic


   .. grid-item-card:: Current stable release

      .. image:: https://img.shields.io/github/release-date/sandialabs/sansmic
         :alt: GitHub Release Date
         :target: https://github.com/sandialabs/sansmic/releases/latest


      .. image:: https://img.shields.io/github/v/release/sandialabs/sansmic?display_name=release&logo=github&logoColor=white
         :alt: GitHub Release
         :target: https://github.com/sandialabs/sansmic/releases/latest


      .. image:: https://img.shields.io/github/check-runs/sandialabs/sansmic/BUILD_SCRIPT_REPLACE?logo=github&logoColor=white
         :alt: GitHub tag check runs
         :target: https://github.com/sandialabs/sansmic/releases/latest


      .. image:: https://img.shields.io/pypi/v/sansmic?logo=pypi&logoColor=white
         :alt: PyPI - Version
         :target: https://pypi.org/project/sansmic


   .. grid-item-card:: Development version

      .. 
         image:: https://sloc.xyz/github/sandialabs/sansmic/?category=code
         :alt: Lines of code badge
         :target: https://github.com/sandialabs/sansmic


      .. image:: https://codecov.io/github/sandialabs/sansmic/graph/badge.svg?token=oDeMIUHoqg
         :alt: Codecov on main branch badge
         :target: https://app.codecov.io/github/sandialabs/sansmic


      .. image:: https://github.com/sandialabs/sansmic/actions/workflows/test-matrix.yml/badge.svg?branch=main
         :alt: Tests status on main branch badge
         :target: https://github.com/sandialabs/sansmic/actions/workflows/test-matrix.yml


      .. image:: https://github.com/sandialabs/sansmic/actions/workflows/gh-pages.yml/badge.svg?branch=main
         :alt: Docs building on main branch badge
         :target: https://github.com/sandialabs/sansmic/actions/workflows/gh-pages.yml


The sansmic leaching simulator
==============================

.. toctree::
   :hidden:
   :maxdepth: 1

   User Guide </BUILD_SCRIPT_REPLACE/userman>
   API Reference </BUILD_SCRIPT_REPLACE/refman>

**sansmic** is a package for the simulation of leaching in underground salt
caverns. The core is written in C++ for speed, but the primary API and the
command-line program are Python-based. The lower- or mixed-case name *sansmic* is used to
differentiate it from the previous, FORTRAN-based versions of the same name.

Solution mining is the process of disolving underground mineral deposits by
pumping fresh, or at least unsaturated, water down a well, allowing it to
leach the minerals into solution, and then pumping the solution back to the
surface. Solution mining is also used to create underground caverns --
typically in salt deposits -- that are then used for energy storage; typically
this is through storage of natural gas or crude oil, but hydrogen storage is
beginning to gain momentum.

SANSMIC was developed in the early 1980s to fill a specific modeling need for
the U.S. Strategic Petroleum Reserve (SPR) that could not be met
using the tools available at the time. That specific need was to
model the injection of both raw water, for cavern leaching, and crude
oil simultaneously in a process referred to as "leach/fill". SANSMIC has
primarily been used at the SPR for modeling impacts due to emergency
exchanges, sales, remediations, and the original construction.

Citing sansmic
--------------

If you use sansmic for a publication, please use the following citation:

* Hart, David, & Zeitler, Todd, & Maurer, Hannah. (2024). *SANSMIC v.1.0*. [Computer software].
  https://github.com/sandialabs/sansmic.
  https://doi.org/10.11578/dc.20240911.9

The list of current contributors is located in the ``AUTHORS.md`` file in the code repository.
