# 📊 Case Scenario: Azure VNet Peering for Global Enterprise Connectivity

## 🏢 Company Background:
Adele Ltd. is a multinational company with offices in NorthCentralUS, WestEurope, and SoutheastAsia. The company runs various business-critical applications in Azure across different 
regions to ensure high availability, performance, and compliance with local data regulations.

## 💼 Business Requirement:
Adele Ltd. wants to establish a secure and high-performance network communication between their Azure Virtual Networks (VNets) deployed in different regions. 
The primary goal is to enable resource sharing, centralized services (e.g., databases, Active Directory), and disaster recovery solutions without exposing traffic to the public internet.

## 🎯 Objectives:
- Enable seamless communication between different Azure VNets.
- Ensure low-latency and high-bandwidth connection.
- Avoid using public IPs or VPN Gateways for intra-Azure communication.
- Maintain segregation of workloads (e.g., Dev, Test, Prod environments).
- Facilitate hub-and-spoke architecture for centralized services (e.g., DNS, Firewall, Bastion Hosts).
- Follow least privilege and security best practices using Network Security Groups (NSGs) and route tables.


## 🔑 Solution: Azure VNet Peering Architecture
Adele Ltd. will set up VNet peering between the following networks:

### 1 Hub Network:

- Location: NorthCentralUS
- Resources: Azure Firewall, DNS, Bastion, Shared Services
- CIDR: 10.0.0.0/16
- Spoke Network 1 (Europe):

### 2 Location: WestEurope
- Resources: Application Servers, Databases
- CIDR: 10.1.0.0/16
- Spoke Network 2 (Asia):

### 3 Location: SoutheastAsia
- Resources: Backup, DR environment
- CIDR: 10.2.0.0/16

## 🔗 VNet Peering Design:

