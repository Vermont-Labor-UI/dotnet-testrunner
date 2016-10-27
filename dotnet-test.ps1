$exitCode = 0;

if(Test-Path -Path 'application/test/') {
  Get-ChildItem application/test/ -Recurse -include project.json | ForEach {
    $parent = Split-Path (Split-Path -Path $_.Fullname -Parent) -Leaf;
    $testFile = "TEST-RESULTS-$parent.xml";
    dotnet test $_.Fullname -xml $testFile;
    $exitCode = [System.Math]::Max($lastExitCode, $exitCode);
  }
}
else
{
  Write-Warning "No test file found.  Skipping tests."
}

exit $exitCode;