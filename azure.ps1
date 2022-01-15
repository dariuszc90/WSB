Connect-AzAccount -TenantId b568e80f-6428-453e-ac73-8f7638ca49ea -Subscription 57a285ef-48b9-432c-ad69-a7e2e3cf38a4
Get-AzContext
Get-AzLocation




$resourceGroup ="storage-ps"
$location = "westeurope"
New-AzResourceGroup -Name $resourceGroup -Location $location

$azappSecret ="ut07Q~XTi6onXqGyv8CuSfkuc2B7Le7VLtRW5"
$resourceGroup ="storage-ps"
$appID = (Get-AzADServicePrincipal -DisplayName az-app).appID
New-AzRoleAssignment -RoleDefinitionName "Owner" -ResourceGroupName $resourceGroup -ApplicationId $appID



$appID = (Get-AzADServicePrincipal -DisplayName az-app).appID
$SecuredPassword = Read-Host -AsSecureString #ut07Q~XTi6onXqGyv8CuSfkuc2B7Le7VLtRW5    secret key z az_app
$TenantId = "b568e80f-6428-453e-ac73-8f7638ca49ea"
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $appID, $SecuredPassword
Connect-AzAccount -ServicePrincipal -TenantId $TenantId -Credential $Credential
# vm start
POST
https://management.azure.com/subscriptions/57a285ef-48b9-432c-ad69-a7e2e3cf38a4/resourceGroups/compute/providers/Microsoft.Compute/virtualMachines/ubuntu01/start?api-version=2018-10-01

