# Contributing to Serverless Benchmarks

It's fantastic that you want to contribute to our benchmarks! You can contribute in several ways, like:

* Creating new benchmarks
* Fixing existing bugs
* Improving documentation and guidelines

To help you on this journey, we've created this document that guides you through several steps, like [creating a new benchmark](#creating-a-new-benchmark), [methodology](#methodology) and [documenting-a-benchmark](#documenting-a-benchmark).

## Table of contents

* [Contributing to Serverless Benchmarks](#)
  * [How it works](#how-it-works)
  * [Methodology](#methodology)
  * [Creating a new benchmark](#creating-a-new-benchmark)
  * [Documenting a benchmark](#documenting-a-benchmark)
  * [Versioning](#versioning)

## How it works

We've separated this project into three major sections:

* `provisioner`: responsible for provisioning resources to execute the benchmark
* `benchmarker`: responsible for setting up and executing the benchmark itself
* `results`: responsible for aggregating the results and notes regarding our benchmark

Each section has a dedicated folder on the root of our repository. In the following headlines, I'm going to give you some details regarding how each of those contexts works.

### Provisioner

[Hosted on the provisioner folder](provisioner), this application uses [Terraform](https://www.terraform.io/) to provide all the required resources for running our tests. To do so, it connects with the cloud platform and creates the desired infrastructure for our tests.

Right now, we're only supporting AWS as our provider, but we can improve this soon.

### Benchmarker

[Hosted on the benchmarker folder](benchmarker), this application uses [Ansible](https://www.ansible.com) to automates the configuration of our Kubernetes cluster and all benchmarked tools. Also, it has a dedicated playbook for running the tests on each of those tools.

### Results

[Hosted on the results folder](results), this application uses markdown and some plugins to host detailed information regarding the benchmark itself.

## Methodology

The essential features, for every FaaS tool, are:

* Reliability
* Response time
* Resources consumption
* Throughput

To test those features, we're doing the following benchmarks:

### Response time test

On this test, we're going to open a single connection and send as many requests as we can in a 10 seconds window to a simple function. Since we have only a single connection, we can measure the following:

* **Response time:**** how fast does the tool responds. With our test, we can measure the slowest and fastest response of each tool
* **Throughput:** how much does the tool handle. With our test, we can see how many requests did the tool handled and get requests per seconds metric

### Scalability test

On this test, we're going to open 200 connects and send as many requests as we can in a 5 minutes window to a simple function. With this, we can measure the following:

* **Reliability:** this is a pretty hard test. With it, we can see how does the tool respond to a load like this
* **Resources consumption:** with a high load we can see how much CPU and computer resources were necessary for the tool to handle it
* **Throughput:** like the response time test, on this test we can see how many requests were handled by the tool

### Important note

The benchmark results may change depending on the provisioned hardware. The results file contains a section dedicated to logging the last provisioned hardware used on the tests.

## Creating a new benchmark

_TODO_

## Documenting a benchmark

_TODO_

## Versioning

We use [SemVer 2.0.0](https://semver.org/) for versioning our releases. Also, we use [Gitflow](https://danielkummer.github.io/git-flow-cheatsheet/) with [this awesome tool](https://github.com/nvie/gitflow) plus [Gitmoji](https://gitmoji.carloscuesta.me) to organize our commits/branches.
