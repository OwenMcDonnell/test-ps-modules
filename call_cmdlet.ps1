param(
    [Parameter(Mandatory=$true)][String]$AzurePassword,
    [Parameter(Mandatory=$true)][String]$AzureTenantId,
    [Parameter(Mandatory=$true)][String]$AzureSubscriptionId
)

try
{
    Write-Output "Connecting to Azure"
    
    $azurePasswordSecureString = ConvertTo-SecureString $AzurePassword -AsPlainText -Force
    $psCred = New-Object System.Management.Automation.PSCredential($AzureSubscriptionId, $azurePasswordSecureString)
    $defaultProfile = Connect-AzAccount -Credential $psCred -TenantId $AzureTenantId  -ServicePrincipal

    Write-Output "Connected to Azure, getting the cloud service definition. CloudServiceName: $CloudServiceName"
}
catch [System.Exception] 
{ 
    Write-Error "======"
    Write-Error $_.Exception.ToString()
    exit 1 
}
