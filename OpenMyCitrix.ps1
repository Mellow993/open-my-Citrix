# Opens the webpage for my work-citrix session
# 2022-04-12 

$CurrentDate = Get-Date
$EarlyTime = Get-Date "05:00 AM"
$LateTime = Get-Date "10:00 AM"
$WebBrowser = "chrome.exe"

function CompareTimes
{
    if($CurrentDate -lt $LateTime -And $CurrentDate -gt $EarlyTime)
    {
        return $true
    }
    else 
    {
        return $false
    }
}

function IsWebsiteAvailable([string] $url)
{
    $HTTP_Request = [System.Net.WebRequest]::Create($url)
    $HTTP_Response = $HTTP_Request.GetResponse()
    $HTTP_Status = [int]$HTTP_Response.StatusCode

    If ($HTTP_Status -eq 200) 
    {
        If ($HTTP_Response -eq $null) { } 
        return $true
    }
    Else 
    {
        If ($HTTP_Response -eq $null) { } 
        return $false
    }
}

function OpenWebsite($url)
{
    [System.Diagnostics.Process]::Start($WebBrowser,"--incognito $url") # due to performance issues it's recommended to open the brower in the incognito mode
}

function Main
{
    $source1 = "https://FirstDestination"
    $source2 = "https://SeconDestination"
    if(CompareTimes)
    {
        if(IsWebsiteAvailable($source1))
        {
            OpenWebsite($source1)
        }
        elseif(IsWebsiteAvailable($source2)) 
        {
            OpenWebsite($source2)
        }
        else 
        {
            Exit  
        }
    }
}

# Start Script
Main



