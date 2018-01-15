## import the file with function
. .\Add-One.ps1

describe 'TDD your TDD' {
  $TestNumber = 1
  $result = Add-One -Number $TestNumber

    it 'should return 2' {
      $result | should be 2
    }
}
