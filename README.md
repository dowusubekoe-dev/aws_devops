# devops_imran-teli
08/08/2023 09:23 Published

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

08/14/2023 8:39 Published

# System Prerequisite & Setup
Using straightforward language to help everyone grasp the procedures or activities, I described what DevOps is all about in my earlier piece.
The setup of the configuration or environment will be the following topic. In my 𝗚𝗶𝘁𝗛𝘂𝗯(https://lnkd.in/gt3QBJeA) account, I've made available all the tools and account creation instructions required to finish the [DevOps]() course by Imran Teli.

# Phase 1: VMware ESXi server Machine Specification
- ASRock LGA 1200 Intel H470 SATA 6Gb/s Micro ATX Intel Motherboard
- 4 CPUs x Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
- 32 GB RAM
- HDD1: 2TB SSD
- Non-SSD: 250GB x 3
- VMware ESXi 6.5 [Installation Guide](https://vcdx133.com/2017/03/06/vsphere-6-5-basics-part-1-esxi-install/)
- Configured with Static IP address

I chose to concentrate on using Linux and MacOS as my operating systems so that I could give all of my attention to my project. Having given it some thought, I decided on [𝗖𝗲𝗻𝘁𝗼𝘀-𝟵-𝗦𝘁𝗿𝗲𝗮𝗺](https://mirrors.centos.org/mirrorlist?path=/9-stream/BaseOS/x86_64/iso/CentOS-Stream-9-latest-x86_64-dvd1.iso&redirect=1&protocol=https).

I initially intended to use VirtualBox as the host virtual machine to install Centos-9-Stream as the guest operating system, but I changed my mind over disk space issues. Instead, I used [𝗨𝗧𝗠](https://mac.getutm.app) on my MacBook Pro to have Centos-9-Stream installed successfully.

# Phase 2: Centos 9 Stream installation on UTM Platform Specification

* Remember to run all the installation in this section with **sudo** *

#### Procedure
1. Click on the link [UTM](https://mac.getutm.app) to download  app.
2. Double click on the file to install, accept all the defaults to complete the installation.
3. Click on the **+** sign at the top to create a VM
4. Select Virtualize

![select virtualize](/img/pick-virtualize.png)

5. For operating system, choose Linux and click on `Browse`

6. Upload the downloaded Centos 7 iso and click on `Continue`

7. Set Memory to 4GB or 4096MB and CPU Cores should be 2. Hit `Continue`

8. Set the storage to 80GB (preferably) and hit `Continue`

9. Give a name to the VM and save all settings

10. Right click on the name of the VM and select Edit. Make the following changes;

	**System**
	- Architecture: x86_64
	- System: Standard PC (Q35 + ICH9, 2009)(alias of pc-q35-7.2)(q35)
	- CPU: Select the one that is similar to your laptop specification

	**Display**
	- Emulated Display Card: virtio-gpu-pci
	- Check off "Resize display to window size automatically

Find the Network Interface for Mac
`$ networksetup -listallhardwareports`

 -> About This Mac -> More Info... -> System Report...

`$ ioreg -r -n ARPT | grep IOName`

- Network - Bridged (Advanced) : This should be tied to the MacBook network interface (`en0`) and the Emulated Network Card of the ESXi server (`rtl8139`)


### Install JDK8 but I recommend JDK11 (Centos UTM)
- Open the termial and type the following commands

	`$ sudo yum -y install java-11-openjdk java-11-openjdk-devel`

	`$ java --version`

	`$ which java`

#### Resources
[JDK11 Installation](https://computingforgeeks.com/how-to-install-java-11-openjdk-11-on-rhel-8/)
	
### Maven (Centos UTM)
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

### VMware Workstation Player, VMware Fusion for Mac OS or Linux
You can install any of the aforementioned apps on your laptop or desktop computer if that is how you like to build your infrastructure. I choose to create the local infrastructure for this project using a [VMware ESXi](https://www.vmware.com/products/esxi-and-esx.html) host, hence the need to have an OVF file from VMware Player.
The main goal of this project is to become an expert at using vagrant to provision servers in the cloud with any Cloud service provider.

### Git Bash (Centos UTM)
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

### Vagrant (Centos UTM)
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

	`$ sudo wget https://raw.github.com/kura/vagrant-bash-completion/master/etc/bash_completion.d/vagrant -O /etc/bash_completion.d/vagrant`

	`$ source ~/.bashrc`

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

[Vagrant Autocomplete Install](https://github.com/kura/kura.gg/blob/main/content/pages/vagrant-bash-completion.rst#debian-ubuntu)

### OVF Tool for VMware ESXi (Centos UTM)
The tool can be downloaded from [VMware](https://code.vmware.com/web/tool/4.3.0/ovf). A VMware account is needed to download the tool. You can also download [OVF Tool](https://github.com/rgl/ovftool-binaries) the binary files from this link. I installed the version **4.3.0** because of the compatibility issues with vmware hardware versions 4 - 13.

#### Procedure
- Go to the browser by clicking on this link [VMware OVF Tool v4.3.0](https://developer.vmware.com/web/tool/4.3.0/ovf/)
- Download and navigate to the folder it was saved to
- Make the installation file executable by running this command

	`$ chmod +x VMware-ovftool-4.3.0-10104578-lin.x86_64.bundle`

- Execute the file using the command below

	`$ ./VMware-ovftool-4.3.0-10104578-lin.x86_64.bundle`

- Accept the End User License Agreement to continue.


#### Resources
[Download OVF Tool Binaries](https://github.com/rgl/ovftool-binaries)
[How to install OVF Tool](https://docs.vmware.com/en/VMware-Telco-Cloud-Operations/1.4.0/deployment-guide-140/GUID-95301A42-F6F6-4BA9-B3A0-A86A268754B6.html)

### VSCode (Centos UTM)
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

### Python (Centos UTM)
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

### AWS CLI
- Open terminal and run the commands below

	`$ cd /var/tmp/`

	`$ wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip`

	`$ unzip awscliv2.zip`

	`$ cd /var/tmp/awscliv2`

	`$ sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin`

	`$ aws --version`

#### Resources
[AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

### Install Open-VM-Tools
- Launch the terminal and run the following commands
	`$ yum install open-vm-tools`

- Reboot the server after finishing the installation


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

# Phase 3: Setting up VMs Automatically
Vagrant is a tool for building and managing virtual machine environments in a single workflow. Vagrant enables the creation and configuration of lightweight, reproducible, and portable development environments.

The steps below outlines the basic steps in the Vagrant architecture:
- Check if the Vagrantfile is present.
- If the Vagrantfile is present, proceed to configure the VM settings.
- Initialize the Vagrant environment based on the Vagrantfile.
- Download the specified base box (operating system image) if not already present.
- Provision the virtual machine by running provisioners (scripts or configuration management tools).
- Start the virtual machine.
- Access the virtual machine using SSH, RDP, or other methods.

### Installed and configured ESXi

![Installation of ESXi host completed](/img/esxi-details.png)

### Creating the First VM
- Create a directory with any of name of your choice. E.g **devops_projects** with a sub-directories of project names
- Visit the [Vagrant Cloud Boxes](https://app.vagrantup.com/boxes/search) and filter boxes according to hosted providers.
For this project, I focused on **vmware_desktop** and **vmware_workstation**.
- Navigate to the sub directory for your project and run
	`$ vagrant init <box name>`
In order for the Vagrantfile to work with VMware_ESXi, I found a github project by [Josenk](https://github.com/josenk/vagrant-vmware-esxi) that better explained the configurtions for VMware ESXi so I used it and made modifications. My customized [Vagrantfile](/Vagrantfile) can be found in the root of this repository.

### Vagrant commands
There are several Vagrant commands which you can use to control your box.

Some of the important ones are:

**`vagrant up`** : Brings a box online

**`vagrant status`** : Show current box status

**`vagrant suspend`** : Pause the current box

**`vagrant resume`** : Resume the current box

**`vagrant halt`** : Shutdown the current box

**`vagrant destroy`** : Destroy the current box. By running this command, you will lose any data stored on the box

**`vagrant snapshot`** : Take a snapshot of the current box

### Provisioned VM in ESXi host

![First provisioned VM](/img/esxi-host.png)

#### Resources
[Vagrant Documentaion](https://developer.hashicorp.com/vagrant/tutorials/getting-started/getting-started-index)

[Josenk VMware ESXi template](https://github.com/josenk/vagrant-vmware-esxi)

[Vagrant Cloud Boxes]( https://app.vagrantup.com/boxes/search)