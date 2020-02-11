<# 将 ./tmp 目录中的文件上传至 qiniu #>

$bucketname = "zomscoop"
$srcdir = (Get-Item ./tmp).FullName
qshell qupload2 --src-dir=$srcdir --bucket=$bucketname --overwrite --success-list=qiniu-success.log --overwrite-list=qiniu-overwrite.log --failure-list=qiniu-failure.log
