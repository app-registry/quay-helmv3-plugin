# Helm Quay plugin

## Overview

This Helm plugin was created from the [Helm plugin](https://github.com/app-registry/appr-helm-plugin) that was designed to work with `Helm v2`. Due to the fact that `Helm v3` comes with a `helm registry` subcommand the original plugin does not work with `Helm v3`.  

## Install the Helm Quay Plugin

First, install the latest [Helm v3 release](https://github.com/kubernetes/helm#install).

If you are a macOS user, quickstart with brew: `brew install helm`

Next download and install the Quay plugin for Helm.


### Option 1: Install using `helm plugin install`

```shell
$ helm plugin install https://github.com/app-registry/quay-helmv3-plugin

$ helm quay --help
Quay plugin assets do not exist, download them now !
downloading https://github.com/app-registry/appr/releases/download/v0.7.4/appr-osx-x64 ...
```

### Option 2: Install using `git clone`
```shell
# export $HELM_PLUGINS environment variable
$ eval `helm env`
$ git clone https://github.com/app-registry/quay-helmv3-plugin $HELM_PLUGINS/quay-helmv3-plugin

$ helm quay --help
Quay plugin assets do not exist, download them now !
downloading https://github.com/app-registry/appr/releases/download/v0.7.4/appr-osx-x64 ...
```

### Upgrade

##### Upgrade the appr binary

``` shell
$ helm quay list-plugin-versions
$ helm quay upgrade-plugin VERSION
downloading https://github.com/app-registry/appr/releases/download/v0.7.4/appr-osx-x64 ...
```

##### Upgrade the helm plugin

```
$ eval `helm env`
$ cd $HELM_PLUGINS/quay-helmv3-plugin

$ git pull origin master
$ helm quay upgrade-plugin
downloading https://github.com/app-registry/appr/releases/download/v0.7.4/appr-osx-x64 ...
```

## Example Usage

### Check Quay version

```
helm quay version quay.io
```

Output should be:
```
Api-version: {u'cnr-api': u'0.X.Y'}
Client-version: 0.X.Y
```

### Pull Helm chart from the Quay registry

```
helm quay list quay.io
helm quay pull quay.io/charts/jenkins
```

### Create and push your own chart

First, create an account on https://quay.io or another on-prem Quay environment and login to the CLI using the username and password

Set an environment for the username created at Quay to use through the rest of these instructions.

```
export USERNAME=philips
```

Login to Quay with the Helm quay plugin:

```
helm quay login -u $USERNAME quay.io
```

Create a new Helm chart, the default will create a sample application:

```
helm create my-first-chart
```

Push this new chart to Quay.

```
cd my-first-chart
helm quay push quay.io/$USERNAME
```
