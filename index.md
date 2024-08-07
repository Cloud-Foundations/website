% *The* Cloud-Foundations Website
%


## Where do these tools come from?

The Cloud Foundations tools come primiarily from the work
started at Symantec Corporation for the 
cloud-platform enginneering division. See the [About](misc/about.html)
page for more information.

## The Cloud Foundations Ecosystem

While not designed together the cloudfoundations tools
form an ecosystem of four(4) subclusters:
Identity and Access Management, Image creation and Distribution,
Machine Domination, and Virtual Machine Management.

Their dependency relastionships can be visualized here:

![](images/daemon-relationships.svg){ width=100% }

### Identity and Access Management

Two tools belong in this cluster: 
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

The imaginator cluster includes all tools for
[image creation](Dominator/cmd/imaginator/index.html)
and distribution. The system generates images for AWS, OpenStack,
and [SmallStack](Dominator/design-docs/SmallStack/index.html) (see below).

### [SmallStack](Dominator/design-docs/SmallStack/index.html)

[SmallStack](Dominator/design-docs/SmallStack/index.html) was the answer to the
question of how to manage our fleet of on-prem VMs given the complete shutdown
of the OpenStack environment. While there were tools like proxmux that
could take over the environment we found them with several
limitations.

### [Dominator](Dominator/design-docs/Dominator/index.html)

The first of the cluster of the Cloud-Foundations ecosystem.  Designed
as an open-source improvement of the Assimilator (an internal Google
system used to deploy and update the OS+Borg to physical machines) its
goal is machine domination with focus on stateful machines.

### [Birther](Dominator/design-docs/MachineBirthing/index.html)

The [Birther](Dominator/design-docs/MachineBirthing/index.html) is a system or
set of integrated components which can be used to automatically or
semi-automatically install (or re-install) an Operating System onto a machine.
It manages the very beginning of the life-cycle of a machine once it is
physically installed, connected and powered on.

## Tool List


The Cloud Foundations tools include: 

Name      |Role             |Documents
----------|-----------------|------
[Birther](https://github.com/Cloud-Foundations/Dominator)|Image-based installation|[Design Doc](Dominator/design-docs/MachineBirthing/index.html)
[Dominator](https://github.com/Cloud-Foundations/Dominator)|Image-based deploy and patching|[Design Doc](Dominator/design-docs/Dominator/index.html)
[Cloud-Gate](https://github.com/Cloud-Foundations/cloud-gate)|AWS access broker|[Design Doc](http://bit.ly/356rtXp)
[Keymaster](https://github.com/Cloud-Foundations/keymaster)|Authentication|[Design Doc](Keymaster/DesignDoc.html)
[SmallStack](https://github.com/Cloud-Foundations/Dominator)|Virtual Machine Management|[Design Doc](Dominator/design-docs/SmallStack/index.html)


---------------

## Some final remarks

Copyright 2019-2024 cloud-foundations.org
