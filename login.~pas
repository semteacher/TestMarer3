unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLogin, ExtCtrls, CCButtonPanel, StdCtrls, Mask, UserName, basevar;

type
  TLoginForm = class(TForm)
    UserPassMaskEdit: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    UserNameEdit: TEdit;
    ButtonPanel1: TButtonPanel;
    UserRoleCB: TComboBox;
    Label3: TLabel;
    procedure ButtonPanel1ButtonOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}
{uses basevar;}
{==================================================}
procedure TLoginForm.ButtonPanel1ButtonOkClick(Sender: TObject);
begin
  //save current loged user
  Settings.LUserName := UserNameEdit.Text;
  Settings.LUserPass := UserPassMaskEdit.Text;
  Settings.LUserTypeID := UserRoleCB.ItemIndex;
  Settings.LUserSQLRole := settings.SQLRoleName.Strings[UserRoleCB.ItemIndex];
  //clear fields
  UserNameEdit.Text := '';
  UserPassMaskEdit.Text := '';
end;
{==================================================}
procedure TLoginForm.FormActivate(Sender: TObject);
begin
  //set list of the SQL roles titles
  UserRoleCB.Items := settings.SQLRoleTitle;
  UserRoleCB.ItemIndex := settings.LUserTypeID;
  //get current Windows user login name
///  UserNameEdit.Text := GetCurrentUserName;
  //disable change login name
///  UserNameEdit.ReadOnly := true;
///  UserPassMaskEdit.SetFocus;
  UserNameEdit.SetFocus;
end;
{==================================================}
end.
