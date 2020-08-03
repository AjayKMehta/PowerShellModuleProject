Demo project to demonstrate automatically publishing a NuGet package for a PowerShell project.

For more information, read [this](https://adamtheautomator.com/azure-devops-powershell-module-pipeline)

## Prerequisites

1. Create Azure DevOps organization and project.
2. Install [Pester Azure DevOps extension](https://marketplace.visualstudio.com/items?itemName=Pester.PesterRunner).
3. Create the pipeline by clicking **New Pipeline**. Choose **GitHub** for **Where is your code?**. Select the repository and path for `azure-pipelines.yml`
4. Ensure **Artifacts** are Enabled for the project.
5. Add `[ProjectName] Build Service ([org name])` as contributor to pre-created NuGet feed.