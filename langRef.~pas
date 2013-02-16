unit langRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, CCButtonPanel, DBCtrls, GridsEh;

type
  TLangRefForm = class(TForm)
    LibLangDBGridEh: TDBGridEh;
    ButtonPanel1: TButtonPanel;
    LibLangDBNavigator: TDBNavigator;
    procedure ButtonPanel1ButtonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LangRefForm: TLangRefForm;

implementation

uses DB, datamod; 
{$R *.dfm}

{====================================================}
{--------------Save changes--------------------------}
procedure TLangRefForm.ButtonPanel1ButtonOkClick(Sender: TObject);
begin
  if LibLangDBGridEh.DataSource.State in [dsEdit, dsInsert] then
       LibLangDBNavigator.BtnClick(nbPost);
end;
{====================================================}
end.
