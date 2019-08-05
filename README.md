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

## Import the module
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

## Initialize the repository
```bash
cd MyModule
git init
git add .
git commit -m "Initial commit"
```

## Build the new module
```powershell
set-location MyModule
.\Invoke-Build.ps1 build
```

## Import the new module
```powershell
Import-module .\Release\MyModule\MyModule.psd1
```






