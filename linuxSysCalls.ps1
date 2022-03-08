#!/usr/bin/pwsh

# This next is literally C-Sharp Code that will be compiled by Add-Type
# into a static class called Externs, which you can then make static calls to...
$src = @'
[DllImport("libc.so.6")] public static extern int getpid();
[DllImport("libc.so.6")] public static extern int getppid();
[DllImport("libc.so.6")] public static extern int getuid();
[DllImport("libc.so.6")] public static extern int geteuid();
'@

$externs = Add-Type -MemberDefinition $src -Name "Externs" -PassThru
$externs::getpid()
$externs::getppid()
$externs::getuid()
$externs::geteuid()
