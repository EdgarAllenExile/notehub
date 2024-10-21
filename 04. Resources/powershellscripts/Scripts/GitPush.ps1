$datestamp = Get-Date -Format "yyyy/MM/dd"
$currdir = (Get-Item .).Name

git add .
git commit -m "$datestamp - $currdir Notes"
git push