# bmi-example-c-docker

The [C example](https://github.com/csdms/bmi-example-c)
for the [Basic Model Interface](https://bmi.readthedocs.io),
dockerized.

## Build an image

Build this example locally with:
```
docker build --tag bmi-example-c .
```
The image is built on the [condaforge/mambaforge](https://hub.docker.com/r/condaforge/mambaforge) base image.
The OS is Linux/Ubuntu.
`conda` and `mamba` are installed in `CONDA_DIR=/opt/conda`.
The *base* environment is activated.
and the C BMI specification and example, including the `run_bmiheatc` executable, are installed into it.

## Run a container

Run a container from this image interactively:
```
docker run -it bmi-example-c
```
This starts a bash shell in the container.
Run the example program `run_bmiheatc` with a configuration file:
```bash
cd /tmp
echo "1.5, 8.0, 6, 5" > config.txt
run_bmiheatc config.txt
```
View the program's output with:
```bash
cat bmiheatc.out
```

## Developer notes

A versioned, multiplatform image built from this repository is hosted on Docker Hub
at [csdms/bmi-example-c](https://hub.docker.com/repository/docker/csdms/bmi-example-c-docker/).
This image is automatically built and pushed to Docker Hub
with the [release](./.github/workflows/release.yml) CI workflow.
The workflow is only run when the repository is tagged.
A user can pull this image from Docker Hub with:
```
docker pull csdms/bmi-example-c
```
