# What is blob?
A Blob (Binary Large Object) is a storage object used to store large amounts of unstructured data. It is optimized for storing this unstructured data, meaning data that doesn't follow a specific format like a table or database entry.

# LRS
LRS stands for **Locally Redundant Storage**. It is one of the data redundancy options available for Storage. LRS ensures that your data is replicated three times within a single physical location (data center) in the same Azure region.

# Downloading and logging into Azure CLI

1. Insert `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash` while SSH'd into your VM. This will **download** CLI.
2. Insert `az login`. It will ask you to go to a link and **sign in** via a web browser, giving it the **code** to authenticate. The **code** will be in this same yellow line as the link.
3. **Insert** the code on the browser input and select your account. 
4. Once signed in, close the window and **return** to your VM console.
5. **Enter** the number for the subscription you wish to use.
6. Insert `az group list`. This prints out some data regarding the current resource group you reside in.
7. Insert `az storage account create --name tech264(name)storage --resource-group tech264 --location uksouth --sku Standard_LRS` to create a storage account. This will print out all the details in JSON format when successful.
8. Insert `az storage account list --resource-group tech264 --query "[].{Name:name, Location:location, Kind:kind}" --output table` to see it all in table format for readability.
9. Insert the following to create a storage container:
```
az storage container create \
    --account-name tech264(name)storage \
    --name testcontainer
```
The `\` can be used to break up commands to have it be multiple lines for readability. 

*You may see a yellow line warning, but fear not! It will create the container anyway. We could add `--auth-mode login` to the end of the command to prevent this!*

10. We can double check that we've made it by listing the containers in the storage account using:
```
az storage container list \
    --account-name tech264(name)storage \
    --output table \
    --auth-mode login
```

11. Insert to upload the test.txt file:
```
az storage blob upload \
    --account-name tech264(name)storage \
    --container-name containername \
    --name filename \
    --file file.type \
    --auth-mode login
```

12. List the blob to make sure it has uploaded:
```
az storage blob list \
    --account-name tech264(name)storage \
    --container-name containername \
    --output table \
    --auth-mode login
```

13.  Back on **Azure** in the **resource group**, locate your **blob storage** (not the VM).
14.  Under **data storage**, go to **containers**.
15.  Go to **settings** and click **configuration**.
16.  Enable "allow blob anonymous access" and click **save**.
17.  Go back to the container and select **change access level**.
18.  Change it from **Private** to **Blob**.
19.  Now, you'll be able to get the URL and view the file.

# Adding images to the sparta app

1. Create the app VM using the app image.
2. Download Azure CLI.
3. Create your container, following the steps to do so.
4. And download the cat image using the `wget` command. 
5. Use the `az upload` command to upload the image into the container. 
6. Make Blob public in the configuration settings.
7. Add the URL for the Blob in the HTML script under the `/repo/app/views/index.ejs` and edit the `img` line, replacing the sparta app with the link from the configuration settings.
8. Refresh page and see your lovely cat.