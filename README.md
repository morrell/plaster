# New-PlasterModule

## Build the module generating module

Run `.\invoke-build.ps1 build` to build the module

```powershell
Build build C:\plaster\Module.Build.ps1
Task /build/Init
Done /build/Init 00:00:00.0085015
Done /build/Clean/Init
Task /build/Clean
Done /build/Clean 00:00:00.1534974
Done /build/StageFiles/Init
Done /build/StageFiles/Clean
Task /build/StageFiles/BeforeStageFiles
Done /build/StageFiles/BeforeStageFiles 00:00:00.0190010
Task /build/StageFiles/PackageRestore skipped.
Task /build/StageFiles
Task /build/StageFiles/AfterStageFiles
Done /build/StageFiles/AfterStageFiles 00:00:00.0220066
Task /build/StageFiles/UpdateModuleVersion skipped.
Done /build/StageFiles 00:00:00.1949998
Task /build/Analyze skipped.
Task /build/Sign skipped.
Task /build/BeforeBuild
Done /build/BeforeBuild 00:00:00.0105057
Task /build/AfterBuild
Done /build/AfterBuild 00:00:00.0329758
Done /build 00:00:00.4994900
Build succeeded. 8 tasks, 0 errors, 0 warnings 00:00:01.0869138
```

# Creating a module

## Import the NewModuleTemplate module
Now you can import the `NewModuleTemplate` module that generates new modules.

```powershell
Import-module .\Release\NewModuleTemplate\NewModuleTemplate.psd1
```

## Generate a new module
Change to a location where you'll store the generated module.

```powershell
Set-Location C:\Modules
```

Run New-PlasterModule to generate a module. Provide a path to make a new folder to contain the module.
```powershell
New-PlasterModule -Path MyModule
```

## Initialize the a git repository
This is required for publishing release notes based on commit history when packaing modules.

```bash
cd MyModule
git init
git add .
git commit -m "Initial commit"
```

## Build the new module
```powershell
Set-Location MyModule
.\Invoke-Build.ps1 build
```

## Import the new module
```powershell
Import-Module .\Release\MyModule\MyModule.psd1
```

# Developing a module

## Writing functions
Module functions are kept in single files inside of `src/ExportedFunctions/`
```
./src/ExportedFunctions/new-thing.ps1
./src/ExportedFunctions/get-thing.ps1
./src/ExportedFunctions/remove-thing.ps1
./src/ExportedFunctions/invoke-thing.ps1
```

They should contain only the function itself and the helper description of a function.
```powershell
<#
.SYNOPSIS
Gets a thing.

.DESCRIPTION
Get a thing by name.

.PARAMETER Name
Name of thing

.INPUTS
[String] Name.

.OUTPUTS
[Object] A thing object.

.EXAMPLE
Get-Thing thing1

Gets thing1.

.EXAMPLE
Get-Thing thing1,thing2

Gets thing1 and thing2.

.EXAMPLE
@("thing1","thing2","thing3") | Get-Thing

Gets things from pipeline input.
#>
Function Get-Thing{
    Param(
        [Parameter(ValueFromPipeline=$true)]
        [string[]]$Name
    )
    Process
    {
        $Thing | ForEach-Object {
            $T = Get-Things | Where-Object {$_.Name -eq $Name}
            return $T
        }
    }
}
```
It's a really good practice to write relevant and helpful cmdlet documentation.

It's also a good practice to specifically name the functions you're exporting in the psd1 file for the module.

```powershell
# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(
    'new-thing',
    'get-thing',
    'remove-thing'
)
```

## Testing a module

You can write pester tests and keep them in the `./test/` folder.

More info on pester testing later...
