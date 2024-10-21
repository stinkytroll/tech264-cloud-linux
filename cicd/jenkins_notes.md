# What is a webhook?

a mechanism that allows external services or applications (such as GitHub, GitLab, Bitbucket, or any other tool) to trigger specific actions or workflows automatically in Jenkins.

## Webhook events you can trigger
**Push Event**: Trigger a build when code is pushed to a branch.

**Pull Request Event**: Trigger a build when a pull request is opened or updated.

**Tag Creation**: Trigger a build when a new tag is created in the repository.

**Branch Deletion**: Trigger a job when a branch is deleted (useful for cleanup tasks).

## Jenkins CI/CD Pipeline - 3 Jobs
![alt text](images/jenkin3jobdiagram.png)

### Jenkins 3 Jobs short explaination
1. **Developer** pushes code to the GitHub dev branch.
2. **Webhook**  triggers Jenkins when a change is made.
3. **Jenkins Job 1**: Tests the code in the dev branch.
4. **Jenkins Job 2**: Merges dev into main if tests are successful.
5. **Jenkins Job 3**: Deploys the code to the AWS EC2 instance.
- Throughout the process, **SSH authentication** is used for secure communication with **GitHub** and **EC2**.

# Jenkins Begins... Making a project
1. Select new item.
2. 
![alt text](images/welcometojen.png)

3. Enter a name for the project.

![alt text](images/itemname.png)

3. Select **Freestyle**. Click **Ok**.
4. Enable **Discard old builds** and set it to a max of **5**. This means that up to 5 build history are kept in the record at a time.

5. Let's add a build step.

![alt text](images/buildstep.png)

6. Select execute shell, and in the input type `uname -a`.

![alt text](images/exeshell.png)

7. Select build now on the right screen.

![alt text](images/buildnow.png)

8. Once the build is complete, click the **build** to get more details. You can select the build number or date and time.

![alt text](images/buildhis.png)

9.  Now select **Console Output** to see... the console output. It'll show the output from our `uname -a` command. It provides detailed information about the system's kernel and operating system.

![alt text](images/consoutput.png)

We've repeated the process and made a second one, instead inputting `date` into the **execute shell**. Now, let's link two projects together.

10. Go to the job you want to start with.
11. Go to **Configure**.

![alt text](images/jenkinsconfigure.png)

12. Scroll down to **Post-Build Actions**.
13. Select **projects to build**.
14. Input the name of the project you want to trigger after this first job has run successfully.

![alt text](images/postbuildact.png)

15. Click **save**.
16. Select **build now** and wait for the build to finish running.
17. Select the build under the history. You'll see it has run both, but you can only view the output for the second build if you're in that build's section.

![alt text](images/cosoutcombine.png)

You can select the hyper link to go straight the other project.

## Making Job 1 in Jenkins
1. Follow the previous steps for creation from **1 - 4.**
2. Enable Github Project.
3. Enter the **HTTPS link** for the **repository** you wish to link.

![alt text](images/githubprojurl.png)

### --> Source Code Management
1. select **Git** and enter your **SSH** repository link.
2. Add your credentials.
   1. For the **Kind** section, select **SSH Username with private key**.
   2. In **ID**, name it the same as the key.
   3. In description, write what the key is going to be used for.
   4. In the **Username** section, Ppaste the **ID** we just used.
   5. Under **Private Key**, Enable **Enter directly** and input your private key. 

*Note! The diagram below shows all steps excluding the **private key** insert, as it is **PRIVATE**. duh.*

![alt text](images/jenkinscreds.png)

1. Click **Add**.
2. Now, under the **credentials**, you can select the key you've added.

So far, the **Git** section should look like this:

![alt text](images/gitrepoinsert.png)

3. Below that, under **Branches to build**, change it to `*/main`. Later, this'll be `dev`.

### --> Build Environment
4. Enable **Provide node and npm bin/ folder to PATH** and specify **NodeJS version 20**. We do this so we can run nodejs and npm commands.
  
![alt text](images/providenodenpm.png)

### --> Build Steps
1. Add an **execute shell** build step, and insert the following commands:

```
cd app
npm install
npm test
```

![alt text](images/exeshell2.png)

2. Click save and you'll return to the job screen. 

### --> On the job screen...
1. Select **Build now** and await your evil machine's birth!!! You might have to do some waiting.
2. You can view the job by clicking the link to it under **build history**.
3. Click **Console Output** and you'll see it working in real time if it hasn't finished yet.

![alt text](images/consout2.png)

## Setting up the Webhook to trigger Job 1

1. Navigate to your GitHub repo's **settings**.
2. Click **Webhooks**.

![alt text](images/githubwebhook.png)

1. **Add** in the **IP** of your Jenkins server, adding `/github-webhook/` to the end of it.

![alt text](images/payloadurl.png)

4. Click **Add Webhook**. Done. It's that simple! Now, we need to get the Jenkins side set up.

### --> Back to the configure screen of Job 1
1. Find **Branches to build** and input `*/dev`. 
2. Check **GitHub hook trigger for GITScm polling**.

![alt text](images/buildtriggers.png)

### --> The GitBash window for the directory
1. Create dev branch using `git branch dev`.
2. Switch to the dev branch using `git switch dev`.
3. Make a change, then perform a `git push` to test the trigger. If this works, a build will activate on **Jenkins** and it will run the build.

## Setting up Job 2 - Merge Job
1. Create a new project, following previous steps such as providing **GitHub** repo links and selecting your **SSH** key. 
2. Add a build step, with the following commands inside:

```
# Switch the branch to the main (since we're working in the dev branch)
git switch main

# Merge the dev changes to the main branch
git merge origin/dev

# Push the changes from local main branch to the GitHub repo
git push origin main
```

1. Ensure you have **SSH Agent** enabled. It will need this for authentication.

![alt text](image.png)

4. Build the job and it will work!

## Setting up Job 3 - Deploy Job
1. Create a new project, following previous steps such as providing **GitHub** repo links and selecting your **SSH** key.
2. Enable **SSH Agent** under build environment as well.
3. Add a build step with the following commands inside:

```
# CD into the app folder
cd app 

# Install all listed dependencies
npm install 

# Runs the test scripts
npm test 

# Prints the current working directory
pwd 

# This command scans the SSH host key of the remote server and adds it to the known hosts file
ssh-keyscan -H AWSINSTANCEIP >> ~/.ssh/known_hosts 

# 
scp -i $SSH_KEY -r $(pwd) ubuntu@AWSINSTANCEIP:/home/ubuntu 

# 
ssh -i  $SSH_KEY ubuntu@AWSINSTANCEIP 'sudo rsync -a /home/ubuntu/app/ /repo/app/ && cd /repo/app && sudo -E pm2 start app.js' 
```
