. .\Public\Get-ReleaseNotes.ps1

describe 'Get-ReleaseNotes' {
    $apiURi = "https://lubosmichalic.atlassian.net/wiki/rest/api/content/66108"
    $result = Get-ReleaseNotes -URi $apiURi -PSCredential Get-Credential

    it 'should return spaces available on Confluence' {
      $result | should match "Test"
    }
}
