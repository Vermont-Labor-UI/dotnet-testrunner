Get-ChildItem application/test/ -Recurse -include project.json | ForEach {
  $parent = Split-Path (Split-Path -Path $_.Fullname -Parent) -Leaf;
  $testFile = "TEST-RESULTS-$parent.xml";
  dotnet test $_.Fullname -xml $testFile;
}
