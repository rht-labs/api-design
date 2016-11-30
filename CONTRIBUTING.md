# How to Contribute

We welcome contributions from the community. Here is the process for submitting patches to any of the rht-labs repositories.

## Open an Issue

If you see something you'd like changed, but aren't sure how to change it, submit an issue describing what you'd like to see. It will probably help to read some of the below information first to understand our design approach.

## Submit a Pull Request

If you feel like getting your hands dirty, feel free to make the change yourself. Here's how:

1. Fork the repo on Github, and then clone it locally.
2. Create a branch named appropriately for the change you are going to make.
3. Make your code change.
4. Push your code change up to your forked repo.
5. Open a Pull Request to merge your changes to this repo and be sure to fill out the template that is provided.

See [Using Pull Requests](https://help.github.com/articles/using-pull-requests/) got more information on how to use GitHub PRs.

# Things Contributors Should Know

# What is Push Button Infrastructure (PBI)?

Push Button Infrastructure is a capability developed in the Open Innovation Lab to enable our participant to focus on feature development on day 1, not the details of the platform they are running. To help understand PBI at a conceptual level, we'll explore it using [bounded contexts](http://martinfowler.com/bliki/BoundedContext.html), a key modelling concept introduced in [domain driven design](https://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215). In order to keep things conceptual, we're not going to introduce the tools or technologies we use for PBI implementation. There are 4 bounded contexts in the PBI conceptual architecture:

* **User Interfaces**
  * Graphical frontends to the assets in the PBI ecosystem, built using a [backend for frontend approach](https://www.thoughtworks.com/insights/blog/bff-soundcloud)
* **Automation API**
   * A declarative contract for modelling the desired state of Automation Targets
   * This repository is used for the Automation API
* **Automation Engines**
   * Tools used to consume the Automation API contract and produce the desired state in Automation Targets
* **Automation Targets**
  * The technologies that we ultimately want to create/configure/provision/etc. with PBI


Here's how those contexts look graphically:
![alt text](images/pbi_conceptual.png "PBI Conceptual Architecture")

# The Design of the Automation API

The current architectural direction for PBI is that the Automation API will be a verbose contract i.e. we'll favor completeness over convention or brevity. This decision was made because the additional detail removes guess work about the desired state when implementing an Automation Engine. However; this can make writing documents in the Automation API schema more laborious. To lower the bar of entry to our ecosystem, we're building a graphical interface using a contract that favors strong conventions and brevity. This new UI, called the labs console, will be able to generate Automation API documents from it's terse model, thus allowing the labs console to drive Automation Engines. The labs console is still to early to consume at this stage.

## A Note About How This API Is Evolving

We didn't originally set out to build an Automation API, but rather automate the creation of projects, apps, build config, etc inside of Red Hat OpenShift. So while architecturally we aspire to a declarative Automation API, our implementation is actually derived from an attempt to strongly type a var file being used for [an Ansible role](https://github.com/rht-labs/ansible-stacks/tree/master/roles/create-openshift-resources). Since this contract is now consumed by our [Jenkins Pipeline Plugin](https://github.com/rht-labs/dynamic-pipeline-jenkins-plugin) and [Ansible Role](https://github.com/rht-labs/ansible-stacks/tree/master/roles/create-openshift-resources) implementations, we're favoring stability in the Automation API and doing experimentation with the [API in the Labs Console](https://github.com/rht-labs/labs-console-api). When we're happy with the evolution of these new concepts, we'll make breaking changes to the Automation API.

## Show Me The Code!

This section provides mappings from the logical architecture to the code base that provide it's implementation.

* **User Interfaces**
  * https://github.com/rht-labs/labs-console
  * https://github.com/rht-labs/labs-console-api
  * https://github.com/rht-labs/infographic

* **Automation API**
  *  https://github.com/rht-labs/api-design
  *  https://github.com/rht-labs/automation-api

* **Automation Engines**
  * https://github.com/rht-labs/ansible-stacks
  * https://github.com/rht-labs/dynamic-pipeline-jenkins-plugin
  * https://github.com/rht-labs/openshift-jenkins-s2i-config
  * https://github.com/redhat-cop/casl-ansible

## Consuming this Contract in Automation Engines / Code Generation
It's also worth noting here that we didn't anticipate writing a single contract that could be consumed by multiple automation engines, but we've found that this element of our evolutionary design has been useful. To support consuming this contract, we're adding scripts and helpers to generate the code we need from these APIs in the code-gen folder. For now, the scripts need to be run in the code-gen directory else they will fail.

TODO where are these published?

