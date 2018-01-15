<#
.SYNOPSIS
  Update Release Documentation
.DESCRIPTION
  If releasing a product, update Release Notes on RedGate Documenation (https://documentation.red-gate.com)
  If just building a product, this command does nothing.
#>

function Update-ReleaseNotes {
    [CmdletBinding(
        SupportsPaging = $true
    )]
    param (
        [Parameter( Mandatory = $true )]
        [URi]$apiURi,

        [Parameter( Mandatory = $true )]
        [PSCredential]$Credential
        )


    PROCESS {
      $Credential = (Get-Credential)
      $SecureCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(
                          $('{0}:{1}' -f $Credential.UserName, $Credential.GetNetworkCredential().Password)
                      ))

      $iwParameters = @{
                  Uri           = "https://lubosmichalic.atlassian.net/wiki/rest/api/content/66108"
                  Method        = 'Get'
                  Headers       = @{Authorization = "Basic $SecureCreds" }
                  ContentType     = "application/json; charset=utf-8"
                  UseBasicParsing = $true
                  Credential    = $Credential
              }

      Invoke-RestMethod @iwParameters
    }
  }
