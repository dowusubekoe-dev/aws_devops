# devops_imran-teli
08/08/2023 09:23 Publish

Hello [**LinkedIn**](https://www.linkedin.com) Family, I am embarking on this journey with the objective of learning and mastering [**DevOps**](https://www.youtube.com/watch?v=Xrgk023l4lI). Some of the basics skills to learn in this roadmap includes

- **Linux** (Ubuntu, Centos, RHEL)
- **Virtualization** (VirtualBox, VMware ESXi, VMware Fusion)
- **Networking**
- **Scripting**
- **DevOps Tools** (Jenkins, Ansible, Docker, Kubernetes)

### What is DevOps

Imagine that you and your classmates are engaged in a significant group project. Every team member has a role to play - someone does the research, someone does the designing, someone writes, and someone else presents. However, while working on the project, the team runs into a number of issues, including misunderstandings, delays, glitches, and changes.

There are various teams involved in software development, including the research team (developers), the design team (designers), the writing/documentation team (QA and Testing), and the presentation team (operations), much like there were in the group project.

DevOps is like a set of teamwork strategies, tools, and processes that help different groups work together better to create software that's faster, more reliable, and of higher quality.

- ⚙️ **Collaboration:** DevOps helps these teams talk to each other more. Developers talk to designers, testers also talk to developers, and everyone knows what's happening.
- ⚙️ **Speed:** With DevOps, we use tools and processes to make things faster, hence making changes quickly, and the final product gets to users faster.
- ⚙️ **Quality:** DevOps detects early mistakes in the software before it gets deployed for customers. It's like having lots of testers making sure everything works well.
- ⚙️ **Feedback:** The DevOps team releases better software products based on consumer feedback.
- ⚙️ **Automation:** Think of having a robot that can format the text perfectly so the writer doesn't need to worry. DevOps uses automation tools to do repetitive tasks, saving time and reducing errors.

08/14/2023 8:39

# System Prerequisite & Setup
Using straightforward language to help everyone grasp the procedures or activities, I described what DevOps is all about in my earlier piece.
The setup of the configuration or environment will be the following topic. In my 𝗚𝗶𝘁𝗛𝘂𝗯(https://lnkd.in/gt3QBJeA) account, I've made available all the tools and account creation instructions required to finish the [DevOps]() course by Imran Teli.

## 1. VMware ESXi server Machine Specification
- ASRock LGA 1200 Intel H470 SATA 6Gb/s Micro ATX Intel Motherboard
- 4 CPUs x Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
- 32 GB RAM
- HDD1: 2TB SSD
- Non-SSD: 250GB x 3
- VMware ESXi 6.5 [Installation Guide](https://vcdx133.com/2017/03/06/vsphere-6-5-basics-part-1-esxi-install/)
- Configured with Static IP address

I chose to concentrate on using Linux and MacOS as my operating systems so that I could give all of my attention to my project. Having given it some thought, I decided on [𝗖𝗲𝗻𝘁𝗼𝘀-𝟵-𝗦𝘁𝗿𝗲𝗮𝗺](https://mirrors.centos.org/mirrorlist?path=/9-stream/BaseOS/x86_64/iso/CentOS-Stream-9-latest-x86_64-dvd1.iso&redirect=1&protocol=https).

I initially intended to use VirtualBox as the host virtual machine to install Centos-9-Stream as the guest operating system, but I changed my mind over disk space issues. Instead, I used [𝗨𝗧𝗠](https://mac.getutm.app) on my MacBook Pro to have Centos-9-Stream installed successfully.

## 2. Centos 9 Stream on UTM Platform Specification
- Architecture - x86_64
- Machine - Standard PC (Q35 + ICH9) (alias of pc-q35-7.2) (q35)
- Memory - 4GB
- HDD Size - 50GB

### 2a. Install JDK8 but I recommend JDK11 (Centos UTM)
- Open the termial and type the following commands

	`$ sudo yum -y install java-11-openjdk java-11-openjdk-devel`

	`$ java --version`

	`$ which java`

#### Resources
[JDK11 Installation](https://computingforgeeks.com/how-to-install-java-11-openjdk-11-on-rhel-8/)
	
### 2b. Maven (Centos UTM)
- Open the termial and type the following commands

	`$ sudo yum install wget unzip zip -y`

	`$ cd /var/tmp`

	`$ https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.zip`

	`$ unzip apache-maven-3.9.4-bin.zip`

	`$ mv apache-maven-3.9.4 /opt/`

	`$ cd /opt/`

	`$ cd `

	`$ vi .bash_profile`

- Press SHIFT + i and copy/paste the following lines;

	`export APACHE_MAVEN=/opt/apache-maven-3.9.4`

	`PATH=$HOME/bin:$APACHE_MAVEN/bin:$PATH`

	`export PATH`

	`$ source .bash_profile`

	`$ mvn --version`

#### Resources
[Maven vesion](https://maven.apache.org/download.cgi) or 
[Maven Installation steps](https://dyclassroom.com/reference-server/how-to-install-apache-maven-on-centos-server)

### 2c. VMware Workstation Player, VMware Fusion for Mac OS or Linux
You can install any of the aforementioned apps on your laptop or desktop computer if that is how you like to build your infrastructure. I choose to create the local infrastructure for this project using a [VMware ESXi](https://www.vmware.com/products/esxi-and-esx.html) host.
The main goal of this project is to become an expert at using vagrant to provision servers in the cloud with any Cloud service provider.

### 2d. Git Bash (Centos UTM)
- Open the termial and type the following command

	`$ sudo dnf install git`

- Verify Git installation:

	`$ git --version`

#### Create Git Repository
- Login to Github and create the repository
- Create a local repository with the same name as the git repository on your computer
- Go back to the terminal and create the .gitignore file

	`$ vi .gitignore`

- Add this `**/.DS_Store` to your .gitignore file, save and exit
- Run the commands below

	`$ echo "# devops_imran-telli" >> README.md`

	`$ git init`

	`$ git add README.md`

	`$ git commit -m "first commit"`

	`$ git branch -M main`

	`$ git remote add origin https://github.com/dowusubekoe-dev/devops_imran-telli.git`

	`$ git push -u origin main`

- …or push an existing repository from the command line
	`$ git remote add origin https://github.com/dowusubekoe-dev/devops_imran-telli.git`

	`$ git branch -M main`

	`$ git push -u origin main`

#### Resources
[Install Git using Apstream](https://idroot.us/install-git-centos-9-stream/)
[Install Git](https://unixcop.com/how-to-install-git-on-centos-9-stream-fedora/)

### 2e. Vagrant (Centos UTM)
- Go to [Vagrant](https://developer.hashicorp.com/vagrant/downloads) download page
- Right click on your desired operting system and copy the download link

	`$ sudo dnf install https://releases.hashicorp.com/vagrant/2.x.x/vagrant_2.x.x_x86_64.rpm`
OR
- Run the following commands to install Vagrant

	`$ sudo yum install -y yum-utils`

	`$ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo`

	`$ sudo yum -y install vagrant`

- **Vagrant Plugins (Centos UTM)**
- Open the termial and type the following command

	`$ vagrant plugin install vagrant-vmware-esxi`

- **VMware Utility (Centos UTM)**
- Open the termial and run command

	`$ sudo dnf install git`

	`$ cd /var/tmp/`

	`$ wget https://releases.hashicorp.com/vagrant-vmware-utility/1.0.22/vagrant-vmware-utility-1.0.22-1.x86_64.rpm`

	`$ cd `

	`$ sudo dnf install /var/tmp/vagrant-vmware-utility-1.0.22-1.x86_64.rpm`

#### Resources
[Vagrant Installation](https://developer.hashicorp.com/vagrant/downloads)
[VMware Utility](https://developer.hashicorp.com/vagrant/downloads/vmware)
[Vagrant VMware ESXi Plugin Configuration](https://github.com/josenk/vagrant-vmware-esxi)

### 2f. OVF Tool for VMware ESXi (Centos UTM)
The tool can be downloaded from [VMware](https://code.vmware.com/web/tool/4.3.0/ovf). A VMware account is needed to download the tool. You can also download [OVF Tool](https://github.com/rgl/ovftool-binaries) the binary files from this link.
#### Procedure
- Download the [VMware OVF Tool](https://github.com/rgl/ovftool-binaries) and copy it to your host under your home directory (or other location).
- Unzip the VMware OVF Tool. It should extract into a folder called **ovftool** in your directory.
- Launch the terminal
- Run the .bashrc file:

	`$ vi ~/.bashrc`
- Add the following line to your .bashrc file:

	`export PATH=$PATH:/usr/lib/vmware-ovftool/ovftool`
- Run the source command to update the shell with the new changes

	`$ source .bashrc`
- Verify the VMware OVF Tool is installed.

	`$ ovftool --version`

#### Resources
[Download OVF Tool Binaries](https://github.com/rgl/ovftool-binaries)
[How to install OVF Tool](https://docs.vmware.com/en/VMware-Telco-Cloud-Operations/1.4.0/deployment-guide-140/GUID-95301A42-F6F6-4BA9-B3A0-A86A268754B6.html)

### 2g. VSCode (Centos UTM)
Import Microsoft’s GPG Key

	`$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc`
Enable yum repository

	`$ sudo vim /etc/yum.repos.d/vstudio_code.repo`
Append the code below and save the created file.
[code]

	`name=Visual Studio Code`

	`baseurl=https://packages.microsoft.com/yumrepos/vscode`

	`enabled=1`

	`gpgcheck=1`

	`gpgkey=https://packages.microsoft.com/keys/microsoft.asc`

Install Visual Studio Code

	`$ sudo yum install code`

#### Resources
[Install VSCode](https://servonode.com/install-visual-studio-code-on-fedora-rhel-centos)

### 2h. Python (Centos UTM)
- Launch the [Python](https://www.python.org/downloads/) page

	`$ cd /var/tmp/`

	`$ wget https://www.python.org/ftp/python/3.x.x/Python-3.x.x.tgz`
- Then, extract the archive file using tar:

	`$ tar xvf Python-3.11.2.tgz`
- Next, switch to the source directory and run the configuration script:

	`$ cd /var/tmp/Python-3.x.x`

	`$ ./configure --enable-optimizations`
- Finally, build Python using the following command:

	`$ sudo make altinstall`
- After the installation process has finished, confirm the version using the following command:

	`$ python3.x --version`

#### Resources
[Python Download](https://www.python.org/downloads/)
[Install Python](https://idroot.us/install-python-centos-9-stream/)

### 2i. AWS CLI
- Open terminal and run the commands below

	`$ cd /var/tmp/`

	`$ wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip`

	`$ unzip awscliv2.zip`

	`$ cd /var/tmp/awscliv2`

	`$ sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin`

	`$ aws --version`
#### Resources
[AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

### Accounts & Sign Up
1. GitHub
2. GoDaddy domain purchase
3. DockerHub
4. SonarCloud

### AWS Account Setup
- Create a Free Tier account
- Setup IAM with 2MFA
- Set Billing Alarm
- Certificate Setup

## Phase 3: Setting up VMs Automatically
Vagrant is a tool for building and managing virtual machine environments in a single workflow. Vagrant enables the creation and configuration of lightweight, reproducible, and portable development environments.

The steps below outlines the basic steps in the Vagrant architecture:
- Check if the Vagrantfile is present.
- If the Vagrantfile is present, proceed to configure the VM settings.
- Initialize the Vagrant environment based on the Vagrantfile.
- Download the specified base box (operating system image) if not already present.
- Provision the virtual machine by running provisioners (scripts or configuration management tools).
- Start the virtual machine.
- Access the virtual machine using SSH, RDP, or other methods.

### Vagrant commands
There are several Vagrant commands which you can use to control your box.

Some of the important ones are:

	`vagrant up`: Bring a box online.

	`vagrant status`: Show current box status.

	`vagrant suspend`: Pause the current box.

	`vagrant resume`: Resume the current box.

	`vagrant halt`: Shutdown the current box.

	`vagrant destroy`: Destroy the current box. By running this command, you will lose any data stored on the box.

	`vagrant snapshot`: Take a snapshot of the current box.

#### Resources
[Vagrant Documentaion](https://developer.hashicorp.com/vagrant/tutorials/getting-started/getting-started-index)
