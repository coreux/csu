## Copyright 2013 Mo McRoberts.
##
##  Licensed under the Apache License, Version 2.0 (the "License");
##  you may not use this file except in compliance with the License.
##  You may obtain a copy of the License at
##
##      http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.

ACLOCAL_AMFLAGS = -I .

EXTRA_DIST = regen-acinclude.sh README

DIST_SUBDIRS = t darwin

SUBDIRS = @ux_kern@ . t

dist_doc_DATA = LICENSE-2.0

LDFLAGS = -Xlinker -r

startlibdir = @libdir@

startlib_PROGRAMS = crtbegin.o

crtbegin_o_CPPFLAGS = @AM_CPPFLAGS@ @UX_CPPFLAGS@

crtbegin_o_SOURCES = begin.c
