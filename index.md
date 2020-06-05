% *The* Cloud-Foundations Website
%


## Where do these tools come from?

The Cloud Foundations tools come primiarily from the work
started at Symantec Corporation for the 
cloud-platform enginneering division.

## The Cloud Foundations Ecosystem

While not designed together the cloudfoundations tools
form an ecosystem of four(4) subclusters:
Identity and access management, Image creation and Distribution,
Machine Domination, and Virtual Machine Management.

Their dependency relastionships can be visualized here:

![](images/daemon-relationships.svg){ width=100% }

### Identity and Access Management

Two tools belong on this cluster: 
[keymaster](https://github.com/Cloud-Foundations/keymaster) and 
[cloud-gate](https://github.com/Cloud-Foundations/cloud-gate).
Both of these tools generate ephemeral credentials for accessing
other systems. Keymaster provides: SSH certificates, TLS certificates,
and it also provices access as an openid connect provider.
Cloud-Gate provides both ephemeral access to AWS tokens and console
access to AWS. Cloud-Gate CLI uses keymaster TLS certificates
to provide CLI access to AWS tokens.

Keymaster is the base system for authenticating users, it's design
focused on a requirement for 2FA, usability and the goal to be an
SSO for both the CLI and the web. 
Cloud-Gate is the AWS access broker and it was built to overcome
the shortcomings of SAML delegation on AWS and to provide delegation
of acess control to the teams that actually know who needs to
be approved for what.

### Imaginator

The imaginator cluster includes all tools for image creation
and distribution. The system generates images for AWS, OpenStack,
and SmallStack (see below).

### SmallStack

SmallStack was the answer to the question on how to manage
our fleet of on-prem vm given the complete shutdown of the
openstack environment. While there were tools like proxmux
that could take over the environment we found them with 
several limitations.

### Dominator

The first of the cluster of the cloud-foundations ecosystem.
Designed as an open-source improvement of Borg its goal is
machine domination with focus on stateful machines.

## Tool List


The cloudfoundations tools include: 

Name      |Role             |Documents
----------|-----------------|------
[Keymaster](https://github.com/Cloud-Foundations/keymaster) |Authentication   |[Design Doc](https://github.com/Cloud-Foundations/keymaster/blob/master/docs/Keymaster-DesignDoc.md)
[Dominator](https://github.com/Cloud-Foundations/Dominator) |Image-based deploy and patching       |[Design Doc](https://github.com/Cloud-Foundations/Dominator/blob/master/design-docs/Dominator/README.md)
[Cloud-Gate](https://github.com/Cloud-Foundations/cloud-gate)|AWS access broker|[Design Doc](http://bit.ly/356rtXp)


---------------

## Some final remarks

YAY we might need to add some copyright here

