# README

Before running this code, please ensure the following steps are completed:

1. **Enable "Agent Pools" in the Admin App:**
   Make sure that "Agent Pools" are enabled for your account in the Admin App. Otherwise, the run will fail due to AP unavailability.

2. **Set Quotas:**
   Better to set high quotas for environments, workspaces and modules. By default, this plan generated 23 environments with workspace and module in each of them. 

3. **Attach Scalr Provider Configuration to the Workspace:**
   Attach the Scalr provider configuration to your workspace. This connection is crucial for the code to interact seamlessly with Scalr.

4. **Set Variables in the `.tfvars` File:**
   Modify the variables in the `.tfvars` file according to your requirements. You can use mine as a reference or just follow the variable assistant in the workspace. I recommend setting everything in the `.tfvars` file (except for sensitive data) and storing it for the future needs.

5. **Configure Workspace Settings with the `.tfvars` File:**
   Set the `.tfvars` file as a var-file in the workspace settings. This ensures that the code utilizes the specified variables during execution.

6. **Check the Variable Assistant on the workspace page:** 
   This will allow you to insert all sensitive data and some other info that varies depending on the container.

Once these steps are completed, you are ready to run the code.
