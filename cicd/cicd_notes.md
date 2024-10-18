- [What is CI/ CD?](#what-is-ci-cd)
    - [Benefits of CI](#benefits-of-ci)
    - [Benefits of CD](#benefits-of-cd)
  - [Difference between CD and CDE (Continous Deployment)](#difference-between-cd-and-cde-continous-deployment)
- [What is Jenkins?](#what-is-jenkins)
  - [Why use Jenkins? Benefits of using Jenkins? Disadvantages?](#why-use-jenkins-benefits-of-using-jenkins-disadvantages)
    - [Benefits](#benefits)
    - [Disadvantages](#disadvantages)
  - [Stages of Jenkins](#stages-of-jenkins)
  - [What alternatives are there for Jenkins](#what-alternatives-are-there-for-jenkins)
- [Why build a pipeline? Business value?](#why-build-a-pipeline-business-value)
- [Diagram of CI/CD](#diagram-of-cicd)
- [Understand SDLC workflow: plan, design, develop, deploy](#understand-sdlc-workflow-plan-design-develop-deploy)
- [Jenkins Begins](#jenkins-begins)

# What is CI/ CD?

**CI**, or **Continous Integration**, refers to the practice of automating the integration of code changes from multiple contributors into a shared repository several times a day.

### Benefits of CI
- Early bug detection
- Reduced merge conflicts
- Automated testing
- Faster dev cycles

**CD**, or **Continous Development**, refers to the process of automatically delivering integrated code changes to testing, staging, and production environments after passing all relevant testing.

### Benefits of CD
- Faster, realiable releases
- Reduce manual errors
- Improve quality
- Increase developer productivity

## Difference between CD and CDE (Continous Deployment)
**CD** focuses on ensuring the app is always in a deployable state, where code can be automatically deployed to a staging environemnt but may require manual approval before going live, whereas **CDE** is about automating the process of releasing the code into production without requiring any manual approval after tests have passed.

# What is Jenkins?
Jenkins is an open-source automation tool used for CI/CD. It allows you to automate the building, testing, and deployment of applications by creating pipelines that automate repetitive tasks.

## Why use Jenkins? Benefits of using Jenkins? Disadvantages?
Jenkins ability to automate the CI/CD pipeline helps to reduce human error by automating repetitive tasks. 

### Benefits
- Extensible, with lots of plugins
- Open-source and supported by a large community
- Very scalable

### Disadvantages
- Learning curve
- Maintenance overhead, requiring updates and monitoring

## Stages of Jenkins
1. **Build**: Code is compiled or built.
2. **Test**: Automated tests are run to validate the code.
3. **Deploy**: Code is deployed to staging or production environments.
4. **Monitor**: Post-deployment, monitoring and feedback stages ensure the health of the deployed application.

## What alternatives are there for Jenkins
- GitLab CI/CD
- Azure DevOps
- Travis CL
- Team City (JetBrains)

# Why build a pipeline? Business value?
- **Increased efficiency**: Automation reduces the time spent on repetitive tasks like testing and deployment.
- **Faster time-to-market**: CI/CD pipelines enable faster, more reliable software releases, meeting market demands quickly.
- **Better quality assurance**: Automation in testing ensures higher product quality with fewer defects.
- **Consistency**: Pipelines standardize processes, ensuring consistent deployments and fewer production issues.
- **Improved developer experience**: Developers can focus on building features rather than manual integrations or deployments.

# Diagram of CI/CD
![alt text](images/image.png)

# Understand SDLC workflow: plan, design, develop, deploy
Software development lifecycle process. 

1. **Plan**: Define the project goals, scope, and requirements. This includes gathering information from stakeholders to set clear objectives.
2. **Design**: Architect the solution, including software design, user interfaces, and database schemas.
3. **Develop**: The actual coding phase where developers implement the required features.
3. **Deploy**: The process of releasing the code into production, making it available to users.

# Jenkins Begins
1. Select new item.
![alt text](images/image.png)

2. Enter a name for the project.

![alt text](images/image-1.png)

3. Select **Freestyle**. Click **Ok**.
4. Enable **Discard old builds** and set it to a max of **5**. This means that up to 5 build history are kept in the record at a time.

5. Let's add a build step.

![alt text](images/image-2.png)

6. Select execute shell, and in the input type `uname -a`.

![alt text](images/image-7.png)

7. Select build now on the right screen.

![alt text](images/image-4.png)

8. Once the build is complete, click the **build** to get more details. You can select the build number or date and time.

![alt text](images/image-6.png)

9.  Now select **Console Output** to see... the console output. It'll show the output from our `uname -a` command. It provides detailed information about the system's kernel and operating system.

![alt text](images/image-5.png)

We've repeated the process and made a second one, instead inputting `date` into the **execute shell**. Now, let's link two projects together.

1. Go to the job you want to start with.
2. Go to **Configureation**

![alt text](image.png)

3. Scroll down to **Post-Build Actions**.
4. Select **projects to build**.
5. Input the name of the project you want to trigger after this first job has run successfully.

![alt text](image-1.png)

6. Click **save**.
7. Select **build now** and wait for the build to finish running.
8. Select the build under the history. You'll see it has run both, but you can only view the output for the second build if you're in that build's section.

![alt text](image-2.png)

You can select the hyper link to go straight the other project.

