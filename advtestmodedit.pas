unit advtestmodedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DB, DBLookupEh,
  ExtCtrls, DBCtrls, CCButtonPanel, Buttons, FIBDataSet, pFIBDataSet,
  GridsEh, ImgList;

type
  TAdvTestModEditor = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ButtonPanel1: TButtonPanel;
    Label3: TLabel;
    SubjectDBEditEh: TDBEditEh;
    FacultyDBEditEh: TDBEditEh;
    TestDBEditEh: TDBEditEh;
    TestModGB: TGroupBox;
    TestModDBGridEh: TDBGridEh;
    TestModDBNavigator: TDBNavigator;
    FullSciensGB: TGroupBox;
    FullSciensDBGridEh: TDBGridEh;
    FullSciensDBNavigator: TDBNavigator;
    AddModuleSBut: TSpeedButton;
    ApprendModuleSBut: TSpeedButton;
    SemestrDBEditEh: TDBEditEh;
    Label4: TLabel;
    MoveTopSB: TSpeedButton;
    MoveBottomSB: TSpeedButton;
    TestSect2sciensGB: TGroupBox;
    Sect2SciensDBGridEh: TDBGridEh;
    Sect2SciensDBNav: TDBNavigator;
    Delsect2sciensSB: TSpeedButton;
    ImageList1: TImageList;
    RepAskCountSB: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure ApprendModuleSButClick(Sender: TObject);
    procedure AddModuleSButClick(Sender: TObject);
    procedure FullSciensDBGridEhTitleBtnClick(Sender: TObject;
      ACol: Integer; Column: TColumnEh);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure DisableFilters;
    procedure MoveTopSBClick(Sender: TObject);
    procedure MoveBottomSBClick(Sender: TObject);
    procedure Delsect2sciensSBClick(Sender: TObject);
    procedure ButtonPanel1ButtonApplyClick(Sender: TObject);
    procedure RepAskCountSBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdvTestModEditor: TAdvTestModEditor;

implementation

uses main, datamod, basevar;
{$R *.dfm}
{=======working with testsection2sciens modules list==============}
{----------------add new module to list-----------------------}
procedure TAdvTestModEditor.AddModuleSButClick(Sender: TObject);
begin
  //chek if selected sciens exist in current test
  if Sect2SciensDBGridEh.DataSource.DataSet.Locate('SCIENS_ID', (FullSciensDBGridEh.DataSource.DataSet.FieldByName('ID_SCIENS').AsInteger), [])=false then
  begin
    //insert line
    Sect2SciensDBGridEh.DataSource.DataSet.Append;
    //goto edit mode
    Sect2SciensDBNav.BtnClick(nbEdit);
    //write data
    Sect2SciensDBGridEh.DataSource.DataSet.FieldByName('SCIENS_ID').AsInteger:= FullSciensDBGridEh.DataSource.DataSet.FieldByName('ID_SCIENS').AsInteger;
    //save changes
    Sect2SciensDBNav.BtnClick(nbPost);
    //refresh grid
    Sect2SciensDBNav.BtnClick(nbRefresh);
  end
  else MessageDlg('Такий модуль вже є в списку!', mtError, [mbOk], 0);
end;
{------delete testsection2sciens record---}
procedure TAdvTestModEditor.Delsect2sciensSBClick(Sender: TObject);
begin
  Sect2SciensDBGridEh.DataSource.DataSet.Delete;
end;
{=======working with testsection modules list==============}
{----------------apprend module from list----------------------}
procedure TAdvTestModEditor.ApprendModuleSButClick(Sender: TObject);
begin
  TestModDBGridEh.DataSource.DataSet.Append;
end;
{--------move section record top-----------}
procedure TAdvTestModEditor.MoveTopSBClick(Sender: TObject);
var
  currrecno:integer;
begin
  TestModDBGridEh.SetFocus;
  //get current record number
  currrecno := TestModDBGridEh.DataSource.Dataset.RecNo;
  //move record
  if currrecno > 0 then
  begin
    tpfibdataset(TestModDBGridEh.DataSource.Dataset).MoveRecord(currrecno, currrecno-1);
    //move cursor
    TestModDBNavigator.BtnClick(nbPrior);
  end;
  //updare record order field
//  TestModDBGridEh.DataSource.Dataset.Edit;
//  TestModDBGridEh.DataSource.Dataset.FieldByName('ORD_NUM').AsInteger := currrecno-1;
//  TestModDBGridEh.DataSource.Dataset.post;
//  TestModDBGridEh.DataSource.Dataset.Prior;
//  TestModDBGridEh.DataSource.Dataset.Edit;
//  TestModDBGridEh.DataSource.Dataset.FieldByName('ORD_NUM').asinteger := currrecno;
//  TestModDBGridEh.DataSource.Dataset.post;

end;
{----------------move section record bottom---------------}
procedure TAdvTestModEditor.MoveBottomSBClick(Sender: TObject);
var
  currrecno:integer;
begin
  TestModDBGridEh.SetFocus;
  //get current record number
  currrecno := TestModDBGridEh.DataSource.Dataset.RecNo;
  //move record
  if currrecno < tpfibdataset(TestModDBGridEh.DataSource.DataSet).RecordCountFromSrv-1 then
  begin
    tpfibdataset(TestModDBGridEh.DataSource.Dataset).MoveRecord(currrecno, currrecno+1);
    //move cursor
    TestModDBNavigator.BtnClick(nbNext);
  end;
end;
{=====================sorting data in the grid====================}
procedure TAdvTestModEditor.FullSciensDBGridEhTitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
var
  SortOrder : boolean;
begin
  //detect sort order - descending or ascending
  if Column.Title.SortMarker = smDownEh then SortOrder := true
  else SortOrder := false;
  TpFIBDataSet(FullSciensDBGridEh.DataSource.DataSet).DoSort([Column.FieldName],[SortOrder]);
end;
{====================working with form=======================}
{--------when show - update data and set filters-------------}
procedure TAdvTestModEditor.FormActivate(Sender: TObject);
begin
  //open dataset and set additional permissions
  testeditDM.OpenFullSciensDataSet; {+17-06-2007}
  if testeditDM.OffPapersDataSet.IsEmpty = false then
  begin  //disable controls
    TestSect2sciensGB.Enabled := false;
    ApprendModuleSBut.Enabled := false;
    AddModuleSBut.Enabled := false;
    TestModDBNavigator.VisibleButtons := [nbFirst, nbprior, nbNext, nbLast, nbRefresh];
    TestModDBGridEh.Columns[2].ReadOnly := true;
  end
  else
  begin  //enable controls
    TestSect2sciensGB.Enabled := true;
    ApprendModuleSBut.Enabled := true;
    AddModuleSBut.Enabled := true;
    TestModDBNavigator.VisibleButtons := [nbFirst, nbprior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbRefresh];
    TestModDBGridEh.Columns[2].ReadOnly := false;
  end;
end;
{-----------when exit - clean filter-------------------------}
procedure TAdvTestModEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //clear filter and apply restrictions
  FullSciensDBGridEh.ClearFilter;
  FullSciensDBGridEh.ApplyFilter;
  //close dataset
  testeditDM.CloseFullSciensDataSet; {+17-06-2007}
end;
{-------------------------save changes------------------------}
procedure TAdvTestModEditor.ButtonPanel1ButtonApplyClick(Sender: TObject);
var
  tmprecno:integer;
begin
//  TestModDBGridEh.SetFocus;
  //save change in Sect2SciensDBGridEh
  if Sect2SciensDBGridEh.DataSource.State in [dsEdit, dsInsert] then
       Sect2SciensDBNav.BtnClick(nbPost);
  //update total_ask in TestModDBGridEh
  //goto edit mode
//  TestModDBNavigator.BtnClick(nbEdit);
  //update total_ask
//  TestModDBGridEh.DataSource.DataSet.FieldByName('ASKS_TOTAL').AsInteger := strtoint(TColumnFooterEh(Sect2SciensDBGridEh.Columns[2].Footer).Value);
  //save changes
//  TestModDBNavigator.BtnClick(nbPost);

//  TestModDBGridEh.DataSource.DataSet.First;
//  tmprecno := 1;
//  while not TestModDBGridEh.DataSource.DataSet.Eof do
//  begin
//    TestModDBGridEh.DataSource.Dataset.Edit;
//    TestModDBGridEh.DataSource.Dataset.FieldByName('ORD_NUM').AsInteger := tmprecno;
//    TestModDBGridEh.DataSource.Dataset.post;
//    TestModDBGridEh.DataSource.Dataset.next;
//    inc(tmprecno);
//  end;
end;
{=====================working with filter=====================}
{------------disable filter for department column------------}
procedure TAdvTestModEditor.DisableFilters;
begin
  FullSciensDBGridEh.STFilter.Visible := false;
///  FullSciensDBGridEh.Columns[0].STFilter.Visible := false;
end;



procedure TAdvTestModEditor.RepAskCountSBClick(Sender: TObject);
begin
  //set sorting
  testeditDM.FullSciensDataSet1.DoSort(['DEP_ID', 'SEMESTR'],[true, true]);
  //load report template
  testeditDM.AskListReport.LoadFromFile(ExtractFilePath(Application.ExeName)+Rep_AskCoutByDep,true);
  //show report
  testeditDM.AskListReport.ShowReport();
end;

end.
