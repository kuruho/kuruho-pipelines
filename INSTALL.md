# INSTALL.md

This document explains how to install the pipelines.

## Prepare the Jenkins instance

**NOTE**: Instructions tested on mv-linux-powerhorse (Ubuntu 16.04.2 LTS 64-bit, Docker 17.03.1-ce)

* Install Jenkins using [gmacario/easy-jenkins](https://github.com/gmacario/easy-jenkins)

```script
git clone https://github.com/gmacario/easy-jenkins
cd easy-jenkins
./runme.sh
```

* Browse the Jenkins Dashboard (i.e. <http://localhost:9080/>)


* When the "Unlock Jenkins" page is displayed, type the initial Jenkins Administrator password (random sequence of hexadecimal digits), then click **Continue**
  - The initial password should be displayed on the terminal where you issued
the `./runme.sh` command.
  - Alternatively, you can retrieve the initial password using the
    following command: `docker-compose logs`


* When the "Customize Jenkins" page is displayed, click **Install suggested plugins** and wait for completion


* When the "Create First Admin User" page is displayed, enter the credentials to be used for the Jenkins Administrator account then click **Save and Finish**


* When the "Jenkins is ready!" page is displayed, click **Start using Jenkins**


* From the Jenkins Dashboard, click **Build Executor Status**, then configure node **master**

  - Number of executors: `4` (default: 2)
  - Labels: `docker` (default: "")

  then click **Save**


## Install the Jenkins pipeline

* From the Jenkins Dashboard, click **New Item**
  - Enter an item name: `solarma-pipelines`
  - Type: **Multibranch Pipeline**
  - Click **OK**


* Configure the job as below:
  - Branch Sources > Add source > Git
    - Project Repository: `https://github.com/SOLARMA/solarma-pipelines.git`
    - Credentials: Add > Jenkins
      - Domain: Global credentials (unrestricted)
      - Kind: Username with password
        - Scope: Global (Jenkins, nodes, items, all child items, etc)
        - Username: `gmacario`
        - Password: `xxxx` (replace with the correct password)
        - ID: `github_gmacario`
      - Click **Add**
    - Click **Save**


## Rebuild the document

* Run job "solarma-pipelines"

* Click on "Open Blue Ocean" and wait until the build completes

* You will find the produced artifacts under the "Artifacts" section of each branch in the Multibranch Pipeline.


## Troubleshooting

If you are unable to fetch the pipeline from git, make sure that:

1. The git server is reachable from the container
2. The git server has a valid https certificate
3. The credentials to access the git server are properly configured in Jenkins

<!-- EOF -->
