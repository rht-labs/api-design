# What Is In This Repository?
This repository is home to the Automation API specification for Open Innovation Labs Push Button Infrastructure. Originally, it started as the home of all our Swagger / OpenAPI Specifications, System Designs and Documentation, but over time we've decided that we should have smaller, more discrete repos. The repository needs to be migrated to a new one to make the name more declarative.

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
![alt text](images/PBI_Conceptual.png "PBI Conceptual Architecture")


# Using the Automation API

The current architectural direction for PBI is that the Automation API will be a verbose contract i.e. we'll favor completeness over convention or brevity. This decision was made because the additional detail removes guess work about the desired state when implementing an Automation Engine. However; this can make writing documents in the Automation API schema more laborious. To lower the bar of entry to our ecosystem, we're building a graphical interface using a contract that favors strong conventions and brevity. This new UI, called the labs console, will be able to generate Automation API documents from it's terse model, thus allowing the labs console to drive Automation Engines. The labs console is still to early to consume at this stage, so the below example will walk you through writing a document in the Automation API model directly.

## Writing An Automation API Document By Hand: An Example

Let's suppose for a moment that you're working on a team that is building a Java web application that you want to deploy to JBoss EAP on OpenShift. In your organization it's standard policy for teams to use a promotion process that deploys new releases of the application from a development environment (DEV), to a testing environment (UAT), and finally to production (PROD). 

### Modelling The Build Environment

### Modelling The Promotion Environments

### Validating Your Document Against the OpenAPI Spec


## Generating An Automation API Document Via The Labs Console: An Example
TODO when console is ready

# Code Generation
The code-gen folder contains scripts and helpers to generate the code we need from these APIs. For now, the scripts need to be run in the code-gen directory else they will fail.

# Contributing
This documentation is focused on end users. If you're interested in contributing or simply learning more about why we've made certain design decisions, see the [contributor's guide](CONTRIBUTING.md).