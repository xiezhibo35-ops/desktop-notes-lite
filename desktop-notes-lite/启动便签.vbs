Option Explicit
' Desktop Notes Lite - silent launcher (dependencies live in .pylibs)
Dim fso, sh, dir, py, script, env

Set fso = CreateObject("Scripting.FileSystemObject")
Set sh = CreateObject("WScript.Shell")

dir = fso.GetParentFolderName(WScript.ScriptFullName)
py = "D:\dev\python\pythonw.exe"
script = dir & "\main.py"

If Not fso.FileExists(py) Then
  MsgBox "Python not found: " & py, 16, "Desktop Notes Lite"
  WScript.Quit 1
End If
If Not fso.FileExists(script) Then
  MsgBox "main.py not found: " & script, 16, "Desktop Notes Lite"
  WScript.Quit 1
End If

sh.CurrentDirectory = dir

Set env = sh.Environment("PROCESS")
env("PYTHONPATH") = dir & "\.pylibs"
env("PYTHONIOENCODING") = "utf-8"

sh.Run """" & py & """ """ & script & """", 0, False
