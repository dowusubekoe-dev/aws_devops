## Ansible Infrastructure setup (AWS Services)
- Login to AWS account using the IAM credentials and launch and **EC2 instance**.
- Provide the name of the ansible machine **ansible_control**.
- Select the **Ubuntu** AMI and make sure it a **Free Tier** type and **Instant type** should be free tier as well.
- Create a **Key Pair** as **ansible_control** and select **.pem** as the extension
- Edit **Network** and provide a name for the **Security Group** as **ansible_control_sg** and the same for the **Description**.
- Up the **Inbound Security Group Rules** and add the following;

    | Type | Protocol | Port Range |
    |------|----------|------------|
    | SSH  | TCP      | 22         |

    | Source  | Name                           | Description |
    |---------|--------------------------------|-------------|
    | My IP   | *Add CIDR, prefix or security* | *optional*  |

- Leave the rest as default and click on **Launch instance**. 

## Ansible Infrastructure setup (Client)
- Login to AWS account using the IAM credentials and launch and **EC2 instance**.
- Provide the name of the ansible machine **dobprofile-web00** and increase the **Count** to **3**.
- Search for **Centos 9 Stream**  from AMI Market and make sure it a **Free Tier** type and **Instant type** should be free tier as well.
- Create a **Key Pair** as **client-key_ansible** and select **.pem** as the extension
- Edit **Network** and provide a name for the **Security Group** as **ansible_control_sg** and the same for the **Description**.
- Up the **Inbound Security Group Rules** and add the following;

    | Type | Protocol | Port Range |
    |------|----------|------------|
    | SSH  | TCP      | 22         |

    | Type        | Protocol | Port Range |
    |-------------|----------|------------|
    | Custom TCP  | TCP      | 22         |

    | Source  | Name                           | Description |
    |---------|--------------------------------|-------------|
    | Custom  | ansible_control_sg             | *optional*  |

- Leave the rest as default and click on **Launch instance**.
- Rename the 3 instances (**targets**) as follows;
    - **dobprofile-web01**
    - **dobprofile-web02**
    - **dobprofile-dbs01**

## Installing Ansible on Ubuntu
To configure the PPA on your system and install Ansible run these commands:

```sh
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo add-apt-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```
- Confirm that ansible is installed by running the command below in the terminal
    ```sh
        ansible --version
    ```