# Create a scaleway project

Scaleway projects are a way to organize and isolate resources in your scaleway
account. We're going to create a dedicated project for your class, so you'll be
able to easily find resource and destroy them at the end.

- In the top-left menu (Organization Dashboard), click on 'Create project'
- Give it a name like 'esgi-iac' and a description if you've some spare time
- In the 'Settings' tab, you'll find the *Project ID*, write it down somewhere

## Create an API Key

- In the top-right menu, click on *IAM*
- In the 'Application tab', create a app named `esgi-iac`
- In the 'Policies', create a policy called `esgi-iac`
  - Select 'Application' as principal
  - and select the `esgi-iac` app.
  - Click on *Add rules*
  - Add an *Access to resources* rule and select the `esgi-iac` project
  - As permission set, select *AllProductsFullAccess*
  - Click on *Create policy*, as this rule will be enough
  - Click on *Back to policies*
- In the *API keys* tab, click on *Generate an API Key*
  - Select the `esgi-iac` app as the key bearer
  - Select 1 year as the expiration
  - For the question "*Will this API key be used for Object Storage?*", click on yes
  - Select the `esgi-iac` project instead of the default choice

- Copy your Access Key ID and Secret Key, as the latter will only be shown once.
- You could also copy and save the `.env` file generated in the folded panel named "Add API keys to your environment"
