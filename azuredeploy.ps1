# azure-vm-simple-windows
# https://docs.microsoft.com/en-us/azure/virtual-machines/windows/ps-template
# https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-powershell


$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"
$adminUsername = Read-Host -Prompt "Enter the administrator username"
$adminPassword = Read-Host -Prompt "Enter the administrator password" -AsSecureString
$dnsLabelPrefix = Read-Host -Prompt "Enter an unique DNS name for the public IP"



New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/CC0001MK/AzureVMDeploy/main/azuredeploy.json?token=ARG3XUJZOC6YEMYDXSHAERS7W75EC" `
    -adminUsername $adminUsername `
    -adminPassword $adminPassword `
    -dnsLabelPrefix $dnsLabelPrefix

 (Get-AzVm -ResourceGroupName $resourceGroupName).name