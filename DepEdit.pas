unit DepEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, CCButtonPanel, DBCtrls, Grids, DBGridEh, Buttons,
  GridsEh;

type
  TDepEditForm = class(TForm)
    LibDepDBGridEh: TDBGridEh;
    LibDepDBNavigator: TDBNavigator;
    ButtonPanel1: TButtonPanel;
    NewPaoerSpeedButton: TSpeedButton;
    DelPaperSpeedButton: TSpeedButton;
    AddDepSpeedButton: TSpeedButton;
    DelDepSpeedButton: TSpeedButton;
    procedure ButtonPanel1ButtonOkClick(Sender: TObject);
    procedure AddDepSpeedButtonClick(Sender: TObject);
    procedure DelDepSpeedButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DepEditForm: TDepEditForm;

implementation

uses DB, datamod;

{$R *.dfm}

procedure TDepEditForm.ButtonPanel1ButtonOkClick(Sender: TObject);
begin
  if LibDepDBGridEh.DataSource.State in [dsEdit, dsInsert] then
       LibDepDBNavigator.BtnClick(nbPost);
end;

procedure TDepEditForm.AddDepSpeedButtonClick(Sender: TObject);
begin
  LibDepDBGridEh.DataSource.DataSet.Append;
end;

procedure TDepEditForm.DelDepSpeedButtonClick(Sender: TObject);
begin
  if MessageDlg('Буде також видалено всі модулі та питання! Ви впевнені?', mtWarning	, [mbYes, mbNo], 0) = mrYes then
      LibDepDBGridEh.DataSource.DataSet.Delete
end;

end.
