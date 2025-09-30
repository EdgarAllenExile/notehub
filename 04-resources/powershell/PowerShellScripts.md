# Powershell Scripts

## Copy From Remote Machine Via SSH

```powershell Example
scp <user@addresss>:<filepath-remote> <filepath-local>
```

```powershell What I Use
scp -P 50022 pd57215@127.0.0.1:C:/Users/pd57215/Downloads/file ./Downloads/
```

## Prepend Text to Files

```
Get-ChildItem -Path . | ForEach-Object {
     $file = $_.FullName
     # Add "-Filter *.xyz " after Path and before pipe to filter by file type
     # the -Raw param was important for me as it didn't read the entire
     # file properly without it. I even tried [System.IO.File]::ReadAllText
     # and got the same thing, so there must have been some characater that
     # caused the file read to return prematurely
     $content = Get-Content $file -Raw

     $prepend = 'Line of Text;' + "`r`n"
     # + "`r`n" inserts Line Break
		 # this could also be from a file: aka
     # $prepend = Get-Content 'path_to_my_file_used_for_prepending'

     $content =  $prepend + $content
     Set-Content $file $content
 }
```

Important Notes

- The + "`r n" portion is needed for carriage return (extra back tick omitted as starts codeblock)

Get-ChildItem "C:\Your\Files\Source" -Recurse -file | Copy-Item -Destination "C:\Your\Files\Destination" -Force
Get-ChildItem "C:\Your\Files\Source" -Recurse -file | Copy-Item -Destination "C:\Your\Files\Destination" -Force
Get-ChildItem "C:\Users\PD57215\Documents\FRTesting\Source" -Recurse -file | Copy-Item -Destination "C:\Users\PD57215\Documents\FRTesting\Destination" -Force
