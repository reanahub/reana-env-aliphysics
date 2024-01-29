==============================
 REANA Environment AliPhysics
==============================

.. image:: https://github.com/reanahub/reana-env-aliphysics/workflows/CI/badge.svg
   :target: https://github.com/reanahub/reana-env-aliphysics/actions

.. image:: https://badges.gitter.im/Join%20Chat.svg
   :target: https://gitter.im/reanahub/reana?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge

.. image:: https://img.shields.io/badge/License-GPL%20v2-blue.svg
   :target: https://github.com/reanahub/reana-env-aliphysics/blob/master/LICENSE

About
=====

``reana-env-aliphysics`` provides a container image with encapsulated runtime
execution environment for `AliPhysics <https://github.com/alisw/AliPhysics>`_
based ALICE data analyses. The container image includes all the necessary
dependencies and does not have any external requirements (such as CVMFS).

``reana-env-aliphysics`` was developed for use in the `REANA
<http://reana.readthedocs.io/>`_ reusable research data analysis platform.

Usage
=====

You can use ``reana-env-aliphysics`` as a base image for containerising your own
AliPhysics-based research data analyses. You can simply start your
``Dockerfile`` from this base image and add your custom code on top, or you can
use the image "as is" and mount your runtime code to the running container. Some
concrete usage examples will be provided later on.

Development
===========

You can build an AliPhysics image corresponding to a particular AliPhysics
version selected from the `list of published Alice packages
<http://alimonitor.cern.ch/packages/?packagename=AliPhysics>`_ by setting up the
``ALIPHYSICS_VERSION`` environment variable:

.. code-block:: console

   $ export ALIPHYSICS_VERSION=vAN-20170521-1
   $ make build

You can test the built container image briefly:

.. code-block:: console

   $ make test

If you would like to try it locally, you can run:

.. code-block:: console

   $ docker run -i -t --rm -v $HOME/foo:/foo docker.io/reanahub/reana-env-aliphysics:vAN-20170521-1 /bin/bash

which will drop you to a shell with the appropriate AliPhysics environment
already set. Everything you write in ``/foo`` inside the container will be
available outside the container under ``~/foo``.

If all the tests are successful, you can publish the newly created AliPhysics
image on Docker Hub:

.. code-block:: console

   $ make push

More information
================

For more information about `REANA <http://reanahub.io/>`_ reusable research data
analysis platform, please see `its documentation <https://docs.reana.io/>`_.
