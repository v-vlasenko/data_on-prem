# READ BEFORE USING

> **Note:** ⚠️ This template doesn't contain acc_id variable declaration and supposed to be run on the same on-prem instance you want to create resources in.

## Instruction

Before running this code, please ensure the following steps are completed:

1. **Enable "Agent Pools" in the Admin App:**
   Make sure that "Agent Pools" are enabled for your account in the Admin App. Otherwise, the run will fail due to AP unavailability.

2. **Set Quotas:**
   Better to set high quotas for environments, workspaces and modules. By default, this plan generated 23 environments with workspace and module in each of them. 

3. **Attach Scalr Provider Configuration to the Workspace:**
   Attach the Scalr provider configuration to your workspace. This connection is crucial for the code to interact seamlessly with Scalr.

4. **Set Variables in the `.tfvars` File:**
   Modify the variables in the `.tfvars` file according to your requirements. You can use mine as a reference or just follow the variable assistant in the workspace. I recommend setting everything in the `.tfvars` file (except for sensitive data) and storing it for the future needs.

5. **Check the Variable Assistant on the workspace page:** 
   This will allow you to insert all sensitive data and some other info that varies depending on the container.

Once these steps are completed, you are ready to run the code.

## Structure and resources

This template utilizes almost every resource that is currently present for Scalr provider. The code is divided into a separate files (`env.tf`, `vcs.tf` etc) so it would be easier to find the needed resource and also contains a `variables.tf` file with all var declarations and annotations. 

This plan **DOESN'T** create a data for the pagination testing purposes, it mainly creates one entity per type, but you can adjust it by adding `count` meta-argument. 

The `report_module_usage.tf` on the other hand creates 21 env with a module and a workspace each and is designed to allow automatic creation of modules in order to test the "Modules in-use" report. It takes a few minutes to apply, so if you don't need this part, you can just change file extension to `.txt` or remove it from the repository