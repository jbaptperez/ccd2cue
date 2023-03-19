# ccd2cue

A *ccd2cue* Linux Docker build.

See [the GNU ccd2cue official documentation](https://www.gnu.org/software/ccd2cue/manual/ccd2cue.html)
to get more information about the tool.

# Build

To build the image, just type the following command:

```bash
docker build -t jbaptperez/ccd2cue:latest .
```

# Run

To run the image, just type the following command:

```bash
docker run --rm -it jbaptperez/ccd2cue:latest --version
```

Then use your own bind mounts (here, the local `app` directory is mounted to `/app` within the container).

```bash
docker run --rm -it \
    --mount type=bind,source="$(pwd)"/app,target=/app \
    jbaptperez/ccd2cue:latest \
    /app/gnu.ccd -o /app/gnu.cue
```

