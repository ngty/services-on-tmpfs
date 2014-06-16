# SERVICES ON TMPFS

Faststrap ur development cycle, run services on tmpfs :)

DONT ever use it for production !!!!


## Usage

Using mysql as example:

    $ make mysql/start   # starts mysql service
    $ make mysql/stop    # stops mysql service 
    $ make mysql/clean   # cleans installed dir (stopping if necessary)
    $ make mysql/cli     # runs cli client to connect `default` db

The same applies to all other services. Most services supports connecting
to a specific db, thus the following works:

    $ make mysql/cli/omg # runs cli client to connect to `omg` db


## Gotchas

It assumes the presence of `/scratch`, & does not check if it is mounted
as `tmpfs`.


## License

See LICENSE

