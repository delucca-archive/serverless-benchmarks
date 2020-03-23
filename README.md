<p align="center">
  <br>
   <img src="https://media.giphy.com/media/q1mHcB8wOCWf6/giphy.gif" alt="Homer Simpson, really worried and turning a lot of pages to read a manual" title="Serverless Benchmarks header's GIF" />
  <br>
</p>
<p align="center">
A collection of benchmark tests for the most famous serverless tools
</p>

## 📖 About this

Serverless is a [quite popular topic nowadays](https://trends.google.com/trends/explore?date=today%205-y&q=serverless), and with that popularity came an overwhelming amount of new solutions. This repository focus on providing an easy way to compare the Function as a Service (FaaS, for short) solutions. Here, we're going to keep all the scripts and benchmark results for those tools.

* [Table of contents](#)
  * [Getting started](#-getting-started)
  * [Available benchmarks](#-available-benchmarks)
  * [Prerequisites](#-prerequisites)
  * [Running a benchmark](#-running-a-benchmark)
  * [Contributing](#-contributing)
  * [Useful links](#-useful-links)
  * [License](#-license)

## 🤖 Getting started

This repository is organized based on each tool we're testing. We have three main assets for each tool:

* **Scripts:** shell scripts to set up and execute our benchmarks
* **Notebooks:** text files containing useful information regarding the benchmark, like results, methodology, and walkthrough
* **Scenarios:** Katacoda scenarios containing a step-by-step guide to running the benchmark

All tools have their own folder, inside the `benchmarks` folder on this repository. There is also a `scripts` folder on the root of the repository. There we're going to place all global scripts that are used across multiple tools. To see all available benchmarks of this repository, check [the next section](#-available-benchmarks).

If you want to run a specific benchmark, go on the [running a benchmark section](#-running-a-benchmark).

## 🌱 Available benchmarks

On this section we're going to list all available benchmarks on this repository so far. Click on their names to learn more:

* [Kubeless](benchmarks/kubeless)
* [Fission](benchmarks/fission)
* [OpenFaas](benchmarks/openfaas)
* [Nuclio](benchmarks/nuclio)

If you're searching for a tool we haven't done the benchmark yet, please open a new [feature request](https://github.com/odelucca/serverless-benchmarks/labels/feature-request).

## 🖥️ Prerequisites

Each tool has its own prerequisites, which is usually listed on their `README.md` file at the root folder of that given tool. But every tool has some common prerequisites, those are listed here:

* [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
* [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [Hey](https://github.com/rakyll/hey)

We've developed a script to automatically check if you have all the prerequisites installed. It is placed inside [scripts/check-prerequisites.sh](scripts/check-prerequisites.sh). **IMPORTANT** The script will not install the prerequisites (since it depends on your distro), it will only check if your environment can run our benchmarks.

Also, there is a `check-prerequisites` script on each tool. Those scripts extend the global script, checking for both common and tool-specific prerequisites.

## ⚙ Running a benchmark

Every benchmark has the same folder structure:

``` text
serverless-benchmarks
│
├── benchmarks
| ├── <tool>
| |   ├── scripts 
| |   |   ├── <other-scripts>
| |   |   ├── setup.sh
| |   |   └── run.sh
| |   └── <other-files>
| └── <other-tools>
└── ...
```

The `setup.sh` and `run.sh` will always exist. Before executing the `run` script you must configure your environment. Below I'm going to show you a simple snippet that will set up and execute the benchmark test for the `kubeless` tool:

``` sh
# assuming you're on the repository's root folder
TOOL_SCRIPTS="./benchmarks/kubeless/scripts" && \
$TOOL_SCRIPTS/setup.sh && \
$TOOL_SCRIPTS/run.sh
```

After executing that snippet, just wait some minutes to finish installing and executing your benchmark (the amount of time depends on the tool, but it is usually ~10m).

## 💻 Contributing

Contributions are what make the open source such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**. You can learn how to contribute to this project on the [`CONTRIBUTING`](CONTRIBUTING.md) file.

## 🔗 Useful links

* [Check common prerequisites scripts](scripts/check-prerequisites.sh)
* [Setup all tools script](scripts/setup.sh)
* [Run all benchmarks script](scripts/run.sh)

## 🔓 License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for more information.
