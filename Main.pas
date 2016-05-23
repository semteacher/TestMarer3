unit Main;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls, Grids,
  DBGridEh, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  DBCtrls, RxRichEd, rxDBRichEd, {uDBImages,} Mask, DBCtrlsEh,
  DBLookupEh, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList, RXSpin,
  EhLibFIB, DBTables, FIBQuery, pFIBQuery, DBGrids, DBGridEhImpExp,
  pFIBProps, DBGridEhFindDlgs, GridsEh, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxRichEdit, cxRadioGroup, cxCheckBox,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxLookAndFeels,
  cxTextEdit, cxSpinEdit, cxNavigator, cxDBNavigator, frxClass, Variants,
  RXSplit, StrUtils, frxExportRTF, FileCtrl{, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue};

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FilePrintSetupItem: TMenuItem;
    FileExitItem: TMenuItem;
    HelpContentsItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    StatusLine: TStatusBar;
    PrintSetupDialog: TPrinterSetupDialog;
    ReferenceMenu: TMenuItem;
    LangLibEditItem: TMenuItem;
    SciensLibEditItem: TMenuItem;
    UsersLibEditItem: TMenuItem;
    N5: TMenuItem;
    MainActionList: TActionList;
    LangLibEdit: TAction;
    SciensLibEdit: TAction;
    UserLibEdit: TAction;
    ToolsMenu: TMenuItem;
    SettingsEditItem: TMenuItem;
    SettingsEdit: TAction;
    AskOpenEditorCmd: TAction;
    AddAskCmd: TAction;
    DelAskCmd: TAction;
    AnswerOpenEditorCmd: TAction;
    SelDepDBLComboboxEh: TDBLookupComboboxEh;
    Label5: TLabel;
    PageControl1: TPageControl;
    AskEditTab: TTabSheet;
    TestEditTab: TTabSheet;
    AddOffPaper: TAction;
    DelOffPaper: TAction;
    ExpOffPaper: TAction;
    ExpAnswers: TAction;
    ExpPaperWithAnsw: TAction;
    AdvModulesEdit: TAction;
    PrepareExport: TAction;
    ExchangeAsk: TAction;
    EditSelectedObj: TAction;
    DepLibEdit: TAction;
    DepLibEditItem: TMenuItem;
    PrintAskList: TAction;
    PrintAskListItem: TMenuItem;
    PrintAskListWithoutAnsw: TAction;
    TestAskPopupMenu: TPopupMenu;
    SelectDel: TMenuItem;
    N12: TMenuItem;
    SelectToArch: TMenuItem;
    ExpModulesRtf: TAction;
    SaveDialog1: TSaveDialog;
    CloneTestCmd: TAction;
    N2: TMenuItem;
    N6: TMenuItem;
    ImportFromWordCmd: TAction;
    MSWord1: TMenuItem;
    OpenDialogDOC: TOpenDialog;
    ProgressRG: TRadioGroup;
    PgBar1: TProgressBar;
    AboutCmd: TAction;
    ExchangeAnswOrder: TAction;
    PaperAddAnswerCmd: TAction;
    PaperDelAnswerCmd: TAction;
    ExpOffPaperRTF: TAction;
    SaveDialog2: TSaveDialog;
    cxStyleRepository1: TcxStyleRepository;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    AddAnswerCmd: TAction;
    N7: TMenuItem;
    SelectMoveCmd: TMenuItem;
    OpenDialogTXT: TOpenDialog;
    ExportMoodleCmd: TAction;
    ImportMoodleCmd: TAction;
    N8: TMenuItem;
    AIKENMOODLE1: TMenuItem;
    AIKENMOODLE2: TMenuItem;
    SaveDialog3: TSaveDialog;
    ExpOffModuleWord: TAction;
    PrintOffPaperFReport: TAction;
    ClonePaperCmd: TAction;
    PrintOffPaperWithAnsw: TAction;
    RepAskCountCalcCmd: TAction;
    cxStyle6content: TcxStyle;
    ReportMenu: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    RTF1: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    Answer2Print: TMenuItem;
    ExpAnswersWord: TAction;
    Answer2MSWord: TMenuItem;
    ImportMoodleXMLCmd: TAction;
    MOODLEXML1: TMenuItem;
    OpenDialogXML: TOpenDialog;
    N14: TMenuItem;
    UpdateAskcountCmd: TAction;
    AskCountUpdate: TMenuItem;
    tests2paperspane: TPanel;
    papers2previewPanel: TPanel;
    test2papersplitter: TSplitter;
    papersPanel: TPanel;
    PapersGB: TGroupBox;
    NewPaperSB: TSpeedButton;
    DelPaperSB: TSpeedButton;
    ExpPaperSpeedButton: TSpeedButton;
    ExpPaperAnswSB: TSpeedButton;
    ExpAnswerSB: TSpeedButton;
    ExpPaperWOutAnswSB: TSpeedButton;
    ExPaperRTFSpeedBut: TSpeedButton;
    ExpModuleWordSB: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ClonePaperSB: TSpeedButton;
    AnswRepSB: TSpeedButton;
    PapersDBGridEh: TDBGridEh;
    PapersDBNavigator: TDBNavigator;
    paper2previewSplitter: TSplitter;
    Panel4: TPanel;
    PrintGB: TGroupBox;
    ChangeAskSButton: TSpeedButton;
    EditObjSButton: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton1: TSpeedButton;
    RedyPaperDBNavigator: TDBNavigator;
    RedyPaperTextDBRichEdit: TRxDBRichEdit;
    RedyParerDBGridEh: TDBGridEh;
    test2modulespane: TPanel;
    test2modulessplitter: TSplitter;
    Panel6: TPanel;
    TestModGB: TGroupBox;
    AdvTestModEditSpeedButton: TSpeedButton;
    ExpModListSBut: TSpeedButton;
    TestModDBGridEh: TDBGridEh;
    TestModDBNavigator: TDBNavigator;
    subjPanel: TPanel;
    SubjectGB: TGroupBox;
    SubjectDBGridEh: TDBGridEh;
    SubjectDBNavigator: TDBNavigator;
    subj2testsSplitter: TSplitter;
    Panel8: TPanel;
    TestGroupBox: TGroupBox;
    CloneTestSB: TSpeedButton;
    TestDBGridEh: TDBGridEh;
    TestDBNavigator: TDBNavigator;
    AskGB: TGroupBox;
    AskEditSpeedButton: TSpeedButton;
    AddAskSpeedButton: TSpeedButton;
    DelAskSpeedButton: TSpeedButton;
    AnswEditSpeedButton: TSpeedButton;
    AskAnswGrid: TcxGrid;
    AskGridDBTableView: TcxGridDBTableView;
    AskGridDBTableViewID_ASK: TcxGridDBColumn;
    AskGridDBTableViewSCIENS_ID: TcxGridDBColumn;
    AskGridDBTableViewASKTEXT: TcxGridDBColumn;
    AskGridDBTableViewASKTEXT2: TcxGridDBColumn;
    AskGridDBTableViewASKIMAGE: TcxGridDBColumn;
    AskGridDBTableViewPOINTS: TcxGridDBColumn;
    AskGridDBTableViewFREQUENT: TcxGridDBColumn;
    AskGridDBTableViewID_ASKTYPE: TcxGridDBColumn;
    AskGridDBTableViewANSWCOUNT: TcxGridDBColumn;
    AskGridDBTableViewARCHIVE: TcxGridDBColumn;
    AskGridDBTableViewask_tepe_search: TcxGridDBColumn;
    AnswGridDBTableView1: TcxGridDBTableView;
    AnswGridDBTableView1ID_ANSWER: TcxGridDBColumn;
    AnswGridDBTableView1ANSWERTEXT1: TcxGridDBColumn;
    AnswGridDBTableView1ASK_ID: TcxGridDBColumn;
    AnswGridDBTableView1WEIGHT: TcxGridDBColumn;
    AnswGridDBTableView1EXPLANATION: TcxGridDBColumn;
    AnswGridDBTableView1ANSWERIMAG: TcxGridDBColumn;
    AskGrid1Level1: TcxGridLevel;
    AnswGridLevel2: TcxGridLevel;
    AskRxDBRichEdit: TRxDBRichEdit;
    SciensGB: TGroupBox;
    ModulesDBGridEh: TDBGridEh;
    ModulesDBNavigator: TDBNavigator;
    AnswerRxDBRichEdit: TRxDBRichEdit;
    sciens2asksSplitter: TSplitter;
    SelectFromArch: TMenuItem;
    InvSearchSBut: TSpeedButton;
    InvalidAskSearchCmd: TAction;
    PrintAskListOnly: TAction;
    PrintAskListItem3: TMenuItem;
    N16: TMenuItem;
    PrintAskAnswerOnly: TAction;
    PrintAnswersListItem: TMenuItem;
    PrintAskListWithoutAnsw2: TAction;
    PrintAskListItem4: TMenuItem;
    BatchAskListWithAnswer: TAction;
    N17: TMenuItem;
    BatchPrintAskListItem: TMenuItem;
    SrchAnswerlessQstCmd: TAction;
    N15: TMenuItem;
    AnswerlessQstMenu: TMenuItem;
    InvalidQstenu: TMenuItem;
    SrchAnswerCountNotEqueaCmd: TAction;
    AnswerLessThenMenu: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FilePrintSetup(Sender: TObject);
    procedure FileExit(Sender: TObject);
    procedure HelpContents(Sender: TObject);
    procedure HelpSearch(Sender: TObject);
    procedure HelpHowToUse(Sender: TObject);
    procedure HelpAbout(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ModulesDBGridEhTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure LangLibEditExecute(Sender: TObject);
    procedure SciensLibEditExecute(Sender: TObject);
    procedure UserLibEditExecute(Sender: TObject);
    procedure SettingsEditExecute(Sender: TObject);
    procedure AskOpenEditorCmdExecute(Sender: TObject);
    procedure SelDepDBLComboboxEhCloseUp(Sender: TObject; Accept: Boolean);
    procedure AddAskCmdExecute(Sender: TObject);
    procedure DelAskCmdExecute(Sender: TObject);
    procedure AddAnswerCmdExecute(Sender: TObject);
    procedure AnswerOpenEditorCmdExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StartUserLogin;
    procedure SetuserPermissions;
    procedure ModulesDBGridEhExit(Sender: TObject);
    procedure ExpOffPaperExecute(Sender: TObject);
    procedure PrepareExportExecute(Sender: TObject);
    procedure ExpPaperWithAnswExecute(Sender: TObject);
    procedure ExpAnswersExecute(Sender: TObject);
    procedure SubjectDBGridEhExit(Sender: TObject);
    procedure TestDBGridEhExit(Sender: TObject);
    procedure TestModDBGridEhExit(Sender: TObject);
    procedure PapersDBGridEhExit(Sender: TObject);
    procedure ExchangeAskExecute(Sender: TObject);
    procedure DelOffPaperExecute(Sender: TObject);
    procedure AddOffPaperExecute(Sender: TObject);
    procedure SetProgressBar(pb_min, pb_max, pb_steep, pb_pos: integer);
    procedure ProgressBarStepIt(pb_steep: integer);
    procedure ProgressBarPosition (pb_pos: integer);
    procedure AdvModulesEditExecute(Sender: TObject);
    procedure EditSelectedObjExecute(Sender: TObject);
    procedure DepLibEditExecute(Sender: TObject);
    procedure PrintAskListExecute(Sender: TObject);
    procedure PrintAskListWithoutAnswExecute(Sender: TObject);
    procedure SelectDelClick(Sender: TObject);
    procedure SelectToArchClick(Sender: TObject);
    procedure SubjectDBGridEhTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure TestDBGridEhTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure ExpModulesRtfExecute(Sender: TObject);
    procedure RedyParerDBGridEhDblClick(Sender: TObject);
    procedure PapersDBGridEhTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure CloneTestCmdExecute(Sender: TObject);
    procedure SelectMoveClick(Sender: TObject);
    procedure ImportFromWordCmdExecute(Sender: TObject);
    procedure AboutCmdExecute(Sender: TObject);
    procedure AnswerDBGridEhDblClick(Sender: TObject);
    procedure ExchangeAnswOrderExecute(Sender: TObject);
    procedure PaperAddAnswerCmdExecute(Sender: TObject);
    procedure PaperDelAnswerCmdExecute(Sender: TObject);
    procedure ExpOffPaperRTFExecute(Sender: TObject);
    procedure AskGridDBTableViewDblClick(Sender: TObject);
    procedure AnswGridDBTableView1DblClick(Sender: TObject);
    procedure AskAnswGridExit(Sender: TObject);
    procedure AskGridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure AskGridDBTableViewDataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure ExportMoodleCmdExecute(Sender: TObject);
    procedure ImportMoodleCmdExecute(Sender: TObject);
    procedure ExpOffModuleWordExecute(Sender: TObject);
    procedure PrintOffPaperFReportExecute(Sender: TObject);
    procedure ClonePaperCmdExecute(Sender: TObject);

    procedure CheckPreparePaper(showansw:boolean);
    procedure PrintOffPaperWithAnswExecute(Sender: TObject);
    procedure ExpAnswersWordExecute(Sender: TObject);
    procedure TestEditTabShow(Sender: TObject);
    procedure ImportMoodleXMLCmdExecute(Sender: TObject);
    procedure UpdateAskcountCmdExecute(Sender: TObject);
    procedure AskGridDBTableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure AskGridDBTableViewSelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure FormResize(Sender: TObject);
    procedure AskGridDBTableViewDataControllerFilterChanged(
      Sender: TObject);
    procedure SelectFromArchClick(Sender: TObject);
    procedure changeArchiveStatus(archivestatus:boolean);
    procedure AskGridDBTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure AnswGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure InvalidAskSearchCmdExecute(Sender: TObject);
    procedure PrintAskListOnlyExecute(Sender: TObject);
    procedure PrintAskAnswerOnlyExecute(Sender: TObject);
    procedure BatchAskListWithAnswerExecute(Sender: TObject);

    function GetSpecialPath(CSIDL: word): string;
    function FileNameAutoCorrect(AFileName: string): String;
    procedure SrchAnswerlessQstCmdExecute(Sender: TObject);
    procedure SrchAnswerCountNotEqueaCmdExecute(Sender: TObject);
  private
    { Private declarations }
    ShowAnswers, AllowExportPapersFR : boolean;

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses ExtActns, MyUtils, askedit, langRef, LibScRef, UserRef, about, settings, askmanager,
     datamod, basevar, answedit, login, mykernel, advtestmodedit, DepEdit, ShlObj;
{$r *.dfm}
{====================================================}
procedure TMainForm.ShowHint(Sender: TObject);
begin
  StatusLine.SimpleText := Application.Hint;
end;
{=========================================================}
procedure TMainForm.FilePrintSetup(Sender: TObject);
begin
  PrintSetupDialog.Execute;
end;
{=========================================================}
procedure TMainForm.FileExit(Sender: TObject);
begin
  Close;
end;
{=========================================================}
procedure TMainForm.HelpContents(Sender: TObject);
var
  myhelpfilerun : TFileRun;
begin
   myhelpfilerun := TFileRun.Create(self);
   myhelpfilerun.Directory := extractfilepath(application.ExeName);
   myhelpfilerun.FileName := 'TestMaker3.chm';
   myhelpfilerun.Execute;
   myhelpfilerun.Free;
end;
{=========================================================}
procedure TMainForm.HelpSearch(Sender: TObject);
const
  EmptyString: PChar = '';
begin
  Application.HelpCommand(HELP_PARTIALKEY, Longint(EmptyString));
end;

procedure TMainForm.HelpHowToUse(Sender: TObject);
begin
  Application.HelpCommand(HELP_HELPONHELP, 0);
end;

procedure TMainForm.HelpAbout(Sender: TObject);
begin
  { Add code to show program's About Box }
end;
{=========================================================}
{-------Create main form - set deafult settings-----------}
procedure TMainForm.FormCreate(Sender: TObject);
var
  TempCaption : string;
begin
  randomize;
  //1-set Windows title bar
  TempCaption := Format('%s (%s)', [ProductName, CurrFileVersion.FileVersion]);
  Caption := TempCaption;
  Application.Title := TempCaption;
  Application.OnHint := ShowHint;
  //2-Load settings from registry
  basevar.Settings.AppLoadSettings;
  //3-connect to database
//  testeditDM.DatabaseConnect;
end;
{=========================================================}
{-------Destroy main form - save current settings---------}
procedure TMainForm.FormDestroy(Sender: TObject);
begin
  //save settings to registry
  basevar.Settings.AppSaveSettings;
  //delete objects
  basevar.Settings.Free;
end;
{=========================================================}
{------------Activate main form----------------------}
procedure TMainForm.FormActivate(Sender: TObject);
begin
  //defaults
  AllowExportPapersFR := true;
  //maximize main window
  MainForm.WindowState := wsMaximized;
  //display editor tab
  AskEditTab.Show;
  //database user login - only if database not connected {+2012-05-17}
  if testeditDM.TestDB.Connected=false then StartUserLogin;
  //show current departmnet name
//  if basevar.settings.DBConnected then SelDepDBLComboboxEh.KeyValue := SelDepDBLComboboxEh.ListSource.DataSet.FieldByName('DEPID').asinteger;
  if testeditDM.TestDB.Connected=true then SelDepDBLComboboxEh.KeyValue := SelDepDBLComboboxEh.ListSource.DataSet.FieldByName('DEPID').asinteger;
  //set focus to module list
  ModulesDBGridEh.SetFocus;
end;
{====================================================}
{----------------start login dialog------------------}
procedure TMainForm.StartUserLogin;
var
  TempCaption : string;
begin
  //manually create a login form                         {+2012-05-17}
  Application.CreateForm(TLoginForm, LoginForm);
  //display login form
  if LoginForm.ShowModal = mrOK then  //OK button was pressed
  begin
    //connect to db with current user login
    testeditDM.DatabaseUserConnect;
    if testeditDM.TestDB.Connected then
    begin
      {+2010-05-25}
      TempCaption := Format('%s (%s) Активна база даних: %s', [ProductName, CurrFileVersion.FileVersion, basevar.Settings.CurrDBTitle]);
      Caption := TempCaption; {+2010-05-25}
      SetuserPermissions;
    end;
    LoginForm.Free;                      //delete login form {+2012-05-17}
  end;
end;
{----------set restrictions to app interface---------}
procedure TMainForm.SetuserPermissions;
begin //disable controls
  if basevar.Settings.LUserSQLRole = test_operator then
  begin  //test center operator
     //references menu disabled
//       ReferenceMenu.Enabled := false;
     //access denied
     UsersLibEditItem.Enabled := false;
     DepLibEditItem.Enabled := false;
     //operator can not print ask with answers
//     PrintAskListItem.Enabled := false;          {-2012-05-17}
     ExpAnswersWord.Enabled := false;
     ExpAnswersWord.Visible := false;
     //can not delete sciens
     TpFIBDataSet(ModulesDBGridEh.DataSource.DataSet).AllowedUpdateKinds := [ukModify, ukInsert];
     //disable any export excet fast report
     ExpPaperSpeedButton.visible := false;
     ExPaperRTFSpeedBut.visible := false;
     ExpModuleWordSB.visible := false;
     AnswRepSB.visible := false;
     ExpAnswerSB.visible := false;  {+8/01/2010}
     AllowExportPapersFR := false;
     ReportMenu.Visible := false;
     Answer2MSWord.Visible := false;
     Answer2Print.Visible := false;
   //  UpdateAskcountCmd.Enabled := false; {+4/03/2011}       {-17/04/2012}
   end
   else if basevar.Settings.LUserSQLRole = dep_teacher then
        begin   //department teacher
         //access denied
         UsersLibEditItem.Enabled := false;
         DepLibEditItem.Enabled := false;
         //disable all test tools
         TestEditTab.TabVisible:= false;
         ExpAnswersWord.Enabled := false;
         //can not delete sciens
         TpFIBDataSet(ModulesDBGridEh.DataSource.DataSet).AllowedUpdateKinds := [ukModify, ukInsert];
         //can not change department
         SelDepDBLComboboxEh.enabled := false;
         AllowExportPapersFR := false;
         Answer2MSWord.Visible := false;
         Answer2Print.Visible := false;
         UpdateAskcountCmd.Enabled := false; {4/03/2011}
       end
       else if basevar.Settings.LUserSQLRole = dep_admin then
            begin //department admin
              DepLibEditItem.Enabled := false;
              testeditDM.SetUserTypeFilter;
      //      testeditDM.SetFullSciensFilter;
              //disable department filter capabilities
      //      advtestmodedit.AdvTestModEditor.FullSciensDBGridEh.Columns[0].STFilter.Visible := false;
              advtestmodedit.AdvTestModEditor.DisableFilters;
              //can not change department
              SelDepDBLComboboxEh.enabled := false;
              //can delete sciens
              TpFIBDataSet(ModulesDBGridEh.DataSource.DataSet).AllowedUpdateKinds := [ukModify, ukInsert, ukDelete	];
              AllowExportPapersFR := false;
              UpdateAskcountCmd.Enabled := false; {4/03/2011}
                if basevar.Settings.LUserName<>'SYSDBA' then   {+18/12/2014 - selskiy want this}
                begin
                  AnswRepSB.visible := false;
                  Answer2MSWord.Visible := false;
                  Answer2Print.Visible := false;
                end;
            end;

  //set department dataset to current department;
  if testeditDM.TestDB.Connected then testeditDM.DepartDataSet.Locate('DEPID',VarArrayOf([basevar.Settings.LUserDepID]),[]);
end;
{====================================================}
{------------select active control on page-----------}
procedure TMainForm.SelDepDBLComboboxEhCloseUp(Sender: TObject;
  Accept: Boolean);
begin
  if PageControl1.ActivePage = AskEditTab then ModulesDBGridEh.SetFocus
  else SubjectDBGridEh.SetFocus;
end;
{====================================================}
{----------Set sorting option for Modules List-------}
procedure TMainForm.ModulesDBGridEhTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var
  SortOrder : boolean;
begin
  //detect sort order - descending or ascending
  if Column.Title.SortMarker = smDownEh then SortOrder := true
  else SortOrder := false;
  testeditDM.SciensDataSet.DoSort([Column.FieldName],[SortOrder]);
end;
{----------Set sorting option for Subjects List-------}
procedure TMainForm.SubjectDBGridEhTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  SortOrder : boolean;
begin
  //detect sort order - descending or ascending
  if Column.Title.SortMarker = smDownEh then SortOrder := true
  else SortOrder := false;
  testeditDM.SubjectDataSet.DoSort([Column.FieldName],[SortOrder]);
end;
{----------Set sorting option for Test On Subject List-------}
procedure TMainForm.TestDBGridEhTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  SortOrder : boolean;
begin
  //detect sort order - descending or ascending
  if Column.Title.SortMarker = smDownEh then SortOrder := true
  else SortOrder := false;
  testeditDM.SubjTestDataSet.DoSort([Column.FieldName],[SortOrder]);
end;
{----------Set sorting option for Papers List-------}
procedure TMainForm.PapersDBGridEhTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  SortOrder : boolean;
begin
  //detect sort order - descending or ascending
  if Column.Title.SortMarker = smDownEh then SortOrder := true
  else SortOrder := false;
  testeditDM.OffPapersDataSet.DoSort([Column.FieldName],[SortOrder]);
end;
{====================================================}
{----------Show Language Library Edit dialog---------}
procedure TMainForm.LangLibEditExecute(Sender: TObject);
begin
  //manually create a language ref form                     {+2012-06-19}
  Application.CreateForm(TLangRefForm, LangRefForm);
  //display form
  LangRefForm.ShowModal;
  if PageControl1.ActivePage = AskEditTab then ModulesDBGridEh.SetFocus
  else SubjectDBGridEh.SetFocus;
  //delete form
  LangRefForm.Free;                                         {+2012-06-19}
end;
{----------Show Sciens Library Edit dialog-----------}
procedure TMainForm.SciensLibEditExecute(Sender: TObject);
begin
  //manually create a sciens library ref form                     {+2012-06-19}
  Application.CreateForm(TLibSciensRefEditor, LibSciensRefEditor);
  //display form
  LibSciensRefEditor.ShowModal;
  ModulesDBGridEh.Refresh;
  if PageControl1.ActivePage = AskEditTab then ModulesDBGridEh.SetFocus
  else SubjectDBGridEh.SetFocus;
  //delete form
  LibSciensRefEditor.Free;                                  {+2012-06-19}
end;
{----------Show User Edit dialog---------------------}
procedure TMainForm.UserLibEditExecute(Sender: TObject);
begin
  //manually create a urers list form                     {+2012-06-19}
  Application.CreateForm(TUserRefForm, UserRefForm);
  //display form
  UserRefForm.ShowModal;
  if PageControl1.ActivePage = AskEditTab then ModulesDBGridEh.SetFocus
  else SubjectDBGridEh.SetFocus;
  //delete form
  UserRefForm.Free;                                  {+2012-06-19}
end;
{----------Show Department Edit dialog---------------------}
procedure TMainForm.DepLibEditExecute(Sender: TObject);
begin
  //manually create a department ref form                     {+2012-06-19}
  Application.CreateForm(TDepEditForm, DepEditForm);
  //display form
  DepEditForm.ShowModal;
  SelDepDBLComboboxEh.KeyValue := SelDepDBLComboboxEh.ListSource.DataSet.FieldByName('DEPID').asinteger;
  if PageControl1.ActivePage = AskEditTab then ModulesDBGridEh.SetFocus
  else SubjectDBGridEh.SetFocus;
  //delete form
  DepEditForm.Free;                                  {+2012-06-19}
end;
{----------Show Settings dialog----------------------}
procedure TMainForm.SettingsEditExecute(Sender: TObject);
begin
  //show settings window
  SettingsEditForm.ShowModal;
  SelDepDBLComboboxEh.KeyValue := SelDepDBLComboboxEh.ListSource.DataSet.FieldByName('DEPID').asinteger;
  if PageControl1.ActivePage = AskEditTab then ModulesDBGridEh.SetFocus
  else SubjectDBGridEh.SetFocus;
end;
{==========WORKING WITH ASK AND ANSWER LIST==========================}
{----open Ask Editor for selected ask in the list----}
procedure TMainForm.AskOpenEditorCmdExecute(Sender: TObject);
var
  result:integer;
begin
  //manually create a new user edit form                     {+2012-06-19}
  Application.CreateForm(TAskEditForm, AskEditForm);
  //enter dataset edit mode
  AskGridDBTableView.NavigatorButtons.Edit.Click;
  //display editor
  result := AskEditForm.ShowModal;
  //detect - save changes or not
  if result = mrOK then
  begin
    AskGridDBTableView.NavigatorButtons.Post.Click;
    // After editing the same row must be focused - not working!!!
//    AskGridDBTableView.DataController.FocusSelectedRow(0);
  end
  else AskGridDBTableView.NavigatorButtons.Cancel.Click;
  //delete form                                {+2012-06-19}
  AskEditForm.Free;
end;
{---add new ask to the list and open Ask Editor for it---}
procedure TMainForm.AddAskCmdExecute(Sender: TObject);
var
  result:integer;
begin
  //manually create a new user edit form                     {+2012-06-19}
  Application.CreateForm(TAskEditForm, AskEditForm);
  //insert record
  AskGridDBTableView.NavigatorButtons.Append.Click;
//  AskGridDBTableView.DataController.DataSet.Append;
  //display editor
  result := AskEditForm.ShowModal;
  //detect - save changes or not
  if result = mrOK then
  begin
    //store new ask in database
    AskGridDBTableView.NavigatorButtons.Post.Click;
    //move to new aded record
    AskGridDBTableView.NavigatorButtons.Last.Click; //??? 12-07-2011
    //avtomatically open dialog for input answers for new ask
    AddAnswerCmd.Execute;
    //refresh dataset
    AskGridDBTableView.NavigatorButtons.Refresh.Click;
  end
  else AskGridDBTableView.NavigatorButtons.Cancel.Click;
  //delete form                                {+2012-06-19}
  AskEditForm.Free;
end;
{-----------delete selected ask from the list--------}
procedure TMainForm.DelAskCmdExecute(Sender: TObject);
var
  FocusedRow, TopRow: Integer;
begin
  // Remember the top row (the vertical scrollbar position)
  TopRow := AskGridDBTableView.Controller.TopRowIndex;
  // Remember the focused row(!) index
  FocusedRow := AskGridDBTableView.DataController.FocusedRowIndex;
  //perform delete
///  AskGridDBTableView.DataController.DeleteFocused; {original - without confirmation}
  AskGridDBTableView.NavigatorButtons.Delete.Click;
  // After deletion the same row must be focused,
  // although it will correspond to a different data record
  AskGridDBTableView.DataController.FocusedRowIndex := FocusedRow;
  // Restore the top row
  AskGridDBTableView.Controller.TopRowIndex := TopRow;
end;
{--add new answer to the list and open Answer Editor for it--}
procedure TMainForm.AddAnswerCmdExecute(Sender: TObject);
var
  result:integer;
begin
  //manually create a new user edit form                     {+2012-06-19}
//  Application.CreateForm(TAnswEditForm, AnswEditForm);
  //enter edit mode
  AnswGridDBTableView1.DataController.DataSource.DataSet.append;
  //show edit dialog box
  result := AnswEditForm.ShowModal;
  //save or discard changes
  if (result = mrOK)and(AnswGridDBTableView1.DataController.DataSource.State in [dsEdit, dsInsert]) then AnswGridDBTableView1.DataController.DataSource.DataSet.Post
  else AnswGridDBTableView1.DataController.DataSource.DataSet.Cancel;
  //delete form                            {+2012-06-19}
//  AnswEditForm.Free;
end;
{----open Answer Editor for selected answer in the list----}
procedure TMainForm.AnswerOpenEditorCmdExecute(Sender: TObject);
var
  result:integer;
begin
  //manually create a new user edit form                     {+2012-06-19}
//  Application.CreateForm(TAnswEditForm, AnswEditForm);
  //enter edit mode
  AnswGridDBTableView1.DataController.DataSource.DataSet.Edit;
  //show edit dialog box
  result := AnswEditForm.ShowModal;
  //save or discard changes
  if (result = mrOK)and(AnswGridDBTableView1.DataController.DataSource.State in [dsEdit, dsInsert]) then AnswGridDBTableView1.DataController.DataSource.DataSet.Post
  else AnswGridDBTableView1.DataController.DataSource.DataSet.Cancel;
  //delete form                            {+2012-06-19}
//  AnswEditForm.Free;
end;
{------double clik on answer list open edit dialog---------}
procedure TMainForm.AnswerDBGridEhDblClick(Sender: TObject);
begin
  AnswerOpenEditorCmdExecute(Self);
end;
{========WORKING WITH SOME GRIDS===========================}
{------------save changes in modules list grid-------------}
procedure TMainForm.ModulesDBGridEhExit(Sender: TObject);
begin
  if ModulesDBGridEh.DataSource.State in [dsEdit, dsInsert] then ModulesDBNavigator.BtnClick(nbPost);
end;
{------------save changes in subjects list grid------------}
procedure TMainForm.SubjectDBGridEhExit(Sender: TObject);
begin
  if SubjectDBGridEh.DataSource.State in [dsEdit, dsInsert] then SubjectDBNavigator.BtnClick(nbPost);
end;
{--------------save changes in test list grid--------------}
procedure TMainForm.TestDBGridEhExit(Sender: TObject);
begin
  if TestDBGridEh.DataSource.State in [dsEdit, dsInsert] then TestDBNavigator.BtnClick(nbPost);
end;
{------------save changes in test modules list grid--------}
procedure TMainForm.TestModDBGridEhExit(Sender: TObject);
begin
  if TestModDBGridEh.DataSource.State in [dsEdit, dsInsert] then TestModDBNavigator.BtnClick(nbPost);
end;
{-----------clone test with sciens modules list----------------}
procedure TMainForm.CloneTestCmdExecute(Sender: TObject);
begin
  //process cloning
  testeditdm.CloneTestPerform;
  //refresh grid
  TestDBNavigator.BtnClick(nbRefresh);
end;
{=====WORKING WITH PAPERS LIST=============================}
{---------------save changes in papers list grid-----------}
procedure TMainForm.PapersDBGridEhExit(Sender: TObject);
begin
  if PapersDBGridEh.DataSource.State in [dsEdit, dsInsert] then PapersDBNavigator.BtnClick(nbPost);
end;
{--------delete the selected paper variant form list-------}
procedure TMainForm.DelOffPaperExecute(Sender: TObject);
begin
  PapersDBNavigator.BtnClick(nbDelete);
  if testeditdm.RedyPaperMemTable.IsEmpty = false then testeditdm.RedyPaperMemTable.EmptyTable; 
end;
{--------prepare paper to print without answers------------}
procedure TMainForm.PrepareExportExecute(Sender: TObject);
begin
  //set cursor face
  MainForm.cursor := crSQLWait;
  //options-do not show answers
  ShowAnswers := false;
  testeditDM.PrepareCurrentModule(ShowAnswers);
  //enable actions
  ExchangeAsk.Enabled := true;
  EditSelectedObj.Enabled := true;
  ExchangeAnswOrder.Enabled := true;
  PaperAddAnswerCmd.Enabled := true;
  PaperDelAnswerCmd.Enabled := true;
  //goto first record in modules list
  TestModDBGridEh.DataSource.DataSet.First;
  //set active control
  RedyParerDBGridEh.SetFocus;
  //set cursor face
  MainForm.cursor := crDefault;
end;
{-----------prepare paper to print with answers------------}
procedure TMainForm.ExpPaperWithAnswExecute(Sender: TObject);
begin
  //set cursor face
  Cursor := crSQLWait;
  //options-show answers
  ShowAnswers := true;
  testeditDM.PrepareCurrentModule(ShowAnswers);
  //enable actions
  ExchangeAsk.Enabled := true;
  EditSelectedObj.Enabled := true;
  ExchangeAnswOrder.Enabled := true;
  PaperAddAnswerCmd.Enabled := true;
  PaperDelAnswerCmd.Enabled := true;
  //goto first record in modules list
  TestModDBGridEh.DataSource.DataSet.First;
  //set active control
  RedyParerDBGridEh.SetFocus;
  //set cursor face
  cursor := crDefault;
end;
{------------------add new paper to list---------------------------}
procedure TMainForm.AddOffPaperExecute(Sender: TObject);
//insert new record into table and prepare open form for input data in this record
var
  answer : boolean;
begin
  //set cursor face
  cursor := crSQLWait;
  //check abilities to create paper
  testeditDM.CheckCreateNewAsksList(answer);
  if answer = true then
  begin
    //clear existing paper data (+2010-05-25!)
    testeditDM.RedyPaperMemTable.EmptyTable;
    //create offline paper (variant) record in the table
    testeditDM.CreateNewAsksList;
    PapersDBGridEh.Refresh;
    //start creation of the ogffline exam asks list (paper)
    mykernel.GenerateAsksList;
    //log action
    testeditDM.write_log('Успішно створено білет №:',PapersDBGridEh.Columns[0].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(PapersDBGridEh.Columns[0].DisplayText));
  end;
  //set cursor face
  cursor := crDefault;
end;
{------export list of the answers for the current paper(variant)-------}
procedure TMainForm.ExpAnswersExecute(Sender: TObject);
begin
  if (basevar.Settings.LUserSQLRole = test_admin) or (basevar.Settings.LUserSQLRole = dep_admin) then
  begin          {+21/04/2010}
    //set cursor face
    cursor := crSQLWait;
    //connect to ETALON database
    testeditDM.ConnectEtalonDB(true);
    //check and export data
    if testeditDM.ChekEtalonTable(PapersDBGridEh.DataSource.DataSet.fieldbyname('ID_OFFEXAM').AsInteger) then
            MessageDlg('Відповіді на цей варіант вже експортовані!', mtError, [mbOk], 0)
    else mykernel.ExportAnswersDB;
    //disconnect from ETALON database
    testeditDM.ConnectEtalonDB(false);
    //set cursor face
    cursor := crDefault;
      //log action
    testeditDM.write_log('Успішно експортовано відповіді на білет №:',PapersDBGridEh.Columns[0].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(PapersDBGridEh.Columns[0].DisplayText));
  end;
end;
{--------------exchange one ask in ready paper(variant)----------------}
procedure TMainForm.ExchangeAskExecute(Sender: TObject);
var
  tmpcurraskrec, tmpcurrsection, tmpcurrsciensrec : integer;
begin
  //set cursor face
  cursor := crSQLWait;
  //store current ask position
  tmpcurraskrec := testeditDM.RedyPaperMemTable.RecNo;
  //store current test module position
  tmpcurrsection := testeditDM.TestModDataSet.RecNo;
  //store current test module section position
//  tmpcurrsciensrec := testeditDM.TSect2ScDataSet.RecNo;
  //exchange ask
  mykernel.ExchangeAsk;
  //repeat preparing to print with current ShowAnswers state!
  testeditDM.PrepareCurrentModule(ShowAnswers);
  //restore current position - test module
  testeditDM.TestModDataSet.RecNo := tmpcurrsection;
  //restore current position - test module section
//  testeditDM.TSect2ScDataSet.RecNo := tmpcurrsciensrec;
  //restore database position - ask
  testeditDM.RedyPaperMemTable.RecNo := tmpcurraskrec;
  //set cursor face
  cursor := crDefault;
end;
{--exchange order of the answers for current ask in ready paper(variant)-}
procedure TMainForm.ExchangeAnswOrderExecute(Sender: TObject);
var
  tmpcurrrec, tmpcurrmodule : integer;
begin
  //store current ask position
  tmpcurrrec := testeditDM.RedyPaperMemTable.RecNo;
  //store current module numer
  tmpcurrmodule := testeditDM.TestModDataSet.RecNo;
  //set cursor face
  cursor := crSQLWait;
  //exchange answer order
  mykernel.ExchangeAnswerOrder(true);
  //repeat preparing to print with current ShowAnswers state!
  testeditDM.PrepareCurrentModule(ShowAnswers);
  //set cursor face
  cursor := crDefault;
  //restore module list position
  testeditDM.TestModDataSet.RecNo := tmpcurrmodule;
  //restore database position - ask
  testeditDM.RedyPaperMemTable.RecNo := tmpcurrrec;
end;
{-----------------------print paper to MS Word-----------------------}
procedure TMainForm.ExpOffPaperExecute(Sender: TObject);
begin
  CheckPreparePaper(showanswers);
  //set cursor face
  cursor := crSQLWait;
  //original method
  mykernel.PrepareWordDocument;
  mykernel.ExportCurentVariant(ShowAnswers);
  //set cursor face
  cursor := crDefault;
  //log action
  testeditDM.write_log('Успішно експортовано в MS WORD білет №:',PapersDBGridEh.Columns[0].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(PapersDBGridEh.Columns[0].DisplayText));
end;
{-------------------print paper to RTF Template-----------------------}
procedure TMainForm.ExpOffPaperRTFExecute(Sender: TObject);
var
  filename, nm1, nm2, nm3, nm4 : string;
begin
  CheckPreparePaper(showanswers);
  //set cursor face
  cursor := crSQLWait;
  //prepare filename template
  nm1 := 'var_N-'+PapersDBGridEh.Fields[0].AsString;  //variant number
  nm2 := 'sem_N-'+SubjectDBGridEh.Fields[2].AsString; //semestr number
  nm3 := 'dep-'+SubjectDBGridEh.Fields[1].AsString;   //faculty name
  nm4 := 'lang-'+TestDBGridEh.Fields[4].AsString;     //language name
  filename := FileNameAutoCorrect(nm1 + '_'+ nm2 + '_'+ nm3 + '_'+ nm4);
  //select destionation folder
  SaveDialog2.FileName := filename;
  if SaveDialog2.Execute then
  begin
    //launch report execution
    testeditDM.PrintToRTF(SaveDialog2.FileName);
  end;
///  testeditDM.PrintToRTF(ReportDiName+'\'+filename); //for secured version
  //set cursor face
  cursor := crDefault;
  //log action
  testeditDM.write_log('Успішно експортовано в RTF білет №:',PapersDBGridEh.Columns[0].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(PapersDBGridEh.Columns[0].DisplayText));  
end;
{---switch to ask or answer editor window for mistakes correction----}
procedure TMainForm.EditSelectedObjExecute(Sender: TObject);
var
  currTestModID, currDepID, currSubjID, currTestID, currPaperID, tmpAskID, tmpAnswerID, tmpSciensID, tmpDepID : integer;
  tmpTextStream, tmpImageStream : tmemorystream;
  ImageExist:boolean;
begin
  //init memory buffers
  tmpTextStream := tmemorystream.Create;
  tmpImageStream := tmemorystream.Create;
  //store current department ID
  testeditDM.GetCurrentTest(currDepID, currSubjID, currTestID, currPaperID, currTestModID);
  //search for appropritate department ID
  testeditDM.SearchDepartment(tmpAskID, tmpAnswerID, tmpSciensID, tmpDepID);
  if tmpDepID <>0 then
  begin            {1}
    //show ask list tab
    PageControl1.ActivePage := AskEditTab;
    //set select department combo box
    SelDepDBLComboboxEh.KeyValue := tmpDepID;
    //update combobox
    SelDepDBLComboboxEh.CloseUp(false);
    if tmpAnswerID <> 0 then
    begin          {2}
      if testeditDM.LocateAsk(tmpAskID, tmpAnswerID, tmpSciensID) then
      begin        {3}
        //hide navigation panel - user can edit only selected answer in one time
        AnswEditForm.AnswerListGB.visible := false;
        //perform editing
        AnswEditSpeedButton.Action.Execute;
        //show navigation panel - user can edit all answers in one time
        AnswEditForm.AnswerListGB.visible := true;
        //store answer text to memory stream
        testeditDM.AnswerDataToStream(tmpTextStream, tmpImageStream, ImageExist);
      end;         {/3}
    end            {/2}
    else
    begin          {4}
      if testeditDM.LocateAsk(tmpAskID, tmpAnswerID, tmpSciensID) then
      begin        {5}
        //TODO:need check - exist image before editing or not
        AskEditSpeedButton.Action.Execute;
        //store ask text to memory stream
        testeditDM.AskDataToStream(tmpTextStream, tmpImageStream, ImageExist);
       end;        {/5}
    end;           {/4}
    //restore position - test edit tab
    PageControl1.ActivePage := TestEditTab;
    //set select department combo box
    SelDepDBLComboboxEh.KeyValue := currDepID;
    //update combobox
    SelDepDBLComboboxEh.CloseUp(false);
    //restore database position - subject, test and paper
//    testeditDM.SetCurrentTest(currSubjID, currTestID, currPaperID, tmpSciensID);
    testeditDM.SetCurrentTest(currSubjID, currTestID, currPaperID, currTestModID);
    //enable actions (controls)
    ExchangeAsk.Enabled := true;
    EditSelectedObj.Enabled := true;
    ExchangeAnswOrder.Enabled := true;
    PaperAddAnswerCmd.Enabled := true;
    PaperDelAnswerCmd.Enabled := true;    
    //set active control
    RedyParerDBGridEh.SetFocus;
    //restore database position - module and ask
    testeditDM.SetCurrentModule(tmpSciensID, tmpAskID, tmpAnswerID);
    //change data in memory table
    testeditDM.StreamToPreview(tmpTextStream, tmpImageStream, ImageExist);
  end;            {/1}
  //destroy memory buffers
  tmpTextStream.Free;
  tmpImageStream.Free;
end;
{---switch to ask or answer editor window for mistakes correction----}
procedure TMainForm.RedyParerDBGridEhDblClick(Sender: TObject);
begin
  EditSelectedObj.Execute;
end;
{--switch to answer editor window and add new answer for mistakes correction--}
procedure TMainForm.PaperAddAnswerCmdExecute(Sender: TObject);
var
  currTestModID, currDepID, currSubjID, currTestID, currPaperID, tmpAskID, tmpAnswerID, tmpSciensID, tmpDepID : integer;
//  ImageExist:boolean;
begin
  //store current department ID
  testeditDM.GetCurrentTest(currDepID, currSubjID, currTestID, currPaperID, currTestModID);
  //search for appropritate department ID
  testeditDM.SearchDepartment(tmpAskID, tmpAnswerID, tmpSciensID, tmpDepID);
  if tmpAskID <> 0 then //this features work only for ANSWERS!
  begin              {0}
    if tmpDepID <>0 then
    begin            {1}
      //show ask list tab
      PageControl1.ActivePage := AskEditTab;
      //set select department combo box
      SelDepDBLComboboxEh.KeyValue := tmpDepID;
      //update combobox
      SelDepDBLComboboxEh.CloseUp(false);
      if testeditDM.LocateAsk(tmpAskID, tmpAnswerID, tmpSciensID) then
                      AddAnswerCmd.Execute;//perform adding answer
      //restore position - test edit tab
      PageControl1.ActivePage := TestEditTab;
      //set select department combo box
      SelDepDBLComboboxEh.KeyValue := currDepID;
      //update combobox
      SelDepDBLComboboxEh.CloseUp(false);
      //restore database position - subject, test and paper
      testeditDM.SetCurrentTest(currSubjID, currTestID, currPaperID, tmpSciensID);
      //repeat preparing to print with current ShowAnswers state!
      testeditDM.PrepareCurrentModule(ShowAnswers);
      //enable actions (controls)
      ExchangeAsk.Enabled := true;
      EditSelectedObj.Enabled := true;
      ExchangeAnswOrder.Enabled := true;
      PaperAddAnswerCmd.Enabled := true;
      PaperDelAnswerCmd.Enabled := true;
      //set active control
      RedyParerDBGridEh.SetFocus;
      //restore database position - module and ask
      testeditDM.SetCurrentModule(currTestModID, tmpAskID, tmpAnswerID);
    end;            {/1}
  end;              {/0}
end;
{------switch to answer editor window and add delete active answer------}
procedure TMainForm.PaperDelAnswerCmdExecute(Sender: TObject);
var
  currTestModID, currDepID, currSubjID, currTestID, currParerID, tmpAskID, tmpAnswerID, tmpSciensID, tmpDepID : integer;
//  ImageExist:boolean;
begin
  //store current department ID
  testeditDM.GetCurrentTest(currDepID, currSubjID, currTestID, currParerID, currTestModID);
  //search for appropritate department ID
  testeditDM.SearchDepartment(tmpAskID, tmpAnswerID, tmpSciensID, tmpDepID);
  if tmpAnswerID <> 0 then //this features work only for ANSWERS!
  begin              {0}
    if tmpDepID <>0 then
    begin            {1}
      //show ask list tab
      PageControl1.ActivePage := AskEditTab;
      //set select department combo box
      SelDepDBLComboboxEh.KeyValue := tmpDepID;
      //update combobox
      SelDepDBLComboboxEh.CloseUp(false);
      if testeditDM.LocateAsk(tmpAskID, tmpAnswerID, tmpSciensID) then
      begin
        if messagedlg('Ви дійсно бажаєте видалити відповідь?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          AnswGridDBTableView1.DataController.DataSource.DataSet.Delete;
        end;  
      end;
      //restore position - test edit tab
      PageControl1.ActivePage := TestEditTab;
      //set select department combo box
      SelDepDBLComboboxEh.KeyValue := currDepID;
      //update combobox
      SelDepDBLComboboxEh.CloseUp(false);
      //restore database position - subject, test and paper
      testeditDM.SetCurrentTest(currSubjID, currTestID, currParerID, tmpSciensID);
      //repeat preparing to print with current ShowAnswers state!
      testeditDM.PrepareCurrentModule(ShowAnswers);
      //enable actions (controls)
      ExchangeAsk.Enabled := true;
      EditSelectedObj.Enabled := true;
      ExchangeAnswOrder.Enabled := true;
      PaperAddAnswerCmd.Enabled := true;
      PaperDelAnswerCmd.Enabled := true;
      //set active control
      RedyParerDBGridEh.SetFocus;
      //restore database position - module and ask
      testeditDM.SetCurrentModule(currTestModID, tmpAskID, tmpAnswerID);
    end;            {/1}
  end;              {/0}
end;
{------send current module to MS Word--------------}
procedure TMainForm.ExpOffModuleWordExecute(Sender: TObject);
begin
  CheckPreparePaper(showanswers);
  //set cursor face
  cursor := crSQLWait;
  //original method
  mykernel.PrepareWordDocument;
  mykernel.ExportCurentModule(ShowAnswers);
  //set cursor face
  cursor := crDefault;
  //log action
  testeditDM.write_log('Успішно експортовано в RTF білет №:',PapersDBGridEh.Columns[0].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(PapersDBGridEh.Columns[0].DisplayText));
end;
{---------------Show new paper report window!------------------}
procedure TMainForm.PrintOffPaperFReportExecute(Sender: TObject);
var
  tmpfilter : string;
  VariantTitle: TfrxMemoView;
begin
  CheckPreparePaper(false);
  //disable filter
  tmpfilter := '';
  if testeditDM.RedyPaperMemTable.Filtered = true then
  begin
    tmpfilter := testeditDM.RedyPaperMemTable.Filter;
    testeditDM.RedyPaperMemTable.Filtered := false;
  end;
  //disable dcWaitEndMasterScroll - options
  testeditDM.SubjectDataSet.DetailConditions :=[dcForceOpen];
  testeditDM.SubjTestDataSet.DetailConditions :=[dcForceOpen];
  testeditDM.TestModDataSet.DetailConditions :=[dcForceOpen];
  testeditDM.TSect2ScDataSet.DetailConditions :=[dcForceOpen];
  testeditDM.OffPapersDataSet.DetailConditions :=[dcForceOpen];
  testeditDM.OffAsksDataSet.DetailConditions :=[dcForceOpen];
  //disable report export features
  if AllowExportPapersFR=false then testeditDM.AskListReport.PreviewOptions.Buttons := [pbPrint,pbLoad,pbSave,pbZoom,pbFind,pbOutline,pbPageSetup,pbTools,pbEdit,pbNavigator];
  //load report template
  testeditDM.AskListReport.LoadFromFile(ExtractFilePath(Application.ExeName)+Rep_OffPaperWithoutAnswers,true);
  //insert properly variant title
  VariantTitle := testeditDM.AskListReport.FindObject('VariantTitle') as TfrxMemoView;
  if testeditDM.SubjTestDataSet.FBN('lanng_search').AsString ='English'then VariantTitle.Text := 'Variant:'
  else if testeditDM.SubjTestDataSet.FBN('lanng_search').AsString ='Українська' then VariantTitle.Text := 'Варіант:'
       else VariantTitle.Text := 'Вариант:';
  //show report
  testeditDM.AskListRTFExport.ShowDialog := true;
  testeditDM.AskListReport.ShowReport();
  //enable report export features
  if AllowExportPapersFR=false then testeditDM.AskListReport.PreviewOptions.Buttons := [pbPrint,pbLoad,pbSave,pbExport,pbZoom,pbFind,pbOutline,pbPageSetup,pbTools,pbEdit,pbNavigator,pbExportQuick];
  //enable dcWaitEndMasterScroll - options
  testeditDM.SubjectDataSet.DetailConditions := [dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  testeditDM.SubjTestDataSet.DetailConditions := [dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  testeditDM.TestModDataSet.DetailConditions :=[dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  testeditDM.TSect2ScDataSet.DetailConditions :=[dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  testeditDM.OffPapersDataSet.DetailConditions :=[dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  testeditDM.OffAsksDataSet.DetailConditions :=[dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  //enable filter
  if tmpfilter <>'' then
  begin
    testeditDM.RedyPaperMemTable.Filter := tmpfilter;
    testeditDM.RedyPaperMemTable.Filtered := true;
  end;
  testeditDM.write_log('Успішно відкрито вікно FastReport для білету №:',PapersDBGridEh.Columns[0].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, Strtoint(PapersDBGridEh.Columns[0].DisplayText));
end;
{---------------check if paper print prepared--------------}
procedure TMainForm.CheckPreparePaper(showansw:boolean);
begin
  if testeditDM.RedyPaperMemTable.IsEmpty then
  begin
    ShowAnswers := showansw;
    PrepareExport.Execute;
  end;
end;
{===========WORKING WITH MAIN PROGRESSBAR==================}
{---------------------init progressbar---------------------}
procedure TMainForm.SetProgressBar(pb_min, pb_max, pb_steep, pb_pos: integer);
begin
  PgBar1.Step := pb_steep;
  PgBar1.Min := pb_min;
  PgBar1.Max := pb_max;
  PgBar1.Position := pb_pos;
end;
{---------------------steep progressbar--------------------}
procedure TMainForm.ProgressBarStepIt(pb_steep: integer);
begin
  if pb_steep = 1 then PgBar1.StepIt
  else PgBar1.StepBy(pb_steep);
end;
{----------------set progressbar position------------------}
procedure TMainForm.ProgressBarPosition (pb_pos: integer);
begin
  PgBar1.Position := pb_pos;
end;
{=======WORKING WITH MODULES LIST FOR THE TEST=============}
{-----show advanced test modules list editor---------------}
procedure TMainForm.AdvModulesEditExecute(Sender: TObject);
begin
  //manually create a new user edit form                     {+2012-06-19}
  Application.CreateForm(TAdvTestModEditor, AdvTestModEditor);
  //show dialog
  advtestmodedit.AdvTestModEditor.ShowModal;
  testeditdm.TestModDataSet.DoSort(['ORD_NUM'], [true]);
  //delete form                                      {+2012-06-19}
  AdvTestModEditor.Free;
end;
{------export modules list to different format--------------}
procedure TMainForm.ExpModulesRtfExecute(Sender: TObject);
var ExpClass:TDBGridEhExportClass;
    Ext:String;
begin
  SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName)+ExpDirName;
  SaveDialog1.FileName := 'TestModulesList';
  if SaveDialog1.Execute then
  begin
    case SaveDialog1.FilterIndex of
      1: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
      2: begin ExpClass := TDBGridEhExportAsCSV; Ext := 'csv'; end;
      3: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
      4: begin ExpClass := TDBGridEhExportAsRTF; Ext := 'rtf'; end;
      5: begin ExpClass := TDBGridEhExportAsXLS; Ext := 'xls'; end;
    else
      ExpClass := nil; Ext := '';
    end;
    if ExpClass <> nil then
    begin
      if UpperCase(Copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-2,3)) <>
         UpperCase(Ext) then
        SaveDialog1.FileName := SaveDialog1.FileName + '.' + Ext;
      SaveDBGridEhToExportFile(ExpClass,TestModDBGridEh,
           SaveDialog1.FileName,True);
    end;
  end;  
end;
{===========EXPORT FULL ASKS LIST BY SCIENS================}
{------export ask list by selected sciens with answer------}
procedure TMainForm.PrintAskListExecute(Sender: TObject);
var
  tmp_ask_ds, tmp_answ_ds : tdatasource;
  nm0, nm1, nm2, nm3 : string;
begin
  //log action
  testeditDM.write_log('Запит списку питань з вказаними правильними відповідями по модулю (розділу):',ModulesDBGridEh.Columns[1].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(ModulesDBGridEh.Columns[0].DisplayText));
  //disable dcWaitEndMasterScroll - options
  testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen];
  //set cursor face
  cursor := crSQLWait;
  //Improve performance - switch off grid datasets {10-05-2011}
  tmp_ask_ds := AskGridDBTableView.DataController.DataSource;
  AskGridDBTableView.DataController.DataSource := nil;
  tmp_answ_ds := AnswGridDBTableView1.DataController.DataSource;
  AnswGridDBTableView1.DataController.DataSource := nil;
  try
    //load report template
    testeditDM.AskListReport.LoadFromFile(ExtractFilePath(Application.ExeName)+Rep_AskListWithAnswers,true);
    try
      //prepare filename template
      nm0 := 'ID_'+ModulesDBGridEh.fields[0].AsString;//module ID
      nm1 := leftstr(ModulesDBGridEh.fields[1].AsString,30);  //module name
      nm2 := ModulesDBGridEh.Fields[3].AsString; //language name
      nm3 := 'sem_N-'+ModulesDBGridEh.Fields[5].AsString;   //semestr number
      testeditDM.AskListRTFExport.FileName := FileNameAutoCorrect(nm0 + '_' + nm1 + '_'+ nm2 + '_'+ nm3+RTF_ext);
      testeditDM.AskListRTFExport.ShowDialog := true;
      //show report
      testeditDM.AskListReport.ShowReport();
    except
    end;
  finally
    //Improve performance - switch on grid datasets {10-05-2011}
    AskGridDBTableView.DataController.DataSource := tmp_ask_ds;
    AnswGridDBTableView1.DataController.DataSource := tmp_answ_ds;
    //set cursor face
    cursor := crDefault;
    //enable dcWaitEndMasterScroll - options
    testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen, dcWaitEndMasterScroll];
  end;
end;
{----export ask list by selected sciens without answer-----}
procedure TMainForm.PrintAskListWithoutAnswExecute(Sender: TObject);
var
  tmp_ask_ds, tmp_answ_ds : tdatasource;
  nm0, nm1, nm2, nm3 : string;
  tmp_filter_flag, ShowArchive : boolean;
begin
  //log action
  testeditDM.write_log('Запит списку питань без вказаних правильних відповідей по модулю (розділу):',ModulesDBGridEh.Columns[1].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(ModulesDBGridEh.Columns[0].DisplayText));
  //disable dcWaitEndMasterScroll - options
  testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen];
  //set cursor face
  cursor := crSQLWait;
  //Improve performance - switch off grid datasets {10-05-2011}
  tmp_ask_ds := AskGridDBTableView.DataController.DataSource;
  AskGridDBTableView.DataController.DataSource := nil;
  tmp_answ_ds := AnswGridDBTableView1.DataController.DataSource;
  AnswGridDBTableView1.DataController.DataSource := nil;
  try
    //get archive export option
    if MessageDlg('Експортувати також і архівні питання?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then ShowArchive := true
    else ShowArchive := false;
    //options-do not show answers
    if Sender=PrintAskListWithoutAnsw2 then ShowAnswers := false;
    if Sender=PrintAskList then ShowAnswers := true;
    testeditDM.PrepareCurrentSciensAsksList(testeditDM.SciensDataSet.fbn('ID_sciens').AsString, ShowAnswers, ShowArchive);  {2012-04-24}
    tmp_filter_flag := testeditDM.RedyPaperMemTable.Filtered; {+2014/08/12 - fix 0 question export for admins}
    testeditDM.RedyPaperMemTable.Filtered:=false;  {+2014/08/12 - fix 0 question export for admins}
    //load report template
    if (Sender=PrintAskListWithoutAnsw2) or (Sender=PrintAskList) then testeditDM.AskListReport.LoadFromFile(ExtractFilePath(Application.ExeName)+Rep_AskListWithoutAnswers2,true)
    else  testeditDM.AskListReport.LoadFromFile(ExtractFilePath(Application.ExeName)+Rep_AskListWithoutAnswers,true);
    testeditDM.AskListRTFExport.FileName := leftstr(testeditDM.SciensDataSet.fbn('SC_NAME').AsString,30)+RTF_ext;
    try
      //prepare filename template
      nm0 := 'ID_'+ModulesDBGridEh.fields[0].AsString;//module ID
      nm1 := leftstr(ModulesDBGridEh.fields[1].AsString,30);  //module name
      nm2 := ModulesDBGridEh.Fields[3].AsString; //language name
      nm3 := 'sem_'+ModulesDBGridEh.Fields[5].AsString;   //semestr number
      testeditDM.AskListRTFExport.FileName := FileNameAutoCorrect(nm0 + '_' + nm1 + '_'+ nm2 + '_'+ nm3+RTF_ext);
      //show report
      testeditDM.AskListRTFExport.ShowDialog := true;
      testeditDM.AskListReport.ShowReport();
    except
    end;
  finally
    //Improve performance - switch on grid datasets {10-05-2011}
    AskGridDBTableView.DataController.DataSource := tmp_ask_ds;
    AnswGridDBTableView1.DataController.DataSource := tmp_answ_ds;
    //set cursor face
    cursor := crDefault;
    //enable dcWaitEndMasterScroll - options
    testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen, dcWaitEndMasterScroll];
    testeditDM.RedyPaperMemTable.Filtered:=tmp_filter_flag;  {+2014/08/12 - fix 0 question export for admins}
  end;
end;
{========WORKING WITH POP-UP MENU FOR ASKS LIST============}
{--------------------delete selected rows--------------------}
procedure TMainForm.SelectDelClick(Sender: TObject);
var
  i, cannotdeletecount, NeedDeleteRecCount : integer;
  tmp_ask_ds, tmp_answ_ds : tdatasource;
begin
  //selection type - rows
  NeedDeleteRecCount := AskGridDBTableView.DataController.GetSelectedCount;
  cannotdeletecount := 0; //exception count
  if NeedDeleteRecCount > 1 then
  begin         {1}
    if MessageDlg('Ви впевнені?', mtWarning	, [mbYes, mbNo], 0) = mrYes then
    begin       {2}   //perform operation for each selected row
      //set progressbar
      SetProgressBar(0, NeedDeleteRecCount-1,1,0);
      //deleting selected items
      for i := NeedDeleteRecCount-1 downto 0 do //process all selected ask
      begin     {3}
        try
///          testeditDM.TestAskDataSet.Bookmark := AskGridDBTableView.DataController.getselectedbookmark(i);
///          testeditDM.TestAskDataSet.Delete;
          AskGridDBTableView.DataController.DataSet.Bookmark := AskGridDBTableView.DataController.getselectedbookmark(i);
          AskGridDBTableView.DataController.DataSet.Delete;
        except
          //cannot delete - ask is used in someone test paper
          inc(cannotdeletecount);
          AskGridDBTableView.DataController.DataSet.Edit;
          AskGridDBTableView.DataController.DataSet.FieldByName('ARCHIVE').AsInteger:=1; //set to archive
          AskGridDBTableView.DataController.DataSet.Post;
        end;
        //steep progressbar
        ProgressBarStepIt(1);
      end;      {/3}
    end;        {/2}
    AskGridDBTableView.DataController.ClearSelection;
    if cannotdeletecount <> 0 then MessageDlg('Неможливо видалити наступну кількість питань: '+inttostr(cannotdeletecount)+' . Їх поміщено в архів.', mtWarning	, [mbOk], 0);
  end;          {/1}
end;
{------------------move selected ask to archive----------------}
procedure TMainForm.SelectToArchClick(Sender: TObject);
begin
  ChangeArchiveStatus(true);
end;
{------------------move selected ask from archive----------------}
procedure TMainForm.SelectFromArchClick(Sender: TObject);
begin
  ChangeArchiveStatus(false);
end;
{------------------change archive status of the selected asks-----}
procedure TMainForm.ChangeArchiveStatus(archivestatus:boolean);
var
  i, NeedArchRecCount : integer;
begin
  //selection type - rows
  NeedArchRecCount := AskGridDBTableView.DataController.GetSelectedCount;
  if NeedArchRecCount > 1 then
  begin         {1}
    //set progressbar
    SetProgressBar(0, NeedArchRecCount-1,1,0);
   // for i := 0 to NeedArchRecCount-1 do //process all selected ask
    for i := NeedArchRecCount-1 downto 0 do //process all selected ask
    begin     {3}
    
      AskGridDBTableView.DataController.DataSet.Bookmark := AskGridDBTableView.DataController.getselectedbookmark(i);
      AskGridDBTableView.DataController.DataSet.Edit;
      if archivestatus then AskGridDBTableView.DataController.DataSet.FieldByName('ARCHIVE').AsInteger:=yes //set to archive
      else AskGridDBTableView.DataController.DataSet.FieldByName('ARCHIVE').AsInteger:=no; //get from archive
      AskGridDBTableView.DataController.DataSet.Post;
      //steep progressbar
      ProgressBarStepIt(1);
    end;      {/3}
    //set progress bar position
    ProgressBarPosition(0);
  end;          {/1}
end;
{--------move or copy selected ask to another sciens----------------}
procedure TMainForm.SelectMoveClick(Sender: TObject);
var
  i, NeedMoveRecCount : integer;
  tmpMoveAskList : array of integer;
  tmp_ask_ds, tmp_answ_ds : tdatasource;
begin
  //manually create a ask manager form                         {+2012-06-19}
  Application.CreateForm(TMoveTestAsk, MoveTestAsk);
  //selection type - rows
  NeedMoveRecCount := AskGridDBTableView.DataController.GetSelectedCount;
  if NeedMoveRecCount > 1 then
  begin         {1}  //select destination department and sciens
    if askmanager.MoveTestAsk.ShowModal = mrOk then //
    begin       {2}
      //set array size for store asks ID list
      setlength(tmpMoveAskList, NeedMoveRecCount);
      //process all selected asks
      for i := 0 to NeedMoveRecCount-1 do
      begin     {3}
        AskGridDBTableView.DataController.DataSet.Bookmark := AskGridDBTableView.DataController.getselectedbookmark(i);
        tmpMoveAskList[i] := AskGridDBTableView.DataController.DataSource.DataSet.FieldByName('ID_ASK').AsInteger;
      end;      {/3}
      //Improve performance - switch off grid datasets {23-10-2011}
      tmp_ask_ds := AskGridDBTableView.DataController.DataSource;
      AskGridDBTableView.DataController.DataSource := nil;
      tmp_answ_ds := AnswGridDBTableView1.DataController.DataSource;
      AnswGridDBTableView1.DataController.DataSource := nil;
      //set cursor face
      cursor := crSQLWait;
      //perform moving or coping
      testeditDM.MoveAsk(tmpMoveAskList, askmanager.MoveTestAsk.DestSciensID, askmanager.MoveTestAsk.CopyAsk);
      //set cursor face
      cursor := crDefault;
      //Improve performance - switch on grid datasets {23-10-2011}
      AskGridDBTableView.DataController.DataSource := tmp_ask_ds;
      AnswGridDBTableView1.DataController.DataSource := tmp_answ_ds;
      //clear selection
      //AskGridDBTableView.Controller.ClearSelection;
      AskGridDBTableView.DataController.ClearSelection;
    end;        {/2}
  end;          {/1}
  MoveTestAsk.Free;                         //delete form {+2012-06-19}
end;
{==============IMPORT/EXPORT DATA====================}
{-------------import data form MS Word---------------}
procedure TMainForm.ImportFromWordCmdExecute(Sender: TObject);
var
  tmp_ask_ds, tmp_answ_ds : tdatasource;
begin
  //select file and launch import procedure
  if OpenDialogDoc.Execute then
  begin
    //set cursor face
    cursor := crSQLWait;
    //Improve performance - switch off grid datasets {10-05-2011}
    tmp_ask_ds := AskGridDBTableView.DataController.DataSource;
    AskGridDBTableView.DataController.DataSource := nil;
    tmp_answ_ds := AnswGridDBTableView1.DataController.DataSource;
    AnswGridDBTableView1.DataController.DataSource := nil;
    //try import
    mykernel.ImportFromWord(OpenDialogDoc.FileName);
    //decrease network performance - off 23-02-2011
///    testeditDM.TestAskDataSet.Close;
///    testeditDM.TestAskDataSet.Open;
    //Improve performance - switch on grid datasets {10-05-2011}
    AskGridDBTableView.DataController.DataSource := tmp_ask_ds;
    AnswGridDBTableView1.DataController.DataSource := tmp_answ_ds;
    //set cursor face
    cursor := crDefault;
  end;
end;
{----------Export to MOODLE file with AIKEN format---------}
procedure TMainForm.ExportMoodleCmdExecute(Sender: TObject);
var
  tmp_filename : string;
  tmp_ask_ds, tmp_answ_ds : tdatasource;
  ShowArchive: boolean;
begin
//for secured version
///  tmp_filename := inputbox('Назва файлу', 'Введіть назву файлу', ModulesDBGridEh.DataSource.DataSet.fieldbyname('SC_NAME').AsString);
  //create the default filename
  tmp_filename := 'ID_'+testeditDM.SciensDataSet.FBN('ID_SCIENS').asstring;
  tmp_filename := tmp_filename+'_'+testeditDM.SciensDataSet.FBN('SC_NAME').asstring;
  if not testeditDM.SciensDataSet.FBN('SC_DESCR').IsNull
     then tmp_filename := tmp_filename+'_'+testeditDM.SciensDataSet.FBN('SC_DESCR').asstring;
  tmp_filename := tmp_filename+'_'+testeditDM.SciensDataSet.FBN('lanng_search').asstring;
  tmp_filename := tmp_filename+'_'+testeditDM.SciensDataSet.FBN('sc_name_search').asstring;
  tmp_filename := tmp_filename+'_semestr-'+testeditDM.SciensDataSet.FBN('SEMESTR').asstring+'.txt';
  //setup the default filename
  SaveDialog3.FileName := FileNameAutoCorrect(tmp_filename);
  //get archive export option
  if MessageDlg('Експортувати також і архівні питання?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then ShowArchive := true
  else ShowArchive := false;
  //run the save dialog
  if SaveDialog3.Execute then
  begin
    //set cursor face
    cursor := crSQLWait;
    try
      //log action
      testeditDM.write_log('Експорт списку питань з відповідями в форматі AIKEN (MOODLE):',ModulesDBGridEh.Columns[1].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(ModulesDBGridEh.Columns[0].DisplayText));
      //Improve performance - switch off grid datasets {10-05-2011}
      tmp_ask_ds := AskGridDBTableView.DataController.DataSource;
      AskGridDBTableView.DataController.DataSource := nil;
      tmp_answ_ds := AnswGridDBTableView1.DataController.DataSource;
      AnswGridDBTableView1.DataController.DataSource := nil;
      //disable dcWaitEndMasterScroll - options
      testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen];
      //try export
      ///mykernel.ExportToMoodle(SaveDialog3.FileName); //deprecated
      mykernel.ExportToMoodle2(SaveDialog3.FileName, DefOpenAskAnswerCount, ShowArchive);//12-02-2013
      ///mykernel.ExportToMoodle(ReportDiName+'\'+tmp_filename); //for secured version
    finally
      //enable dcWaitEndMasterScroll - options
      testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen, dcWaitEndMasterScroll];
      //Improve performance - switch on grid datasets {10-05-2011}
      AskGridDBTableView.DataController.DataSource := tmp_ask_ds;
      AnswGridDBTableView1.DataController.DataSource := tmp_answ_ds;
      //set cursor face
      cursor := crDefault;
    end;
  end;
end;
{--------Import from MOODLE file with AIKEN format---------}
procedure TMainForm.ImportMoodleCmdExecute(Sender: TObject);
var
  tmp_ask_ds, tmp_answ_ds : tdatasource;
begin
  if OpenDialogTxt.Execute then
  begin
    //log action
    testeditDM.write_log('Імпрот списку питань з відповідями з файлу MOODLE AIKEN:',ModulesDBGridEh.Columns[1].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(ModulesDBGridEh.Columns[0].DisplayText));
    //set cursor face
    cursor := crSQLWait;
    //Improve performance - switch off grid datasets {10-05-2011}
    tmp_ask_ds := AskGridDBTableView.DataController.DataSource;
    AskGridDBTableView.DataController.DataSource := nil;
    tmp_answ_ds := AnswGridDBTableView1.DataController.DataSource;
    AnswGridDBTableView1.DataController.DataSource := nil;
    //try import
    mykernel.ImportFromMoodle(OpenDialogTxt.FileName);
    //Improve performance - switch on grid datasets {10-05-2011}
    AskGridDBTableView.DataController.DataSource := tmp_ask_ds;
    AnswGridDBTableView1.DataController.DataSource := tmp_answ_ds;
    //set cursor face
    cursor := crDefault;
  end;
end;
{----------Import test questions from MoodleXML file format--------------}
procedure TMainForm.ImportMoodleXMLCmdExecute(Sender: TObject);
var
  tmp_ask_ds, tmp_answ_ds : tdatasource;
begin
  if OpenDialogXml.Execute then
  begin
    //log action
    testeditDM.write_log('Імпрот списку питань з відповідями з файлу MOODLE XLM:',ModulesDBGridEh.Columns[1].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(ModulesDBGridEh.Columns[0].DisplayText));
    //set cursor face
    cursor := crSQLWait;
    //Improve performance - switch off grid datasets {10-05-2011}
    tmp_ask_ds := AskGridDBTableView.DataController.DataSource;
    AskGridDBTableView.DataController.DataSource := nil;
    tmp_answ_ds := AnswGridDBTableView1.DataController.DataSource;
    AnswGridDBTableView1.DataController.DataSource := nil;
    //try import
    mykernel.ImportFromMoodleXLM(OpenDialogXml.FileName);
    //update records count
//    AskListDBGridEhSumListRecalcAll(Self);
    //decrease network performance - off 23-02-2011
//    testeditDM.TestAskDataSet.Close;
//    testeditDM.TestAskDataSet.Open;
    //Improve performance - switch on grid datasets {10-05-2011}
    AskGridDBTableView.DataController.DataSource := tmp_ask_ds;
    AnswGridDBTableView1.DataController.DataSource := tmp_answ_ds;
    //set cursor face
    cursor := crDefault;
  end;
end;
{======WORKING WITH HELP SYSTEM=============================}
{---------------show ABOUT dialog box-----------------------}
procedure TMainForm.AboutCmdExecute(Sender: TObject);
begin
  //manually create a ask manager form                         {+2012-06-19}
  Application.CreateForm(TAboutBox, AboutBox);
  //show about box dialog
  AboutBox.ShowModal;
  //delete form
  AboutBox.Free;                                        {+2012-06-19}
end;
{============================================================}
{=======================V-3==================================}
{-----------open ask editor dialog-------------------------------------}
procedure TMainForm.AskGridDBTableViewDblClick(Sender: TObject);
begin
  AskOpenEditorCmdExecute(Self);
end;
{-----------open answer editor dialog-------------------------------------}
procedure TMainForm.AnswGridDBTableView1DblClick(Sender: TObject);
begin
  AnswerOpenEditorCmdExecute(Self);
end;
{--------------------------save changes on exit-------------------------}
procedure TMainForm.AskAnswGridExit(Sender: TObject);
begin
  //save changes
  if AnswGridDBTableView1.DataController.DataSource.State in [dsEdit, dsInsert] then AnswGridDBTableView1.DataController.DataSource.DataSet.Post
  else if AskGridDBTableView.DataController.DataSource.State in [dsEdit, dsInsert] then AskGridDBTableView.DataController.DataSource.DataSet.Post
end;
{---------collapse previous focused record detail----------------------}
procedure TMainForm.AskGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  //collapse previous record detail
  if (APrevFocusedRecord <> nil)and(AskGridDBTableView.ViewData.Records[APrevFocusedRecord.Index].Expanded) then
         AskGridDBTableView.ViewData.Records[APrevFocusedRecord.Index].Expanded :=false;
end;
{--------------select and focus current record--------------------------}
procedure TMainForm.AskGridDBTableViewDataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  //select and focus current record
  AskGridDBTableView.DataController.FocusedRecordIndex := ARecordIndex;
  AskGridDBTableView.DataController.ClearSelection;
  AskGridDBTableView.ViewData.Records[AskGridDBTableView.DataController.FocusedRowIndex].Selected := true
end;

{--------Create copy of the Test Paper with different answers order-----}
procedure TMainForm.ClonePaperCmdExecute(Sender: TObject);
begin
  //clone paper with answer order exchange
  testeditDM.ClonePaperPerform;
  //refresh paper list
  PapersDBNavigator.BtnClick(nbRefresh);
end;
{----------Export Test Paper answers with Fast Report-------------}
procedure TMainForm.PrintOffPaperWithAnswExecute(Sender: TObject);
var
  tmpfilter : string;
  VariantTitle: TfrxMemoView;  
begin
  CheckPreparePaper(false);
  //disable filter
  tmpfilter := '';
  if testeditDM.RedyPaperMemTable.Filtered = true then
  begin
    tmpfilter := testeditDM.RedyPaperMemTable.Filter;
    testeditDM.RedyPaperMemTable.Filtered := false;
  end;
  //setup new filter - show only right answers
  testeditDM.RedyPaperMemTable.Filter := 'Weight=1';
  testeditDM.RedyPaperMemTable.Filtered := true;
  //disable dcWaitEndMasterScroll - options
  testeditDM.SubjectDataSet.DetailConditions :=[dcForceOpen];
  testeditDM.SubjTestDataSet.DetailConditions :=[dcForceOpen];  
  testeditDM.TestModDataSet.DetailConditions :=[dcForceOpen];
  testeditDM.TSect2ScDataSet.DetailConditions :=[dcForceOpen];
  testeditDM.OffPapersDataSet.DetailConditions :=[dcForceOpen];
  testeditDM.OffAsksDataSet.DetailConditions :=[dcForceOpen];
  //disable report export features
  if AllowExportPapersFR=false then testeditDM.AskListReport.PreviewOptions.Buttons := [pbPrint,pbLoad,pbSave,pbZoom,pbFind,pbOutline,pbPageSetup,pbTools,pbEdit,pbNavigator];
  //load report template
  testeditDM.AskListReport.LoadFromFile(ExtractFilePath(Application.ExeName)+Rep_OffPaperWithAnswers,true);
  //insert properly variant title
  VariantTitle := testeditDM.AskListReport.FindObject('VariantTitle') as TfrxMemoView;
  if testeditDM.SubjTestDataSet.FBN('lanng_search').AsString ='English'then VariantTitle.Text := 'Variant:'
  else if testeditDM.SubjTestDataSet.FBN('lanng_search').AsString ='Українська' then VariantTitle.Text := 'Варіант:'
       else VariantTitle.Text := 'Вариант:';
  //show report
  testeditDM.AskListReport.ShowReport();
  //enable report export features
  if AllowExportPapersFR=false then testeditDM.AskListReport.PreviewOptions.Buttons := [pbPrint,pbLoad,pbSave,pbExport,pbZoom,pbFind,pbOutline,pbPageSetup,pbTools,pbEdit,pbNavigator,pbExportQuick];
  //enable dcWaitEndMasterScroll - options
  testeditDM.SubjectDataSet.DetailConditions := [dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  testeditDM.SubjTestDataSet.DetailConditions := [dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  testeditDM.TestModDataSet.DetailConditions :=[dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  testeditDM.TSect2ScDataSet.DetailConditions :=[dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  testeditDM.OffPapersDataSet.DetailConditions :=[dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  testeditDM.OffAsksDataSet.DetailConditions :=[dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  //disable filter
  testeditDM.RedyPaperMemTable.Filtered := false;
  //enable filter
  if tmpfilter <>'' then
  begin
    testeditDM.RedyPaperMemTable.Filter := tmpfilter;
    testeditDM.RedyPaperMemTable.Filtered := true;
  end;
  testeditDM.write_log('Успішно відкрито вікно FastReport для білету №:',PapersDBGridEh.Columns[0].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(PapersDBGridEh.Columns[0].DisplayText));
end;
{--------------Export Test Paper answers to the MS Word------------------}
procedure TMainForm.ExpAnswersWordExecute(Sender: TObject);
var
  tmpcurrrec, tmpcurrmodule : integer;
begin
  //store current ask position
  tmpcurrrec := testeditDM.RedyPaperMemTable.RecNo;
  //store current module numer
  tmpcurrmodule := testeditDM.TestModDataSet.RecNo;

  CheckPreparePaper(showanswers);
  //set cursor face
  cursor := crSQLWait;
  //original method
  mykernel.PrepareWordDocument;
  mykernel.ExportAnswersWord(showanswers);
  //set cursor face
  cursor := crDefault;
  //log action
  testeditDM.write_log('Успішно експортовано в MS WORD відповіді на білет №:',PapersDBGridEh.Columns[0].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(PapersDBGridEh.Columns[0].DisplayText));
  //restore module list position
  testeditDM.TestModDataSet.RecNo := tmpcurrmodule;
  //restore database position - ask
  testeditDM.RedyPaperMemTable.RecNo := tmpcurrrec;

end;
{-----------Manual open subject and off-papers dataset-----------------}
procedure TMainForm.TestEditTabShow(Sender: TObject);
begin
  //open subject and off-papers dataset
  if (testeditDM.TestDB.Connected)and(testeditDM.SubjectDataSet.Active = false) then
  begin
    testeditDM.SubjectDataSet.DetailConditions:= [dcForceOpen, dcWaitEndMasterScroll, dcForceMasterRefresh];
    testeditDM.OffPapersDataSet.DetailConditions:= [dcForceOpen, dcWaitEndMasterScroll, dcForceMasterRefresh];
    testeditDM.SubjectDataSet.Open;
    testeditDM.OffPapersDataSet.Open;
  end;
end;

{-------luanch internal database query to update asc count for each sciense---------}
procedure TMainForm.UpdateAskcountCmdExecute(Sender: TObject);
begin
  //set cursor face
  cursor := crSQLWait;
  //execute update procedure
  testeditDM.UpdateAskCountPerSciens(0);
  //set cursor face
  cursor := crDefault;
end;
{==============CxDBGRID-GRID MODE PROCESSING====================}
{--------------manual calculating summaries---------------------}
procedure TMainForm.AskGridDBTableViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
const
  tmptotalstr  = 'Всього питань: ';
  tmpfilterstr = 'Показано питань: ';
///  tmpselectstr = 'Виділено питань: ';
begin
  try
  //check is the grid connected to data
  if not AskGridDBTableView.IsPattern and AskGridDBTableView.DataController.Active then
  begin
    //check is filter enabled
    if AskGridDBTableView.DataController.Filter <> nil then
       AskGridDBTableView.DataController.Summary.FooterSummaryValues[0]:= tmpfilterstr + inttostr(testeditDM.TestAskDataSet.VisibleRecordCount)
    else
       AskGridDBTableView.DataController.Summary.FooterSummaryValues[0]:= tmptotalstr + inttostr(testeditDM.TestAskDataSet.RecordCountFromSrv);
  end
  else AskGridDBTableView.DataController.Summary.FooterSummaryValues[0]:= ' ';
  except
    ShowMessage('summary error');
  end;
//
end;
{--------------manual calculating summaries depend selection record count-------}
procedure TMainForm.AskGridDBTableViewSelectionChanged(
  Sender: TcxCustomGridTableView);
const
  tmptotalstr  = 'Всього питань: ';
  tmpselectstr = 'Виділено питань: ';
  tmpfilterstr = 'Показано питань: ';
begin
  try
  //check is the grid connected to data
  if not AskGridDBTableView.IsPattern and AskGridDBTableView.DataController.Active then
  begin
    //check is selection enabled
    if AskGridDBTableView.DataController.GetSelectedCount > 1 then
       AskGridDBTableView.DataController.Summary.FooterSummaryValues[0]:= tmpselectstr + inttostr(AskGridDBTableView.Controller.SelectedRecordCount)
    else
    begin
      if AskGridDBTableView.DataController.Filter <> nil then
         AskGridDBTableView.DataController.Summary.FooterSummaryValues[0]:= tmpfilterstr + inttostr(testeditDM.TestAskDataSet.VisibleRecordCount)
      else
        AskGridDBTableView.DataController.Summary.FooterSummaryValues[0]:= tmptotalstr + inttostr(testeditDM.TestAskDataSet.RecordCountFromSrv);
    end;
  end
  else AskGridDBTableView.DataController.Summary.FooterSummaryValues[0]:= ' ';
  except
    ShowMessage('Unknown Selection Error');
  end;
end;
{--------------manual calculating summaries depend filtering record-------}
procedure TMainForm.AskGridDBTableViewDataControllerFilterChanged(
  Sender: TObject);
const
  tmptotalstr  = 'Всього питань: ';
  tmpfilterstr = 'Показано питань: ';
begin
  try
  //check is the grid connected to data
  if not AskGridDBTableView.IsPattern and AskGridDBTableView.DataController.Active then
  begin
    //check is filter enabled
    if AskGridDBTableView.DataController.Filter <> nil then
       AskGridDBTableView.DataController.Summary.FooterSummaryValues[0]:= tmpfilterstr + inttostr(testeditDM.TestAskDataSet.VisibleRecordCount)
    else
       AskGridDBTableView.DataController.Summary.FooterSummaryValues[0]:= tmptotalstr + inttostr(testeditDM.TestAskDataSet.RecordCountFromSrv);
  end
  else AskGridDBTableView.DataController.Summary.FooterSummaryValues[0]:= ' ';
  except
    ShowMessage('filter error');
  end;
end;
{================AUTO CONTROL ALIGMENT==============================}
{---set default and limits to the splitters and panels--------------}
procedure TMainForm.FormResize(Sender: TObject);
begin
  //page1
  //move splitter between list of the sciens and list of the asks per each
  SciensGB.Constraints.MinWidth := mainform.Width div 3;
  SciensGB.Width := mainform.Width div 2;
  sciens2asksSplitter.MinSize := mainform.Width div 3;
  //page 2
  //move main splitter on the Test Edit tab
  tests2paperspane.Constraints.MinWidth := mainform.Width div 3;
  tests2paperspane.Width := mainform.Width div 2;
  test2papersplitter.MinSize := mainform.Width div 3;
  //move splitter between list of the subect/tests and the list of the modules per current test
  test2modulespane.Constraints.MinHeight := tests2paperspane.Height div 2;
  test2modulespane.Height := 2*(tests2paperspane.Height div 3);
  test2modulessplitter.MinSize := tests2paperspane.Height div 3;
  //move splitter between list of the subjects and list of the test per thouse subjects
  subjPanel.Constraints.MinHeight := test2modulespane.Height div 3;
  subjPanel.Height := test2modulespane.Height div 2;
  subj2testsSplitter.MinSize := test2modulespane.Height div 3;
  //move splitter between list of the papers and preview panel
  papersPanel.Constraints.MinHeight := papers2previewPanel.Height div 3;
  papersPanel.Height := papers2previewPanel.Height div 2;
  paper2previewSplitter.MinSize := papers2previewPanel.Height div 3;
end;
{================Color customization==============================}
{---------chnge row colors for the archive questions--------------}
procedure TMainForm.AskGridDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[AskGridDBTableView.GetColumnByFieldName('ARCHIVE').Index]>0 then
    ACanvas.Canvas.Brush.Color := $B9B9FF;
end;
{---------chnge row colors for the right answer--------------}
procedure TMainForm.AnswGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[AnswGridDBTableView1.GetColumnByFieldName('WEIGHT').Index]>0 then
     ACanvas.Canvas.Brush.Color := $fbcf23;
end;
{---------------search for the invalid ask---------------------}
procedure TMainForm.InvalidAskSearchCmdExecute(Sender: TObject);
var
  InvlidAskId,InvalidSciensID : integer;
  SearchRes : boolean;
begin
  //get parameter
  InvlidAskId := strtoint(inputbox('Швидкий пошук', 'Введіть код неваідного питання:', '0' ));
  //search sciens ID
  testeditDM.InvalidAskSearch(InvlidAskId, InvalidSciensID, SearchRes);
  //locate ask in grid
  if SearchRes = true then
  begin
    if ModulesDBGridEh.DataSource.DataSet.Locate('ID_SCIENS', InvalidSciensID, []) = true then
    begin
      with AskGridDBTableView.DataController.Filter.Root do
      begin
        //clear all existing filter conditions
        Clear;
        //add new filter conditions
        AddItem(AskGridDBTableViewID_ASK, foEqual, InvlidAskId, inttostr(InvlidAskId));
      end;
      AskGridDBTableView.DataController.Filter.Active:=true;
//      AskGridDBTableView.DataController.DataSet.Locate('ID_ASK', InvlidAskId, []);
    end
    else Messagedlg('Помилка вибору категорії', mtError, [mbOK], 0);
  end
  else Messagedlg('Нічого не знайдено', mtError, [mbOK], 0);
end;
{---------------2013-search question without answers--------------------}
procedure TMainForm.SrchAnswerlessQstCmdExecute(Sender: TObject);
var
  FoundRes : Variant;
  SearchRes : boolean;
  AItemList: TcxFilterCriteriaItemList;
begin
  //search by sciens ID
  testeditDM.SearchAskWithoutCorrectAnswer(testeditDM.SciensDataSet.FBN('ID_SCIENS').asstring, FoundRes, SearchRes);
  //set ask list filter
  if SearchRes=true then
  begin
    AskGridDBTableView.DataController.Filter.BeginUpdate;
    try
      AskGridDBTableView.DataController.Filter.Root.Clear;
      AItemList := AskGridDBTableView.DataController.Filter.Root.AddItemList(fboAND);
      AItemList.AddItem(AskGridDBTableViewID_ASK, foInList, FoundRes, SrchAnswerlessQstCmd.Caption);
      try
        AskGridDBTableView.Datacontroller.Filter.Active := True;
      except
      end;
    finally
      AskGridDBTableView.DataController.Filter.EndUpdate;
      Messagedlg('Знайдено проблемних питань: '+ inttostr(VarArrayHighBound(FoundRes, 1)+1), mtWarning, [mbOK], 0);
    end;
  end
  else Messagedlg('Питань без вказаної правильної відповіді не знайдено', mtWarning, [mbOK], 0);
end;
{---------------2013-search question with answer count less than required--------------------}
procedure TMainForm.SrchAnswerCountNotEqueaCmdExecute(Sender: TObject);
var
  CorrectAnswerCount : string;
  FoundRes : Variant;
  SearchRes : boolean;
  AItemList: TcxFilterCriteriaItemList;
begin
  //get parameter
  CorrectAnswerCount := (inputbox('Швидкий пошук', 'Введіть задану кількість відповідей:', inttostr(DefOpenAskAnswerCount) ));
  //search by sciens ID
  testeditDM.SearchAskWithIncorrectAnswersCount(testeditDM.SciensDataSet.FBN('ID_SCIENS').asstring, CorrectAnswerCount, FoundRes, SearchRes);
  //set ask list filter
  if SearchRes=true then
  begin
    AskGridDBTableView.DataController.Filter.BeginUpdate;
    try
      AskGridDBTableView.DataController.Filter.Root.Clear;
      AItemList := AskGridDBTableView.DataController.Filter.Root.AddItemList(fboAND);
      AItemList.AddItem(AskGridDBTableViewID_ASK, foInList, FoundRes, SrchAnswerCountNotEqueaCmd.Caption+' '+CorrectAnswerCount);
      try
        AskGridDBTableView.Datacontroller.Filter.Active := True;
      except
      end;
    finally
      AskGridDBTableView.DataController.Filter.EndUpdate;
      Messagedlg('Знайдено проблемних питань: '+ inttostr(VarArrayHighBound(FoundRes, 1)+1), mtWarning, [mbOK], 0);
    end;
  end
  else Messagedlg('Питань з кількістю відповідей, нем рівною ' +CorrectAnswerCount + ' не знайдено', mtWarning, [mbOK], 0);
end;
{=============================================================================================}
{---------------2012-display report with list question without answer text--------------------}
procedure TMainForm.PrintAskListOnlyExecute(Sender: TObject);
var
  tmp_ask_ds, tmp_answ_ds : tdatasource;
  nm0, nm1, nm2, nm3 : string;
begin
  //log action
  testeditDM.write_log('Запит списку питань без дистракторів по модулю (розділу):',ModulesDBGridEh.Columns[1].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(ModulesDBGridEh.Columns[0].DisplayText));
  //set cursor face
  cursor := crSQLWait;
  //disable dcWaitEndMasterScroll - options
  testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen];
  //Improve performance - switch off grid datasets {10-05-2011}
  tmp_ask_ds := AskGridDBTableView.DataController.DataSource;
  AskGridDBTableView.DataController.DataSource := nil;
  tmp_answ_ds := AnswGridDBTableView1.DataController.DataSource;
  AnswGridDBTableView1.DataController.DataSource := nil;
  try
    //load report template
    testeditDM.AskListReport.LoadFromFile(ExtractFilePath(Application.ExeName)+Rep_AskListOnly,true);
    testeditDM.AskListRTFExport.ShowDialog := true;
    try
      //prepare filename template
      nm0 := 'ID_'+ModulesDBGridEh.fields[0].AsString;//module ID
      nm1 := leftstr(ModulesDBGridEh.fields[1].AsString,30);  //module name
      nm2 := ModulesDBGridEh.Fields[3].AsString; //language name
      nm3 := 'sem_'+ModulesDBGridEh.Fields[5].AsString;   //semestr number
      testeditDM.AskListRTFExport.FileName := FileNameAutoCorrect(nm0 + '_' + nm1 + '_'+ nm2 + '_'+ nm3+RTF_ext);
      //show report
      testeditDM.AskListRTFExport.ShowDialog := true;
      testeditDM.AskListReport.ShowReport();
    except
    end;
  finally
    //Improve performance - switch on grid datasets {10-05-2011}
    AskGridDBTableView.DataController.DataSource := tmp_ask_ds;
    AnswGridDBTableView1.DataController.DataSource := tmp_answ_ds;
    //set cursor face
    cursor := crDefault;
    //enable dcWaitEndMasterScroll - options
    testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen, dcWaitEndMasterScroll];
  end;
end;
{-------2012-batch processing reports-list of question s by sciens with correct answers-----}
procedure TMainForm.PrintAskAnswerOnlyExecute(Sender: TObject);
var
  tmp_ask_ds, tmp_answ_ds : tdatasource;
  nm0, nm1, nm2, nm3 : string;
begin
  //log action
  testeditDM.write_log('Запит списку відповідей на питання по модулю (розділу):',ModulesDBGridEh.Columns[1].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(ModulesDBGridEh.Columns[0].DisplayText));
  //disable dcWaitEndMasterScroll - options
  testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen];
  //set cursor face
  cursor := crSQLWait;
  //Improve performance - switch off grid datasets {10-05-2011}
  tmp_ask_ds := AskGridDBTableView.DataController.DataSource;
  AskGridDBTableView.DataController.DataSource := nil;
  tmp_answ_ds := AnswGridDBTableView1.DataController.DataSource;
  AnswGridDBTableView1.DataController.DataSource := nil;
  //prepare filename template
  nm0 := 'ID_'+ModulesDBGridEh.fields[0].AsString;//module ID
  nm1 := leftstr(ModulesDBGridEh.fields[1].AsString,30);  //module name
  nm2 := ModulesDBGridEh.Fields[3].AsString; //language name
  nm3 := 'sem_'+ModulesDBGridEh.Fields[5].AsString;   //semestr number
  //select destionation folder
  SaveDialog2.FileName := FileNameAutoCorrect(nm0 + '_'+ nm1 + '_'+ nm2 + '_'+ nm3 + '-answers!'+RTF_ext);
  try
    //load report template
 //   testeditDM.AskListReport.LoadFromFile(ExtractFilePath(Application.ExeName)+Rep_AskAnswerOnly,true);
    if SaveDialog2.Execute then
    begin
      try
        //launch report execution
        testeditDM.PrintQuestionAnswersToHTML(SaveDialog2.FileName);
        //show report
   //     testeditDM.AskListReport.ShowReport();
      except
      end;
    end;
  finally
    //Improve performance - switch on grid datasets {10-05-2011}
    if tmp_ask_ds<>nil then AskGridDBTableView.DataController.DataSource := tmp_ask_ds;
    if tmp_answ_ds<>nil then AnswGridDBTableView1.DataController.DataSource := tmp_answ_ds;
    //set cursor face
    cursor := crDefault;
    //enable dcWaitEndMasterScroll - options
    testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen, dcWaitEndMasterScroll];
  end;
end;
{---------------2012-display report with list question without answer text--------------------}
procedure TMainForm.BatchAskListWithAnswerExecute(Sender: TObject);
var
  i : integer;
  tmp_ask_ds, tmp_answ_ds : tdatasource;
  nm0, nm1, nm2, nm3, initfolder, batchscienslisfoder, batchscienslistfilename : string;
  batchscienslist : tstringlist;
  tmp_filter_flag, loadsuccesful, repbuildsuccessful, repexportsucessful, ShowAnswers, ShowArchive : boolean;
begin
  if OpenDialogTXT.Execute then
  begin
    //default path to store result
    initfolder := GetSpecialPath(CSIDL_PERSONAL);
    //select destination folder
    if SelectDirectory('Папка для збереження результатів:', initfolder, batchscienslisfoder) then
    begin
      try
        //log action
        testeditDM.write_log('Запит списку питань з вказаними правильними відповідями по модулю (розділу):',ModulesDBGridEh.Columns[1].DisplayText, basevar.Settings.LUserID, basevar.Settings.LUserDepID, strtoint(ModulesDBGridEh.Columns[0].DisplayText));
        //disable dcWaitEndMasterScroll - options
        testeditDM.TestAskDataSet.DetailConditions :=[dcForceOpen];
        testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen];
        //set cursor face
        cursor := crSQLWait;
        //Improve performance - switch off grid datasets {10-05-2011}
        tmp_ask_ds := AskGridDBTableView.DataController.DataSource;
        AskGridDBTableView.DataController.DataSource := nil;
        tmp_answ_ds := AnswGridDBTableView1.DataController.DataSource;
        AnswGridDBTableView1.DataController.DataSource := nil;
        //prepare local variables
        batchscienslist := TstringList.Create;
        loadsuccesful := true;
        try
          batchscienslist.LoadFromFile(OpenDialogTXT.FileName);
        except
          loadsuccesful := false;
        end;
        if loadsuccesful then //list of the sciens loaded
        begin
          //get archive export option
          if MessageDlg('Експортувати також і архівні питання?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then ShowArchive := true
          else ShowArchive := false;
          tmp_filter_flag := testeditDM.RedyPaperMemTable.Filtered; {+2014/08/12 - fix 0 question export for admins}
          testeditDM.RedyPaperMemTable.Filtered:=false;  {+2014/08/12 - fix 0 question export for admins}
          //process all sciens ID
          for i:=0 to batchscienslist.Count-1 do
          begin
            //options-do not show answers
            if Sender=BatchAskListWithAnswer then ShowAnswers := true;
            if testeditDM.SciensDataSet.Locate('ID_SCIENS',strtoint(batchscienslist.Strings[i]) ,[]) then
            begin  //sciens record found
              testeditDM.PrepareCurrentSciensAsksList(batchscienslist.Strings[i], ShowAnswers, ShowArchive);  {2012-04-24}
              //load report template
              if Sender=BatchAskListWithAnswer then testeditDM.AskListReport.LoadFromFile(ExtractFilePath(Application.ExeName)+Rep_AskListWithAnswersBatch,true);
              testeditDM.AskListRTFExport.FileName := leftstr(testeditDM.SciensDataSet.fbn('SC_NAME').AsString,30)+RTF_ext;
              testeditDM.AskListRTFExport.ExportPageBreaks := false;
              testeditDM.AskListRTFExport.HeaderFooterMode := hfNone;
              testeditDM.AskListRTFExport.ShowDialog := false;
              try
                //prepare filename template
                nm0 := 'ID_'+ModulesDBGridEh.fields[0].AsString;//module ID
                nm1 := leftstr(ModulesDBGridEh.fields[1].AsString,30);  //module name
                nm2 := ModulesDBGridEh.Fields[3].AsString; //language name
                nm3 := 'sem_'+ModulesDBGridEh.Fields[5].AsString;   //semestr number
                testeditDM.AskListRTFExport.FileName := batchscienslisfoder + '\' + FileNameAutoCorrect(nm0 + '_' + nm1 + '_'+ nm2 + '_'+ nm3+RTF_ext);
                //build report without dislpay
       //         repbuildsuccessful := testeditDM.AskListReport.ShowReport();
                repbuildsuccessful := testeditDM.AskListReport.PrepareReport(true);
              except
                repbuildsuccessful :=false;
              end;
              //export report to RTF file;
              if repbuildsuccessful then repexportsucessful := testeditDM.AskListReport.Export(testeditDM.AskListRTFExport);
         //                             testeditDM.AskListReport.Clear;
            end;   //else - error - record not found
          end;
        end;
      finally
        //Improve performance - switch on grid datasets {10-05-2011}
        AskGridDBTableView.DataController.DataSource := tmp_ask_ds;
        AnswGridDBTableView1.DataController.DataSource := tmp_answ_ds;
        //set cursor face
        cursor := crDefault;
        //enable dcWaitEndMasterScroll - options
        testeditDM.TestAskDataSet.DetailConditions :=[dcForceOpen, dcWaitEndMasterScroll];
        testeditDM.AnswerDataSet.DetailConditions :=[dcForceOpen, dcWaitEndMasterScroll];
        //destroy local variables
        batchscienslist.Free;
        testeditDM.RedyPaperMemTable.Filtered:=tmp_filter_flag;  {+2014/08/12 - fix 0 question export for admins}
      end;
    end;
  end;

end;
//get path to the system folders
function TMainForm.GetSpecialPath(CSIDL: word): string;
  var s: string;
begin
  SetLength(s, MAX_PATH);
  if not SHGetSpecialFolderPath(0, PChar(s), CSIDL, true)
  then s := '';
  result := PChar(s);
end;
//remove special characters from filename or setup default filename  {+2012-06-21}
function TMainForm.FileNameAutoCorrect(AFileName: string): String;
var
 c: Char;
 i: Integer;
 deffilename : string;
begin
  deffilename := 'AutoFile-' + DateTimeToStr(Now); //default filename
  // Name length, Reserved names, Complex reserved names
  if (AFileName = '') or (AFileName = 'AUX') or (AFileName = 'PRN') or (AFileName = 'CON')
    or (Copy(AFileName, 1, 3) = 'COM') or (Copy(AFileName, 1, 3) = 'LPT') then
  begin
    Result := deffilename;
    Exit;
  end;
  // Special characters
  for i := 1 to Length(AFileName) do
  begin
    try
      c := AFileName[i];
      if (c in ['\', '/', ':', '*', '?', '"', '<', '>', '|', ',', '.', #13, #10]) then AFileName[i]:='-';
    except
      Result := deffilename;
      Exit;
    end;
    Result := AFileName;
  end;
end;



end.
