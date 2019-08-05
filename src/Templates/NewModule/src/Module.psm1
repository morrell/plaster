$Script:ModuleRoot = $PSScriptRoot

<%
if ($PLASTER_PARAM_PackageRestore -eq "Paket") {
	"&`$PSScriptRoot\bin\Loader.ps1"
}
%>

#Export all scripts as functions in .\ExportedFunctions, The functions must also be listed in the FunctionsToExport variable in the psd1 file.
Get-ChildItem $PSScriptRoot\ExportedFunctions\*.ps1 -Exclude *.Tests.ps1 | ForEach-Object {
	. $_.fullname
}