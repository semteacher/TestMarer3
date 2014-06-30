unit basevar;

interface

uses sysutils, StdCtrls, Windows, classes, crypt;

type
  TSpecSymb = set of char;

const
  yes : integer = 1;
  no : integer = 0;
  //application name
  ProductName = 'Редактор Тестових Питань Та Білетів - 3';
  copyright = 'Copyright 2007-2014. All rigth reserved';
  mail_text = 'semteacher@mail.ru';

  //database default file name
  dbfilename = 'TDMU_TEST.GDB';
  //database default file location
  dbfilepath_loc = 'D:\TEST_DB\'; {local pc}
  dbfilepath_loc_name = 'Локальна база даних';
  dbfilepath_tdmu = '10.21.0.204:/var/data/'; {tdmu campus server}
  dbfilepath_tdmu_name = 'Сервер центру тестування ТДМУ';
  dbfilepath_medinf = '192.168.3.100:D:\DB\Java\'; {medinfdep local server}
  dbfilepath_medinf_name = 'Сервер кафедри медичної інформатики';
  dbfilepath_medinf_out = '10.21.0.193:D:\DB\Java\'; {medinfdep campus server}
  dbfilepath_medinf_out_name = 'Сервер каф. медінформатики (зовн.)';
  //database default connection properties
  dbusername = 'SYSDBA';
  dbuserpass = 'masterkey';
//  dbusername = 'ROMAN';
//  dbuserpass = 'bublik';
  locatecode = 'WIN1251';

  //file extensions
  RTF_ext : string = '.rtf';
  //databaselist filename
  DatabaseListFileName = 'Databases.cfg';
  //etalon database filename
  EtalonFilename = 'Etalon.mdb';
  //report filenames
//  Rep_AskListWithAnswers     :string = 'Reports\ask_list_with_answers.fr3';//support separate image field
//  Rep_AskListWithoutAnswers  :string = 'Reports\ask_list_without_answers.fr3';//support separate image field
  Rep_AskListWithAnswers     :string = 'Reports\ask_list_with_answers_noimg.fr3';//did not support separate image field
  Rep_AskListWithAnswers2    :string = 'Reports\ask_list_with_answers_noimg_mt.fr3';//did not support deparate image field
  Rep_AskListWithoutAnswers  :string = 'Reports\ask_list_without_answers_noimg.fr3';//did not support deparate image field
  Rep_AskListWithoutAnswers2 :string = 'Reports\ask_list_without_answers_noimg_mt.fr3';//did not support deparate image field
  Rep_AskListWithAnswersBatch:string = 'Reports\ask_list_with_answers_noimg_batch_mt.fr3';//did not support deparate image field
  Rep_AskListOnly            :string = 'Reports\ask_list_only.fr3';
  Rep_OffPaperWithoutAnswers :string = 'Reports\off_paper2.fr3';
  Rep_OffPaperWithAnswers    :string = 'Reports\off_paper_answers.fr3';
  Rep_OffPaperRTFTemplate    :string = 'Reports\bilet_p_d.rtf';
  Rep_AskCoutByDep           :string = 'Reports\rep_ask_count.fr3';
  //export directory name
  ExpDirName  :string = 'Export\';
  //repor path (2010) - for special edition only!
  ReportDiName :string = 'D:\Test_Report';
  //app directory name
  AppDirName : string = 'Testmaker3';
  //database shema filename
  DBShemaCasheFilename : string = 'test3cashe.cfg';

  //users types (order same as in the database table and it is important!)
///  test_admin     = 1;
///  test_operator  = 2;
///  dep_teacher    = 3;
///  dep_admin      = 4;
  //users SQL role names
  dep_teacher    = 'DEPTEACH';
  dep_admin      = 'DEPADM';
  test_operator  = 'TESTUSER';
  test_admin     = 'TESTADM';

  dep_teacher_title    = 'Викладач кафедри';
  dep_admin_title      = 'Адміністратор кафедри';
  test_operator_title  = 'Оператор ЦТ';
  test_admin_title     = 'Адміністратор ЦТ';



  //registry key names
  AppRegKeyName = '\SOFTWARE\SemTestMaker3';
  CurrDepRegValueNameKey :string = 'DepID';
  AskFormatStateKey      :string = 'AskFormatSt';
  AnswerFormatStateKey   :string = 'AnswerFormatSt';
  OpenAskAnswerCountKey  :string = 'OpenAskAnswCount';
  SetMinimalfontSizeKey  :string = 'SetMinimalfontSize';
  MinimalFontSizeKey     :string = 'MinimalFontSize';

  PageAskLimitKey        :string = 'PageAskLimit';

  W_ShowPersonKey        :string = 'W_ShowPersonSt';
  W_ShowSignKey          :string = 'W_ShowSignSt';
  W_ShowGroupKey         :string = 'W_ShowGroupSt';
  W_ShowSpecKey          :string = 'W_ShowSpecSt';
  W_ShowSubjKey          :string = 'W_ShowSubjSt';
  W_ShowFacultyKey       :string = 'W_ShowFacultySt';
  W_ShowSemestrKey       :string = 'W_ShowSemestrSt';
  W_ShowDateKey          :string = 'W_ShowDateSt';
  W_ShowPageKey          :string = 'W_ShowPageSt';
  W_SetFontSizeKey       :string = 'W_SetFontSizeSt';
  W_FontSizeKey          :string = 'W_FontSizeSt';

  DBfilePathKey          :string = 'DBfilePath';
  DBServerIDKey          :string = 'DBServerID';

  //special symbols
  SpecSymb : TSpecSymb= [#9, #10, #13, #32];
  
  DoubleSpace : string = #32#32; //double space in text
  SingSpace : string = #32; //single space;
  SpaceEndPar : string = #32#13#10;//(space) and (paragraph end) and (scroll caret) symbols
  EndPar : string = #13#10;//(end paragraph) and (scroll caret) symbols
  Tab : string = #9;//(tab) symbol
  EndParUtf : string = #$A;

  //right answer marker
  RightAnswerChr : string = '*';

  //default settings;
  DefPageAskLimit = 168;//max ask on one page are up to 168!
  DefPageAskLimitID = 0;//this value always placed into 0 position

  OffLineVarDefName = 'Варіант';

  DefAskFormatState = true;

  DefOpenAskAnswerCount = 5;
  DefMinFontsize = 12;

type
  TSettings = class(TObject)
    procedure SetDefaultSettings;
    procedure SetDatabaseLoc;
    procedure AppLoadSettings;
    procedure AppSaveSettings;
  private

  public
    NotFirstRun      : boolean;
    DBConnected      : boolean;
    //ask format parameters
    AskFormatSt      : boolean;
    AnswerFormatSt   : boolean;
    MinFontSt        : boolean;

    OpenAskAnswCount : integer;

    MinFontSize      : integer;
    //Word document settings
    W_ShowPerson     : boolean;
    W_ShowSign       : boolean;
    W_ShowGroup      : boolean;
    W_ShowSpec       : boolean;
    W_ShowSubj       : boolean;
    W_ShowFaculty    : boolean;
    W_ShowSemestr    : boolean;
    W_ShowDate       : boolean;
    W_ShowPage       : boolean;

    W_SetFontSize    : boolean;
    W_FontSize       : integer;
    //database location
    CurrDBTitle    : string;
    CurrDBfilePath : string;
    CurrDBFileName : string;
    CurrDBServerID : integer;
    //logged user data
    LUserName: string;
    LUserPass: string;
    LUserDepID: integer;
    LUserID: integer;
    LUserTypeID: integer;
    LUserSQLRole: string;
    //etalon database settings
    PageAskLimit     : integer;
    //SQL role names and titles
    SQLRoleName, SQLRoleTitle : tstringlist;

    UserOldSQLRole : string;
  end;
var
  Settings : TSettings;
  PassKey  : TPassSaver;

implementation

uses Controls, Dialogs, Registry, main;
{=======================================================}
procedure TSettings.SetDefaultSettings;
begin
  //set default options for ask and answer format
  AskFormatSt      := DefAskFormatState;
  AnswerFormatSt   := DefAskFormatState;
  OpenAskAnswCount := DefOpenAskAnswerCount;
  MinFontSt        := DefAskFormatState;
  MinFontSize      := DefMinFontsize;

  W_ShowPerson     := DefAskFormatState;
  W_ShowSign       := DefAskFormatState;
  W_ShowGroup      := DefAskFormatState;
  W_ShowSpec       := DefAskFormatState;
  W_ShowSubj       := DefAskFormatState;
  W_ShowFaculty    := DefAskFormatState;
  W_ShowSemestr    := DefAskFormatState;
  W_ShowDate       := DefAskFormatState;
  W_ShowPage       := DefAskFormatState;

  W_SetFontSize    := DefAskFormatState;
  W_FontSize       := DefMinFontsize;

  PageAskLimit     := DefPageAskLimit;
  //set default synchrone list of the SQL roles and it are titles
  SQLRoleName := tstringlist.create;
  SQLRoleName.Append(dep_teacher);         //ID=0
  SQLRoleName.Append(dep_admin);           //ID=1
  SQLRoleName.Append(test_operator);       //ID=2
  SQLRoleName.Append(test_admin);          //ID=3

  SQLRoleTitle := tstringlist.create;
  SQLRoleTitle.Append(dep_teacher_title);
  SQLRoleTitle.Append(dep_admin_title);
  SQLRoleTitle.Append(test_operator_title);
  SQLRoleTitle.Append(test_admin_title);

end;
{=======================================================}
procedure TSettings.SetDatabaseLoc;
begin
  //set default option for database connect
  CurrDBFileName := dbfilepath_loc+dbfilename;
  CurrDBServerID := 1;
  basevar.Settings.LUserID := 0;//user not logged
  basevar.Settings.LUserDepID := 0;//user not logged
  basevar.Settings.LUserTypeID := 0;//default-department teacher
  basevar.Settings.DBConnected := false;//not connected
  basevar.Settings.LUserName := '';
  basevar.Settings.LUserPass := '';
  basevar.Settings.LUserSQLRole := '';
end;
{=======================================================}
procedure TSettings.AppLoadSettings;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  //load settings from HKEY_CURRENT_USER key  
  try
    NotFirstRun := Reg.OpenKey(AppRegKeyName, False);
    if NotFirstRun = false then //key not exist-firs run
       MessageDlg('Ви ще не користувалися цим комп"ютером.'+#13+'Встановлено параметри по-замовчуванню', mtWarning, [mbOk], 0)
    else   //key exist - not first run - load settings
    begin
      //read settings
      AskFormatSt := reg.ReadBool(AskFormatStateKey);
      AnswerFormatSt := reg.ReadBool(AnswerFormatStateKey);
      OpenAskAnswCount := reg.ReadInteger(OpenAskAnswerCountKey);
      MinFontSt := reg.ReadBool(SetMinimalfontSizeKey);
      MinFontSize := reg.ReadInteger(MinimalFontSizeKey);

      PageAskLimit := reg.ReadInteger(PageAskLimitKey);

      W_ShowPerson     := reg.ReadBool(W_ShowPersonKey);
      W_ShowSign       := reg.ReadBool(W_ShowSignKey);
      W_ShowGroup      := reg.ReadBool(W_ShowGroupKey);
      W_ShowSpec       := reg.ReadBool(W_ShowSpecKey);
      W_ShowSubj       := reg.ReadBool(W_ShowSubjKey);
      W_ShowFaculty    := reg.ReadBool(W_ShowFacultyKey);
      W_ShowSemestr    := reg.ReadBool(W_ShowSemestrKey);
      W_ShowDate       := reg.ReadBool(W_ShowDateKey);
      W_ShowPage       := reg.ReadBool(W_ShowPageKey);

      W_SetFontSize    := reg.ReadBool(W_SetFontSizeKey);
      W_FontSize       := reg.ReadInteger(W_FontSizeKey);
      //read database conection info
      CurrDBFileName   := reg.ReadString(DBfilePathKey);
      CurrDBServerID   := reg.ReadInteger(DBServerIDKey);
    end;
  finally
    Reg.Free;
  end;
end;
{=======================================================}
procedure TSettings.AppSaveSettings;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  //save settings into HKEY_CURRENT_USER key
  try
    if Reg.OpenKey(AppRegKeyName, true) then
      begin  {2} 
        reg.WriteBool(AskFormatStateKey, AskFormatSt);
        reg.WriteBool(AnswerFormatStateKey, AnswerFormatSt);
        Reg.WriteInteger(OpenAskAnswerCountKey, OpenAskAnswCount);
        reg.WriteBool(SetMinimalfontSizeKey, MinFontSt);
        Reg.WriteInteger(MinimalFontSizeKey, MinFontSize);

        Reg.WriteInteger(PageAskLimitKey, PageAskLimit);
        
        reg.WriteBool(W_ShowPersonKey, W_ShowPerson);
        reg.WriteBool(W_ShowSignKey, W_ShowSign);
        reg.WriteBool(W_ShowGroupKey, W_ShowGroup);
        reg.WriteBool(W_ShowSpecKey, W_ShowSpec);
        reg.WriteBool(W_ShowSubjKey, W_ShowSubj);
        reg.WriteBool(W_ShowFacultyKey, W_ShowFaculty);
        reg.WriteBool(W_ShowSemestrKey, W_ShowSemestr);
        reg.WriteBool(W_ShowDateKey, W_ShowDate);
        reg.WriteBool(W_ShowPageKey, W_ShowPage);

        reg.WriteBool(W_SetFontSizeKey, W_SetFontSize);
        reg.WriteInteger(W_FontSizeKey, W_FontSize);

        reg.WriteString(DBfilePathKey, CurrDBFileName);
        reg.WriteInteger(DBServerIDKey, CurrDBServerID);
      end    {/2}
    finally
      Reg.Free;
    end;
end;

initialization
  Settings := TSettings.Create;
  Settings.SetDefaultSettings;
  Settings.SetDatabaseLoc;
  Settings.UserOldSQLRole :='';

  PassKey := TPassSaver.Create('460180F1-A607-4729-BE83-A53297851AC4');
end.
