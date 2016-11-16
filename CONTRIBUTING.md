# How to Contribute

We welcome contributions from the community. Here is the process for submitting patches to any of the rht-labs repositories.

## Open an Issue

If you see something you'd like changed, but aren't sure how to change it, submit an issue describing what you'd like to see.

## Submit a Pull Request

If you feel like getting your hands dirty, feel free to make the change yourself. Here's how:

1. Fork the repo on Github, and then clone it locally.
2. Create a branch named appropriately for the change you are going to make.
3. Make your code change.
4. Push your code change up to your forked repo.
5. Open a Pull Request to merge your changes to this repo and be sure to fill out the template that is provided.

See [Using Pull Requests](https://help.github.com/articles/using-pull-requests/) got more information on how to use GitHub PRs.

# Things Contributors Should Know

# The Design of the Automation API

The current architectural direction for PBI is that the Automation API will be a verbose contract i.e. we'll favor completeness over convention or brevity. This decision was made because the additional detail removes guess work about the desired state when implementing an Automation Engine. However; this can make writing documents in the Automation API schema more laborious. To lower the bar of entry to our ecosystem, we're building a graphical interface using a contract that favors strong conventions and brevity. This new UI, called the labs console, will be able to generate Automation API documents from it's terse model, thus allowing the labs console to drive Automation Engines. The labs console is still to early to consume at this stage, so the below example will walk you through writing a document in the Automation API model directly.

## A Note About How This API Is Evolving

We didn't originally set out to build an Automation API, but rather automate the creation of projects, apps, build config, etc inside of Red Hat OpenShift. So while architecturally we aspire to a declarative Automation API, our implementation is actually derived from an attempt to strongly type a var file being used for [an Ansible role](https://github.com/rht-labs/ansible-stacks/tree/master/roles/create-openshift-resources). Since this contract is now consumed by our [Jenkins Pipeline Plugin](https://github.com/rht-labs/dynamic-pipeline-jenkins-plugin) and [Ansible Role](https://github.com/rht-labs/ansible-stacks/tree/master/roles/create-openshift-resources) implementations, we're favoring stability in the Automation API and doing experimentation with the [API in the Labs Console](https://github.com/rht-labs/labs-console-api). When we're happy with the evolution of these new concepts, we'll make breaking changes to the Automation API.

## Logical Architecture & Links to Code Repositories 
TODO

  * Repositories include:
    * https://github.com/rht-labs/labs-console
    * https://github.com/rht-labs/labs-console-api
    * https://github.com/rht-labs/infographic


       * Repositories include:
     * https://github.com/rht-labs/ansible-stacks
     * https://github.com/rht-labs/dynamic-pipeline-jenkins-plugin
     * https://github.com/rht-labs/openshift-jenkins-s2i-config
     * https://github.com/rht-labs/rhc-ose

       * We have the following types of automation targets:
     * Hosting Infrastructure (e.g. OpenStack, AWS)
     * Container Platform (e.g. OpenShift)
     * DevOps and Collaboration tools (e.g. Jira, Slack, GitHub, Jenkins)
     * Application Development (e.g. Maven builds, OpenShift s2i)

## Why build the Automation API?

The IT Automation and CI / CD tooling ecosystems are exploding. There is no one tool to rule them all

The current swagger.yaml file defines the automation API used throughout Open Innovation Labs. Over time it is likely that we'll model multiple APIs in this repository, and move Automation to a sub directory.

## Little Bit of Backstory
TODO e.g. why is it called an engagement

## Stability vs Experimentation
