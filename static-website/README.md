# static-website
This project automates the deployment of a static website on AWS using Terraform. It sets up the necessary infrastructure components such as an S3 bucket for storing website content, CloudFront for content delivery, configuring Cloudflare as a DNS service, and CodePipeline for continuous integration and continuous deployment (CI/CD) from this GitHub repository.

## AWS Services Used
### S3 
I chose to use S3 (Simple Storage Service) to host the the static website for the following reasons.

1. S3 can handle any amount of traffic and data so the website can scale without issues.
2. S3 provides the 11 9's of durability.
3. S3 is cost effective and you only pay for what you use.

> **Note:** For this project I did not enable the static web-hosting option for S3. Instead I configured CloudFront using OAC (Origin Access Control) to provide a level of security that only allows CloudFront to access the web files hosted on S3. 

### CloudFront

CloudFront was used to reduce latency and improve load times of the website via cached content in edge locations. It also provides cost savings as it reduces data transfer costs by compressing files. CloudFront also offers DDoS protection increasing security against such attacks. Furthermore, it provides the ability to redirect HTTP to HTTPS increasing security through data integrity, confidentiality, and authentication using SSL/TLS certificates.

### AWS Certificate Manager
This service provides the generation of 