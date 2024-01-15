# README

> **Note:** ⚠️ You can't create modules with `null` provider as it will result in failed run due to Terraform specifics (most likely a bug).

Before running this code, please ensure the following steps are completed:

1. **Enable "Agent Pools" in the Admin App:**
   Make sure that "Agent Pools" are enabled for your account in the Admin App. Otherwise, the run will fail due to AP unavailability.

2. **Set Quotas:**
   Ensure that your environment quota is set to a minimum of 55 environments. 

3. **Attach Scalr Provider Configuration to the Workspace:**
   Attach the Scalr provider configuration to your workspace. This connection is crucial for the code to interact seamlessly with Scalr.

4. **Set Variables in the `.tfvars` File:**
   Modify the variables in the `.tfvars` file according to your requirements. You can use mine as a reference or just follow the variable assistant in the workspace. I recommend setting everything in the `.tfvars` file (except for sensitive data) and storing it for the future needs.

5. **Configure Workspace Settings with the `.tfvars` File:**
   Set the `.tfvars` file as a var-file in the workspace settings. This ensures that the code utilizes the specified variables during execution.

Once these steps are completed, you are ready to run the code.
