- [The basics of Azure](#the-basics-of-azure)
  - [Azure regions and availability zones: how they work and include up-to-date diagrams to help](#azure-regions-and-availability-zones-how-they-work-and-include-up-to-date-diagrams-to-help)
  - [How is Azure structured/organised?](#how-is-azure-structuredorganised)
  - [What types of services does Azure provide?](#what-types-of-services-does-azure-provide)
  - [Ways to access Azure?](#ways-to-access-azure)
  - [Explain the difference between Azure and Azure DevOps](#explain-the-difference-between-azure-and-azure-devops)
  - [Why use the Azure Pricing Calculator?](#why-use-the-azure-pricing-calculator)
- [Virtual Machine Network Diagram](#virtual-machine-network-diagram)
- [Steps to Create a Virtual Network and a New SSH Key Pair in Azure](#steps-to-create-a-virtual-network-and-a-new-ssh-key-pair-in-azure)
  - [1. Creating a Virtual Network (VNet) in Azure](#1-creating-a-virtual-network-vnet-in-azure)
    - [What is a Virtual Network (VNet)?](#what-is-a-virtual-network-vnet)
    - [Steps to Create a Virtual Network](#steps-to-create-a-virtual-network)
  - [2. Creating a New SSH Key Pair for Azure Virtual Machines](#2-creating-a-new-ssh-key-pair-for-azure-virtual-machines)
    - [What is an SSH Key Pair?](#what-is-an-ssh-key-pair)
    - [Steps to Create an SSH Key Pair (Using GitBash)](#steps-to-create-an-ssh-key-pair-using-gitbash)
- [Plan to create a Virtual Machine](#plan-to-create-a-virtual-machine)
- [How to Create a Virtual Machine (VM)](#how-to-create-a-virtual-machine-vm)
  - [--\> Basics](#---basics)
  - [--\> Disks](#---disks)
  - [--\> Networking](#---networking)
  - [--\> Tags](#---tags)
  - [--\> Review and Create](#---review-and-create)
- [How to Stop Your Virtual Machine](#how-to-stop-your-virtual-machine)
- [Connecting Your Virtual Machine](#connecting-your-virtual-machine)
- [How to add a port](#how-to-add-a-port)
- [The first two commands you run when you first start your VM](#the-first-two-commands-you-run-when-you-first-start-your-vm)
- [Deleting Your Virtual Machine](#deleting-your-virtual-machine)
- [SSH Security](#ssh-security)
- [Create an Image](#create-an-image)
- [Dashboard VM](#dashboard-vm)
- [How to counteract High CPU Load](#how-to-counteract-high-cpu-load)
- [Scaling a VM](#scaling-a-vm)
- [Architecture for an Azure VM Scale Set](#architecture-for-an-azure-vm-scale-set)
- [Creating a VM scale set](#creating-a-vm-scale-set)
  - [Basics --\>](#basics---)
  - [Disks --\>](#disks---)
  - [Networking --\>](#networking---)
  - [Health --\>](#health---)
  - [Advanced --\>](#advanced---)
  - [Tags --\>](#tags---)
  - [Review and Create --\>](#review-and-create---)
- [What is a load balancer and why is it needed?](#what-is-a-load-balancer-and-why-is-it-needed)
    - [Healthy Instance:](#healthy-instance)
    - [Unhealthy Instance:](#unhealthy-instance)
- [How to SSH into an instance](#how-to-ssh-into-an-instance)
- [Creating a dashboard](#creating-a-dashboard)
- [How did load testing and the dashboard combined help us?](#how-did-load-testing-and-the-dashboard-combined-help-us)
  - [Allows you to identify performance issues](#allows-you-to-identify-performance-issues)
  - [Monitoring Auto-Scale and Load Distribution](#monitoring-auto-scale-and-load-distribution)
  - [Ensures high availability](#ensures-high-availability)
- [Creating an unhealthy instance in my dashboard](#creating-an-unhealthy-instance-in-my-dashboard)
- [Creating an alert rule](#creating-an-alert-rule)
    - [Condition -- \>](#condition----)
    - [Actions --\>](#actions---)
    - [Details --\>](#details---)
    - [Notifications --\>](#notifications---)
    - [Tags --\>](#tags----1)
    - [Review and Create --\>](#review-and-create----1)

# The basics of Azure

## Azure regions and availability zones: how they work and include up-to-date diagrams to help

- **Regions**: Azure is divided into geographic **regions**, each containing one or more **data centers**. These **regions** are designed to provide** redundancy** and **high availability**, enabling **users** to choose a location closest to their users for optimal performance.
- **Availability Zones**: These are separate physical locations within a **region**, designed to be **isolated from failures** in other zones. Each zone has independent power, cooling, and networking, which increases resilience against outages.

![alt text](availabilityzonesvsregions.png)

## How is Azure structured/organised?
- **Resource Groups**: Logical containers for Azure resources (VMs, databases, etc.) to manage permissions and policies collectively.
- Subscriptions: Represents a billing entity; a user can have multiple subscriptions to manage costs and resources separately.
- **Management Groups**: Allows organization of multiple subscriptions for governance and management.

## What types of services does Azure provide?
**Compute**:
- Virtual Machines
- Azure Functions (serverless)
- App Services

**Storage**:
- Azure Blob Storage
- Azure File Storage
- Azure Queue Storage

**Networking**:
- Virtual Network
- Azure Load Balancer
- Azure VPN Gateway

**Databases**:
- Azure SQL Database
- Azure Cosmos DB
- Azure Database for PostgreSQL

**AI and Machine Learning**:
- Azure Machine Learning
- Cognitive Services

**DevOps**:
- Azure DevOps (including Repos, Pipelines, Boards)

**Security and Identity**:
- Azure Active Directory
- Azure Security Center

## Ways to access Azure?
- **Azure Portal**: A web-based interface for managing Azure services and resources.
- **Azure CLI**: A command-line tool for managing Azure resources from the terminal.
- **Azure PowerShell**: A set of cmdlets for managing Azure resources using PowerShell.
- **REST API**: For programmatic access to Azure services.
- **Azure SDKs**: Libraries for various programming languages to build applications that integrate with Azure.
## Explain the difference between Azure and Azure DevOps
**Azure**: A comprehensive cloud computing platform offering a wide range of services for building, deploying, and managing applications.

**Azure DevOps**: A suite of development tools and services designed for software development, including:
- Azure Repos (source control)
- Azure Pipelines (CI/CD)
- Azure Boards (project management)
## Why use the Azure Pricing Calculator?
The Azure Pricing Calculator helps users estimate the cost of using Azure services by:
- **Budgeting**: **Users** can input their expected usage to understand potential costs.
- **Comparing** Services: It allows **users** to compare the costs of different services and configurations.
- **Customization**: **Users** can tailor the calculator to their specific needs and scenarios, making it easier to plan and manage budgets.

# Virtual Machine Network Diagram

![alt text](vmdiagram.png)

**NSG Rule – Allow SSH**
Allows inbound SSH traffic (port 22) for remote management of the VM.

**Virtual Network (VNet)**
Provides secure communication between VMs and other resources, acting as a private cloud network.

**Subnet**
A segment within the VNet for organizing and isolating VMs that can communicate internally.

**Resource Group**
A container to manage and organize related Azure resources like VMs and storage.

**Disk**
Storage assigned to the VM, including the OS disk and optional data disks.

**Public IP**
Makes the VM accessible from the internet via SSH or HTTP.

**NSG Rule – Allow HTTP**
Allows inbound HTTP traffic (port 80) for web server access.
Region

The geographic location where the VM and resources are hosted.

**SSH Key**
A secure authentication method for connecting to the VM, without needing a password.

**Network Interface Controller (NIC)**
Connects the VM to the VNet for internal and external network communication.

**Virtual Machine (VM)**
The core component that runs your applications, simulating a physical computer.

**Network Security Group (NSG)**
A virtual firewall that controls inbound and outbound traffic to the VM with security rules.


# Steps to Create a Virtual Network and a New SSH Key Pair in Azure

## 1. Creating a Virtual Network (VNet) in Azure

### What is a Virtual Network (VNet)?
A Virtual Network (VNet) in Azure allows resources like virtual machines (VMs), databases, and applications to securely communicate with each other, the internet, and other networks.


### Steps to Create a Virtual Network

1. **Create the Virtual Network:**
   - Go to "Virtual Networks" in the Azure Portal.
   - Click `+ Create` at the top of the page.

2. **Configure Basic Settings:**
   - **Subscription**: Choose the correct subscription.
   - **Resource Group**: Select the resource group you created earlier.
   - **Name**: Enter a name for your virtual network. (e.g tech264-..)
   - **Region**: Select UK South.

3. **Configure IP Addresses:**
   - Go to the "IP Addresses" tab.
   - Define the **Address Space** (default is a /16 CIDR block, e.g., `10.0.0.0/16`).
   - Under **Subnets**, click `+ Add subnet` to create subnets for the VNet (e.g., a default subnet `10.0.2.0/24` (256 addresses)).
   -  Under **Subnets**, click `+ Add subnet` to create a private subnet for the VNet (e.g., a private subnet `10.0.3.0/24` (256 addresses)).

4. **Configure Security:**
   - Go to the "Security" tab to enable any specific security features (We do not need to write anything in our case).

5. ***Tags:**
   - Name : Owner
   - Value : Your name

6. **Review and Create:**
   - Click `Review + Create` to validate the configuration.
   - If validation passes, click `Create`.

7. **Deployment:**
   - Wait for the VNet deployment to finish. Once deployed, you can manage the VNet through the Azure Portal.
  
![alt text](subsetdiagram.png)

## 2. Creating a New SSH Key Pair for Azure Virtual Machines

### What is an SSH Key Pair?
An SSH key pair consists of a public and private key used to authenticate access to virtual machines securely.

### Steps to Create an SSH Key Pair (Using GitBash)

1. **Open a Terminal:**
   1. Open GitBash
   2. Go to home directory using `cd`.
   3. Use `mkdir .ssh` to create a directory for SSH keys (Once done, doesn't need to be done again) when you're in your home directory. If it already exists, you can, `cd -ssh` into it.

2. **Generate SSH Key Pair:**
   Use the following command to generate an SSH key pair:

   ```
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

`-t rsa`: Specifies the type of key to create (RSA).

`-b 4096`: Sets the key size to 4096 bits.

`-C`: Adds a comment (optional) to identify the key, often your email address.


3. **Save the SSH Key Pair:**
 - After running the command, you’ll be prompted to specify a location to save the key. Press Enter to save it in the default location.
 - You can choose to add a passphrase for extra security or leave it blank.

4. **View the SSH Public Key:**

To view and copy the public key, run:

```
cat ~/.ssh/example_key_name.pub
```

You can then paste this into your SSH key.

# Plan to create a Virtual Machine
- Virtual Network + Subnet
- Name
- Location, effects pricing
- Size, effects pricing
- Storage, effects pricing
- Operating system, could effect pricing
- SSH key pair

# How to Create a Virtual Machine (VM)

## --> Basics
1. **Search** for Virtual Machine on the Azure Portal. Create a new VM.
2. **Assign** resource group `(tech264)`.
3. **Name** the VM (e.g tech264-name...)
4. Set **region** to `(Europe) UK South`.
5. Change **availability** to "No infrastructure redudancy required".
6. Change **image** to the OS we want on the disc (Also includes flavour and version of the OS, with stuff installed and ready to run - Basically a snapshot of a system). In our case, select `Ubuntu Pro 22.04 - x64 Gen2`. If it is not visible in the immediate recent, click "See all images" and search for it.
7. Change **security type** to standard. 
8. Change **size** to `Standard_Bs1 - 1 vcpu, 1 GiB memory`. Select "see all sizes" if not seen in immediate recent.
9. Change **username** to to something more secure.
10. Change SSH public key source to `Use existing key stored in Azure`.
11. Select **your** Stored key (e.g tech264..).
12. Select `HTTP (80)` under **select inbound ports**. Both `SHH (22)` and `HTTP (80)` should be selected. You need to set up a certificate to use `HHTPS (443)`.

## --> Disks
1. Change OS Disk type to `Standard SSD (locally redundant storage)`.

## --> Networking
1. Change the **virtual network** to your own one, as it will default alphabetically.
2. Change **subnet** to `public-subnet`.
3. Enable **Delete public IP and NIC when VM is deleted**. Automates this just in case you forget to do it yourself.

## --> Tags
1. Select `Owner : (your name)`.

## --> Review and Create
1. Make sure all your details are correct.
2. Once you click create, it will deploy until completion. 

# How to Stop Your Virtual Machine
1. Go to your **resource**.
2. **Status** should read as "Running". 
3. Click "Stop".
4. It will give you a warning, select "yes". The virtual machine will begin stopping. 

# Connecting Your Virtual Machine
1. **Start** your virtual machine.
2. Navigate to "Connect" under your VM.
3. Find "Native SSH" and **select** it. A side panel should open. 
4. Input `~/.ssh/` and your `private key name` into the "Copy and Execute SSH Command" line. This will output a command for us to use in our CL (We are using **GitBash**).
5. Click the copy button for the code below what was just inputted.
6. Paste this code into your **GitBash**.
7. A **warning** will appear once entered into your **GitBash**. Respond with `yes` and then it will permanently save the IP address, meaning we will not be given the warning again.
8. You can type `exit` to **logout** of the Virtual Machine. 

# How to add a port
1. Navigate to your VM's **network settings**.
2. Open up **Settings** and click **inbound security rules**.
3. Change the **destination port** to `3000`.
4. Change protocol to **TCP**.
5. Change the priority. The **lower** the priority, the **higher** the priority. 

# The first two commands you run when you first start your VM
1. `sudo apt update -y`
2. `sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y`

# Deleting Your Virtual Machine
1. Navigate to overview.
2. Find your resource group.
3. Filter your name. You will see multiple items appear.
4. Tick `resourcegroupname-name-vmname`
5. Tick `resourcegroupname-vmname-ip`
6. Tick `resourcegroupname-vmname-nsg`
7. Tick `resourcegroupname-name-networkinterface`
8. Tick `resourcegroupname-name-Disk`
9. Locate **delete**. **AVOID** clicking **delete** for the **resource group**.
10. Tick "Apply force delete" just to be safe.
11. Enter "delete" in the input box and click **delete**.
12. Select **delete** once more to confirm **deletion**.

We leave the Virtual Network and SSH Key as they can be reused.

# SSH Security
Even though only you have your SSH key, people can still attempt to access your VM. Keeping your VM secure is important to prevent data breaches and other security issues. 

1. Navigate to **Network Settings**.
2. Locate **Inbound security rules** under **Settings**.
3. Find your SSH rule and change **Source** from **Any** to your own IP address 
to stop people from trying to access your VM.

However, when you turn off the VM, the IP will change. 

If we're not SSHing into it for a long time, we could...

1. Change access for **SSH** to **Deny**. This means NO ONE can get access.

# Create an Image

1. Select **Capture Image** on the VM of choice's **Overview**.
2. Under **Instance details**, Select **No, capture only a managed image**. 
3. Enable **Automatically delete this virtual machine after creating the image**.
4. Name image appropriately.
5. Run `sudo waagent -deprovision+user` inside our DB SSH to remove delete information we no longer need, then return to Azure window.
6. Add tags.
7. Review, then create.

# Dashboard VM
1. In the VM -> Overview-> scroll down to where is:
2. Properties--Monitoring--Capabilities--Recommendations--Tutorials
3. Select Monitoring
4. In the monitoring window -> Platform metrics -> pin the metrics that we need(e.g. CPU, Disk bytes)
5. Click pin-> create new-> type(private/pubic) -> Dashboard name-> Pin

# How to counteract High CPU Load
![alt text](image-1.png)

# Scaling a VM
![alt text](image.png)

# Architecture for an Azure VM Scale Set
![alt text](image-2.png)

# Creating a VM scale set
A scale set lets you create and manage a group of load balanced VMs. 

## Basics -->
1. Search "scale set" in the top search bar and click **virtual machine scale set**.
2. **Assign** resource group `(tech264)`.
3. **Name** the VM (e.g tech264-name...)
4. Set **region** to `(Europe) UK South`.
5. Select all 3 availability zones.
6. Under **orchestration mode**, select `uniform`.
7. Set the security type to `standard`.
8. For **scaling**, select `autoscaling`. A window will appear below it - click **configure**.
9. Select the pencil for the default condition to edit it.
10. Input **3** for the maximum instances / VMs.
11. Input **75** for the CPU threshold greater than. 
12. Select **Save**.
13. Once returned to the basics page, select "see all images".
14. Select "my images" and search for your image - then **select**.
9. Change **username** to something more secure.
10. Change SSH public key source to `Use existing key stored in Azure`.
11. Select **your** Stored key (e.g tech264..).

## Disks -->
1. Change OS Disk type to `Standard SSD (locally redundant storage)`.

## Networking -->
1. For the **Virtual network**, Select your subnet.
2. Edit your **Network Interface**.
3. Select allow selected ports, then enable `SSH(22)` and `HTTP(80)`.
4. Ensure public IP address is **disabled** as the load balancer will handle this now.
5. Apply those changes and you will be returned to the Networking screen.
6. Select **Create a load balancer**.
7. Change the name to your naming conventions with al "lb" on the end of it, to label it as a **load balancer**. 
8. Select **Create**. This will take up the "Select load balancer" slot.

## Health -->
1. **Tick** the box labelled "Enable application health monitoring". 
2. **Tick** the box labelled "Automatic repairs".

## Advanced -->
1. **Tick** the box "Enable user data" to allow an input and insert:
```bash
#!/bin/bash

echo "Change directory to app"
cd repo/app
echo "In app directory"

# Stop all existing pm2 processes
pm2 stop all

echo "start"
pm2 start app.js
echo "App started with pm2
```

## Tags -->
1. Select owner and your name.

## Review and Create -->
1. **Ensure** you've selected the correct options.
2. **Create** your shiny new VM scale set.

# What is a load balancer and why is it needed?

A load balancer is a system or device that distributes incoming network traffic across multiple servers (or other resources), ensuring no single server is overwhelmed. It acts as a "traffic manager," distributing client requests efficiently to multiple backend servers, also known as a server pool or server farm.

How to create an unhealthy instance (for testing) and why it is marked as healthy/unhealthy

To create an unhealthy instance for testing in a load-balanced environment, you simulate conditions where a server fails to meet the health check criteria set by the load balancer. We could:
`sudo systemctl stop nginx` : Stop nginx from running.
`sudo ufw deny 80/tcp` : Block the port with a firewall rule.

### Healthy Instance:

The instance is considered healthy if it responds to the health check with expected results. This typically includes:
- HTTP response code 200 (OK) from the health check URL.
- Successful connection to the specified TCP/UDP port.
- Expected output from a script.
- Healthy instances are included in the load balancer’s pool and continue to receive traffic.

### Unhealthy Instance:

The instance is marked unhealthy if:
- It doesn’t respond to the health check within the defined timeout period.
- It returns an HTTP status code like 500 (Internal Server Error) or doesn’t return a 200 OK.
- The port being checked is not reachable.
- It fails custom health check criteria (e.g., a failed database connection or insufficient resources).
- Unhealthy instances are excluded from the load balancer’s pool until they pass the health checks again.

# How to SSH into an instance

As you would normally grab the IP, you would need to find the public IP. As well as that, since the instance is now managed by a load balancer, the IP is different. 
Once we have the IP, we also need to use `-p` to label a port input for our SSH command, followed by the instance port number. This ranges between 50000 and 50002.

# Creating a dashboard
1. Navigate to **Dashboard Hub**.
2. Click **Create**.
3. Then on the **Tile Gallery**, select what you would like to see. 
4. You can also navigate to a resource, select **Monitoring** and pin data of your choosing.

# How did load testing and the dashboard combined help us?

## Allows you to identify performance issues
Load testing simulates high traffic to the application, meaning you can identify high CPU or memory usage easily.

## Monitoring Auto-Scale and Load Distribution
Azure provides auto-scaling services that spin up more instances when a load increases. The dashboard allows you to visualise load distrubition and track scaling events.

## Ensures high availability
Load testing helps ensure that the appliation remains available even under heavy load. We can use the dashboard's alerts to send alerts when certain thresholds are met.

# Creating an unhealthy instance in my dashboard

Navigate to your operating system tab under your scale set. Edit user data and commit out the `sudo pm2 start app.js` line. Then, delete one of the instances and when it remakes one, it will do so with the new user data - creating an unhealthy, unworking instance.
![alt text](image-3.png)

# Creating an alert rule
1. Select the VM you wish to add an alert to and navigate to **Monitoring**.
2. under "Alerts", you will ee a pop up to **enable** or **creatre alert rule**. Select **creatre alert rule**.

### Condition -- >
1. For **Signal name**, select **Percentage CPU**.
2. Change the **Threshold** to your desired amount: **75**% in our case. 

### Actions -->
1. Select **Create action group**.
2. Select **tech264** as the resource group. 
3. Name the action group appropriately.

### Details -->
1. Set the severity.
2. Add a rule name.

### Notifications -->
1. For **notification type**, select **Email/SMS/message/Push/Voice**.
2. Name it appropriately.
3. Select the pencil to edit details.
4. Enable **email**, and input your desired email.

### Tags -->
1. Select owner and your name.

### Review and Create -->
1. **Ensure** you've selected the correct options.
2. **Create** your shiny new VM scale set.