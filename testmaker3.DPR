program testmaker3;

uses
  Forms,
  basevar in 'basevar.pas',
  Main in 'Main.pas' {MainForm},
  datamod in 'datamod.pas' {testeditDM: TDataModule},
  langRef in 'langRef.pas' {LangRefForm},
  LibScRef in 'LibScRef.pas' {LibSciensRefEditor},
  UserRef in 'UserRef.pas' {UserRefForm},
  settings in 'settings.pas' {SettingsEditForm},
  askedit in 'askedit.pas' {AskEditForm},
  answedit in 'answedit.pas' {AnswEditForm},
  login in 'login.pas' {LoginForm},
  mykernel in 'mykernel.pas',
  advtestmodedit in 'advtestmodedit.pas' {AdvTestModEditor},
  DepEdit in 'DepEdit.pas' {DepEditForm},
  sendkey in 'sendkey.pas',
  askmanager in 'askmanager.pas' {MoveTestAsk},
  about in 'about.pas' {AboutBox},
  Umd5 in 'Umd5.pas',
  UserName in 'UserName.pas',
  NewUser in 'NewUser.pas' {NewUserForm},
  crypt in 'crypt.pas',
  MyShlObj in 'MyShlObj.pas',
  MoodleXML in 'MoodleXML.pas';


{$R *.RES}

begin
  Application.Initialize;
//set default settings

//create database connection

///  Application.CreateForm(TtesteditDM, testeditDM);

  //craete main form
  Application.CreateForm(TMainForm, MainForm);
  //create database connection
  Application.CreateForm(TtesteditDM, testeditDM);

  //create all other forms
//  Application.CreateForm(TLoginForm, LoginForm);  // {-2012-05-17} will be created manually on-demand
//  Application.CreateForm(TLangRefForm, LangRefForm);
//  Application.CreateForm(TLibSciensRefEditor, LibSciensRefEditor);
//  Application.CreateForm(TUserRefForm, UserRefForm);
  Application.CreateForm(TSettingsEditForm, SettingsEditForm);
//  Application.CreateForm(TAskEditForm, AskEditForm);
  Application.CreateForm(TAnswEditForm, AnswEditForm);
//  Application.CreateForm(TAdvTestModEditor, AdvTestModEditor);
//  Application.CreateForm(TMoveTestAsk, MoveTestAsk);
//  Application.CreateForm(TDepEditForm, DepEditForm);
//  Application.CreateForm(TAboutBox, AboutBox);
//  Application.CreateForm(TNewUserForm, NewUserForm);  

  Application.Run;
end.
