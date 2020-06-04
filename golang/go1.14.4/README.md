# Docker Run

## [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint)

ENTRYPOINT has two forms:

The exec form, which is the preferred form:

- `ENTRYPOINT ["executable", "param1", "param2"]`

The shell form:

- `ENTRYPOINT command param1 param2`

An `ENTRYPOINT` allows you to configure a container that will run as an executable.

Command line arguments to `docker run <image>` will be appended after all elements in an exec form `ENTRYPOINT`, and will override all elements specified using `CMD`. This allows arguments to be passed to the entry point, i.e., `docker run <image> -d` will pass the `-d` argument to the entry point. You can override the `ENTRYPOINT` instruction using the docker run `--entrypoint` flag.

The shell form prevents any `CMD` or `run` command line arguments from being used, but has the disadvantage that your `ENTRYPOINT` will be started as a subcommand of `/bin/sh -c`, which does not pass signals. This means that the executable will not be the container’s `PID 1` - and will not receive Unix signals - so your executable will not receive a `SIGTERM` from `docker stop <container>`.

Only the last `ENTRYPOINT` instruction in the `Dockerfile` will have an effect.

## examples

- ENTRYPOINT ["executable", "param1", "param2"] (exec form)
- ENTRYPOINT command param1 param2 (shell form)
- CMD ["executable","param1","param2"] (exec form, this is the preferred form)  
- CMD ["param1","param2"] (as default parameters to ENTRYPOINT)  
- CMD command param1 param2 (shell form)
