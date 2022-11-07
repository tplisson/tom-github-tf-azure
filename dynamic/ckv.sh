cmd='checkov -f dynamic.tf --external-checks-dir . -c dynamic1 --framework terraform --compact'
echo "### Executing: $cmd"
$cmd