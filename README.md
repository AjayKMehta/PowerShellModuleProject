[![Build Status](https://dev.azure.com/ajaymehta1/PowerShellModuleProject/_apis/build/status/AjayKMehta.PowerShellModuleProject?branchName=master)](https://dev.azure.com/ajaymehta1/PowerShellModuleProject/_build/latest?definitionId=1&branchName=master)

Demo project to demonstrate automatically publishing a NuGet package for a PowerShell project.

For more information, read [this](https://adamtheautomator.com/azure-devops-powershell-module-pipeline)

I extended the pipeline by adding automatic versioning using [MinVer](https://github.com/adamralph/minver).

## Manual steps

1. Create Azure DevOps organization and project.
2. Install [Pester Azure DevOps extension](https://marketplace.visualstudio.com/items?itemName=Pester.PesterRunner).
3. Create the pipeline by clicking **New Pipeline**. Choose **GitHub** for **Where is your code?**. Select the repository and path for `azure-pipelines.yml`
4. Ensure **Artifacts** are Enabled for the project.
5. Add `[ProjectName] Build Service ([org name])` as contributor to pre-created NuGet feed.

If you want to display a build status badge, make sure your Azure DevOps project is public and follow [these instructions](https://www.azuredevopslabs.com/labs/azuredevops/github-integration/#task-6-adding-a-build-status-badge).