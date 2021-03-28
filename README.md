# Mikes-Cyber-Bootcamp
Cybersecurity Boot Camp


## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/mikecaldwell/Mikes-Cyber-Bootcamp/blob/main/Diagrams/NetworkDiagram.png "Network Diagram")

These files have been tested and used to generate a live ELK deployment and DVWA (D*mn Vulnerable Web Application) servers on Azure. They can be used to either recreate the entire deployment pictured above.
Alternatively, select portions of the YML playbook file may be used to install only certain pieces of it, such as Filebeat.

  - [elkplaybook1.yml](https://github.com/mikecaldwell/Mikes-Cyber-Bootcamp/blob/main/Ansible/elkplaybook1.yml) - ELK Server Installation
    - [filebeat-playbook.yml](https://github.com/mikecaldwell/Mikes-Cyber-Bootcamp/blob/main/Ansible/filebeat-playbook.yml) - Filebeat Installation
    - [metricbeat-playbook.yml](https://github.com/mikecaldwell/Mikes-Cyber-Bootcamp/blob/main/Ansible/metricbeat-playbook.yml) - Metricbeat Installation
  - [myplaybook1.yml](https://github.com/mikecaldwell/Mikes-Cyber-Bootcamp/blob/main/Ansible/myplaybook1.yml) - DVWA Server Installation

##### This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- A load balancer may aid in the security of the web servers by mitigating a Denial of Service (DoS) Attack by 'balancing' web traffic between servers the load balancer can access.
- A jump box works in a simular way a gateway router does. The jump box limits access to the servers like a gateway router, but it can also do all the server software maintenance.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics.
- Filebeat watches for changes in specified log files or locations. It then collects the data and forwards it to either Logstach or Elasticsearch to be indexed.
- Metricbeat collects metrics and statics and sends the data to programs such as Logstach or Elasticsearch.

The configuration details of each machine may be found below.

| Name       | Function       | IP Address | Operating System |
|------------|----------------|------------|------------------|
| Jump Box   | Gateway        | 10.0.0.4   | Linux            |
| Web-1      | Web Server     | 10.0.0.5   | Linux            |
| Web-2      | Web Server     | 10.0.0.6   | Linux            |
| ELK Server | ELK Log Server | 10.1.0.4   | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Personal (Home) IP address

Machines within the network can only be accessed by SSH.
- The Jump Box Provisioner is the only machine with to access the ELK VM. Its IP address is 10.0.0.4.

A summary of the access policies in place can be found in the table below.

| Name          | Publicly Accessible | Allowed IP Addresses                 |
|---------------|---------------------|--------------------------------------|
| Jump Box      | No                  | Personal (Home) IP Address           |
| Web-1         | No                  | 10.0.0.4                             |
| Web-2         | No                  | 10.0.0.4                             |
| Load Balancer | No                  | 10.0.0.4, Personal (Home) IP Address |
| ELK Server    | No                  | 10.0.0.4, Personal (Home) IP Address |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because automating configuration with Ansible has the benefit of being:
- Lightweight
- Can share resources
- Are specialized
- Are easily duplicated
- Prevelant and redundant

The playbook implements the following tasks:
- Installs Python3
- Installs the Docker Python module
- Increases virtual memory
- Downloads and launches a Docker web container
- Enables the Docker service

The following screenshots display the result of running `docker ps` and 'ansible-playbook' commands after successfully configuring the ELK instance.

![alt text](https://github.com/mikecaldwell/Mikes-Cyber-Bootcamp/blob/main/Images/docker_ps.png "docker_ps.png")
![alt text](https://github.com/mikecaldwell/Mikes-Cyber-Bootcamp/blob/main/Images/myplaybook1.png "myplaybook1.png")
![alt text](https://github.com/mikecaldwell/Mikes-Cyber-Bootcamp/blob/main/Images/elkplaybook1.png "elkplaybook1.png")


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.5
- Web-2 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- The Filebeat is used to collect log files from very specific files, such as those generated by Apache, Microsoft Azure tools, the Nginx web server, and MySQL databases.
- The Metricbeat is used to collect data about metrics and statistics from specific sources such as Redis and MySQL.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook (*.yml) file to /etc/ansible.
- Update the /etc/ansible/hosts file to include the IP addresses of the websevers to be used.
- Run the playbook, and navigate to http://[your.VM.IP]:5601/app/kibana to check that the installation worked as expected.
