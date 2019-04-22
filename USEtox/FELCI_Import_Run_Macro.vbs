Dim objExcel, book, fso, CurrentDirectory

set fso = CreateObject("Scripting.FileSystemObject") 
CurrentDirectory = fso.GetAbsolutePathName(".")

Set objExcel = CreateObject("Excel.Application")

Set book = objExcel.Workbooks.Open(CurrentDirectory & "\USESim3.0_FELCI_DCM(5).xlsm",,TRUE)

objExcel.DisplayAlerts = False
objExcel.Application.Run "'USESim3.0_FELCI_DCM(5).xlsm'!Module2.importdata"
objExcel.Application.Run "'USESim3.0_FELCI_DCM(5).xlsm'!Module1.Run_Simulation"
objExcel.DisplayAlerts = False
objExcel.ActiveWorkbook.Saved = True
objExcel.ActiveWorkbook.Close 
objExcel.Application.Quit

Set objExcel = Nothing
Set book = Nothing
Set fso = Nothing

WScript.Quit