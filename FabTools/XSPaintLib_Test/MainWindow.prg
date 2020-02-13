



#using System.Windows.Forms
#using FabPaintLib
CLASS MainWindow INHERIT System.Windows.Forms.Form
    
    PRIVATE menuStrip1 AS System.Windows.Forms.MenuStrip
    PRIVATE fileToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem
    PRIVATE openToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem
    PRIVATE fabPaintLib_Control21 AS FabPaintLib.Control.FabPaintLib_Control
    PRIVATE zoomToolStripMenuItem AS System.Windows.Forms.ToolStripMenuItem
    PRIVATE toolStripMenuItem100 AS System.Windows.Forms.ToolStripMenuItem
    PRIVATE toolStripMenuItem200 AS System.Windows.Forms.ToolStripMenuItem
    PRIVATE toolStripMenuItem300 AS System.Windows.Forms.ToolStripMenuItem
    PRIVATE toolStripMenuItem75 AS System.Windows.Forms.ToolStripMenuItem
    PRIVATE toolStripMenuItem50 AS System.Windows.Forms.ToolStripMenuItem
    /// <summary>
    /// Required designer variable.
    /// </summary>
    PRIVATE components AS System.ComponentModel.IContainer
    CONSTRUCTOR()
      SUPER()
      SELF:InitializeComponent()
      RETURN
    
   /// <summary>
   /// Clean up any resources being used.
   /// </summary>
   /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    PROTECTED VIRTUAL METHOD Dispose( disposing AS System.Boolean ) AS System.Void
      IF disposing && components != NULL
         components:Dispose()
      ENDIF
      SUPER:Dispose( disposing )
      RETURN
    
   /// <summary>
   /// Required method for Designer support - do not modify
   /// the contents of this method with the code editor.
   /// </summary>
    PRIVATE METHOD InitializeComponent() AS System.Void
        SELF:menuStrip1 := System.Windows.Forms.MenuStrip{}
        SELF:fileToolStripMenuItem := System.Windows.Forms.ToolStripMenuItem{}
        SELF:openToolStripMenuItem := System.Windows.Forms.ToolStripMenuItem{}
        SELF:zoomToolStripMenuItem := System.Windows.Forms.ToolStripMenuItem{}
        SELF:toolStripMenuItem100 := System.Windows.Forms.ToolStripMenuItem{}
        SELF:toolStripMenuItem200 := System.Windows.Forms.ToolStripMenuItem{}
        SELF:toolStripMenuItem300 := System.Windows.Forms.ToolStripMenuItem{}
        SELF:toolStripMenuItem75 := System.Windows.Forms.ToolStripMenuItem{}
        SELF:toolStripMenuItem50 := System.Windows.Forms.ToolStripMenuItem{}
        SELF:fabPaintLib_Control21 := FabPaintLib.Control.FabPaintLib_Control{}
        SELF:menuStrip1:SuspendLayout()
        SELF:SuspendLayout()
        // 
        // menuStrip1
        // 
        SELF:menuStrip1:Items:AddRange(<System.Windows.Forms.ToolStripItem>{ SELF:fileToolStripMenuItem, SELF:zoomToolStripMenuItem })
        SELF:menuStrip1:Location := System.Drawing.Point{0, 0}
        SELF:menuStrip1:Name := "menuStrip1"
        SELF:menuStrip1:Size := System.Drawing.Size{418, 24}
        SELF:menuStrip1:TabIndex := 0
        SELF:menuStrip1:Text := "menuStrip1"
        // 
        // fileToolStripMenuItem
        // 
        SELF:fileToolStripMenuItem:DropDownItems:AddRange(<System.Windows.Forms.ToolStripItem>{ SELF:openToolStripMenuItem })
        SELF:fileToolStripMenuItem:Name := "fileToolStripMenuItem"
        SELF:fileToolStripMenuItem:Size := System.Drawing.Size{37, 20}
        SELF:fileToolStripMenuItem:Text := "File"
        // 
        // openToolStripMenuItem
        // 
        SELF:openToolStripMenuItem:Name := "openToolStripMenuItem"
        SELF:openToolStripMenuItem:Size := System.Drawing.Size{103, 22}
        SELF:openToolStripMenuItem:Text := "Open"
        SELF:openToolStripMenuItem:Click += System.EventHandler{ SELF, @openToolStripMenuItem_Click() }
        // 
        // zoomToolStripMenuItem
        // 
        SELF:zoomToolStripMenuItem:DropDownItems:AddRange(<System.Windows.Forms.ToolStripItem>{ SELF:toolStripMenuItem100, SELF:toolStripMenuItem200, SELF:toolStripMenuItem300, SELF:toolStripMenuItem75, SELF:toolStripMenuItem50 })
        SELF:zoomToolStripMenuItem:Enabled := FALSE
        SELF:zoomToolStripMenuItem:Name := "zoomToolStripMenuItem"
        SELF:zoomToolStripMenuItem:Size := System.Drawing.Size{51, 20}
        SELF:zoomToolStripMenuItem:Text := "Zoom"
        // 
        // toolStripMenuItem100
        // 
        SELF:toolStripMenuItem100:Name := "toolStripMenuItem100"
        SELF:toolStripMenuItem100:Size := System.Drawing.Size{152, 22}
        SELF:toolStripMenuItem100:Text := "100%"
        SELF:toolStripMenuItem100:Click += System.EventHandler{ SELF, @toolStripMenuItem100_Click() }
        // 
        // toolStripMenuItem200
        // 
        SELF:toolStripMenuItem200:Name := "toolStripMenuItem200"
        SELF:toolStripMenuItem200:Size := System.Drawing.Size{152, 22}
        SELF:toolStripMenuItem200:Text := "200%"
        SELF:toolStripMenuItem200:Click += System.EventHandler{ SELF, @toolStripMenuItem200_Click() }
        // 
        // toolStripMenuItem300
        // 
        SELF:toolStripMenuItem300:Name := "toolStripMenuItem300"
        SELF:toolStripMenuItem300:Size := System.Drawing.Size{152, 22}
        SELF:toolStripMenuItem300:Text := "300%"
        SELF:toolStripMenuItem300:Click += System.EventHandler{ SELF, @toolStripMenuItem300_Click() }
        // 
        // toolStripMenuItem75
        // 
        SELF:toolStripMenuItem75:Name := "toolStripMenuItem75"
        SELF:toolStripMenuItem75:Size := System.Drawing.Size{152, 22}
        SELF:toolStripMenuItem75:Text := "75%"
        SELF:toolStripMenuItem75:Click += System.EventHandler{ SELF, @toolStripMenuItem75_Click() }
        // 
        // toolStripMenuItem50
        // 
        SELF:toolStripMenuItem50:Name := "toolStripMenuItem50"
        SELF:toolStripMenuItem50:Size := System.Drawing.Size{152, 22}
        SELF:toolStripMenuItem50:Text := "50%"
        SELF:toolStripMenuItem50:Click += System.EventHandler{ SELF, @toolStripMenuItem50_Click() }
        // 
        // fabPaintLib_Control21
        // 
        SELF:fabPaintLib_Control21:AutoScroll := TRUE
        SELF:fabPaintLib_Control21:AutoScrollMargin := System.Drawing.Size{418, 262}
        SELF:fabPaintLib_Control21:Dock := System.Windows.Forms.DockStyle.Fill
        SELF:fabPaintLib_Control21:Image := NULL
        SELF:fabPaintLib_Control21:Location := System.Drawing.Point{0, 24}
        SELF:fabPaintLib_Control21:Name := "fabPaintLib_Control21"
        SELF:fabPaintLib_Control21:Size := System.Drawing.Size{418, 262}
        SELF:fabPaintLib_Control21:TabIndex := 1
        SELF:fabPaintLib_Control21:Text := "fabPaintLib_Control21"
        SELF:fabPaintLib_Control21:Zoom := 1
        // 
        // MainWindow
        // 
        SELF:AutoScaleDimensions := System.Drawing.SizeF{((Single) 6), ((Single) 13)}
        SELF:AutoScaleMode := System.Windows.Forms.AutoScaleMode.Font
        SELF:ClientSize := System.Drawing.Size{418, 286}
        SELF:Controls:Add(SELF:fabPaintLib_Control21)
        SELF:Controls:Add(SELF:menuStrip1)
        SELF:MainMenuStrip := SELF:menuStrip1
        SELF:Name := "MainWindow"
        SELF:Text := "Test FabPaintLib in WinForms"
        SELF:menuStrip1:ResumeLayout(FALSE)
        SELF:menuStrip1:PerformLayout()
        SELF:ResumeLayout(FALSE)
        SELF:PerformLayout()
    
    PRIVATE METHOD openToolStripMenuItem_Click( sender AS System.Object, e AS System.EventArgs ) AS System.Void
	    local oOD   AS  OpenFileDialog
	    LOCAL oMP	AS	FabMultiPage
	    LOCAL oImg	AS	FabPaintLib
	    //
	    oOD := OpenFileDialog{}
	    oOD:Filter := "All Pictures|*.bmp;*.jpg;*.pcx;*.tga;*.tif;*.png;*.pct;*.dib;*.gif" + ;
	                    "|All files|*.*" + ;
	                    "|BMP - OS/2 or Windows Bitmap|*.bmp" + ;
	                    "|JPG - JPEG - JFIF Compliant|*.jpg" + ;
	                    "|PCX - Zsoft Paintbrush|*.pcx" + ;
	                    "|TGA - Truevision Targa|*.tga" + ;
	                    "|TIF - Tagged Image File Format|*.tif" + ;
	                    "|PNG - Portable Network Graphics|*.png" + ;
	                    "|PCT - Macintosh PICT|*.pct" + ;
	                    "|DIB - OS/2 or Windows DIB|*.dib" + ;
	                    "|GIF - GIF File|*.gif"
	    if ( oOD:ShowDialog() == DialogResult.OK )
		    // MultiPage File ?
		    oMP := FabMultiPage{ (String) oOD:FileName }
		    IF oMP:IsValid
			    // 
			    SELF:DoOpenFile(oOD:FileName )
		    ELSE
			    // No, try as a standard file....
			    SELF:DoOpenFile(oOD:FileName )
		    ENDIF
		    //
	    ENDIF   
    
        RETURN
        
        
    VIRTUAL METHOD DoOpenFile( cFileName AS System.String ) AS System.Void
        //
        SELF:fabPaintLib_Control21:Image := FabPaintLib{ cFileName }
        SELF:zoomToolStripMenuItem:Enabled := TRUE
     Return
     
    PRIVATE METHOD toolStripMenuItem100_Click( sender AS System.Object, e AS System.EventArgs ) AS System.Void
        SELF:fabPaintLib_Control21:Zoom := 1
        RETURN
    
    PRIVATE METHOD toolStripMenuItem200_Click( sender AS System.Object, e AS System.EventArgs ) AS System.Void
        SELF:fabPaintLib_Control21:Zoom := 2
        RETURN
    
    PRIVATE METHOD toolStripMenuItem300_Click( sender AS System.Object, e AS System.EventArgs ) AS System.Void
        SELF:fabPaintLib_Control21:Zoom := 3
        RETURN
    
    PRIVATE METHOD toolStripMenuItem75_Click( sender AS System.Object, e AS System.EventArgs ) AS System.Void
        SELF:fabPaintLib_Control21:Zoom := 0.75
        RETURN
    
    PRIVATE METHOD toolStripMenuItem50_Click( sender AS System.Object, e AS System.EventArgs ) AS System.Void
        SELF:fabPaintLib_Control21:Zoom := 0.5
        RETURN
END CLASS
