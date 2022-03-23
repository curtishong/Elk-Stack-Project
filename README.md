## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Filepath to diagram](https://github.com/curtishong/Elk-Stack-Project/blob/main/Diagrams/Virtual%20Network.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.
  
  [ELK Install](https://github.com/curtishong/Elk-Stack-Project/blob/6e91b69737b5abf007f83c40c54deb5276923b2f/Scripts/Anisible/ELK/elk.yml)
  [DVWA](https://github.com/curtishong/Elk-Stack-Project/blob/6e91b69737b5abf007f83c40c54deb5276923b2f/Scripts/Anisible/DVWA/pentest.yml)
  [Filebeat](https://github.com/curtishong/Elk-Stack-Project/blob/29a3c34a4b2dc4819ede0620547c623d4efebe62/Scripts/Anisible/Filebeat/filebeat-playbook.yml)
  [MetricBeat](https://github.com/curtishong/Elk-Stack-Project/blob/6e91b69737b5abf007f83c40c54deb5276923b2f/Scripts/Anisible/Metricbeat/metricbeat-playbook.yml)
  
This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available , in addition to restricting access to the network.

Load balancers ensures that work to process incoming traffic will be shared by both vulnerable web servers. The advantages of a jump box is to serve as a gateway to manage acess into a remote network. A majority of the time the primary mode of entry is by ssh, secure shell, and without the key, access is denied.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.

Filebeat's main priority is to monitors log files and locations that you specify.
Metricbeat records the metrics and system resources usage for display in Elasticsearch.

The configuration details of each machine may be found below.


| Name      | Function            | IP Address | Operating System     |
|-----------|---------------------|------------|----------------------|
| Jump Box  | Gateway             | 10.0.0.4   | Linux (Ubuntu 18.04) |
| Web 1     | Web Server          | 10.0.0.5   | Linux (Ubuntu 18.04) |
| Web 2     | Web Server          | 10.0.0.6   | Linux (Ubuntu 18.04) |
| ELK       | ElasticSearch Stack | 10.1.0.4   | Linux (Ubuntu 18.04) |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

172.115.165.9

Machines within the network can only be accessed by JumpBox.

The JumpBox machine has access to the ELK VM. The IP address of the JumpBox VM is 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name    | Publicly Accessible | Allowed IP Addresses |
|---------|---------------------|----------------------|
| JumpBox | SSH -22- Yes        | 172.115.165.9        |
| Web 1   | No                  |                      |
| Web 2   | No                  |                      |
| ELK     | Kibana -5601- Yes   | *                    |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

It allows users for full automation to a specifc server and reduces configuration errors if we were to perform them manually. This allows the same ruleset for each configuration, automation of code. 

The playbook implements the following tasks:

. Installing Docker: This installs the core docker code to the remote servers.

. Install Python3_pip: Pip is an installation module that allows for additional docker modules to be installed easier
. Increasing Memory/Use More Memory: This allows the ELK Docker image to allow the server to lauch since the ELK Docker image tends to have too little memory.
. Download and Lauch ELK Container: This downloads the ELK docker container and initializes it with the specified ports being published.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker PS](https://github.com/curtishong/Elk-Stack-Project/blob/e521e26667d7c6a95d7c81cd56d4f696ac6b60fc/Scripts/Anisible/Images/Docker%20PS.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

The ELK Server monitors the following IPs:

10.0.0.5

10.0.0.6

We have installed the following Beats on these machines:

We successfully installed Filebeat and Metricbeat on the Web 1 and Web 2.

These Beats allow us to collect the following information from each machine:

Filebeat collects system type events like login to see who is trying to login into our systems. Metricbeats record the metrics and statistics from the operation system. This allows us to look at what services are running on that server and also how much CPU or RAM at any time. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the [ELK Install](https://github.com/curtishong/Elk-Stack-Project/blob/7afe1326459a308aa9ca5c9aaf76f29ea229b897/Scripts/Anisible/ELK/elk.yml)
- Update the hosts [Hosts](https://github.com/curtishong/Elk-Stack-Project/blob/6e91b69737b5abf007f83c40c54deb5276923b2f/Scripts/Anisible/ELK/hosts) file to include our IP and change the ansible_python_interpreter=/usr/bin/python3. 
- Run the playbook, and navigate to http://[your_elk_server]:5601/app/kibana to check that the installation worked as expected.
