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
   - **Name**: Enter a name for your virtual network.
   - **Region**: Select the region where you want to create the VNet.

3. **Configure IP Addresses:**
   - Go to the "IP Addresses" tab.
   - Define the **Address Space** (default is a /16 CIDR block, e.g., `10.0.0.0/16`).
   - Under **Subnets**, click `+ Add subnet` to create subnets for the VNet (e.g., a default subnet `10.0.2.0/24` (256 addresses)).
   -  Under **Subnets**, click `+ Add subnet` to create a private subnet for the VNet (e.g., a private subnet `10.0.3.0/24` (256 addresses)).

4. **Configure Security:**
   - Go to the "Security" tab to enable any specific security features.

5. **Review and Create:**
   - Click `Review + Create` to validate the configuration.
   - If validation passes, click `Create`.

6. **Deployment:**
   - Wait for the VNet deployment to finish. Once deployed, you can manage the VNet through the Azure Portal.

## 2. Creating a New SSH Key Pair for Azure Virtual Machines

### What is an SSH Key Pair?
An SSH key pair consists of a public and private key used to authenticate access to virtual machines securely.

### Steps to Create an SSH Key Pair (Using Linux/macOS or Windows PowerShell)

1. **Open a Terminal or PowerShell:**
   - On Linux/macOS, open the terminal.
   - On Windows, use PowerShell or the Windows Subsystem for Linux (WSL).

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
