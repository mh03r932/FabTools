#include "VOSystemLibrary.vh"
class FabShellWindow inherit SHELLWINDOW 


  //USER CODE STARTS HERE (do NOT remove this line)

METHOD	FileExit()	CLASS	FabShellWindow
	//
	SELF:EndWindow()
        return self

METHOD	HelpAbout()	CLASS	FabShellWindow
	//
	HelpAbout{ SELF }:Show()
return self

method Init(oParent) class FabShellWindow 

self:PreInit(oParent)

super:Init(oParent)

self:Caption := "FabZip Test Shell"
self:HyperLabel := HyperLabel{#FabShellWindow,"FabZip Test Shell",NULL_STRING,NULL_STRING}
self:Menu := MENUSTD{}
self:Icon := ICON_ZIP{}
self:Origin := Point{12, 139}
self:Size := Dimension{800, 600}

self:PostInit(oParent)

return self

METHOD	ZipOpen()	CLASS	FabShellWindow
	LOCAL oWIn 	AS	FabZipTest1
	//
	oWin := FabZipTest1{ SELF }
	oWin:Show()
	//
return self
END CLASS

