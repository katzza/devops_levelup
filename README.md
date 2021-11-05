# devops_levelup

--------- 1 --------Terraform +  nginx ---------

1. Install terraform, add C:\terraform  to Path (environment variables -user variables -path), check with Powershell command terraform -help

2. Registration in AWS, download AWS cli 2.0

3. Use AWS console - IAM , add user with access key + AdministratorAccess, download secret keys (don't refresh page)

4. Cmd in terraform-directory,    aws configure, Default region name [None]: eu-west-3, Default output format [None]: json

5. Main.tf - code from lesson + aws_security_group + provisioner

6. Terraform init

7. Terraform plan

8. Terraform apply

9. Check aws console, go to http

10. Terraform destroy

-----------------------------------------------------------------