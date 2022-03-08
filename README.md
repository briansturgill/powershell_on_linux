# PowerShell on Linux

This is a guide for Linux people about using PowerShell on Linux.

PowerShell is for ADMINISTRATORS and DEVELOPERS.
It is not the general interface a Unix/Linux shell is.
It would be possible to create a softer environment for non-power users.

## Installation

To install PowerShell use: snap install powershell --classic
The "--classic" gives the app access to your whole file system. [Necessary for a shell!]
If you don't use snap, there are alternate means:
[Alternate ways to install PowerShell on Linux](https://docs.microsoft.com/en-us/powershell/scripting/install/install-other-linux?view=powershell-7.2#installation-using-a-binary-archive-file)


## IMPORTANT: Invocation
To invoke PowerShell, use "pwsh".
On Windows, the new PowerShell is also invoked with "pwsh".
But also on Windows there is "powershell", which invokes an older variant that older extensions
still work with.
In WSL (Linux inside of Windows) you can get to PowerShell from bash by using "powershell.exe"...
but as it will not have access to Linux commands, I advise installing the Linux powershell there.
Note that WSL does not support snap, I used this [alternate way to install](https://docs.microsoft.com/en-us/powershell/scripting/install/install-other-linux?view=powershell-7.2#installation-using-a-binary-archive-file).

## Where's the pwsh ".pwshrc"?
The equivalent of .bashrc is stored in directory in variable: $profile
```powershell
echo $profile
/home/brian/.config/powershell/Microsoft.PowerShell_profile.ps1
```
If pwsh has not already created an empty profile, you'll need
to create powershell directory yourself.

I put the following in my $profile:
```powershell
Set-PSReadLineOption -EditMode Emacs
# I use these settings for Light Mode.
Set-PSReadLineOption -Colors @{
      Command            = 'Magenta'
      Number             = 'Black'
      Member             = 'Black'
      Operator           = 'Black'
      Type               = 'Black'
      Variable           = 'DarkGreen'
      Parameter          = 'DarkGreen'
      ContinuationPrompt = 'Black'
      Default            = 'Black'
    }
# Set-Alias "ls" "myls"
# Aliases are strictly only name aliases in PowerShell
# If you need to add arguments or other transformations, use this:
function ls {
	/usr/bin/ls -F --color $args
}
```

## Examples of Linux specialized usage of PowerShell
Examples:
linuxSysCalls.ps1 - shows how easy it is to make external "C" calls
gtk.ps1 - Small GtkSharp example. Make sure you read comments in file before running.

## Debugging PowerShell scripts under all platforms.
Visual Studio Code [an open source editor by Microsoft] has an extension
for PowerShell [Called PowerShell by Microsoft.] This extension allows
line by line debugging of powershell screipts, along with formatting and
colorization.

### To install VSCode under Linux:
```sh
sudo snap install --classic code
```
or see: [Visual Studio Code on Linux](https://code.visualstudio.com/docs/setup/linux).


### To install the extension.
[Extensions Icon in VSCode - 5th button on left side bar: 4 squares, top right raised.](vscode_extensions_icon.png)
Click on the Extensions button, type PowerShell in the search box.
Click in the list PowerShell (by Microsoft).
In the main editor screen PowerShell information will appear... click Install.
IMPORTANT, Restart VSCode!

### Debugging with the PowerShell extension...
Create a directory somewhere using your shell and then cd to it and type:
    code .

Click the "explorer" button at the top left (looks like two sheets of paper).
Now move your mouse near the name of the directory and click the new file button...
Create a file, named it "demo.ps1".
```powershell
#!/usr/bin/pwsh

$fs = Get-PSDrive /
$percent_used = [Math]::Round(($fs.Used/($fs.Free+$fs.Used))*100, 2)
if ($percent_used -gt 90) {
	Write-Host "Ugh! Used $($percent_used)%!"
} elseif ($percent_used -gt 20) {
	Write-Host "Great! Only using $($percent_used)%."
} else {
	Write-Host "Did you really need that new disk? Using a measly $($percent_used)%!"
}
```

To the left of line 3 single click twice (pause between)... this will set a breakpoint.
A red "led" will appear there.

* From the "Run" menu select "Add Configuration..."

* Choose "Launch Current File".

* You'll be placed into the file "launch.json".

* Switch back to your PowerShell file.

* From "Run" menu select "Start Debugging".

* You'll stop at first line of code.

* Select "Step Over" from debug controls at top.

* You'll stop at line 4.

* Hover over "$percent_used"... you'll see it's value.

* Add $percent_used in the watch expressions at the left.

* Hit "Step Over" a few times.

By now, you'll have a good idea of how the debugging works.
Hit the red square button to stop debugging.
