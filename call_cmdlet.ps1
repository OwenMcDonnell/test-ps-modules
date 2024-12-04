param(
    [Parameter(Mandatory=$true)][String]$AzurePassword,
    [Parameter(Mandatory=$true)][String]$AzureTenantId,
    [Parameter(Mandatory=$true)][String]$AzureSubscriptionId,
    [Parameter(Mandatory=$true)][String]$AzureAppId
)

try
{
    Write-Output "Connecting to Azure"
    
    $azurePasswordSecureString = ConvertTo-SecureString $AzurePassword -AsPlainText -Force
    $psCred = New-Object System.Management.Automation.PSCredential($AzureAppId, $azurePasswordSecureString)
    Connect-AzAccount -Credential $psCred -TenantId $AzureTenantId  -ServicePrincipal

}
catch [System.Exception] 
{ 
    Write-Error "======"
    Write-Error $_.Exception.ToString()
    exit 1 
}
