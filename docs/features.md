# PSRule for Azure features

The following sections describe key features of PSRule for Azure.

- [Ready to go](#ready-to-go)
- [DevOps](#devops)
- [Cross-platform](#cross-platform)

## Ready to go

PSRule for Azure includes over 100 rules for validating resources against configuration recommendations.
Each rule includes additional information to help remediate issues.

Use the built-in rules to start enforcing release processes quickly.
Then layer on your own rules as your organization's requirements mature.
Custom rules can be implemented quickly and work side-by-side with built-in rules.

As new built-in rules are added and improved, download the latest PowerShell module to start using them.

## DevOps

Azure resources can be validated throughout their lifecycle to support a DevOps culture.

From as early as authoring a Azure Resource Manager (ARM) template, resources can be validated offline.
Pre-flight validation can be integrated into a continuous integration (CI) processes to:

- **Shift-left:** Identify configuration issues and provide fast feedback in pull requests.
- **Add qualify gates:** Implement quality gates between environments such as development, test and production.
- **Monitor continuously:** Perform ongoing checks for configuration optimization opportunities.

PSRule for Azure provides the following cmdlets that extract data for analysis:

- [Export-AzTemplateRuleData](commands/PSRule.Rules.Azure/en-US/Export-AzTemplateRuleData.md) - Used for pre-flight analysis of one or more ARM templates.
- [Export-AzRuleData](commands/PSRule.Rules.Azure/en-US/Export-AzRuleData.md) - Used for in-flight analysis of resources deployed to one or more Azure subscriptions.

## Cross-platform

PSRule uses modern PowerShell libraries at its core, allowing it to go anywhere PowerShell can go.
PSRule runs on MacOS, Linux and Windows.

To install PSRule for Azure use the `Install-Module` cmdlet within PowerShell.

```powershell
Install-Module -Name PSRule.Rules.Azure -Scope CurrentUser;
```

For additional installation options see [install instructions](scenarios/install-instructions.md).

## Frequently Asked Questions (FAQ)

Continue reading for FAQ relating to _PSRule for Azure_.
For general FAQ see [PSRule - Frequently Asked Questions (FAQ)][ps-rule-faq], including:

- [How is PSRule different to Pester?][compare-pester]
- [How do I configure PSRule?][ps-rule-configure]
- [How do I ignore a rule?][ignore-rule]

### What permissions do I need to export data?

The default built-in _Reader_ role to a subscription is required for:

- Exporting rule data with `Export-AzRuleData`.
- Exporting rule data from templates with `Export-AzTemplateRuleData` when online features are used.
  - Optionally `-ResourceGroupName` and `-Subscription` parameter can be used, these require access _Reader_ access.

### What permissions do I need to analyze exported data?

No access to Azure is required after data has been exported to JSON.

### Should I continue to use Azure Security Center, Azure Advisor or Azure Policy?

Absolutely.
PSRule for Azure does not replace Azure Security Center, Azure Advisor or Azure Policy.

PSRule complements Azure Security Center, Azure Advisor and Azure Policy features by:

- Recommending turning on and using features of Azure Security Center, Azure Advisor or Azure Policy.
- Providing offline analysis in split environments where the analyst has no access to Azure subscriptions.
  - Rule data for analysis can be exported out to a JSON file.
- Providing the ability to analyze resources in Azure Resource Manager templates before deployment.
  - Additionally analysis can be performed in a continuous integration (CI) process.
- Providing the ability to layer on organization specific rules, as required.
- Data collection requires limited permissions and requires no additional configuration.

### Traditional unit testing vs PSRule for Azure?

You may already be using a unit test framework such as Pester to test infrastructure code.
If you are, then you may have encountered the following challenges.

For a general PSRule/ Pester comparison see [How is PSRule different to Pester?][compare-pester]

#### Unit testing more than basic JSON structure

Unit tests are unable to effectively test resources contained within Azure templates.
Templates should be reusable, but this creates problems for testing when functions, conditions and copy loops are used.
Template parameters could completely change the type, number of, or configuration of resources.

PSRule resolves templates to allow analysis of the resources that would be deployed based on provided parameters.

#### Standard library of tests

When building unit tests for Azure resources, starting with an empty repository can be a daunting experience.
While there are several open source repositories and samples around to get you started, you need to integrate these yourself.

_PSRule for Azure_ is distributed as a PowerShell module using the PowerShell Gallery.
Using a PowerShell module makes it easy to install and update.
The built-in rules allow you starting testing resources quickly, with minimal integration.

For details examples see:

- [Validate Azure resources from templates with Azure Pipelines](scenarios/azure-pipelines-ci/azure-pipelines-ci.md)
- [Validate Azure resources from templates with continuous integration (CI)](scenarios/azure-template-ci/azure-template-ci.md)

[compare-pester]: https://github.com/microsoft/PSRule/blob/master/docs/features.md#how-is-psrule-different-to-pester
[ignore-rule]: https://github.com/microsoft/PSRule/blob/master/docs/features.md#how-do-i-ignore-a-rule
[ps-rule-configure]: https://github.com/microsoft/PSRule/blob/master/docs/features.md#how-do-i-configure-psrule
[ps-rule-faq]: https://github.com/microsoft/PSRule/blob/master/docs/features.md#frequently-asked-questions-faq
