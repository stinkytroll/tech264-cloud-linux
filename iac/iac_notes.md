# What is IaC?
Infrastructure as Code is the practice of managing and provisioning infrastructure through code instead of manual processes. It lets infrastructure be defined, deployed and updated using files the machine can read, such as config files or scripts.

## Benefits of IaC?
- **Automation and Consistenc**y: Automating the setup and deployment of infrastructure ensures consistent configurations across environments (development, staging, production).
- **Version Contro**l: Infrastructure configurations can be tracked, rolled back, or updated with version control systems like Git, similar to application code.
- **Scalability**: IaC allows for rapid scaling of infrastructure to meet increased demand.
- **Reduced Costs and Tim**e: Automated processes save time by eliminating the need for manual setup, which reduces operational overhead.
- **Disaster Recovery**: IaC enables quick and reliable infrastructure recovery through predefined templates.
- **Collaboration**: IaC allows teams to collaborate more effectively as infrastructure is treated like code, making it easy to share and review.

## When/where to use IaC
- **Cloud Infrastructure**: When deploying to cloud environments like AWS, Azure, or Google Cloud, IaC is useful to define and provision VMs, networks, storage, and more.
- **Development and Test Environments**: IaC is often used to quickly create identical development, testing, and production environments.
- **Continuous Deployment Pipelines**: IaC plays a critical role in continuous integration/continuous deployment (CI/CD) by automating the provisioning of environments and managing their lifecycle.

## What are the tools available for IaC?
- **Terraform**: A widely used open-source tool for building, changing, and versioning infrastructure across multiple cloud providers.
- **AWS CloudFormation**: AWS's native IaC tool for defining and provisioning AWS resources.
- **Azure Resource Manager (ARM) Templates**: Used to define and deploy Azure resources.
- **Pulumi**: A modern IaC tool that allows infrastructure to be written in general-purpose programming languages.
- **Ansible**: A configuration management tool that can also be used for IaC by managing both infrastructure provisioning and system configurations.
- **Chef/Puppet**: Configuration management tools that automate infrastructure setup, especially for managing large-scale deployments.

## What is configuration management (CM)?
It is the process of standardising and maintaining the configuration of systems and software across an organisation. It manages system state, software installations, patches and updates, ensuring consistency across environments - which helps to keep the system configurations up to date.

## What is provisioning of infrastructure? Do CM tools do it?
It is the process of setting up infrastructure components and making them ready to use. It can involve creating VMs, storage and network resources in a cloud environment or setting up hardware.

CM tools can manage infrastructure provisioning by integrating with APIs or virtualisation platforms. Their primary focus is on configuring and maintaining system states after the infrastructure is set up.

# What is Ansible and how does it work?
Ansible is an open-source automation tool used for configuration management, application deployment and task automation. It works by connecting to servers using SSH, using playbooks written to define tasks to be performed.

- **Inventory**: A list of target machines or nodes that Ansible manages, defined in a configuration file.
- **Playbooks**: YAML files that define the tasks Ansible will execute on the target nodes. Playbooks are declarative, meaning you define the desired state rather than step-by-step procedures.
- **Modules**: Reusable, self-contained scripts that perform specific actions (e.g., installing software, copying files, or managing users). Ansible has hundreds of modules for different tasks and platforms.
- **Idempotency**: Ansible ensures that tasks are idempotent, meaning they can be run multiple times without changing the system unless necessary.

## Who is using IaC and Ansible in the industry
Tech companies such as Google, Facebook, Netflix and Amazon all use IaC tools to manage their cloud infrastructure and application deployments. Banks, phone service providers, healthcare organisations and retail all use IaC for automation of processes. 