# This is an example of a powershell script to call a paginated API to store the output from an API call to a local CSV.
# This reduces server load by calling the API in pages. It can also help reduce cloud expenses by performing frequent API calls locally and exporting more structured data
to Azure or other cloud. 

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Set cache for paginated API call
$cacheUri = '...InsertLinkHere...&QueryParameters=True&UseCache=True'
$cache = Invoke-RestMethod -Uri $cacheUri

# Store number of cached pages in a variable
$totalCalls = [int]$cache.data.(...Path to Number of Pages...) + 1

# Loop through each cached page and append the results to the array
$array = @()
for (($i = 1)l $i -lt $totalCalls; $i++)
{
    $Uri = '...InsertLinkHere...&QueryParameters=True&Page = $i'
    $apiData = Invoke-RestMethod -Uri $Uri
    $array += $apiData.data
}

# Convert to CSV or other preferred format and output to desired location
$array | ConvertTo-Csv -NoTypeInformation | Out-File -FilePath "...InsertFilePath..."
