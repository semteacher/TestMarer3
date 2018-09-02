unit UserRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, CCButtonPanel, DBCtrls, Buttons,
  GridsEh, IB_Services, ComCtrls, NewUser, crypt;

type
  TUserRefForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    pFIBSecurityService1: TpFIBSecurityService;
    UserPageControl: TPageControl;
    AppUserPage: TTabSheet;
    DBServerUserPage: TTabSheet;
    ChangePassSpeedButton: TSpeedButton;
    AddUserSpeedButton: TSpeedButton;
    User2FirebirdSB: TSpeedButton;
    DelUserSpeedButton: TSpeedButton;
    LibUserDBGridEh: TDBGridEh;
    LibUserDBNavigator: TDBNavigator;
    StringGrid1: TStringGrid;
    procedure LibUserDBGridEhTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure ButtonPanel1ButtonOkClick(Sender: TObject);
    procedure AddUserSpeedButtonClick(Sender: TObject);
    procedure DelUserSpeedButtonClick(Sender: TObject);
    procedure ChangePassSpeedButtonClick(Sender: TObject);
    procedure User2FirebirdSBClick(Sender: TObject);
    procedure ShowDBUsers;
    procedure FormActivate(Sender: TObject);
    procedure EstablishSecurityService;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserRefForm: TUserRefForm;

implementation

uses DB, datamod, basevar, pFIBProps;
{$R *.dfm}
{====================================================}
{----------Set sorting option for Users List---------}
procedure TUserRefForm.LibUserDBGridEhTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  SortOrder : boolean;
begin
  if Column.Title.SortMarker = smDownEh then SortOrder := true
  else SortOrder := false;
   testeditDM.LibUserDataSet.DoSort([Column.FieldName],[SortOrder]);
end;
{====================================================}
{--------------Auto save changes--------------------------}
procedure TUserRefForm.ButtonPanel1ButtonOkClick(Sender: TObject);
begin
  if LibUserDBGridEh.DataSource.State in [dsEdit, dsInsert] then
  begin
    //save changes in the database
    LibUserDBNavigator.BtnClick(nbPost);
    //submit changes to Firebird server
    User2FirebirdSBClick(Self);
  end;
end;
{====================================================}
{--------------Add new user--------------------------}
procedure TUserRefForm.AddUserSpeedButtonClick(Sender: TObject);
const
  tmpcapt = 'Новий користувач';
var
  tmpsqlrole, tmplogin, tmppass1, tmppass2, tmpfirstname, tmplastname, tmpmiddlename : string;
  tmpsqlroleid : integer;
  exist : boolean;
begin
  //manually create a new user edit form                     {+2012-06-19}
  Application.CreateForm(TNewUserForm, NewUserForm);
  //set form title
  NewUserForm.Caption := 'Новий коритувач';
  NewUserForm.LoginEdit.ReadOnly := false;
  NewUserForm.UserRoleCB.ItemIndex := 0;
  //display new user dialog
  if NewUserForm.ShowModal = mrok then
  begin
    //get user login/password
    tmplogin := NewUserForm.LoginEdit.Text;
    tmppass1 := NewUserForm.UserPassMaskEdit.Text;
    tmppass2 := NewUserForm.ConfirmPassMaskEdit.Text;
    tmpfirstname := NewUserForm.FirstNameEdit.Text;
    tmplastname := NewUserForm.LastNameEdit.Text;
    tmpmiddlename := NewUserForm.MiddleNameEdit.Text;
//    tmpsqlrole := settings.SQLRoleName.Strings[NewUserForm.UserRoleCB.itemindex];
    tmpsqlroleid := NewUserForm.UserRoleCB.itemindex;
    //chek passwords compability
    if tmppass1 = tmppass2 then
    begin
      //test username and password
      testeditDM.ExistUser(tmplogin, tmppass1, exist);
      if exist = false  then
      begin
        //save user data in database
        LibUserDBGridEh.DataSource.Dataset.Append;
        LibUserDBGridEh.DataSource.Dataset.FieldByName('USERNAME').AsString := tmplogin;
        LibUserDBGridEh.DataSource.Dataset.FieldByName('USERPASS').Asstring := passkey.HideStr(tmppass1);{31/03/2010}
///        LibUserDBGridEh.DataSource.Dataset.FieldByName('USERTYPE_ID').AsInteger := 3;//default - teacher
        LibUserDBGridEh.DataSource.Dataset.FieldByName('USERTYPE_ID').AsInteger := tmpsqlroleid;
        LibUserDBGridEh.DataSource.Dataset.FieldByName('firstname').AsString := tmpfirstname;
        LibUserDBGridEh.DataSource.Dataset.FieldByName('lastname').AsString := tmplastname;
        LibUserDBGridEh.DataSource.Dataset.FieldByName('middlename').AsString := tmpmiddlename;
        LibUserDBGridEh.DataSource.Dataset.post;
        //register user on DB srver
        User2FirebirdSBClick(Self);
      end
      else MessageDlg('Користувач з таким логіном вже існує!', mtError, [mbOk], 0);
    end
    else MessageDlg('Введені паролі не співпадають!', mtError, [mbOk], 0);
  end;
  //delete form                                              {+2012-06-19}
  NewUserForm.Free;                                          
end;
{====================================================}
{---------------delete user--------------------------}
procedure TUserRefForm.DelUserSpeedButtonClick(Sender: TObject);
var
  sucess, userexist : boolean;
  tmpusername : string;
  i : integer;
begin
 if CompareText(LibUserDBGridEh.DataSource.Dataset.FieldByName('USERNAME').AsString,'sysdba') <> 0 then
 begin
  if LibUserDBGridEh.DataSource.Dataset.FieldByName('USERID').AsInteger <> basevar.Settings.LUserID then
  begin
    //get user name from database
    tmpusername := LibUserDBGridEh.DataSource.Dataset.FieldByName('USERNAME').AsString;
    userexist := false; //default - not exist
    //get firebird user data
    pFIBSecurityService1.Active := True;
    pFIBSecurityService1.DisplayUsers;
    //search user name
    for i := 0 to pFIBSecurityService1.UserInfoCount - 1 do
    begin
      if CompareText(pFIBSecurityService1.UserInfo[i].UserName, tmpusername)=0 then userexist := true;
    end;
    pFIBSecurityService1.Active := false;
    //start user deleting
    if userexist then
    begin
      //reopen security tool
      //pFIBSecurityService1.Active := True;
      //pFIBSecurityService1.UserName := tmpusername; //replacer since Firebird 2.5 with SQL!
      try
        sucess := true; //default - delete OK
        //pFIBSecurityService1.DeleteUser; //replacer since Firebird 2.5 with SQL!
        //testeditDM.TmpFIBQuery.Options := [qoStartTransaction];
        testeditDM.TmpFIBQuery.SQL.Text := 'DROP USER ' + tmpusername + ';';
        testeditDM.TmpFIBQuery.Prepare;
        testeditDM.TmpFIBQuery.ExecQuery;
        testeditDM.TmpFIBQuery.Close;
        //if testeditDM.TmpFIBQuery.Transaction.Active then testeditDM.TmpFIBQuery.Transaction.Commit;
      except
        sucess := false; //error - not deleted
        //if testeditDM.TmpFIBQuery.Transaction.Active then testeditDM.TmpFIBQuery.Transaction.Rollback;
        MessageDlg('Помилка видалення коритувача з серверу СУРБД Firebird!', mtError, [mbOk], 0);
      end;
      //close security tool
      //pFIBSecurityService1.Active := false; //replacer since Firebird 2.5 with SQL!
    end;
    if sucess or not(userexist) then LibUserDBNavigator.BtnClick(nbDelete); //delete user record in database
    //show users from DB server
    ShowDBUsers;
  end
  else MessageDlg('Не можна видалити самого себе!', mtError, [mbOk], 0);
 end
 else MessageDlg('Не можна видалити SYSDBA!', mtError, [mbOk], 0);
end;
{====================================================}
{--------------change password-----------------------}
procedure TUserRefForm.ChangePassSpeedButtonClick(Sender: TObject);
var
  tmppass1, tmppass2 : string;
begin
  //manually create a new user edit form                     {+2012-06-19}
  Application.CreateForm(TNewUserForm, NewUserForm);
  //set window title
  NewUserForm.Caption := 'Редагування даних коритувача';
  //set current user login
  NewUserForm.LoginEdit.Text := LibUserDBGridEh.DataSource.Dataset.FieldByName('USERNAME').AsString;
  NewUserForm.LoginEdit.ReadOnly := true;
  NewUserForm.FirstNameEdit.Text := LibUserDBGridEh.DataSource.Dataset.FieldByName('FirstName').AsString;
  NewUserForm.LastNameEdit.Text := LibUserDBGridEh.DataSource.Dataset.FieldByName('LastName').AsString;
  NewUserForm.MiddleNameEdit.Text := LibUserDBGridEh.DataSource.Dataset.FieldByName('MiddleName').AsString;
  NewUserForm.UserRoleCB.ItemIndex := LibUserDBGridEh.DataSource.Dataset.FieldByName('USERTYPE_ID').Asinteger;
  //display new user dialog
  if NewUserForm.ShowModal = mrok then
  begin
    //get new user password
    tmppass1 := NewUserForm.UserPassMaskEdit.Text;
    tmppass2 := NewUserForm.ConfirmPassMaskEdit.Text;
    //chek passwords compability
    if tmppass1 = tmppass2 then
    begin
      //change password in database
      LibUserDBNavigator.BtnClick(nbEdit);
      LibUserDBGridEh.DataSource.Dataset.FieldByName('USERPASS').AsString := passkey.HideStr(tmppass1);{31/03/2010}
      LibUserDBGridEh.DataSource.Dataset.FieldByName('FirstName').AsString := NewUserForm.FirstNameEdit.Text;
      LibUserDBGridEh.DataSource.Dataset.FieldByName('LastName').AsString := NewUserForm.LastNameEdit.Text;
      LibUserDBGridEh.DataSource.Dataset.FieldByName('MiddleName').AsString := NewUserForm.MiddleNameEdit.Text;
      LibUserDBGridEh.DataSource.Dataset.FieldByName('USERTYPE_ID').Asinteger := NewUserForm.UserRoleCB.ItemIndex;
      LibUserDBNavigator.BtnClick(nbPost);
      //change password on DB server
      User2FirebirdSBClick(Self);
    end
    else MessageDlg('Введені паролі не співпадають!', mtError, [mbOk], 0);
  end;
  //delete form                        {+2012-06-19}
  NewUserForm.Free;
end;
{====================================================}
{--------------Add/modify Firebird user--------------}
procedure TUserRefForm.User2FirebirdSBClick(Sender: TObject);
var
  tmpsqltext, tmpusername, tmpuserpass, tmpfirstname, tmplastname, tmpmiddlename, tmpsqlrole, tmpoldsqlrole: string;
  CreateUserSQLText, EditUserSQLText: string;
  userexist, usersuccess: boolean;
  i : integer;
begin
  //get user
  tmpfirstname := LibUserDBGridEh.DataSource.Dataset.FieldByName('firstname').AsString;
  tmplastname := LibUserDBGridEh.DataSource.Dataset.FieldByName('lastname').AsString;
  tmpmiddlename := LibUserDBGridEh.DataSource.Dataset.FieldByName('middlename').AsString;
  tmpusername := LibUserDBGridEh.DataSource.Dataset.FieldByName('USERNAME').AsString;
  tmpuserpass := passkey.ShowStr(LibUserDBGridEh.DataSource.Dataset.FieldByName('USERPASS').AsString);{31/03/2010}
  tmpsqlrole := LibUserDBGridEh.DataSource.Dataset.FieldByName('userrole_search').AsString;
  userexist := false; //default - not exist

  //get firebird user data
  pFIBSecurityService1.Active := True;
  pFIBSecurityService1.DisplayUsers;
  //search user name
  for i := 0 to pFIBSecurityService1.UserInfoCount - 1 do
  begin
    if CompareText(pFIBSecurityService1.UserInfo[i].UserName, tmpusername)=0 then userexist := true;
  end;
  pFIBSecurityService1.Active := false;
  //reopen security tool
  pFIBSecurityService1.Active := True;
  //get current user data from database
  pFIBSecurityService1.UserName := tmpusername;
  pFIBSecurityService1.Password := tmpuserpass;
  pFIBSecurityService1.FirstName := tmpfirstname;
  pFIBSecurityService1.MiddleName := tmpmiddlename;
  pFIBSecurityService1.LastName := tmplastname;
  pFIBSecurityService1.SQlRole := tmpsqlrole;

  usersuccess := true;
  //testeditDM.TmpFIBQuery.Options := [qoStartTransaction];
  if userexist then
  begin
    try
      //modify user data on the DB server
      //pFIBSecurityService1.ModifyUser; //replacer since Firebird 2.5 with SQL!
      EditUserSQLText := 'ALTER USER ' + tmpusername + ' PASSWORD '''+ tmpuserpass +'''';
      EditUserSQLText := EditUserSQLText + ' FIRSTNAME ''' + tmpfirstname + '''';
      EditUserSQLText := EditUserSQLText + ' MIDDLENAME ''' + tmpmiddlename + '''';
      EditUserSQLText := EditUserSQLText + ' LASTNAME ''' + tmplastname + ''';';
//MessageDlg(EditUserSQLText, mtWarning	, [mbOk], 0);
      testeditDM.TmpFIBQuery.SQL.Text := EditUserSQLText;
      testeditDM.TmpFIBQuery.Prepare;
      testeditDM.TmpFIBQuery.ExecQuery;
      testeditDM.TmpFIBQuery.Close;
      if testeditDM.TmpFIBQuery.Transaction.Active then testeditDM.TmpFIBQuery.Transaction.Commit;
    except
      usersuccess := false;
      if testeditDM.TmpFIBQuery.Transaction.Active then testeditDM.TmpFIBQuery.Transaction.Rollback;
      MessageDlg('Помилка редагування даних користувача ' + tmpusername + ' на сервері СУРБД Firebird', mtError, [mbOk], 0);
    end;
    if usersuccess then
    begin  //assign user to role
      if tmpsqlrole <> settings.UserOldSQLRole then
      begin
        //REVOKE <имя роли> FROM <имя пользователя>
        try
          testeditDM.TmpFIBQuery.SQL.Text := 'REVOKE '+settings.UserOldSQLRole+' FROM '+ tmpusername;
          testeditDM.TmpFIBQuery.Prepare;
          testeditDM.TmpFIBQuery.ExecQuery;
          testeditDM.TmpFIBQuery.Close;
          //if testeditDM.TmpFIBQuery.Transaction.Active then testeditDM.TmpFIBQuery.Transaction.Commit;
        except
         //if testeditDM.TmpFIBQuery.Transaction.Active then testeditDM.TmpFIBQuery.Transaction.Rollback;
         MessageDlg('Помилка видалення ролі '+settings.UserOldSQLRole+' користувача '+tmpusername+' на сервері СУРБД Firebird', mtError, [mbOk], 0);
        end;
        //TODO: run this SQL query - "grant MyRole to NewUser"
        if tmpsqlrole <> test_admin then tmpsqltext := 'GRANT '+tmpsqlrole+' TO '+ tmpusername
        else tmpsqltext := 'GRANT '+test_admin+','+test_operator+','+dep_admin+','+dep_teacher+' TO '+ tmpusername + ' WITH ADMIN OPTION';
        try
          testeditDM.TmpFIBQuery.SQL.Text := tmpsqltext;
          testeditDM.TmpFIBQuery.Prepare;
          testeditDM.TmpFIBQuery.ExecQuery;
          testeditDM.TmpFIBQuery.Close;
        except
         //if testeditDM.TmpFIBQuery.Transaction.Active then testeditDM.TmpFIBQuery.Transaction.Rollback;
         MessageDlg('Помилка присвоєнння ролі: '+tmpsqltext+' на сервері СУРБД Firebird', mtError, [mbOk], 0);
        end;
      end;
    end;
  end
  else
  begin
    try
      //add new user to DB server
      //pFIBSecurityService1.AddUser; //replacer since Firebird 2.5 with SQL!
      CreateUserSQLText := 'CREATE USER ' + tmpusername + ' PASSWORD '''+ tmpuserpass +'''';
      CreateUserSQLText := CreateUserSQLText + ' FIRSTNAME ''' + tmpfirstname + '''';
      CreateUserSQLText := CreateUserSQLText + ' MIDDLENAME ''' + tmpmiddlename + '''';
      CreateUserSQLText := CreateUserSQLText + ' LASTNAME ''' + tmplastname + ''';';
//MessageDlg(CreateUserSQLText, mtWarning	, [mbOk], 0);
      testeditDM.TmpFIBQuery.SQL.Text := CreateUserSQLText;
      testeditDM.TmpFIBQuery.Prepare;
      testeditDM.TmpFIBQuery.ExecQuery;
      testeditDM.TmpFIBQuery.Close;
    except
      usersuccess := false;
      MessageDlg('Помилка реєстрації користувача '+tmpusername+' на сервері СУРБД Firebird', mtError, [mbOk], 0);
    end;
    if usersuccess then
    begin  //assign user to role
      //TODO: run this SQL query - "grant MyRole to NewUser"
      if tmpsqlrole <> test_admin then tmpsqltext := 'GRANT '+tmpsqlrole+' TO '+ tmpusername
      else tmpsqltext := 'GRANT '+test_admin+','+test_operator+','+dep_admin+','+dep_teacher+' TO '+ tmpusername + ' WITH ADMIN OPTION';
      try
        testeditDM.TmpFIBQuery.SQL.Text := tmpsqltext;
        testeditDM.TmpFIBQuery.Prepare;
        testeditDM.TmpFIBQuery.ExecQuery;
        testeditDM.TmpFIBQuery.Close;
      except
         //if testeditDM.TmpFIBQuery.Transaction.Active then testeditDM.TmpFIBQuery.Transaction.Rollback;
         MessageDlg('Помилка присвоєнння ролі: '+tmpsqltext+' на сервері СУРБД Firebird', mtError, [mbOk], 0);
      end;
    end;
  end;

  //close security tool
  pFIBSecurityService1.Active := False;
  //get DB users infor from DB server
  ShowDBUsers;
end;
{====================================================}
{--------------show Firebird users-------------------}
procedure TUserRefForm.ShowDBUsers;
var i: Integer;
begin
  //prepare grid
  StringGrid1.RowCount := 2;
  StringGrid1.FixedRows := 1;
  StringGrid1.Cells[0, 0] := 'Логін';
  StringGrid1.Cells[1, 0] := 'Ім"я';
  StringGrid1.Cells[2, 0] := 'По-батькові';
  StringGrid1.Cells[3, 0] := 'Прізвище';
  //get firebird user data
  pFIBSecurityService1.Active := True;
  pFIBSecurityService1.DisplayUsers;
  //display user data
  for i := 0 to pFIBSecurityService1.UserInfoCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] :=
    pFIBSecurityService1.UserInfo[i].UserName;
    StringGrid1.Cells[1, i + 1] :=
    pFIBSecurityService1.UserInfo[i].FirstName;
    StringGrid1.Cells[2, i + 1] :=
    pFIBSecurityService1.UserInfo[i].MiddleName;
    StringGrid1.Cells[3, i + 1] :=
    pFIBSecurityService1.UserInfo[i].LastName;
//MessageDlg(pFIBSecurityService1.UserInfo[i].LastName, mtWarning	, [mbOk], 0);
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
  end;
  StringGrid1.RowCount := StringGrid1.RowCount - 1;
  pFIBSecurityService1.Active := False;
  AppUserPage.Visible := true;
end;

procedure TUserRefForm.EstablishSecurityService;
var
  pos_srvadr : integer;
  tmp_srvadr : string;
begin
  //get server IP adres
  pos_srvadr := pos(':',Settings.CurrDBFileName);
  tmp_srvadr := copy(Settings.CurrDBFileName, 0, pos_srvadr-1); //extract IP
  //set options
  pFIBSecurityService1.LibraryName := testeditDM.TestDB.LibraryName;
  pFIBSecurityService1.Protocol := TCP;
  ///pFIBSecurityService1.ServerName := testeditDM.TestDB.DBSiteName;
  //check - is it connection local by testing path - like 'd:'
  if pos_srvadr <= 2 then pFIBSecurityService1.ServerName := testeditDM.TestDB.DBSiteName //local server - name
  else pFIBSecurityService1.ServerName := tmp_srvadr; //remote server - IP
  //set parameters
  pFIBSecurityService1.Params.Clear;
  pFIBSecurityService1.Params.Add('user_name='+ Settings.LUserName);
  pFIBSecurityService1.Params.Add('password='+ Settings.LUserPass);
//  pFIBSecurityService1.Params.Add('sql_role_name='+Settings.LUserSQLRole);
//  pFIBSecurityService1.Params.Add('lc_ctype='+locatecode);
end;


procedure TUserRefForm.FormActivate(Sender: TObject);
begin
  EstablishSecurityService;
  ShowDBUsers;
end;

end.
