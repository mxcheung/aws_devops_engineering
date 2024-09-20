$result = test-path -path "c:\logs\wintail.exe"

if ($result -like "False")
{
	Copy-Item "c:\temp\wintail.exe" -Destination "c:\logs\wintail.exe"
}
