# CI Images for Python

This is an official Docker image containing builds of the latest stable
releases of Python, as well as a semi-up-to-date checkout of the Python
[git master branch](https://github.com/python/cpython).  It is based on
[Ubuntu 18.04 LTS](http://releases.ubuntu.com/18.04/).

The versions of Python currently supported include:

* Python 3.9 git head
* [Python 3.8.0b1](https://www.python.org/downloads/release/python-380b1/)
* [Python 3.7.3](https://www.python.org/downloads/release/python-373/)
* [Python 3.6.8](https://www.python.org/downloads/release/python-368/)
* [Python 3.5.7](https://www.python.org/downloads/release/python-357/)
* [Python 3.4.10](https://www.python.org/downloads/release/python-3410/)
* [Python 2.7.16](https://www.python.org/downloads/release/python-2716/)

Feel free to help us by submitting [merge
requests](https://gitlab.com/python-devs/ci-images/merge_requests) or
[issues](https://gitlab.com/python-devs/ci-images/issues).

We are publishing the Docker images on [Quay](https://quay.io). Changes to
this repository automatically trigger new builds so the Quay images are [always
up to date](https://quay.io/repository/python-devs/ci-image?tab=info).

You can use this image to test something in the latest version of Python,
e.g.:

```
$ docker run quay.io/python-devs/ci-image python3.8 -c "import sys; print(sys.version)"
```

You can pull the resulting containers with this command:

```
$ docker pull quay.io/python-devs/ci-image
```

If you want to use this image in your own CI pipelines (e.g. a
[.gitlab-ci.yml](https://gitlab.com/help/ci/yaml/README.md) file for a GitLab
shared runner), use this URL to refer to the image:

```
quay.io/python-devs/ci-image
```

Here's [an example](https://gitlab.com/python-devs/importlib_resources/blob/master/.gitlab-ci.yml).
