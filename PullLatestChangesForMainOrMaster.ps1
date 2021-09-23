ls -name -Exclude *.ps1* | foreach {
  cd .\$_ ;
  $mainBranch = (git symbolic-ref refs/remotes/origin/HEAD) -replace "refs/remotes/origin/",""
  Write-Host "Pull latest for $_ repo using branch $mainBranch"
  git pull origin $mainBranch *> $null;
  cd ..
}
Write-Host "Done.";
