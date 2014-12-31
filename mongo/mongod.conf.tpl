# See http://www.mongodb.org/display/DOCS/File+Based+Configuration for format details
# Run mongod --help to see a list of options

bind_ip = 127.0.0.1
port = @@PORT@@
quiet = true
dbpath = @@SCRATCH@@
logpath = @@SCRATCH@@/run/mongod.log
pidfilepath = @@SCRATCH@@/run/mongod.pid
logappend = true
fork = true
smallfiles = true
unixSocketPrefix = @@SCRATCH@@/run
