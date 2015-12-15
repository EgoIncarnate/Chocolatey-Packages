﻿$packageName = 'jivkok.vsextensions.2013'

function RunBatchfileAndUseItsEnvironmentVariables ($file) {
  $cmd = """$file"" & set"
  cmd /c $cmd | Foreach-Object {
    $p, $v = $_.split('=')
    Set-Item -path env:$p -value $v
  }
}

function curlex($url, $filename) {
  $path = [IO.Path]::GetTempPath() + "\" + $filename

  if ( Test-Path $path ) { rm -force $path }

  (New-Object Net.WebClient).DownloadFile($url, $path)

  return New-Object IO.FileInfo $path
}

function Install-Extension($url, $name) {
  echo "Installing $name"

  $extension = (curlex $url $name).FullName

  $result = Start-Process -FilePath "VSIXInstaller.exe" -ArgumentList "/q $extension" -Wait -PassThru;
}

$BatchFile = Join-Path $env:VS120COMNTOOLS "vsvars32.bat"
RunBatchfileAndUseItsEnvironmentVariables $BatchFile

Install-Extension http://visualstudiogallery.msdn.microsoft.com/fb5badda-4ea3-4314-a723-a1975cbdabb4/file/100523/7/Microsoft.CodeDigger.vsix CodeDigger.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/76293c4d-8c16-4f4a-aee6-21f83a571496/file/9356/23/CodeMaid_v0.7.0.vsix CodeMaid.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/86548753-2b00-42e0-a40c-185f93e37a4f/file/136953/3/EasyMotion.vsix EasyMotion.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/c8bccfe2-650c-4b42-bc5c-845e21f96328/file/75539/10/EditorConfigPlugin.vsix EditorConfig.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/b31916b0-c026-4c27-9d6b-ba831093f6b2/file/62080/3/Gister.vsix Gister.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/0855e23e-4c4c-4c82-8b39-24ab5c5a7f79/file/15725/4/MarkdownMode.vsix MarkdownMode.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/2beb9705-b568-45d1-8550-751e181e3aef/file/93630/8/MultiEdit.vsix MultiEdit.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/4ec1526c-4a8c-4a84-b702-b21a8f5293ca/file/105933/4/NuGet.Tools.2013.vsix NuGet.vsix
# Install-Extension http://visualstudiogallery.msdn.microsoft.com/ad0897b3-7537-4c92-a38c-104b0e005206/file/75983/4/PerfWatsonMonitor.vsix PerfWatsonMonitor.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/a058d5d3-e654-43f8-a308-c3bdfdd0be4a/file/89212/35/PostSharp-3.1.27.vsix PostSharp.vsix
Install-Extension https://visualstudiogallery.msdn.microsoft.com/f65f845b-9430-4f72-a182-ae2a7b8999d7/file/166502/10/PowerShellTools.12.0.vsix PowerShellTools.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/dbcb8670-889e-4a54-a226-a48a15e4cace/file/117115/1/ProPowerTools.vsix ProPowerTools.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/f0589156-a8e6-47db-8bac-90f01ca6b8a3/file/80662/4/Cobisi.RoutingAssistant-v1.8.vsix RoutingAssistant.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/b08b0375-139e-41d7-af9b-faee50f68392/file/5131/8/SnippetDesigner.vsix SnippetDesigner.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/90ac3587-7466-4155-b591-2cd4cc4401bc/file/112721/3/TechTalk.SpecFlow.Vs2013Integration.vsix SpecFlow.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/f4d9c2b5-d6d7-4543-a7a5-2d7ebabc2496/file/63103/7/VSColorOutput.vsix VSColorOutput.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/c6d1c265-7007-405c-a68b-5606af238ece/file/106247/16/SquaredInfinity.VSCommands.VS12.vsix VSCommands.vsix
# Install-Extension http://visualstudiogallery.msdn.microsoft.com/59ca71b3-a4a3-46ca-8fe1-0e90e3f79329/file/6390/45/VsVim.vsix VsVim.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/56633663-6799-41d7-9df7-0f2a504ca361/file/105627/23/WebEssentials2013.vsix WebEssentials.vsix
Install-Extension http://visualstudiogallery.msdn.microsoft.com/2b96d16a-c986-4501-8f97-8008f9db141a/file/53962/59/Mindscape.WebWorkbench.Integration.10.vsix WebWorkbench.vsix
