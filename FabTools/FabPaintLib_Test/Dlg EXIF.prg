USING VO
#include "Dlg EXIF.vh"



STATIC DEFINE EXIFDLG_CLOSEPB := 100
STATIC DEFINE EXIFDLG_EXIFLISTVIEW := 101



PARTIAL CLASS EXIFDlg INHERIT DIALOGWINDOW
	EXPORT oCCClosePB AS PUSHBUTTON
	EXPORT oDCEXIFListView AS LISTVIEW

	// {{%UC%}} User code starts here (DO NOT remove this line)  

METHOD ClosePB( ) 
	self:EndDialog()
return self

CONSTRUCTOR(oParent,uExtra)

	SELF:PreInit(oParent,uExtra)

	SUPER(oParent , ResourceID{"EXIFDlg" , _GetInst()} , TRUE)

	SELF:oCCClosePB := PUSHBUTTON{SELF , ResourceID{ EXIFDLG_CLOSEPB  , _GetInst() } }
	SELF:oCCClosePB:HyperLabel := HyperLabel{#ClosePB , "Close" , NULL_STRING , NULL_STRING}

	SELF:oDCEXIFListView := LISTVIEW{SELF , ResourceID{ EXIFDLG_EXIFLISTVIEW  , _GetInst() } }
	SELF:oDCEXIFListView:GridLines := True
	SELF:oDCEXIFListView:FullRowSelect := True
	SELF:oDCEXIFListView:HyperLabel := HyperLabel{#EXIFListView , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:Caption := "EXIF Data"
	SELF:HyperLabel := HyperLabel{#EXIFDlg , "EXIF Data" , NULL_STRING , NULL_STRING}

	SELF:PostInit(oParent,uExtra)

RETURN


method PostInit(oParent,uExtra) 
	//Put your PostInit additions here
	local oLVColumn 	as ListViewColumn
	local oImgList		as	ImageList
	//
	oLVColumn := ListViewColumn{ 10 }
	oLVColumn:HyperLabel := HyperLabel{ #Item,"Item" }
	//
	self:oDCEXIFListView:AddColumn( oLVColumn )
	//
	oLVColumn := ListViewColumn{10 }
	oLVColumn:HyperLabel := HyperLabel{ #Value,"Value" }
	//
	self:oDCEXIFListView:AddColumn( oLVColumn )
	//
	oLVColumn := ListViewColumn{ }
	oLVColumn:HyperLabel := HyperLabel{ #Desc,"Description" }
	//
	self:oDCEXIFListView:AddColumn( oLVColumn )
	//
	oImgList := ImageList{ 1, Dimension{16,16} }
	oImgList:Add( ICON_GREEN{} )
	//
	self:oDCEXIFListView:SmallImageList := oImgList
	//	
	return nil

END CLASS

