# Contributing to Serverless Benchmarks

It's awesome that you want to contribute to our benchmarks! You can contribute in several ways, like:

* Creating new benchmarks
* Fixing existing bugs
* Improving documentation and guidelines

To help you on this journey we've created this document that will guide you through several steps, like [creating a new benchmark](#creating-a-new-benchmark), [understanding our folder structure](#understanding-our-folder-structure) and [documenting-a-benchmark](#documenting-a-benchmark).

## Table of contents

* [Contributing to Serverless Benchmarks](#)
  * [How it works](#how-it-works)
  * [Methodology](#methodology)
  * [Understanding our folder structure](#understanding-our-folder-structure)
  * [Creating a new benchmark](#creating-a-new-benchmark)
  * [Documenting a benchmark](#documenting-a-benchmark)
  * [Versioning](#versioning)

## How it works

Our repository contains a package of assets for each tool benchmark. We have **scripts**, **notebooks** and **interactive scenarios** for each one of those tools. The way it works is pretty simple, the main idea is to provide a knowledge center to host every information regarding the performance of the most used tools.

If you want to understand how we are doing our tests, check the [methodology section](#methodology).

## Methodology

The most important features to worry, for every FaaS tool, are:

* Reliability
* Response time
* Resources consumption
* Throughput

To test those features we're doing the following benchmarks:

### Response time test

On this test, we're going to open a single connection and send as many requests as we can in a 10 seconds window to a simple function. Since we have only a single connection we can measure the following:

* **Response time:**** how fast does the tool responds. With our test, we can measure the slowest and fastest response of each tool
* **Throughput:** how much does the tool handle. With our test, we can see how many requests did the tool handled and get requests per seconds metric

### Load test

On this test we're going to open 200 connects and send as many requests as we can in a 5 minutes window to a simple function. With this, we can measure the following:

* **Reliability:** this is a pretty hard test. With it, we can see how does the tool respond to a load like this
* **Resources consumption:** with a high load we can see how much CPU and computer resources were necessary for the tool to handle it
* **Throughput:** like the response time test, on this test we can see how many requests were handled by the tool

### Important note

The benchmark results may change depending on your hardware. Every `README.md` file at the root of the tool folder has a section dedicated to declaring the hardware used on the last benchmark made for that given tool.

## Understanding our folder structure

On the root of our repository there are two main folders:

* **benchmarks:** all benchmarks for every tool
* **scripts:** common shared scripts

Inside the `benchmarks` folder, we have one folder for each tool. You can see a list of available tools on [our README file section](README.md#available-benchmarks). For each tool we have the following folders:

* **scripts:** useful scripts to execute the benchmark
* **notebooks:** text files with useful annotations
* **scenario:** Katacoda interactive scenario, explaining every step to execute the benchmark manually

Note that the contents of each folder may change, depending on the tool. There is also a `README` file on the root of each tool's directory that will contain all the relevant information regarding that tool benchmark, like results, how to run that benchmark, prerequisites, and others.

**IMPORTANT:** the prerequisites for each tool may change, but they all extend a global prerequisite script located on [scripts/check-prerequisites.sh](scripts/check-prerequisites.sh) containing some basic prerequisites that are common for every tool. Also, those scripts don't install the required prerequisites, they only check if you have them installed.

## Creating a new benchmark

_TODO_

## Documenting a benchmark

_TODO_

## Versioning

We use [SemVer 2.0.0](https://semver.org/) for versioning our releases. Also, we use [Gitflow](https://danielkummer.github.io/git-flow-cheatsheet/) with [this awesome tool](https://github.com/nvie/gitflow) plus [Gitmoji](https://gitmoji.carloscuesta.me) to organize our commits/branches.
