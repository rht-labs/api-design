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
