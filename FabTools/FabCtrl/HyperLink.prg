USING VO


CLASS CURSOR_HAND INHERIT Pointer

CONSTRUCTOR() 
   super(ResourceID{"CURSOR_HAND", _GetInst()})
return 
END CLASS

CLASS FabHyperLink INHERIT FabCustomTextCntrl
	PROTECT cAction			AS	STRING
	PROTECT oPointer		AS	Pointer
	PROTECT lTransparent	AS	LOGIC
	PROTECT lAutoSize		AS	LOGIC
	
	ACCESS Action AS STRING  
RETURN SELF:cAction

ASSIGN Action( cNewAction AS STRING )   
	SELF:cAction := cNewAction
RETURN //SELF:cAction


ACCESS AutoSize AS LOGIC  
RETURN SELF:lAutoSize

ASSIGN AutoSize( lNewSet AS LOGIC )   
 SELF:lAutoSize := lNewSet

METHOD Dispatch( oEvent ) 
	LOCAL oHL 		AS HyperLabel
	LOCAL symName	AS	SYMBOL
	//
	IF ( oEvent:Message == WM_ERASEBKGND )
		//
		RETURN 1
	ELSEIF ( oEvent:Message == WM_SETCURSOR )
		//
		IF ( LoWord( oEvent:lParam ) == HTClient ) .and. ( oEvent:wParam == DWORD( _CAST, SELF:Handle() ) )
			SetCursor( SELF:oPointer:Handle() )
			SELF:EventReturnValue := 1
			RETURN 1
		ELSE
			RETURN 0
		ENDIF
	ELSEIF ( oEvent:Message == WM_LBUTTONUP )
		//
		oHL:=SELF:HyperLabel
		IF ( oHL!=NULL_OBJECT )
			symName := oHL:NameSym
		ENDIF
		//
		IF !Empty( SELF:Action )
			ShellExecute( SELF:Owner:Handle(), NULL_PSZ, String2Psz( SELF:cAction ), NULL_PSZ, NULL_PSZ, SW_SHOWNOACTIVATE )
		ELSEIF IsMethod( SELF:Owner, symName )
			Send( SELF:Owner, symName )
			RETURN 1
		ELSE
			IF !IsString( SELF:cCaption)
				SELF:cCaption := SELF:__GetText()
			ENDIF
			ShellExecute( SELF:Owner:Handle(), NULL_PSZ, String2Psz( SELF:cCaption ), NULL_PSZ, NULL_PSZ, SW_SHOWNOACTIVATE )
		ENDIF

	ENDIF
	//
RETURN SUPER:Dispatch( oEvent )



METHOD Draw( hDC AS PTR ) AS VOID  
	LOCAL liOldMode	AS	LONG
	LOCAL liNewMode	AS	LONG
	LOCAL dwOldClr	AS	DWORD
	LOCAL hOldFont	AS	PTR
	LOCAL Canvas	IS	_winRect
	LOCAL cText		AS	STRING
	LOCAL hBrush	AS	PTR
	LOCAL pNewSize	IS _WINSize
 	//
	hOldFont := SelectObject( hDC, SELF:oFont:Handle() )
    //
	cText := SELF:Caption
	// Fit the Text Size ?
	IF SELF:lAutoSize
		GetTextExtentPoint32(hDC, Cast2Psz(cText), long(SLen(cText)), @pNewSize )
		SetWindowPos( SELF:Handle(0), NULL_PTR, 0, 0, pNewSize:cx, pNewSize:cy, SWP_NOZORDER + SWP_NOACTIVATE + SWP_NOMOVE)
	ENDIF
	//
	GetClientRect( SELF:Handle(), @Canvas )
	//
	SELF:__SetColors( hDC )
	//
	dwOldClr := GetBkColor( hDC )
	// Need to draw the background ?
	IF !SELF:lTransparent
		hBrush := CreateSolidBrush( dwOldClr )
		FillRect( hDC, @Canvas, hBrush )
		DeleteObject( hBrush )
	ENDIF
	// We are always in TRANSPARENT mode for Text drawing
	liNewMode := TRANSPARENT
	liOldMode := SetBkMode( hDC, PTR(_CAST, liNewMode) )
	//
	TextOut( hDC, Canvas:Left, Canvas:Top,Cast2Psz( cText ), long(SLen( cText ) ))
    //
    SelectObject( hDC, hOldFont )
    SetBkMode( hDC, PTR(_CAST, liOldMode))
    //


return

CONSTRUCTOR( oOwner, xId, oPoint, oDimension, cRegclass, kStyle, lDataAware ) 
	LOCAL oFont		AS	Font
	//
	SUPER( oOwner, xId, oPoint, oDimension, cRegclass, kStyle, lDataAware )
	//
	SELF:Show()
	//
	SELF:SetFont( NULL_OBJECT )
	oFont := SELF:Font
	oFont:UnderLine := TRUE
	SELF:Font := oFont
	SELF:TextColor := Color{ 0, 0, 255 }
	SELF:oPointer := Cursor_Hand{}
	SELF:lAutoSize := TRUE
	SELF:lTransparent := FALSE
	//
	InvalidateRect( SELF:Handle(), NULL_PTR, TRUE )
	//
return 

ACCESS @@Transparent AS LOGIC  
RETURN SELF:lTransparent

ASSIGN @@Transparent( lNewSet AS LOGIC )   
	SELF:lTransparent := lNewSet
	SELF:Update()
RETURN //SELF:lTransparent

END CLASS

