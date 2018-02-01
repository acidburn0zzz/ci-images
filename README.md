# CI Images for Python

This is an official Docker image containing builds of the latest stable
releases of Python, as well as a semi-up-to-date checkout of the Python
[git master branch](https://github.com/python/cpython).

The versions of Python currently supported include:

* Python 3.8 git head
* [Python 3.7.0b1](https://www.python.org/downloads/release/python-370b1/)
* [Python 3.6.4](https://www.python.org/downloads/release/python-364/)
* [Python 3.5.4](https://www.python.org/downloads/release/python-354/)
* [Python 3.4.7](https://www.python.org/downloads/release/python-347/)
* [Python 2.7.14](https://www.python.org/downloads/release/python-2714/)

We'll track new maintenance releases of these Python versions, and will
include Python 3.7 beta releases when they become available.  Feel free to
help us by submitting [merge
requests](https://gitlab.com/python-devs/ci-images/merge_requests) or
[issues](https://gitlab.com/python-devs/ci-images/issues).

We are publishing the Docker images on [Quay](https://quay.io). Changes to
this repository automatically trigger new builds so the Quay images are [always
up to date](https://quay.io/repository/python-devs/ci-image?tab=info).  You
can pull the resulting containers with this command:

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
