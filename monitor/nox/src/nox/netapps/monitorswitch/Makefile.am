include ../../../Make.vars 

CONFIGURE_DEPENCIES = $(srcdir)/Makefile.am

MYSQL_LIBS = -lz -lmysqlclient -L /usr/lib/mysql/

EXTRA_DIST = \
	meta.json

pkglib_LTLIBRARIES =		\
	monitorswitch.la	


monitorswitch_la_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/src/nox -I$(top_srcdir)/src/nox/netapps 
monitorswitch_la_SOURCES = monitorswitch.cc monitorswitch.hh
monitorswitch_la_LDFLAGS = -module -export-dynamic  -lnl -lhwdb -lz -lmysqlclient -L/usr/lib/mysql/ 

NOX_RUNTIMEFILES = meta.json

all-local: nox-all-local
clean-local: nox-clean-local 
install-exec-hook: nox-install-local
