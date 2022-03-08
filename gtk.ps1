#!/usr/bin/pwsh

# BEFORE YOU RUN THIS!
# You need to obtain and copy to $PSHOME, the following files:
#	AtkSharp.dll
#	CairoSharp.dll
#	GdkSharp.dll
#	GioSharp.dll
#	GLibSharp.dll
#	GtkSharp.dll
#	PangoSharp.dll
#
# See the script get_gtksharp.ps1 for details on how you might go about this.
# Possibly you can just run the script, but you should review it carefully before running!

Add-Type -Assembly AtkSharp
Add-Type -Assembly CairoSharp
Add-Type -Assembly GdkSharp
Add-Type -Assembly GioSharp
Add-Type -Assembly GLibSharp
Add-Type -Assembly GtkSharp
Add-Type -Assembly PangoSharp

function hello($s, $a) {
	Write-Host($s.Label)
 if ($s.Label -eq "Hello World") {
		$s.Label = "Hello World Again"
	} elseif ($s.Label -eq "Hello World Again") {
		$s.Label = "Exit"
	} else {
		[Gtk.Application]::Quit()
	}
}

[Gtk.Application]::Init()
$app = New-Object Gtk.Application("org.gtkapp.gtkapp", [GLib.ApplicationFlags]::None)
$app.Register([Glib.Cancellable]::Current) | Out-Null

$btn = New-Object Gtk.Button("Hello World")

$btn.AddSignalHandler("clicked", [System.EventHandler]${function:hello})

$win = New-Object Gtk.Window("helloworld")

$win.AddSignalHandler("delete-event", [Gtk.DeleteEventHandler]{[Gtk.Application]::Quit()}, [Gtk.DeleteEventArgs].asType())

$win.Add($btn)

$win.ShowAll()

[Gtk.Application]::Run()
