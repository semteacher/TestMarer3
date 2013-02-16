unit NewUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, CCButtonPanel, Mask, StdCtrls, DBCtrlsEh, basevar;

type
  TNewUserForm = class(TForm)
    LoginEdit: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    UserPassMaskEdit: TMaskEdit;
    ButtonPanel1: TButtonPanel;
    Label3: TLabel;
    ConfirmPassMaskEdit: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LastNameEdit: TEdit;
    FirstNameEdit: TEdit;
    MiddleNameEdit: TEdit;
    Label7: TLabel;
    UserRoleCB: TComboBox;
    procedure ButtonPanel1ButtonOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewUserForm: TNewUserForm;

implementation

{$R *.dfm}

procedure TNewUserForm.ButtonPanel1ButtonOkClick(Sender: TObject);
begin
//
end;

procedure TNewUserForm.FormActivate(Sender: TObject);
begin
  //set focus
  LoginEdit.SetFocus;
end;

procedure TNewUserForm.FormCreate(Sender: TObject);
begin
  //set list of the SQL roles titles
  UserRoleCB.Items := settings.SQLRoleTitle;
end;

end.
