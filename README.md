<p align="center">
  <br>
   <img src="https://media.giphy.com/media/q1mHcB8wOCWf6/giphy.gif" alt="Homer Simpson, really worried and turning a lot of pages to read a manual" title="Serverless Benchmarks header's GIF" />
  <br>
</p>
<p align="center">
Benchmarking the most famous serverless tools
</p>

## 📖 About this

Serverless is a [quite a popular topic nowadays](https://trends.google.com/trends/explore?date=today%205-y&q=serverless), and with that popularity came an overwhelming amount of new solutions. This repository focus on providing an easy way to compare the Function as a Service (FaaS, for short) solutions. Here, we're going to keep all the scripts and benchmark results for those tools.

* [Table of contents](#)
  * [Getting started](#-getting-started)
  * [Available benchmarks](#-available-benchmarks)
  * [Prerequisites](#-prerequisites)
  * [Executing all benchmarks](#-executing-all-benchmarks)
  * [Additional commands](#-additional-commands)
  * [Notes and results](#-notes-and-results)
  * [Contributing](#-contributing)
  * [Useful links](#-useful-links)
  * [License](#-license)

## 🤖 Getting started

Our benchmark relies on a [custom methodology](CONTRIBUTING.md#methodology) that requires the execution of some standardized tests.

Each tool requires a set of steps to reproduce our benchmark methodology, to automate that we're using [Terraform](https://www.terraform.io/) as our automated provision tool, and [Ansible](https://www.ansible.com/) for IT automation.

**Terraform** handles the basic provisioning of our cloud platform while **Ansible** uses the provisioned infrastructure to configure our Kubernetes cluster, setup each tool, and run the tests.

**IMPORTANT:** We're using [AWS](https://aws.amazon.com/) as our primary (and only) cloud platform. The test architecture allows the usage of their [free tier images](https://aws.amazon.com/free/), so you can create a new account and execute the tests with no expenses.

On the next sections of this document you may learn more about [prerequisites](#-prerequisites) and how to [execute our benchmarks](#-executing-all-benchmars)

## 🌱 Available benchmarks

In this section, we're going to list all available benchmarks on this repository so far. After the tool name, we've placed relevant shortcuts for you to navigate on our benchmarks.

* **Kubeless**: [website](https://kubeless.io/) . [results](results/README.md#kubeless) . [more](results/kubeless)
* **Fission**: [website](https://fission.io) . [results](results/README.md#fission) . [more](results/fission)
* **OpenFaas**: [website](http://openfaas.com/) . [results](results/README.md#openfaas) . [more](results/openfaas)
* **Nuclio**: [website](https://nuclio.io) . [results](results/README.md#nuclio) . [more](results/nuclio)
* **Knative**: [website](https://knative.dev) . [results](results/README.md#knative) . [more](results/knative)

If you're searching for a tool we haven't done the benchmark yet, please open a new [feature request](https://github.com/odelucca/serverless-benchmarks/labels/feature-request).

## 🖥️ Prerequisites

Before executing our benchmark, you may need the following tools installed on your local environment:

* [Terraform CLI](https://www.terraform.io/downloads.html)
* [Ansible CLI](https://docs.ansible.com/ansible/latest/installation_guide/index.html)

To check if your local environment matches the prerequisites, you can run the following command:

```sh
make check_prerequisites
```

## ⚙ Executing all benchmarks

To start a new routine from scratch, you can run:

```shell
make benchmark
```

This command does the following:

1. Prompts for required cloud information to set up your Terraform integration
2. Provision the required resources in your cloud platform
3. Waits for all provisioned resources to be available
4. Runs Ansible playbook to configure the Kubernetes cluster
5. Runs all Ansible playbooks to setup every tool on our cluster
6. Runs all Ansible playbooks to execute the benchmark tests
7. Exports the results for our tests

You can also run only parts of the benchmark. To do so, take a look on the  [additional commands](#-additional-commands) section.

## 🕹️ Additional commands

Additionally, we have other commands that run only a part of our entire benchmark pipeline. They're all available as `make` commands:

* `provision`: applies the Terraform desired infrastructure on your cloud platform
* `provision_config`: setup the Terraform integration
* `provision_wait`: waits for the required resources to be available on your cloud platform
* `setup`: runs the Ansible playbook to set up our Kubernetes cluster and, afterward, executes all playbooks to set up our tools on the cluster
* `setup_cluster`: runs only the Ansible playbook to set up our Kubernetes cluster
* `setup_tools`: runs only the Ansible playbook to set up our serverless tools
* `run_tests`: runs all Ansible playbooks for all tests on all benchmarked tools
* `run_tests_response_time`: runs all Ansible playbooks for all benchmarked tools to test only their response time
* `run_tests_scalability`: runs all Ansible playbooks for all benchmarked tools to test only their scalability
* `run_<tool>`: runs the Ansible playbook for all tests on the given tool
* `run_<tool>_<test>`: runs the Ansible playbook to test only the given tool with the provided test

## 💡 Notes and results

You can find our analysis, technical inspections, and relevant results at the `results` folder on the repository root. You can [click here](results) to go there.

That folder contains documents comparing general aspects of all tools. Also, there is a specific folder for each tool that contains a detailed analysis of that tool.

## 💻 Contributing

Contributions are what make the open source such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**. You can learn how to contribute to this project on the [`CONTRIBUTING`](CONTRIBUTING.md) file.

## 🔗 Useful links

* [Provisioner folder](provisioner)
* [Benchmarker folder](benchmarker)
* [Results folder](results)

## 🔓 License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for more information.
