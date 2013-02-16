unit LibScRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, CCButtonPanel, DBCtrls, Grids, DBGridEh, GridsEh;

type
  TLibSciensRefEditor = class(TForm)
    ButtonPanel1: TButtonPanel;
    LibSciensDBGridEh: TDBGridEh;
    LIbSciensDBNavigator: TDBNavigator;
    procedure ButtonPanel1ButtonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LibSciensRefEditor : TLibSciensRefEditor;

implementation

uses DB, datamod;
{$R *.dfm}
{====================================================}
{--------------Save changes--------------------------}
procedure TLibSciensRefEditor.ButtonPanel1ButtonOkClick(Sender: TObject);
begin
   if LibSciensDBGridEh.DataSource.State in [dsEdit, dsInsert] then
         LibSciensDBNavigator.BtnClick(nbPost);
end;
{====================================================}
end.
