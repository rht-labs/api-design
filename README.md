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

# To Learn More or Start Contributing
See the [contributor's guide](CONTRIBUTING.md). The following documentation is focused on end users. 

# Getting Started With An Example

Let's suppose for a moment that you're working on a team that is building a Java web application that you want to deploy to JBoss EAP on OpenShift. In your organization it's standard policy for teams to use a promotion process that deploys new releases of the application from a development environment (DEV), to a testing environment (UAT), and finally to production (PROD). 

In it's current form, the Automation API is a very thin abstraction over the below concepts. If you are new to these concepts, it may help to read through the below links before continuing.

* [OpenShift Projects](https://docs.openshift.com/container-platform/3.3/architecture/core_concepts/projects_and_users.html#architecture-core-concepts-projects-and-users)
* [OpenShift Source to Image (S2I)](https://docs.openshift.com/container-platform/3.3/architecture/core_concepts/builds_and_image_streams.html).
* [Jenkins Pipeline](https://go.cloudbees.com/docs/cloudbees-documentation/cookbook/book.html#_continuous_delivery_with_jenkins_pipeline)

If you would like to read [the schema](swagger.yml) for the engagement before following the example, now is the time to do it. You can use tools like [swagger editor](http://editor.swagger.io/) to visualize the schema as well. 

## The Engagement Object Hierarchy

The Automation API is currently composed of a single object hierarchy, the engagement. We're going to focus on the parts of the engagement that define OpenShift resources, like projects and applications inside an OpenShift cluster. Through out each section of the example, we'll show only the new JSON needed to add the functionality described. We'll put the whole document together at the end. **Feedback requested** is this the right way to do it? Or should we show complete examples? I'm worried that will be to much data on the screen.

Most Automation API documents will start like this:

```json
{
  "openshift_clusters": [
    {
      "openshift_resources": {    
        "projects": []
      }
    }
  ]
}
```

## Modelling The Build Environment

PBI leverages OpenShift S2I for all container builds. Thus, we need to tell our automation to set up an OpenShift project where these S2I builds can take place. Given that our organization has a policy for DEV => UAT => PROD promotion process, we'll use the DEV stage to build our images. Here is how to do that:

```json
{
  "projects": [
    {
      "name": "hello-world-dev",
      "display_name": "Hello World - DEV",
      "environment_type": "build",
      "apps":[]
    }
  ]
}
```

## Modelling The Application

PBI leverages Jenkins to do application builds. While we can use OpenShift S2I to do application builds, Jenkins provides an ecosystem of 3rd party plugins for things like static analysis and artifact archiving that are very valuable. Therefore, we need to give Jenkins the information it needs to properly build our Java Application with maven. OpenShift will use the resulting WAR file from the Jenkins application build to create a container image with S2I, so we need to tell OpenShift to use a JBoss EAP base container image.

```json
{
  "apps":[
    {
    "name": "hello-world",
        "scm_url": "https://github.com/jboss-developer/jboss-eap-quickstarts.git",
        "scm_ref": "master",
        "build_tool": "mvn-3",
        "build_application_commands": [
          "mvn clean install"
        ],
        "context_dir": "helloworld",
        "base_image": "openshift/jboss-eap64-openshift"
    }
  ]
}
```

## Modelling The Promotion Environments

In the previous steps we've declared our DEV stage with the details of how to build our application and it's corresponding container image. We now need a way to promote this application to our UAT and PROD stages. PBI leverages Jenkins pipeline and OpenShift ImageStreams to provide this functionality. Therefore, we simply need to tell OpenShift which projects to create for our UAT and PROD stages, as well as the apps we expect in those project, and PBI will be smart enough to create pipelines in Jenkins to promote the application through those stages. Here is what that looks like:

```json
{
  "projects":[
    {
      "name": "hello-world-uat",
      "display_name": "Hello World - UAT",
      "environment_type": "promotion",
      "apps": [
        {
          "name": "hello-world",
          "base_image": "hello-world"
        }
      ] 
    },
    {
      "name": "hello-world-prod",
      "display_name": "Hello World - PROD",
      "environment_type": "promotion",
      "apps": [
        {
          "name": "hello-world",
          "base_image": "hello-world"
        }
      ] 
    }
  ]
}
```


## Modelling Users & Groups
 
TODO

## The End Result

If we put it all together, here is the result. 

```json
{
  "openshift_clusters": [
    {
      "openshift_resources": {    
        "projects": [
          {
            "name": "hello-world-dev",
            "display_name": "Hello World - DEV",
            "environment_type": "build",
            "apps":[
              {
                "name": "hello-world",
                "scm_url": "https://github.com/jboss-developer/jboss-eap-quickstarts.git",
                "scm_ref": "master",
                "build_tool": "mvn-3",
                "build_application_commands": [
                  "mvn clean install"
                ],
                "context_dir": "helloworld",
                "base_image": "openshift/jboss-eap64-openshift"
              }
            ]
          },
          {
            "name": "hello-world-uat",
            "display_name": "Hello World - UAT",
            "environment_type": "promotion",
            "apps": [
              {
                "name": "hello-world",
                "base_image": "hello-world"
              }
            ] 
          },
          {
            "name": "hello-world-prod",
            "display_name": "Hello World - PROD",
            "environment_type": "promotion",
            "apps": [
              {
                "name": "hello-world",
                "base_image": "hello-world"
              }
            ] 
          }
        ]
      }
    }
  ]
}
```

## Next Steps

### Adding More Apps

The Automation API is designed to support multiple apps in a project. Remember that projects use kubernetes to control resource quotas, so you'll want to work with your operations team to figure out the right balance of projects and apps.

### More complicated scenarios

The Automation API supports a lot more than what was covered here. Review the schema to get an idea what those things are, and [open an issue](https://github.com/rht-labs/api-design/issues/new) if you'd like more documentation.

### Validating Your Document Against the OpenAPI Spec
See https://github.com/rht-labs/api-design/issues/53

## Generating An Automation API Document Via The Labs Console: An Example
TODO when console is ready

# Code Generation
The code-gen folder contains scripts and helpers to generate the code we need from these APIs. For now, the scripts need to be run in the code-gen directory else they will fail.

# Contributing
This documentation is focused on end users. If you're interested in contributing or simply learning more about why we've made certain design decisions, see the [contributor's guide](CONTRIBUTING.md).