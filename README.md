# kuruho-pipelines

Jenkins Pipelines for the kuruho organization

### Prerequisites

Please refer to section "System Requirements" of <https://github.com/gmacario/my-jenkins-pipelines>

#### Install easy-jenkins

Follow instructions at <https://github.com/gmacario/easy-jenkins>

Configure the initial administrator account - example:

* Username: `admin`
* Password `xxxx` (see KeePass)
* Confirm password `xxxx`
* Full name `Admin (build-gmhome)`
* E-mail address `admin@solarma.it`

#### Post-install configuration

Browse `${JENKINS_DASHBOARD}` (in my case <http://build-gmhome.solarma.it:9080>)

Click on **Build Executor Status**, then click on the "Configure" icon of node `master`

* Number of executors: 8 (was 2)
* Labels: `docker`

then click **Save**.

### Install pipeline `kuruho/kuruho-pipelines`

Browse `${JENKINS_DASHBOARD}` and click **Open Blue Ocean**.

Click **New Pipeline** to start the Blue Ocean pipeline creation wizard.

* Where do you store your code? **Github**
* Connect to Github: Create an access key
  - Token description: `easy-jenkins @build-gmhome`
  - Select scopes: Accept defaults (repo:all, read:user, user:email)
  - Click **Generate token**
* Click icon to copy your new personal access token
* On the Jenkins pipeline setup page, paste your Github access token and click **Connect**
* Which organization does the repository belong to? **kuruho**
* Create a single Pipeline or discover all Pipelines: **New Pipeline**
* Choose a repository: `kuruho-pipelines`, then click **Create Pipeline**
* Wait until the "Completed" status is displayed

<!-- EOF -->
