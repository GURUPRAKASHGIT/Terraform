**Authentication and Configuration**

Configuration for the AWS Provider can be derived from several sources, which are applied in the following order:

Parameters in the provider configuration : Hard-coded credentials are not recommended in any Terraform configuration 
      and risks secret leakage should this file ever be committed to a public version control system.

Environment variables
Shared credentials files
Shared configuration files
Container credentials
Instance profile credentials and region


**Environment variables:**
You can provide your credentials via the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, environment variables, representing your AWS Access Key and AWS Secret Key, respectively. Note that setting your AWS credentials using either these (or legacy) environment variables will override the use of AWS_SHARED_CREDENTIALS_FILE and AWS_PROFILE. The AWS_DEFAULT_REGION and AWS_SESSION_TOKEN environment variables are also used, if applicable:

provider "aws" {}
**
Usage:

Linux:**

$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_DEFAULT_REGION="us-west-2"
$ terraform plan


**Windows:**

$ setx AWS_ACCESS_KEY_ID "anaccesskey"
$ setx AWS_SECRET_ACCESS_KEY "asecretkey"
$ setx AWS_DEFAULT_REGION "us-west-2"



**full documentation** : https://registry.terraform.io/providers/hashicorp/aws/latest/docs
