param(
    [Parameter(Mandatory=$true)][String]$AzurePassword,
    [Parameter(Mandatory=$true)][String]$AzureTenantId
)

try
{
    Write-Output "Connecting to Azure"
    
    $psCred = New-Object System.Management.Automation.PSCredential($AzureApplicationId, $azurePasswordSecureString)
    $defaultProfile = Connect-AzAccount -Credential $psCred -TenantId $AzureTenantId  -ServicePrincipal

    Write-Output "Connected to Azure, getting the cloud service definition. CloudServiceName: $CloudServiceName"
}
catch [System.Exception] 
{ 
    Write-Error "======"
    Write-Error $_.Exception.ToString()
    exit 1 
}
