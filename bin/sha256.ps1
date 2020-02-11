<# 获取文件的 SHA256 Hash #>
param (
  [string]$filepath
)
if(-not (Test-Path ./tmp)) {
  mkdir ./tmp
}
$oldfile = (Get-Item $filepath)
$newpath = "./tmp/$($oldfile.Name)"
cp -Force $oldfile $newpath
$file = (Get-Item $newpath)
$hash = (Get-FileHash -Algorithm SHA256 $file).Hash
Set-Content -Encoding ASCII -Path "./tmp/$($file.Name).sha256" -Value "$hash"
echo $file.Name
echo "sha256:$hash"
