unit askmanager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DB, DBLookupEh,
  ExtCtrls, DBCtrls, CCButtonPanel, Buttons, FIBDataSet, pFIBDataSet,
  GridsEh;

type
  TMoveTestAsk = class(TForm)
    ButtonPanel1: TButtonPanel;
    FullSciensGB: TGroupBox;
    FullSciensDBGridEh1: TDBGridEh;
    FullSciensDBNavigator: TDBNavigator;
    OptionsGB: TGroupBox;
    MoveOptionsRG: TRadioGroup;
    CopyRBut: TRadioButton;
    MoveRBut: TRadioButton;
    Label1: TLabel;
    procedure AddModuleSButClick(Sender: TObject);
    procedure FullSciensDBGridEh1TitleBtnClick(Sender: TObject;
      ACol: Integer; Column: TColumnEh);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure DisableFilters;
    procedure ButtonPanel1ButtonApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DestSciensID : integer;
    CopyAsk : boolean;
  end;

var
  MoveTestAsk: TMoveTestAsk;

implementation

uses main, datamod, basevar;
{$R *.dfm}
{================working with modules list====================}
{----------------add new module to list-----------------------}
procedure TMoveTestAsk.AddModuleSButClick(Sender: TObject);
begin

end;

{=====================sorting data in the grid====================}
procedure TMoveTestAsk.FullSciensDBGridEh1TitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
var
  SortOrder : boolean;
begin
  //detect sort order - descending or ascending
  if Column.Title.SortMarker = smDownEh then SortOrder := true
  else SortOrder := false;
  TpFIBDataSet(FullSciensDBGridEh1.DataSource.DataSet).DoSort([Column.FieldName],[SortOrder]);
end;
{====================working with form=======================}
{--------when show - update data and set filters-------------}
procedure TMoveTestAsk.FormActivate(Sender: TObject);
begin
  if testeditDM.FullSciensDataSet.Active = false then testeditDM.FullSciensDataSet.Open;
  testeditDM.FullSciensDataSet.FullRefresh;  
  //open dataset and set additional permissions   {+20/12/2009}
///  if (Settings.LUserTypeID = dep_admin) or (Settings.LUserTypeID = dep_teacher) then
  if (Settings.LUserSQLRole = dep_admin) or (Settings.LUserSQLRole = dep_teacher) then
  begin
    //setup filter to the current departmnet
    testeditDM.FullSciensDataSet.Filtered := false;
    testeditDM.FullSciensDataSet.Filter := 'DEP_ID = '+inttostr(Settings.LUserDepID);
    testeditDM.FullSciensDataSet.Filtered := true;
    //disable filter row
    FullSciensDBGridEh1.STFilter.Visible := false;
 end;
//  testeditDM.OpenFullSciensDataSet; {+17-06-2007}
end;
{-----------when exit - clean filter-------------------------}
procedure TMoveTestAsk.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //clear filter and apply restrictions
  testeditDM.FullSciensDataSet.Filtered := false; {+20/12/2009}
end;
{=====================working with filter=====================}
{------------disable filter for department column------------}
procedure TMoveTestAsk.DisableFilters;
begin
  FullSciensDBGridEh1.STFilter.Visible := false;
///  FullSciensDBGridEh.Columns[0].STFilter.Visible := false;
end;

procedure TMoveTestAsk.ButtonPanel1ButtonApplyClick(Sender: TObject);
begin
  DestSciensID := tpfibdataset(FullSciensDBGridEh1.DataSource.DataSet).FBN('ID_SCIENS').AsInteger;
  if CopyRBut.Checked then CopyAsk := true  //copy selected ask
  else CopyAsk := false;  //move selected ask
  modalresult := mrOK;
end;

end.
