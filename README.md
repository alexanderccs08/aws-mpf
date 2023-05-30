# aws-mpf

## Management AWS CLI - Profiles

Let's imagine you have a few AWS customer accounts to manage. In this scenario, the AWS CLI tool can help you with this purpose.

In order to facilitate this access to multiple AWS accounts via CLI, AWS itself allows you to configure profiles for access. With profiles configured, your credentials are already linked to these profiles.

You can also access another AWS account, just change the profile that is currently being used.
Access will be governed by the permissions that will be assigned to these profiles in each of these AWS accounts.

This my first project to support some admin to manage your
AWS account by using script shell.

This script has some features such as:
* List the profiles
* Add a new credential
* Set up a profile

After choosing a profile, you can exit the script and run the aws cli commands to manage your resources on AWS.

Look at some examples:

1. Command to start an EC2 instance created on AWS passing its ID as a parameter:

`aws ec2 start-instances --instance-ids i-1348636c`

2. Command to copy all contents of a local folder to an S3 bucket:

`aws s3 cp myfolder s3://mybucket/myfolder --recursive`

Of course, you need to know what resources have been provisioned for that profile type.

Consult the [AWS CLI documentation](https://docs.aws.amazon.com/cli/index.html) for more details.

To add a new credential, you need to get some security information from the AWS console.

These information are:

**AWS_ACCESS_KEY_ID**
**AWS_SECRET_ACCESS_KEY**

### **Set up your environment**

Finally, you can add this script like a command, just edit `.bashrc` file current user, using alias method.

`vim /home/youruser/.bashrc`
or
`vim ~/.bashrc`

In the end of this file, add:
`alias amp='path where is your python script'`

You can choose your own alias, like 'alias abc=...' 

`alias awsp='source /home/alexander/scripts/aws/awsmp.sh'`

For more details about CLI configure files, [click here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

