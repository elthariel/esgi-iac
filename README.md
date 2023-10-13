# ESGI - IaC - Course samples and docs

## Requirements

- A [Scaleway account](https://www.scaleway.com/en/docs/console/my-account/how-to/create-an-account/)
- A [dedicated scaleway project](doc/scw-project.md)
- A GNU/Linux (or Unix) environment
- [Docker](https://docs.docker.com/get-docker/)
- The class docker image


## The class project

Every course has a final project that allows the teacher to evaluate what you've
learned. Moreover, the project itself is without doubt the best way to learn.

As this is an Infrastructure as Code class, a skill part of of the larger DevOps
field, this will be a DevOps project. And it will requires you to develop skills
a little bit beyond the strict scope of IaC.

The project can be summarized as such: I will ask you to deploy a software
you've been, ideally, developing yourself on a Kubernetes cluster using modern
DevOps tools, including terraform.

It will be performed by students in teams of 2 or 3.

### The base, mandatory layer

To make things a little bit more interesting, in my own humble opinion (but
sadly for you, my opinion on this is the one that matters :p), I'll adding a few
constraints:

- The app you're deploying MUST be dockerized (i.e. available as a container
  image). It's a k8s requirement.
- The container image MUST be available on the internet in a docker-compatible
  image registry. It COULD be in a public image registry (i.e. without
  authentication)
- The app you're deploying MUST use a database of some sort (postgresql, mysql,
  mongo, etc.)
- The database MUST be deployed either inside kubernetes OR as a managed
  scaleway service provisionned through terraform.
- The kubernetes cluster MUST be provisioned on scaleway using terraform
- The app MUST be deployed as a Pod using terraform via the kubernetes provider
- The cluster and the app provisioning code must be organized in dedicated
  terraform modules, and used from the main program
- The terraform state of your main program MUST be stored in a remote (i.e.
  non-local) backend
- It MUST be possible to deploy your app using only 2 commands, one to provision
  the state bucket, another to provision the terraform cluster and all the
  kubernetes resources required to deploy your app in the cluster. There SHOULD
  be no other manual actions required. It means there must be 2 terraform
  programs.
- Your app MUST be available publicly on the Internet (you can use a
  LoadBalancer, or a NodePort. The latter is cheaper)

If your group produce 2 terraform programs respecting the *MUST* constraints
above, you would get a note between 8/20 and 12/20, depending on the quality of
your code.

### The bonus, fun layer

In addition to the base layer of requirements mentionned above, I'll provide you
with a list of potential features you could implement that will allow you to
rise above the average 10/20 grade. You can mix and match those ideas based on
your personal interests and opinions. You can also try to suggest me totally new
ideas for consideration.

At the end of each item, the number between parenthesis is the maximum number of
point(s) the implementation of the item would entails you to.

As you'll easily realize. The sum of the potential earnable points is way
above 20. While I'm not sure the ESGI school allows for grades above 20/20, as
some schools do, if you're in the situation where you end up deserving a grade
above 20/20, I will:
- Make a public announcement of that note in the school,
- Sign you a certificate of DevOps awesomeness,
- and *write you a public recommandation on your Linkedin profile*

Without further ado, here's the list of optional items of the project:

- The app is deployed as a Deployment (and not a single Pod), using terraform
  via the kubernetes provider. (1)
- The app you're deploying is also using an alternate datastore, like an object
  storage (example: an S3 compatible store), or Redis, in addition to the main
  datastore (2)
- The app you're deploying has an additional container running a different, but
  related process, for example a background job processor. (1)
- The app has automated scaling based on CPU usage of the container. (1.5)
- The app container image is stored in a private container registry with the
  credentials injected as a kubernetes secret via terraform (1.5)
- The private container registry is also created via terraform (1)
- Your app is exposed to the internet through a kubernetes ingress controller
  (like traefik, the nginx ingress controller, etc.) (2)
- The app is exposed through https, using the ingress controller of the previous
  point and tls certificate managed using the `cert-manager` tool (+3)
- Your app is deployed through a custom (i.e. that you wrote yourselves) helm
  chart. The helm chart is installed via terraform (+3)
- Your kubernetes cluster has centralized logging using loki and grafana, aka
  the loki-stack. Helm is recommended here :) (+3).
- You have a CI/CD pipeline automating the build and deployment of your app when
  new commits are pushed on a certain branch of your app code repository (+4)

### Pedagogic support

Due to the diversity of the directions in which this project can go, based on
your own decisions, I will support you doing this project by:

- Continuing teaching you the fundamentals of Terraform
- Introduce you to the fundamentals of Kubernetes
- Teach mini lessons on any related topics that you rise during the class
- Answer your questions with explanations, live coding and relevant documentation and resources.

# Have fun !
