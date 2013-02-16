unit answedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RxRichEd, rxDBRichEd, DBCtrls, ExtCtrls, CCButtonPanel,
  rxSpeedbar, Mask, RXSpin, RxCombos, ImgList, DBGridEh, DBCtrlsEh,
  DBLookupEh, ExtDlgs, rxClipMon, uDBImages, Buttons, Grids, GridsEh,
  dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxNavigator,
  cxDBNavigator, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxSpinEdit, cxRichEdit;

type
  TAnswEditForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    SciensInfoPanel: TPanel;
    Label1: TLabel;
    AskEditPanel: TPanel;
    FormatBar: TSpeedBar;
    FontName: TFontComboBox;
    FontSize: TRxSpinEdit;
    SpeedbarSection3: TSpeedbarSection;
    BoldBtn: TSpeedItem;
    ItalicBtn: TSpeedItem;
    UnderlineBtn: TSpeedItem;
    ColorBtn: TSpeedItem;
    BackgroundBtn: TSpeedItem;
    LeftBtn: TSpeedItem;
    CenterBtn: TSpeedItem;
    RightBtn: TSpeedItem;
    SuperscriptBtn: TSpeedItem;
    SubscriptBtn: TSpeedItem;
    BulletsBtn: TSpeedItem;
    RxDBRichEdit1: TRxDBRichEdit;
    FontDialog: TFontDialog;
    ToolbarImages: TImageList;
    SpeedbarSection4: TSpeedbarSection;
    CutBtn: TSpeedItem;
    CopyBtn: TSpeedItem;
    PasteBtn: TSpeedItem;
    UndoBtn: TSpeedItem;
    RedoBtn: TSpeedItem;
    Label3: TLabel;
    Label4: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    OpenPictureDialog1: TOpenPictureDialog;
    PasteSpecBtn: TSpeedItem;
    FontBtn: TSpeedItem;
    ImagEditPanel: TPanel;
    AnswDBImage: TpDBImage;
    DelPictSpeedButton: TSpeedButton;
    AddPictSpeedButton: TSpeedButton;
    AddPictFromClipSpeedButton: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    DBEditEh1: TDBEditEh;
    AnswerListGB: TGroupBox;
    RxDBRichEdit2: TRxDBRichEdit;
    AddAnswerSButton: TSpeedButton;
    SpecPasteSpeedButton: TSpeedButton;
    RxRichEdit1: TRxRichEdit;
    answersDBNavigator: TcxDBNavigator;
    AnswGridDBTableView1: TcxGridDBTableView;
    AnswGridLevel1: TcxGridLevel;
    AnswGrid: TcxGrid;
    AnswGridDBTableView1ID_ANSWER: TcxGridDBColumn;
    AnswGridDBTableView1ASK_ID: TcxGridDBColumn;
    AnswGridDBTableView1WEIGHT: TcxGridDBColumn;
    AnswGridDBTableView1EXPLANATION: TcxGridDBColumn;
    AnswGridDBTableView1ANSWERTEXT1: TcxGridDBColumn;
    AnswGridDBTableView1ANSWERIMAG: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5content: TcxStyle;
    right_answ_row: TcxStyle;
    procedure SelectionChange(Sender: TObject);
    function CurrText: TRxTextAttributes;

    procedure FormPaint(Sender: TObject);
    procedure SetEditRect;
    procedure RichEditChange(Sender: TObject);
    procedure FocusEditor;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure UpdateCursorPos;
    procedure ClipboardChanged(Sender: TObject);
    procedure EditUndo(Sender: TObject);
    procedure EditRedo(Sender: TObject);
    procedure EditCut(Sender: TObject);
    procedure EditCopy(Sender: TObject);
    procedure EditPaste(Sender: TObject);
    procedure EditPasteSpecialClick(Sender: TObject);

    procedure SelectFont(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure SubscriptClick(Sender: TObject);
    procedure AlignButtonClick(Sender: TObject);

    procedure BulletsButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DelPictSpeedButtonClick(Sender: TObject);
    procedure AddPictSpeedButtonClick(Sender: TObject);
    procedure AddPictFromClipSpeedButtonClick(Sender: TObject);
    procedure ButtonPanel1ButtonOkClick(Sender: TObject);

    function PerformTextClean:boolean;

    procedure DeleteWrongSymbolsBefore;
    procedure DeleteWrongSymbolsAfter;
    procedure SetParagraphFormat;
    procedure AddAnswerSButtonClick(Sender: TObject);
    procedure DBNumberEditEh1Change(Sender: TObject);
    procedure SpecPasteSpeedButtonClick(Sender: TObject);
    procedure AnswGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
    FUpdating: Boolean;
    FClipboardMonitor: TClipboardMonitor;
  public
    { Public declarations }
  end;

var
  AnswEditForm: TAnswEditForm;

const
  GutterWid: Integer = 6;

  
implementation

uses {DB,} jpeg, datamod, basevar, Clipbrd, sendkey;
{$R *.dfm}

procedure TAnswEditForm.SelectionChange(Sender: TObject);
begin
  with RxDBRichEdit1.Paragraph do
  try
    FUpdating := True;
    BoldBtn.Down := fsBold in CurrText.Style;
    //BoldBtn.Down := fsBold in RxDBRichEdit1.SelAttributes.Style;
    ItalicBtn.Down := fsItalic in CurrText.Style;
    UnderlineBtn.Down := fsUnderline in CurrText.Style;
    BulletsBtn.Down := Boolean(Numbering);
    SuperscriptBtn.Down := CurrText.SubscriptStyle = ssSuperscript;
    SubscriptBtn.Down := CurrText.SubscriptStyle = ssSubscript;
    FontSize.AsInteger := CurrText.Size;
    FontName.FontName := CurrText.Name;

    case Ord(Alignment) of
      0: LeftBtn.Down := True;
      1: RightBtn.Down := True;
      2: CenterBtn.Down := True;
    end;
    UpdateCursorPos;
  finally
    FUpdating := False;
  end;
end;
{======================================================}
function TAnswEditForm.CurrText: TRxTextAttributes;
begin
  if RxDBRichEdit1.SelLength > 0 then Result := RxDBRichEdit1.SelAttributes
  else Result := RxDBRichEdit1.WordAttributes;
end;
{======================================================}
procedure TAnswEditForm.FormPaint(Sender: TObject);
begin
  SetEditRect;
end;
{======================================================}
procedure TAnswEditForm.SetEditRect;
var
  R: TRect;
  Offs: Integer;
begin
  with RxDBRichEdit1 do begin
    if SelectionBar then Offs := 3 else Offs := 0;
    R := Rect(GutterWid + Offs, 0, ClientWidth - GutterWid, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
  end;
end;
{======================================================}
procedure TAnswEditForm.FormCreate(Sender: TObject);
begin
  OpenPictureDialog1.InitialDir := ExtractFilePath(ParamStr(0));

  HandleNeeded;
  SelectionChange(Self);

  FClipboardMonitor := TClipboardMonitor.Create(Self);
  FClipboardMonitor.OnChange := ClipboardChanged;
  SuperscriptBtn.Enabled := RichEditVersion >= 2;
  SubscriptBtn.Enabled := RichEditVersion >= 2;
  BackgroundBtn.Enabled := RichEditVersion >= 2;
end;
{======================================================}
procedure TAnswEditForm.ClipboardChanged(Sender: TObject);
var
  E: Boolean;
begin
  { check to see if we can paste what's on the clipboard }
  E := RxDBRichEdit1.CanPaste;
  PasteBtn.Enabled := E;
  PasteSpecBtn.Enabled := E;
end;
{======================================================}
procedure TAnswEditForm.EditUndo(Sender: TObject);
begin
  RxDBRichEdit1.Undo;
  RichEditChange(nil);
  SelectionChange(nil);
end;
{======================================================}
procedure TAnswEditForm.EditRedo(Sender: TObject);
begin
  RxDBRichEdit1.Redo;
  RichEditChange(nil);
  SelectionChange(nil);
end;
{======================================================}
procedure TAnswEditForm.EditCut(Sender: TObject);
begin
  RxDBRichEdit1.CutToClipboard;
end;
{======================================================}
procedure TAnswEditForm.EditCopy(Sender: TObject);
begin
  RxDBRichEdit1.CopyToClipboard;
end;
{======================================================}
procedure TAnswEditForm.EditPaste(Sender: TObject);
begin
  RxDBRichEdit1.PasteFromClipboard;
end;
{======================================================}
procedure TAnswEditForm.EditPasteSpecialClick(Sender: TObject);
begin
  try
    RxDBRichEdit1.PasteSpecialDialog;
  finally
    FocusEditor;
  end;
end;
{======================================================}
procedure TAnswEditForm.RichEditChange(Sender: TObject);
begin
  UndoBtn.Enabled := RxDBRichEdit1.CanUndo;
  RedoBtn.Enabled := RxDBRichEdit1.CanRedo;
end;
{======================================================}
procedure TAnswEditForm.FocusEditor;
begin
  with RxDBRichEdit1 do if CanFocus then SetFocus;
end;
{======================================================}
procedure TAnswEditForm.SelectFont(Sender: TObject);
begin
  FontDialog.Font.Assign(RxDBRichEdit1.SelAttributes);
  if FontDialog.Execute then CurrText.Assign(FontDialog.Font);
  FocusEditor;
end;
{======================================================}
procedure TAnswEditForm.FontNameChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Name := FontName.FontName;
end;
{======================================================}
procedure TAnswEditForm.FontSizeChange(Sender: TObject);
begin
  if FUpdating then Exit;
  if FontSize.AsInteger > 0 then CurrText.Size := FontSize.AsInteger;
end;
{======================================================}
procedure TAnswEditForm.BoldButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if BoldBtn.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;
{======================================================}
procedure TAnswEditForm.ItalicButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if ItalicBtn.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;
{======================================================}
procedure TAnswEditForm.UnderlineButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if UnderlineBtn.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;
{======================================================}
procedure TAnswEditForm.SubscriptClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if SuperscriptBtn.Down then
    CurrText.SubscriptStyle := ssSuperscript
  else if SubscriptBtn.Down then
    CurrText.SubscriptStyle := ssSubscript
  else
    CurrText.SubscriptStyle := ssNone;
end;
{======================================================}
procedure TAnswEditForm.AlignButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  RxDBRichEdit1.Paragraph.Alignment := TParaAlignment(TComponent(Sender).Tag);
end;
{======================================================}
procedure TAnswEditForm.BulletsButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  RxDBRichEdit1.Paragraph.Numbering := TRxNumbering(BulletsBtn.Down);
end;
{======================================================}
procedure TAnswEditForm.UpdateCursorPos;
var
  CharPos: TPoint;
begin
  CharPos := RxDBRichEdit1.CaretPos;
  { update the status of the cut and copy command }
  CopyBtn.Enabled := RxDBRichEdit1.SelLength > 0;
  CutBtn.Enabled := CopyBtn.Enabled;
//  EditObjPropsItem.Enabled := RxDBRichEdit1.SelectionType = [stObject];
end;
{======================================================}
procedure TAnswEditForm.FormShow(Sender: TObject);
begin
  UpdateCursorPos;
//  DragAcceptFiles(Handle, True);
  RichEditChange(nil);
  FocusEditor;
  ClipboardChanged(nil);
end;
{======================================================}
procedure TAnswEditForm.FormDestroy(Sender: TObject);
begin
  { remove ourselves from the viewer chain }
  FClipboardMonitor.Free;
end;
{======================================================}
procedure TAnswEditForm.FormActivate(Sender: TObject);
begin
  FocusEditor;
end;
{======================================================}
procedure TAnswEditForm.DelPictSpeedButtonClick(Sender: TObject);
begin
  AnswDBImage.DataSource.DataSet.Edit;
  AnswDBImage.Field.Clear;
  AnswDBImage.DataSource.DataSet.Post;
//  AnswDBImage.Refresh;
end;
{======================================================}
procedure TAnswEditForm.AddPictSpeedButtonClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute= True then
  begin
    try
      TBlobField(AnswDBImage.DataSource.DataSet.FieldByName('ANSWERIMAG')).LoadFromFile(OpenPictureDialog1.FileName);
    except
      on EInvalidGraphic do
        AnswDBImage.Picture.Graphic := nil;
    end;
  end;
end;
{======================================================}
procedure TAnswEditForm.AddPictFromClipSpeedButtonClick(Sender: TObject);
begin
//TODO: works only when ANY object paste form MS WORD!!!
//TODO: but not works whrn object paste directly from server application (ex. ChemDraw and etc.)
  AnswDBImage.PasteFromClipboard;
end;
{======================================================}
procedure TAnswEditForm.SpecPasteSpeedButtonClick(Sender: TObject);
begin
  RxRichEdit1.Clear;
  try
    RxRichEdit1.PasteSpecialDialog;
  finally
    RxRichEdit1.SetFocus;
  end;
  RxRichEdit1.CopyToClipboard;
  AnswDBImage.PasteFromClipboard;
  RxRichEdit1.Clear;
end;
{======================================================}
procedure TAnswEditForm.AddAnswerSButtonClick(Sender: TObject);
begin
  //clear text and check result      //if any characters exist then append new record
  if PerformTextClean = true
  then answersDBNavigator.DataSource.DataSet.Append
  else MessageDlg('Відсутній текст відповіді!', mtError, [mbOk], 0);
///  answerDBNavigator.DataSource.DataSet.Append;
end;
{======================================================}
procedure TAnswEditForm.ButtonPanel1ButtonOkClick(Sender: TObject);
begin
  //clean text and check result
  if PerformTextClean = false then //not any character
  begin  //text not exist!
    MessageDlg('Відсутній текст відповіді!', mtError, [mbOk], 0);
    AnswEditForm.ModalResult := mrCancel;
  end;
end;
{======================================================}
function TAnswEditForm.PerformTextClean : boolean;
begin
  result := true;//cleaninng completed OK!
  //apply default font size
  RxDBRichEdit1.SetFocus;
  RxDBRichEdit1.SelectAll;
  if Settings.MinFontSt = true then RxDBRichEdit1.SelAttributes.Size := Settings.MinFontSize;
  //apply settings: delete empty lines, spaces, tabs anywhere in text
  if (Settings.AnswerFormatSt)and(length(RxDBRichEdit1.Lines.Text) > 0) then DeleteWrongSymbolsBefore;
  if (Settings.AnswerFormatSt)and(length(RxDBRichEdit1.Lines.Text) > 0) then DeleteWrongSymbolsAfter;
  if (Settings.AnswerFormatSt)and(length(RxDBRichEdit1.Lines.Text) > 0) then SetParagraphFormat;
  //check result
  if length(RxDBRichEdit1.Lines.Text) = 0 then result := false;//all text was deleted - mistake!
end;

{======================================================}
procedure TAnswEditForm.DeleteWrongSymbolsBefore;
//delete empty lines and spec symbols at the start of the text
var
  i : integer;
  tmpchar : char;
  tmpstr : string;
  stop : boolean;
begin
  RxDBRichEdit1.SetFocus;
  i := 0;
  RxDBRichEdit1.SelStart := i;
  stop := false;
  repeat
    inc(i);
    RxDBRichEdit1.SelLength := i;
    if (RxDBRichEdit1.SelectionType = [stText])or(RxDBRichEdit1.SelectionType = [stText, stMultiChar]) then
    begin
      tmpstr := RxDBRichEdit1.SelText;
      tmpchar := tmpstr[i];
      if not (tmpchar in SpecSymb) then stop := true; //there - text!
    end
    else stop := true; //there - object!
  until stop = true;
  //go back on one character!
  RxDBRichEdit1.SelLength := i-1;
  //delete text
  if RxDBRichEdit1.SelLength > 0 then RxDBRichEdit1.ClearSelection;
end;
{==============================================}
procedure TAnswEditForm.DeleteWrongSymbolsAfter;
//delete empty lines and spec symbols at the end of the text
var
  i : integer;
  tmpchar : char;
  tmpstr : string;
  stop : boolean;
begin
  RxDBRichEdit1.SetFocus;
  i := length(RxDBRichEdit1.text);
  stop := false;
  repeat
    dec(i);
    RxDBRichEdit1.SelStart := i;
    RxDBRichEdit1.SelLength := 1;
    if (RxDBRichEdit1.SelectionType = [stText])or(RxDBRichEdit1.SelectionType = [stText, stMultiChar]) then
    begin
      tmpstr := RxDBRichEdit1.SelText;
      if tmpstr <> '' then   //real interpretation of the symbol #10
      begin
        tmpchar := tmpstr[1];
        if not (tmpchar in SpecSymb) then stop := true; //there - text!
      end;
    end
    else stop := true; //there - object!
  until stop = true;
  //go forward on one character!
  RxDBRichEdit1.SelStart := i+1;
  RxDBRichEdit1.SelLength := length(RxDBRichEdit1.text)-1-i;
  //delete text
  if RxDBRichEdit1.SelLength > 0 then RxDBRichEdit1.ClearSelection;
end;
{============================================================}
procedure TAnswEditForm.SetParagraphFormat;
//set standart paragraph forat
begin
  RxDBRichEdit1.SetFocus;
  //select all text
  RxDBRichEdit1.SelectAll;
  //set standart paragraph forat
  RxDBRichEdit1.Paragraph.Alignment := paLeftJustify;
  RxDBRichEdit1.Paragraph.FirstIndent := 0;
  RxDBRichEdit1.Paragraph.LeftIndent := 0;
  RxDBRichEdit1.Paragraph.RightIndent := 0;
  RxDBRichEdit1.Paragraph.SpaceAfter := 0;
  RxDBRichEdit1.Paragraph.SpaceBefore := 0;
  RxDBRichEdit1.Paragraph.LineSpacingRule := lsSingle;
  RxDBRichEdit1.Paragraph.NumberingStyle := nsSimple;
  RxDBRichEdit1.Paragraph.Numbering := nsNone;
end;
{============================================================}
{------------------------------------------------------------}
procedure TAnswEditForm.DBNumberEditEh1Change(Sender: TObject);
begin
  AnswGridDBTableView1.DataController.Refresh;
end;
{---------chnge row colors for the right answer--------------}
procedure TAnswEditForm.AnswGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[AnswGridDBTableView1.GetColumnByFieldName('WEIGHT').Index]>0 then
     ACanvas.Canvas.Brush.Color := $fbcf23;
end;

end.
