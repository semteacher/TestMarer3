unit settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, ShlObj, MyShlObj, CCButtonPanel, Buttons, ValEdit, Grids;

type
  TSettingsEditForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    DBSettingGB: TGroupBox;
    DatabaseOpenDialog: TOpenDialog;
    ConnectDBSBut: TSpeedButton;
    ChooseDBFileSBut: TSpeedButton;
    AddServerSBut: TSpeedButton;
    DelServerSBut: TSpeedButton;
    DatabasesListEditor: TValueListEditor;
    DefaultServersSBut: TSpeedButton;
    AllSettingsGB: TGroupBox;
    EditorsSettingGB: TGroupBox;
    Label4: TLabel;
    ClearAskFormatChB: TCheckBox;
    ClearAnswerFormatChB: TCheckBox;
    DefFontSizeSpinEdit: TSpinEdit;
    SetMinFontCheckBox: TCheckBox;
    DefAskSettingGB: TGroupBox;
    Label1: TLabel;
    DefOpenAskCountSpinEdit: TSpinEdit;
    WordSettingsGB: TGroupBox;
    Label5: TLabel;
    ShowPersonChBox: TCheckBox;
    ShowSignChBox: TCheckBox;
    wordFontsizeSpinEdit: TSpinEdit;
    SetFontsizeChBox: TCheckBox;
    ShowGroupChBox: TCheckBox;
    ShowSpecChBox: TCheckBox;
    ShowSubjChBox: TCheckBox;
    ShowFacultyChBox: TCheckBox;
    ShowSemesterChBox: TCheckBox;
    ShowDateChBox: TCheckBox;
    ShowPageChBox: TCheckBox;
    EtalonGroupBox: TGroupBox;
    Label6: TLabel;
    EtalonPageComboBox: TComboBox;
    DefaultSpeedButton: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure ButtonPanel1ButtonOkClick(Sender: TObject);
    procedure DefaultSpeedButtonClick(Sender: TObject);
    procedure DisplaySettings;
    procedure EtalonPageComboBoxExit(Sender: TObject);
    procedure ConnectDBSButClick(Sender: TObject);
    procedure DelServerSButClick(Sender: TObject);
    procedure AddServerSButClick(Sender: TObject);
    procedure ChooseDBFileSButClick(Sender: TObject);
    procedure DefaultServersSButClick(Sender: TObject);
    procedure SetDefaultserverList;
    procedure FormCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsEditForm: TSettingsEditForm;

implementation

uses main, datamod, basevar, pFIBDatabase, login;

{$R *.dfm}
{====================================================}
procedure TSettingsEditForm.DisplaySettings;
var
  tmppos : integer;
begin
  ClearAskFormatChB.Checked := basevar.Settings.AskFormatSt;
  ClearAnswerFormatChB.Checked := basevar.Settings.AnswerFormatSt;
  SetMinFontCheckBox.Checked := basevar.Settings.MinFontSt;

  DefOpenAskCountSpinEdit.Value := basevar.Settings.OpenAskAnswCount;
  DefFontSizeSpinEdit.Value := basevar.Settings.MinFontSize;

  ShowPersonChBox.Checked := basevar.Settings.W_ShowPerson;
  ShowSignChBox.Checked := basevar.Settings.W_ShowSign;
  ShowGroupChBox.Checked := basevar.Settings.W_ShowGroup;
  ShowSpecChBox.Checked := basevar.Settings.W_ShowSpec;
  ShowSubjChBox.Checked := basevar.Settings.W_ShowSubj;
  ShowFacultyChBox.Checked := basevar.Settings.W_ShowFaculty;
  ShowSemesterChBox.Checked := basevar.Settings.W_ShowSemestr;
  ShowDateChBox.Checked := basevar.Settings.W_ShowDate;
  ShowPageChBox.Checked := basevar.Settings.W_ShowPage;

  SetFontsizeChBox.Checked := basevar.Settings.W_SetFontSize;
  wordFontsizeSpinEdit.Value := basevar.Settings.W_FontSize;
  try
    //load list of the databases files
///    DatabasesListEditor.Strings.LoadFromFile(ExtractFilePath(Application.ExeName)+DatabaseListFileName);
    DatabasesListEditor.Strings.LoadFromFile(GetSpecialPath(CSIDL_APPDATA)+ '\' + AppDirName+ '\'+DatabaseListFileName);
  except
    SetDefaultserverList;
    //display current server
    basevar.Settings.CurrDBServerID := 1;
    basevar.Settings.CurrDBFileName := dbfilepath_loc+dbfilename;
  end;
  //display current server
  DatabasesListEditor.Row := basevar.Settings.CurrDBServerID;
  //search combobox for text
  tmppos := EtalonPageComboBox.Items.IndexOf(inttostr(basevar.Settings.PageAskLimit));
  if tmppos = -1 then
  //need add one new item in drop-down list
  begin
    EtalonPageComboBox.Items.Append(inttostr(basevar.Settings.PageAskLimit));
    EtalonPageComboBox.ItemIndex := EtalonPageComboBox.Items.Count-1;
  end
  else EtalonPageComboBox.ItemIndex := tmppos;
end;
{====================================================}
procedure TSettingsEditForm.FormActivate(Sender: TObject);
begin
//  testeditDM.PrepareServersList;
  //display current settings
  DisplaySettings;
end;
{====================================================}
procedure TSettingsEditForm.ButtonPanel1ButtonOkClick(Sender: TObject);
var
  tmppath : string;
begin
  //store current values of the parameters
  basevar.Settings.AskFormatSt := ClearAskFormatChB.Checked;
  basevar.Settings.AnswerFormatSt := ClearAnswerFormatChB.Checked;
  basevar.Settings.OpenAskAnswCount := DefOpenAskCountSpinEdit.Value;
  basevar.Settings.MinFontSt := SetMinFontCheckBox.Checked;
  basevar.Settings.MinFontSize := DefFontSizeSpinEdit.Value;
  //store current of the database connection
///  basevar.Settings.CurrDBFileName := DatabasesListEditor.Values[DatabasesListEditor.Keys[DatabasesListEditor.Row]];
/// basevar.Settings.CurrDBServerID := DatabasesListEditor.Row;
  //store current Word settings
  basevar.Settings.W_ShowPerson := ShowPersonChBox.Checked;
  basevar.Settings.W_ShowSign := ShowSignChBox.Checked;
  basevar.Settings.W_ShowGroup := ShowGroupChBox.Checked;
  basevar.Settings.W_ShowSpec := ShowSpecChBox.Checked;
  basevar.Settings.W_ShowSubj := ShowSubjChBox.Checked;
  basevar.Settings.W_ShowFaculty := ShowFacultyChBox.Checked;
  basevar.Settings.W_ShowSemestr := ShowSemesterChBox.Checked;
  basevar.Settings.W_ShowDate := ShowDateChBox.Checked;
  basevar.Settings.W_ShowPage := ShowPageChBox.Checked;

  basevar.Settings.W_SetFontSize := SetFontsizeChBox.Checked;
  basevar.Settings.W_FontSize := wordFontsizeSpinEdit.Value;
  //save current value of the ask per page count 
  basevar.Settings.PageAskLimit := strtoint(EtalonPageComboBox.Text);
  //save list of the databses
///  DatabasesListEditor.Strings.SaveToFile(ExtractFilePath(Application.ExeName)+DatabaseListFileName);
  tmppath := GetSpecialPath(CSIDL_APPDATA)+ '\' + AppDirName;
  if not DirectoryExists(tmppath)then CreateDir(tmppath); //check folder exist
  DatabasesListEditor.Strings.SaveToFile(tmppath + '\'+ DatabaseListFileName);
end;
{====================================================}
procedure TSettingsEditForm.DefaultSpeedButtonClick(Sender: TObject);
begin
  //set default values of the parameters
  basevar.Settings.SetDefaultSettings;
  DisplaySettings;
end;
{====================================================}
procedure TSettingsEditForm.EtalonPageComboBoxExit(Sender: TObject);
begin
  if strtoint(EtalonPageComboBox.Text) > DefPageAskLimit then
  begin
    //error - bad value
    MessageDlg('Ввведено недопустиме значення! Буде встановлено значення по замовчуванню!', mtError, [mbOk], 0);
    EtalonPageComboBox.ItemIndex := DefPageAskLimitID; //set dafault value
  end
  else //need add one new item in drop-down list
  begin
    //chek - if this value exist in list or not
    if EtalonPageComboBox.Items.IndexOf(EtalonPageComboBox.Text)=-1 then
    begin //add new value
      EtalonPageComboBox.Items.Append(EtalonPageComboBox.Text);
      EtalonPageComboBox.ItemIndex := EtalonPageComboBox.Items.Count-1;
    end  //scroll to exist value
    else EtalonPageComboBox.ItemIndex := EtalonPageComboBox.Items.IndexOf(EtalonPageComboBox.Text);
  end;
  EtalonPageComboBox.Update; //update control
end;
{=========WORKING WITH LIST OF THE DATABASES==================}
{---------connect to selected database file-------------------}
procedure TSettingsEditForm.ConnectDBSButClick(Sender: TObject);
begin
  //close current connection
  if basevar.Settings.DBConnected = true then
  begin
    testeditDM.DatabaseDisconnect;
    basevar.Settings.SetDatabaseLoc;
  end;
  //set new selection
  basevar.Settings.CurrDBTitle := DatabasesListEditor.Keys[DatabasesListEditor.Row];
  basevar.Settings.CurrDBFileName := DatabasesListEditor.Values[DatabasesListEditor.Keys[DatabasesListEditor.Row]];
  basevar.Settings.CurrDBServerID := DatabasesListEditor.Row;
  //connect to new database
//  testeditDM.DatabaseConnect;
  if basevar.Settings.DBConnected = false then
  begin
    ModalResult := mrOK;
    ButtonPanel1ButtonOkClick(self);
    MainForm.StartUserLogin;
    close;
  end;
end;
{------------delete database filenane from list----------------}
procedure TSettingsEditForm.DelServerSButClick(Sender: TObject);
begin
  DatabasesListEditor.DeleteRow(DatabasesListEditor.Row);
end;
{-------------add database filename to list--------------------}
procedure TSettingsEditForm.AddServerSButClick(Sender: TObject);
begin
  if DatabaseOpenDialog.Execute then DatabasesListEditor.InsertRow('Імя нового серверу',DatabaseOpenDialog.FileName,true);
end;
{--------------select new database filename--------------------}
procedure TSettingsEditForm.ChooseDBFileSButClick(Sender: TObject);
begin
  if DatabaseOpenDialog.Execute then
  DatabasesListEditor.Values[DatabasesListEditor.Keys[DatabasesListEditor.Row]] := DatabaseOpenDialog.FileName;
end;
{-------------set default server list--------------------------}
procedure TSettingsEditForm.DefaultServersSButClick(Sender: TObject);
begin
  if MessageDlg('Наявний список буде очищено! Продовжити?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
        then SetDefaultserverList;
end;
{-----------------------fill default server list------------------------}
procedure TSettingsEditForm.SetDefaultserverList;
begin
  DatabasesListEditor.Strings.Clear;
  DatabasesListEditor.InsertRow(dbfilepath_loc_name,dbfilepath_loc+dbfilename,true);
  DatabasesListEditor.InsertRow(dbfilepath_tdmu_name,dbfilepath_tdmu+dbfilename,true);
  DatabasesListEditor.InsertRow(dbfilepath_medinf_name,dbfilepath_medinf+dbfilename,true);
  DatabasesListEditor.InsertRow(dbfilepath_medinf_out_name,dbfilepath_medinf_out+dbfilename,true);
end;

procedure TSettingsEditForm.FormCreate(Sender: TObject);
begin
  //set default values of the parameters
  basevar.Settings.SetDefaultSettings;
  DisplaySettings;
end;

end.
