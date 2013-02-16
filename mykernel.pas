unit mykernel;

interface

uses sysutils, WordXP, Variants, DB, Classes, MoodleXML;

   procedure PerformSearchMinimalFrequency(SciensIDToSearch : string; var SerchMinFreq : String);
   procedure PerformSearchListOfAskwithMinFreq (SciensIDToSearch : string; FreqToSearch : String; var SerchRecCount : integer);
   procedure GetAskIDList(var FindAskIDList : array of integer; var FindAnswCountList : array of integer; var FindAskIDStatus : array of boolean; var RealCount : integer);
   function CheckIsAskInOfflineTestExist(SearchAskId:integer):boolean;
   procedure ChangeOfflineAskData(OldAskId:integer;NewAskId:integer);
   procedure WriteOfflineAskData(WtiteAskId:integer;WriteRightAnswOrder:TStrings;WriteSciensId:string; WriteTestSectID:integer);
   procedure WriteChangedFrequent(WtiteAskId:integer; FreqStr:string);
   procedure SetAnswerOrder(tmpAnswCount:integer; var tmpRightAnswOrder:TStrings);

   procedure GenerateAsksList;
   procedure ExchangeAsk;
   procedure ExchangeAnswerOrder(showprogres:boolean);

   procedure PrepareWordDocument;
   procedure WriteDocumentHeader(HeadStr:string; isBold:boolean);
   procedure ExportCurentVariant(ShowAnsw : boolean);
   procedure ExportCurentModule(ShowAnsw : boolean);
   procedure ExportAnswersWord(ShowAnsw : boolean);

   procedure ExportAnswersDB;

   procedure ImportFromWord(ImportFileName:OleVariant);
   procedure ImportFromMoodle(ImportFileName:OleVariant);
   procedure ImportFromMoodleXLM(ImportFileName:OleVariant);
   procedure ExportToMoodle(ExportFileName:OleVariant);
   procedure ExportToMoodle2(ExportFileName:OleVariant; def_answ_count:integer; ShowArchive: boolean);

var
  Word_Run : boolean;
implementation
uses Windows, ShellAPI, main, datamod, basevar, Controls, Dialogs, StrUtils, DateUtils, pFIBProps, FIBDatabase;
{==========================================================================}
{---search TESTASK table to ask with minimal frequent for current sciens---}
procedure PerformSearchMinimalFrequency(SciensIDToSearch : string; var SerchMinFreq : String);
  //get minimum frequen from ask list table
var
  MinFreqSQL : string;
begin
  //set query options {11/07/2007}
  testeditdm.TmpFIBQuery.Options := [qoStartTransaction];
  //prepare SQL
  //archived questions NOT included in search!
  MinFreqSQL := 'SELECT min( testasks.frequent ) min_frequent FROM testasks WHERE ';
  MinFreqSQL := MinFreqSQL + '((testasks.sciens_id = ' + SciensIDToSearch + ')AND';
  MinFreqSQL := MinFreqSQL + '(archive=0));';
  //set SQL query
  testeditdm.TmpFIBQuery.SQL.Text := MinFreqSQL;
  //run SQL query
  testeditdm.TmpFIBQuery.Prepare;
  testeditdm.TmpFIBQuery.ExecQuery;
  //get minimal frequent
  SerchMinFreq := testeditdm.TmpFIBQuery.FieldByName('min_frequent').AsString;
  //close query
  testeditdm.TmpFIBQuery.Close;
end;
{==========================================================================}
{------prepare list of asks from TESTASK table with minimal frequent-------}
procedure PerformSearchListOfAskwithMinFreq (SciensIDToSearch : string; FreqToSearch : String; var SerchRecCount : integer);
//get list of ask with minimal frequency
var
  MinFreqSQL : string;
begin
  //set query options {11/07/2007}
  testeditdm.TmpFIBQuery.Options := [qoStartTransaction];
  //prepare SQL
  //archived questions NOT included in search!    {field 'answcount' aded 16/07/2007}
///  MinFreqSQL := 'SELECT testasks.frequent, testasks.answcount, testasks.id_ask FROM testasks WHERE ';
///  MinFreqSQL := MinFreqSQL + '((testasks.sciens_id=' + SciensIDToSearch + ')AND';
///  MinFreqSQL := MinFreqSQL + '(testasks.frequent=' + FreqToSearch + ')AND';
///  MinFreqSQL := MinFreqSQL + '(archive=0));';
  {+10/01/2009}
  MinFreqSQL := 'SELECT testasks.id_ask, testasks.frequent, count(answers.id_answer) answcount FROM testasks ';
  MinFreqSQL := MinFreqSQL + 'inner join answers on (testasks.id_ask = answers.ask_id) ';
  MinFreqSQL := MinFreqSQL + 'WHERE ((testasks.sciens_id=' + SciensIDToSearch + ')AND';
  MinFreqSQL := MinFreqSQL + '(testasks.frequent=' + FreqToSearch + ')AND(archive=0)) ';
  MinFreqSQL := MinFreqSQL + 'group by testasks.id_ask, testasks.frequent;';
  {-10/01/2009}
  //set SQL query
  testeditdm.TmpFIBQuery.SQL.Text := MinFreqSQL;
  //run SQL query
  testeditdm.TmpFIBQuery.Prepare;
  testeditdm.TmpFIBQuery.ExecQuery;
  while not testeditdm.TmpFIBQuery.Eof do
  begin //need vizit each record for calculate it is count
    testeditdm.TmpFIBQuery.Next;
  end;
  //get count of the ask with minimal frequency
  SerchRecCount := testeditdm.TmpFIBQuery.RecordCount;
end;
{==========================================================================}
{-------chek exist or not the current ask in current paper variant---------}
function CheckIsAskInOfflineTestExist(SearchAskId:integer):boolean;
begin
  //TODO:change search in database to search in the memory!!
  //by default - ask present
  CheckIsAskInOfflineTestExist := true;
  //ask NOT present
  if not testeditdm.OffAsksDataSet.Locate('ASK_ID',(SearchAskId),[]) then CheckIsAskInOfflineTestExist := false;
end;
{==========================================================================}
{-----fill memory table with ID of not used asks with minimal frequent-----}
procedure GetAskIDList(var FindAskIDList : array of integer; var FindAnswCountList : array of integer; var FindAskIDStatus : array of boolean; var RealCount : integer);
var
  i : integer;
  tmpAskID : integer;
begin
  //set query options {11/07/2007}
  testeditdm.TmpFIBQuery.Options := [qoStartTransaction];
  //open query
  testeditdm.TmpFIBQuery.Close;
  testeditdm.TmpFIBQuery.Prepare;
  testeditdm.TmpFIBQuery.ExecQuery;
  i := 0;
  while not testeditdm.TmpFIBQuery.Eof do
  //processing all records
  begin
    //get ID for current ask
    tmpAskID := testeditdm.TmpFIBQuery.FieldByName('ID_ASK').Asinteger;
    //check if this ask are present among previously generetd asks
    if CheckIsAskInOfflineTestExist(tmpAskID) = false then
    begin
      //write ask ID
      FindAskIDList[i] := tmpAskID;//this ask can been selected!
      //write current answer count   {16/07/2007}
      FindAnswCountList[i] := testeditdm.TmpFIBQuery.FieldByName('ANSWCOUNT').Asinteger;
      //write current useing status
      FindAskIDStatus[i] := false; //but this ask not selected now!
      inc(i);
    end;
    //goto next record
    testeditdm.TmpFIBQuery.Next;
  end;
  //show count data record in the array
  RealCount := i{+1};
  testeditdm.TmpFIBQuery.Close;
end;
{================================================================}
{---------change one ask in ready variant of the paper-----------}
procedure ChangeOfflineAskData(OldAskId:integer;NewAskId:integer);
         //changes one ask to another in the table of the offline ask list
var
  oldFilter : string;
begin
  //set default old filter value
  oldFilter := '';
  //store existing filter data
  if testeditdm.OffAsksDataSet.Filtered = true then oldFilter := testeditdm.OffAsksDataSet.Filter;
  //set new filter
  testeditdm.OffAsksDataSet.Filtered := false;
  testeditdm.OffAsksDataSet.Filter := 'ASK_ID='+inttostr(OldAskId);
  testeditdm.OffAsksDataSet.Filtered := true;
  //change ask id
  testeditdm.OffAsksDataSet.Edit;
  testeditdm.OffAsksDataSet.FieldByName('ASK_ID').asInteger := NewAskId;
  testeditdm.OffAsksDataSet.Post;
  //disable filter
  testeditdm.OffAsksDataSet.Filtered := false;
  //restore previous filter
  if oldFilter <>'' then
  begin
    testeditdm.OffAsksDataSet.Filter := oldFilter;
    testeditdm.OffAsksDataSet.Filtered := true;
  end;
end;
{================================================================}
{------------write data to the offline asks list table-----------}
procedure WriteOfflineAskData(WtiteAskId:integer;WriteRightAnswOrder:TStrings;WriteSciensId:string; WriteTestSectID:integer);
 //write changes in the table os asks and in the table of the offline ask list
begin
  //fill data in the table of exam variant
  testeditdm.OffAsksDataSet.Append;
  //write data
  testeditdm.OffAsksDataSet.FieldByName('ASK_ID').asInteger := WtiteAskId;
  testeditdm.OffAsksDataSet.FieldByName('RIGHTORDER').AsString := WriteRightAnswOrder.CommaText;
  testeditdm.OffAsksDataSet.FieldByName('SCIENS_ID').asInteger := strtoint(WriteSciensId);
  testeditdm.OffAsksDataSet.FieldByName('TESTSECT_ID').asInteger := WriteTestSectID;
  //store change
  testeditdm.OffAsksDataSet.post;
end;
{================================================================}
{--------------change of the frequent for selected ask-----------}
procedure WriteChangedFrequent(WtiteAskId:integer; FreqStr:string);
//set change frequention in base table
var
  tmpstr : string;
begin
  //search record
{  testeditdm.ChangeAsksDataSet.Locate('ID_ASK',WtiteAskId,[]);
  //write data
  testeditdm.ChangeAsksDataSet.edit;
  testeditdm.ChangeAsksDataSet.FieldByName('FREQUENT').Asinteger := strtoint(FreqStr)+1; {!!!!!}
{  testeditdm.ChangeAsksDataSet.post;}
  tmpstr := inttostr(strtoint(FreqStr)+1);
  testeditdm.TmpFibQuery.SQL.Text := 'UPDATE TESTASKS SET FREQUENT='+tmpstr+' WHERE ID_ASK='+inttostr(WtiteAskId);
  //set query options
  testeditdm.TmpFIBQuery.Options := [qoStartTransaction, qoAutoCommit];
  testeditdm.TmpFibQuery.ExecQuery;
  testeditdm.TmpFibQuery.Close;
end;
{================================================================}
{------------------create order of answers-----------------------}
procedure SetAnswerOrder(tmpAnswCount:integer; var tmpRightAnswOrder:TStrings);
var
  tmporder : set of byte;
  tmpanswpos, i : integer;
begin
  tmporder := []; //default set is empty
  tmpRightAnswOrder.Clear; //delete previous text
  //create temporary set of answer order {1/10/207}
  for i := 1 to tmpAnswCount do
  begin
    repeat
      tmpanswpos := random(tmpAnswCount)+1;
    until not (tmpanswpos in tmporder);
    include(tmporder,tmpanswpos);
    tmpRightAnswOrder.Append(inttostr(tmpanswpos));
  end;                             {1/10/207}
end;
{================================================================}
{----------create new ask list - offline paper variant-----------}
procedure GenerateAsksList;
var
  minFreq, AskBySciens : integer;
  NowGenerated : integer;//count generated ask on this iteration
  CurrTestSectID, CurrAsk : integer;
  minFreqCount : integer;
  MinFreqAskId : integer;
  LeaveGenerate : integer;
  CurrRightAnswerOrder : TStrings;
  CycleLimit : integer;
  tmpminpos : integer;
  generated : boolean;
  minFreqStr : string;
  CurrSciensID : string;
  AskIDList : array of integer;
  AnswCountList : array of integer;
  AskIDStatus : array of boolean;
begin
   CurrRightAnswerOrder := TStringList.Create;//prepare string list
   //set detail conditions to immediate access!      {8/11/2009}
   testeditdm.TSect2ScDataSet.DetailConditions := [dcForceOpen];
   //goto first record in the list of test modules for current test;
   testeditdm.TestModDataSet.first;  {27/11/2006}
   While not testeditdm.TestModDataSet.Eof do   {27/11/2006}
   //processind all test section for the current test on some subject;
   begin            {1}
    CurrTestSectID := testeditdm.TestModDataSet.FieldByName('ID_TESTSECTION').AsInteger;
    //goto first record in the list of sciens for current test module
    testeditdm.TSect2ScDataSet.First;
    while not testeditdm.TSect2ScDataSet.Eof do
    begin            {1-1}                   {7/11/2009}
     //get current sciens ID
     CurrSciensID := testeditdm.TSect2ScDataSet.FieldByName('SCIENS_ID').AsString;
     //get questions count for this sciens direction (module)
     AskBySciens := testeditdm.TSect2ScDataSet.FieldByName('ASKCOUNT').AsInteger;
     //set progressbar
     mainform.SetProgressBar(0, AskBySciens, 1, 0);
     //geting minimum frequen from ask list table
     PerformSearchMinimalFrequency(CurrSciensID, minFreqStr);  {level up - 5-04-2007}
     NowGenerated := 0;
     while NowGenerated < AskBySciens do  //must generate appropritate number of questions
     begin          {2}
       LeaveGenerate := AskBySciens - NowGenerated; //how much ask need generate now
       //geting list of ask with minimal frequency
       PerformSearchListOfAskwithMinFreq (CurrSciensID, minFreqStr, minFreqCount);
       //create dinamic arrays
       setlength(AskIDList, minFreqCount);
       setlength(AnswCountList, minFreqCount);
       setlength(AskIDStatus, minFreqCount);
       //get list of the asks ID to the dinamic array and test it to present in the existing base {16/07/2007}
       GetAskIDList(AskIDList, AnswCountList, AskIDStatus, minFreqCount);//now exist ready count of the ask ID for generating
       if minFreqCount > 0 then
       begin        {2+}
         if minFreqCount >= LeaveGenerate then CycleLimit := LeaveGenerate
         else CycleLimit := minFreqCount;
         //generate set of asks and fill data into the tables
         for CurrAsk := 1 to CycleLimit do
         begin          {3}
           //generate probability ask ID-select random question number
           generated := false;
           repeat  //do up to find new ask ID
             tmpminpos := random(minFreqCount);
             if AskIDStatus[tmpminpos] = false then generated := true;
           until generated = true;//exit when find ID with status "false"-not used
           MinFreqAskId := AskIDList[tmpminpos];//select ask ID
           AskIDStatus[tmpminpos] := true;//change status for selected ask ID
           //set position for right answer  {16/07/2007}
           SetAnswerOrder(AnswCountList[tmpminpos], CurrRightAnswerOrder);
           //write changes in the table os asks and in the table of the offline ask list
           WriteOfflineAskData(MinFreqAskId, CurrRightAnswerOrder, CurrSciensID, CurrTestSectID);{7/11/2009}
           //set change frequention in base table
           WriteChangedFrequent(MinFreqAskId, minFreqStr);
           //one question aded to list
           inc(NowGenerated);
           //change progressbar position
           mainform.ProgressBarStepIt(1);
         end             {/3}
       end           {/2+}
       else
       begin         {2++}
         //set new value of the minimal frequency for search!!!;
         minFreq := strtoint(minFreqStr)+1;
         minFreqStr := inttostr(minFreq);
       end;          {/2++}
     end;            {/2}
     //goto next sciens (module)
     testeditdm.TSect2ScDataSet.Next;
    end;            {/1-1}
    //goto next test module
    testeditdm.TestModDataSet.Next;  {27/11/2006}
    //clear progressbar position
    mainform.ProgressBarPosition(0);
   end;             {/1}
   CurrRightAnswerOrder.Free; //destroy string list
   //restore detail conditions                {8/11/2009}
   testeditdm.TSect2ScDataSet.DetailConditions := [dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
end;
{================================================================}
{---------change one ask in ready variant of the paper-----------}
procedure ExchangeAsk;
var
  MinFreqAskId, tmpminpos, minFreq, ExAsk_ID, ExSciens_ID, minFreqCount : integer;
  change_OK : boolean;
  CurrSciensID, minFreqStr : string;
  AskIDList : array of integer;
  AnswCountList : array of integer;  
  AskIDStatus : array of boolean;//not used in this procedure
begin
  //get current ask ID and sciens ID
  ExAsk_ID := testeditdm.RedyPaperMemTable.FieldByName('ASK_ID').asInteger;
  ExSciens_ID := testeditdm.RedyPaperMemTable.FieldByName('SCIENS_ID').asInteger;
  CurrSciensID := inttostr(ExSciens_ID);
  //geting minimum frequen from ask list table
  PerformSearchMinimalFrequency(CurrSciensID, minFreqStr);
  //set progressbar - steep 1 complet
  mainform.SetProgressBar(0, 4, 1, 1);
  change_OK := false;
  repeat
    //geting list of ask with minimal frequency
    PerformSearchListOfAskwithMinFreq (CurrSciensID, minFreqStr, minFreqCount);
    //change progressbar position
    mainform.ProgressBarStepIt(1);
    //create dinamic arrays
    setlength(AskIDList, minFreqCount);
    setlength(AnswCountList, minFreqCount);
    setlength(AskIDStatus, minFreqCount);
    //get list of the asks ID to the dinamic array and test it to present in the existing base
    GetAskIDList(AskIDList, AnswCountList, AskIDStatus, minFreqCount);
    //change progressbar position
    mainform.ProgressBarStepIt(1);
    if minFreqCount > 0 then
    begin
      //select random question number
      tmpminpos := random(minFreqCount);
      MinFreqAskId := AskIDList[tmpminpos];
      change_OK := true;
    end
    else
    begin
      //set new value of the minimal frequency for search!!!;  {14/12/2006}
      minFreq := strtoint(minFreqStr)+1;
      minFreqStr := inttostr(minFreq);
    end;
  until change_OK = true; //stop when exchange performed!
  //for ask that changed frequence NOT decrease!
  //chamge record in the offline ask list table
  ChangeOfflineAskData(ExAsk_ID, MinFreqAskId);
  //change progressbar position
  mainform.ProgressBarStepIt(1);
  //set change frequention in base table
  WriteChangedFrequent(MinFreqAskId, minFreqStr);
  //TODO: set old ask to archive
  testeditdm.SetOldAskToArchive(ExAsk_ID, ExSciens_ID);
  //clear progressbar position
  mainform.ProgressBarPosition(0);
end;
{====================================================================}
{---------change answer order for current ask of the paper-----------}
procedure ExchangeAnswerOrder(showprogres:boolean);
var
  ExAsk_ID, AnswCount : integer;
  tmpRightAnswerOrder : TStrings;
begin
  tmpRightAnswerOrder := TStringList.Create;//prepare string list
  //get current ask ID and sciens ID
  ExAsk_ID := testeditdm.RedyPaperMemTable.FieldByName('ASK_ID').asInteger;
  //set progressbar - steep 1 complet
  if showprogres then mainform.SetProgressBar(0, 4, 1, 1);
  //search record
  testeditdm.OffAsksDataSet.Locate('ASK_ID',inttostr(ExAsk_ID), [loCaseInsensitive]);
  //get cout of answer for current ask          ????
  AnswCount := testeditdm.OffAnswTextDataSet.RecordCountFromSrv;
  //change progressbar position - steep 2 compleet
  if showprogres then mainform.ProgressBarStepIt(1);
  //set position for right answer
  SetAnswerOrder(AnswCount, tmpRightAnswerOrder);
  //change progressbar position - steep 3 compleet
  if showprogres then mainform.ProgressBarStepIt(1);
  //change answer order
  testeditdm.OffAsksDataSet.Edit;
  testeditdm.OffAsksDataSet.FieldByName('RIGHTORDER').asString := tmpRightAnswerOrder.CommaText;
  testeditdm.OffAsksDataSet.Post;
  //change progressbar position - steep 4 compleet
  if showprogres then mainform.ProgressBarStepIt(1);
  tmpRightAnswerOrder.Free; //destroy string list
  //clear progressbar position
  if showprogres then mainform.ProgressBarPosition(0);
end;
{======================================================================}
{----------------------set MS Word default parameters------------------}
procedure PrepareWordDocument;
const
  bord_style=1; //border style of the table
  bord_width=4; //border widdth of the table
  font_name = 'Times New Roman';    {'Courier New';}
  font_size = 12;
begin
  //run microsoft word
  Word_Run := true;
  testeditdm.WordApplication1.Connect;
  //create new document
  testeditdm.WordApplication1.Documents.Add(EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  testeditdm.WordDocument1.ConnectTo(testeditdm.WordApplication1.ActiveDocument);
  with testeditdm.WordApplication1 do
  begin
    //sample options
    Options.Pagination := true;
    Options.WPHelp := false;
    Options.WPDocNavKeys := false;
    Options.ShortMenuNames := false;
    Options.RTFInClipboard := true;
    Options.BlueScreen := false;
    Options.EnableSound := false;
    Options.ConfirmConversions := false;
    Options.UpdateLinksAtOpen := true;
    Options.SendMailAttach := true;
    Options.MeasurementUnit := 1; {centimeters}
    Options.AllowPixelUnits := false;
    Options.AnimateScreenMovements := false;
    Options.ApplyFarEastFontsToAscii := false;
    Options.InterpretHighAnsi := 1;
    //disable spellchek
    Options.CheckSpellingAsYouType:=False;
    Options.CheckGrammarAsYouType:=False;
    //set line parameters
    Options.DefaultBorderLineStyle := bord_style; //wdLineStyleSingle
    Options.DefaultBorderLineWidth := bord_width; //wdLineWidth050pt
    Options.DefaultBorderColor := 0;
    //set compability format
    ActiveDocument.Compatibility[7]:=true;  ///wdSuppressSpBfAfterPgBrk
    ActiveDocument.Compatibility[8]:=true;  ///wdSuppressTopSpacing
    ActiveDocument.Compatibility[13]:=true;  ///wdLeaveBackslashAlone
    ActiveDocument.Compatibility[14]:=true;  ///wdExpandShiftReturn
    ActiveDocument.Compatibility[15]:=true;  ///wdDontULTrailSpace
    ActiveDocument.Compatibility[16]:=true;  ///wdDontBalanceSingleByteDoubleByteWidth
    ActiveDocument.Compatibility[21]:=true;  ///wdNoSpaceForUL
    ActiveDocument.Compatibility[26]:=true;  ///wdUsePrinterMetrics
    ActiveDocument.Compatibility[29]:=true;  ///wdSuppressBottomSpacing
    //set page format
    ActiveDocument.PageSetup.TopMargin := 40;
    ActiveDocument.PageSetup.BottomMargin := 40;
    ActiveDocument.PageSetup.LeftMargin := 60;
    ActiveDocument.PageSetup.RightMargin := 40;
    //set grid format
    ActiveDocument.SnapToGrid := true;
    ActiveDocument.GridDistanceHorizontal := CentimetersToPoints(0.1);
    ActiveDocument.GridDistanceVertical := CentimetersToPoints(0.1);
    ActiveDocument.GridOriginHorizontal := CentimetersToPoints(2);
    ActiveDocument.GridOriginVertical := CentimetersToPoints(1.5);
    ActiveDocument.GridSpaceBetweenHorizontalLines := 1;
    ActiveDocument.GridSpaceBetweenVerticalLines := 2;
    ActiveDocument.GridOriginFromMargin := True;
  end;
  //set font paragraph format
  testeditdm.WordDocument1.Range.Font.Size := font_size;
  testeditdm.WordDocument1.Range.Font.Name := font_name;
end;
{======================================================================}
{-----------write title data to the MS Word document-------------------}
procedure WriteDocumentHeader(HeadStr:string; isBold:boolean);
var
  tmp_doc_end : OleVariant;
begin
  //enable bold text effect
  if isBold then
  begin
    tmp_doc_end := testeditdm.WordDocument1.Range.End_ - 1;
    testeditdm.WordDocument1.Range(tmp_doc_end).Font.Bold:=1;
  end;
  //insert line for person name input
  testeditdm.WordDocument1.Range.InsertAfter(HeadStr);
  //insert paragraph break
  testeditdm.WordDocument1.Range.InsertParagraphAfter;
  //disable bold text effect
  if isBold then
  begin
    tmp_doc_end := testeditdm.WordDocument1.Range.End_ - 1;
    testeditdm.WordDocument1.Range(tmp_doc_end).Font.Bold:=0;
  end;
end;
{===================PRINT PAPERS=======================================}
{-----------------write all data to the MS Word document---------------}
procedure ExportCurentVariant(ShowAnsw : boolean);
const
  font_size = 12; //default font size
  comulcount = 3; //count of the column in the table
  first_col = 30;  //width of the first column of the table
  sec_col = 20;   //width of the second column of the table
  third_col = 460;
var
  PageNumberAlignment, FirstPage, tab_style, tab_border, r_beg, r_end, doc_end : OleVariant;
  subject, faculty, semester, person, sign, group, speciality, tmpstr : string;
  currtable, currow, rowscount : integer;
        {---------------------------------------------}
        procedure GetLangTitleData(LangIDStr:string);
        begin
          //set default values
          subject := ''; faculty := ''; semester := '';
          person := ''; sign := ''; group := ''; speciality := '';
          //set filter to lang table
          testeditdm.LangsDataSet.Filtered := false;
          testeditdm.LangsDataSet.Filter := 'ID_LANG='+LangIDStr;
          testeditdm.LangsDataSet.Filtered := true;
          person := testeditdm.LangsDataSet.FieldByName('PERSON_TIT').AsString;
          sign := testeditdm.LangsDataSet.FieldByName('SIGN_TIT').AsString;
          group := testeditdm.LangsDataSet.FieldByName('GROUP_TIT').AsString;
          speciality := testeditdm.LangsDataSet.FieldByName('SPEC_TIT').AsString;
          subject := testeditdm.LangsDataSet.FieldByName('SUBJ_TIT').AsString;
          faculty := testeditdm.LangsDataSet.FieldByName('FACULTY_TIT').AsString;
          semester := testeditdm.LangsDataSet.FieldByName('SEMESTR_TIT').AsString;
          //disable filter
          testeditdm.LangsDataSet.Filtered := false;
        end;
        {---------------------------------------------}
begin
 try
  //hide Microsoft Word main window
  if testeditdm.WordApplication1.Visible = true then testeditdm.WordApplication1.Visible := false;
  //get language title data
  GetLangTitleData(testeditdm.SubjTestDataSet.FieldByName('LANG_ID').AsString);
  //insert page number into document footer
  if basevar.Settings.W_ShowPage = DefAskFormatState then
  begin
    PageNumberAlignment := wdAlignPageNumberCenter;
    FirstPage := true;
    testeditdm.WordDocument1.Sections.Item(1).Footers.Item(1).PageNumbers.Add(PageNumberAlignment, FirstPage);
  end;
  MainForm.RedyPaperTextDBRichEdit.ReadOnly := false;
  //insert date into document header
  if basevar.Settings.W_ShowDate = DefAskFormatState then
      testeditdm.WordDocument1.Sections.Item(1).Headers.Item(1).Range.Text := datetostr(today);
  //set special paragraph format
  testeditdm.WordDocument1.Range.ParagraphFormat.Alignment := 1;
  testeditdm.WordDocument1.Range.ParagraphFormat.SpaceBefore := 6;
  testeditdm.WordDocument1.Range.ParagraphFormat.SpaceAfter := 6;
  //insert line for person name input
  if basevar.Settings.W_ShowPerson = DefAskFormatState then WriteDocumentHeader(person, True);
  //insert line for person sign input
  if basevar.Settings.W_ShowSign = DefAskFormatState then WriteDocumentHeader(sign, True);
  //insert line for group number input
  if basevar.Settings.W_ShowGroup = DefAskFormatState then WriteDocumentHeader(group, True);
  //insert line speciality name input
  if basevar.Settings.W_ShowSpec = DefAskFormatState then WriteDocumentHeader(speciality, True);
  //insert name of subject into document
  tmpstr := testeditdm.SubjectDataSet.fieldByName('SUBJNAME').AsString;
  if basevar.Settings.W_ShowSubj = DefAskFormatState then WriteDocumentHeader(subject + ' ' + tmpstr, True);
  //insert name of faculty into document
  tmpstr := testeditdm.SubjectDataSet.fieldByName('FACULTY').AsString;
  if basevar.Settings.W_ShowFaculty = DefAskFormatState then WriteDocumentHeader(faculty + ' ' + tmpstr, True);
  //insert number of semester into document
  tmpstr := testeditdm.SubjectDataSet.fieldByName('SEMESTR').AsString;
  if basevar.Settings.W_ShowSemestr = DefAskFormatState then WriteDocumentHeader(semester + ' ' + tmpstr, True);
  //insert name of variant into document
  tmpstr := testeditdm.OffPapersDataSet.fieldByName('VAR_NAME').AsString;
  tmpstr := tmpstr + '  ' + testeditdm.OffPapersDataSet.fieldByName('ID_OFFEXAM').AsString;
  WriteDocumentHeader(tmpstr, True);
  //set normal text paragraph format
  doc_end := testeditdm.WordDocument1.Range.End_ - 1;
  testeditdm.WordDocument1.Range(doc_end).ParagraphFormat.Alignment := 0;
  testeditdm.WordDocument1.Range(doc_end).ParagraphFormat.SpaceBefore := 0;
  testeditdm.WordDocument1.Range(doc_end).ParagraphFormat.SpaceAfter := 0;

  //goto first record in the list of sciens for current test;
  testeditdm.TestModDataSet.first;  {27/11/2006}
  //define current table number
  currtable := 1;
  While not testeditdm.TestModDataSet.Eof do   {27/11/2006}
  //processind all modules for the current test on some subject;
  begin            {1}
    //insert additional paragraph break
    testeditdm.WordDocument1.Range.InsertParagraphAfter;
    //insert name of section into document
    tmpstr := inttostr(currtable)+'. ';
//    tmpstr := tmpstr + testeditdm.TestModDataSet.FieldByName('sc_name_search').AsString;
    tmpstr := tmpstr + testeditdm.TestModDataSet.FieldByName('SECT_TITLE').AsString;
    WriteDocumentHeader(tmpstr, True);
    //insert additional paragraph break
    testeditdm.WordDocument1.Range.InsertParagraphAfter;
    //define number of rows in new table
    rowscount := testeditdm.RedyPaperMemTable.RecordCount;//!!!!
    //set progressbar
    mainform.SetProgressBar(0, rowscount, 1, 0);
     //insert table at the end of the document
    r_beg := testeditdm.WordDocument1.Range.End_ - 1;
    r_end := testeditdm.WordDocument1.Range.End_ - 1;
    testeditdm.WordDocument1.Tables.Add(testeditdm.WordDocument1.Range(r_beg, r_end), rowscount, comulcount, EmptyParam, EmptyParam);
    //apply format style to table
    tab_style := 0; tab_border := 0;
    testeditdm.WordDocument1.Tables.Item(currtable).AutoFormat(tab_style, tab_border, EmptyParam, EmptyParam,
          EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
    //format column width in the table
    testeditdm.WordDocument1.Tables.Item(currtable).Columns.Item(1).Width:=first_col;
    if ShowAnsw then testeditdm.WordDocument1.Tables.Item(currtable).Columns.Item(2).Width:=2*sec_col
    else testeditdm.WordDocument1.Tables.Item(currtable).Columns.Item(2).Width:=sec_col;
    testeditdm.WordDocument1.Tables.Item(currtable).Columns.Item(3).Width:=third_col;

    //define current row number
    currow := 1;
    While not testeditdm.RedyPaperMemTable.Eof do
    //processing all asks for the current sciens
    begin          {2}
      if not testeditdm.RedyPaperMemTable.fieldByName('RecPrefix').IsNull then
      begin        {3}
        testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,1).Range.Text := testeditdm.RedyPaperMemTable.fieldByName('RecPrefix').AsString;
        //select all text without last character - paragraph end
{work OK!}        MainForm.RedyPaperTextDBRichEdit.SelectAll;
{work OK!}        MainForm.RedyPaperTextDBRichEdit.SelLength := MainForm.RedyPaperTextDBRichEdit.SelLength-1;
        //set default font size
        if basevar.Settings.W_SetFontSize = DefAskFormatState then MainForm.RedyPaperTextDBRichEdit.SelAttributes.Size := basevar.Settings.W_FontSize; {font_size;}
        //copy all text to clipboard
{work OK!}        MainForm.RedyPaperTextDBRichEdit.CopyToClipboard;
        //merge cells
        testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,2).Merge(testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,3));
        //paste clipboard content - write ask text to word documnet
        if not testeditdm.RedyPaperMemTable.fieldByName('RecData').IsNull then
{work OK!}            testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,2).Range.Paste;
//{12/10/08}             testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,2).Range.InsertAfter(MainForm.RedyPaperTextDBRichEdit.Text);
        //merge cells
      end          {/3}
      else
      begin        {4}
        if not testeditdm.RedyPaperMemTable.fieldByName('RecPrefix2').IsNull then
        begin      {5}
          testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,2).Range.Text := testeditdm.RedyPaperMemTable.fieldByName('RecPrefix2').AsString;
          //select all text without last character - paragraph end
{work OK!}          MainForm.RedyPaperTextDBRichEdit.SelectAll;
{work OK!}          MainForm.RedyPaperTextDBRichEdit.SelLength := MainForm.RedyPaperTextDBRichEdit.SelLength-1;
          //set default font size
          if basevar.Settings.W_SetFontSize = DefAskFormatState then MainForm.RedyPaperTextDBRichEdit.SelAttributes.Size := basevar.Settings.W_FontSize; {font_size;}
          //copy all text to clipboard
{work OK!}          MainForm.RedyPaperTextDBRichEdit.CopyToClipboard;
          //paste clipboard content - write answer text to word documnet
          if not testeditdm.RedyPaperMemTable.fieldByName('RecData').IsNull then
{work OK!}             testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,3).Range.Paste;
//{12/10/08}             testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,3).Range.InsertAfter(MainForm.RedyPaperTextDBRichEdit.SelText);
        end        {/5}
        else
        begin      {6} //TODO - delete -picture for ask or answer
///          MainForm.RedyDBImage.CopyToClipboard;
///          if not testeditdm.RedyPaperMemTable.fieldByName('RecData').IsNull then
///             testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,3).Range.Paste;
        end;       {/6}
      end;         {/4}
      //goto next question
      testeditdm.RedyPaperMemTable.Next;
      inc (currow); //goto next row in the table
      //change progressbar position
      mainform.ProgressBarStepIt(1);
    end;           {/2}
    doc_end := testeditdm.WordDocument1.Range.End_ - 1;
    testeditdm.WordDocument1.Range(doc_end).ListFormat.ListOutdent;
    //goto next sciens
    testeditdm.TestModDataSet.Next;
    inc (currtable);
    //clear progressbar position
    mainform.ProgressBarPosition(0);
  end;             {/1}
  MainForm.RedyPaperTextDBRichEdit.ReadOnly := false;
  //show main application window
  testeditdm.WordApplication1.Visible := True;
  //show Word document window
  testeditdm.WordApplication1.Activate;
 finally
  //disconnect from document
  testeditdm.WordDocument1.Disconnect;
  //disconnect from word application
  testeditdm.WordApplication1.Disconnect;
 end; 
end;
{---------Export current module in MS Word----------------}
procedure ExportCurentModule(ShowAnsw : boolean);
const
  font_size = 12; //default font size
  comulcount = 3; //count of the column in the table
  first_col = 30;  //width of the first column of the table
  sec_col = 20;   //width of the second column of the table
  third_col = 460;
var
  PageNumberAlignment, FirstPage, tab_style, tab_border, r_beg, r_end, doc_end : OleVariant;
  subject, faculty, semester, person, sign, group, speciality, tmpstr : string;
  currtable, currow, rowscount : integer;
        {---------------------------------------------}
        procedure GetLangTitleData(LangIDStr:string);
        begin
          //set default values
          subject := ''; faculty := ''; semester := '';
          person := ''; sign := ''; group := ''; speciality := '';
          //set filter to lang table
          testeditdm.LangsDataSet.Filtered := false;
          testeditdm.LangsDataSet.Filter := 'ID_LANG='+LangIDStr;
          testeditdm.LangsDataSet.Filtered := true;
          person := testeditdm.LangsDataSet.FieldByName('PERSON_TIT').AsString;
          sign := testeditdm.LangsDataSet.FieldByName('SIGN_TIT').AsString;
          group := testeditdm.LangsDataSet.FieldByName('GROUP_TIT').AsString;
          speciality := testeditdm.LangsDataSet.FieldByName('SPEC_TIT').AsString;
          subject := testeditdm.LangsDataSet.FieldByName('SUBJ_TIT').AsString;
          faculty := testeditdm.LangsDataSet.FieldByName('FACULTY_TIT').AsString;
          semester := testeditdm.LangsDataSet.FieldByName('SEMESTR_TIT').AsString;
          //disable filter
          testeditdm.LangsDataSet.Filtered := false;
        end;
        {---------------------------------------------}
begin
 try
  //hide Microsoft Word main window
  if testeditdm.WordApplication1.Visible = true then testeditdm.WordApplication1.Visible := false;
  //get language title data
  GetLangTitleData(testeditdm.SubjTestDataSet.FieldByName('LANG_ID').AsString);
  //insert page number into document footer
  if basevar.Settings.W_ShowPage = DefAskFormatState then
  begin
    PageNumberAlignment := wdAlignPageNumberCenter;
    FirstPage := true;
    testeditdm.WordDocument1.Sections.Item(1).Footers.Item(1).PageNumbers.Add(PageNumberAlignment, FirstPage);
  end;
  MainForm.RedyPaperTextDBRichEdit.ReadOnly := false;
  //insert date into document header
  if basevar.Settings.W_ShowDate = DefAskFormatState then
      testeditdm.WordDocument1.Sections.Item(1).Headers.Item(1).Range.Text := datetostr(today);
  //set special paragraph format
  testeditdm.WordDocument1.Range.ParagraphFormat.Alignment := 1;
  testeditdm.WordDocument1.Range.ParagraphFormat.SpaceBefore := 6;
  testeditdm.WordDocument1.Range.ParagraphFormat.SpaceAfter := 6;
  //insert line for person name input
  if basevar.Settings.W_ShowPerson = DefAskFormatState then WriteDocumentHeader(person, True);
  //insert line for person sign input
  if basevar.Settings.W_ShowSign = DefAskFormatState then WriteDocumentHeader(sign, True);
  //insert line for group number input
  if basevar.Settings.W_ShowGroup = DefAskFormatState then WriteDocumentHeader(group, True);
  //insert line speciality name input
  if basevar.Settings.W_ShowSpec = DefAskFormatState then WriteDocumentHeader(speciality, True);
  //insert name of subject into document
  tmpstr := testeditdm.SubjectDataSet.fieldByName('SUBJNAME').AsString;
  if basevar.Settings.W_ShowSubj = DefAskFormatState then WriteDocumentHeader(subject + ' ' + tmpstr, True);
  //insert name of faculty into document
  tmpstr := testeditdm.SubjectDataSet.fieldByName('FACULTY').AsString;
  if basevar.Settings.W_ShowFaculty = DefAskFormatState then WriteDocumentHeader(faculty + ' ' + tmpstr, True);
  //insert number of semester into document
  tmpstr := testeditdm.SubjectDataSet.fieldByName('SEMESTR').AsString;
  if basevar.Settings.W_ShowSemestr = DefAskFormatState then WriteDocumentHeader(semester + ' ' + tmpstr, True);
  //insert name of variant into document
  tmpstr := testeditdm.OffPapersDataSet.fieldByName('VAR_NAME').AsString;
  tmpstr := tmpstr + '  ' + testeditdm.OffPapersDataSet.fieldByName('ID_OFFEXAM').AsString;
  WriteDocumentHeader(tmpstr, True);
  //set normal text paragraph format
  doc_end := testeditdm.WordDocument1.Range.End_ - 1;
  testeditdm.WordDocument1.Range(doc_end).ParagraphFormat.Alignment := 0;
  testeditdm.WordDocument1.Range(doc_end).ParagraphFormat.SpaceBefore := 0;
  testeditdm.WordDocument1.Range(doc_end).ParagraphFormat.SpaceAfter := 0;
  //define current table number
  currtable := 1;

    //insert additional paragraph break
    testeditdm.WordDocument1.Range.InsertParagraphAfter;
    //insert name of section into document
    tmpstr := inttostr(currtable)+'. ';
//    tmpstr := tmpstr + testeditdm.TestModDataSet.FieldByName('sc_name_search').AsString;
    tmpstr := tmpstr + testeditdm.TestModDataSet.FieldByName('SECT_TITLE').AsString;
    WriteDocumentHeader(tmpstr, True);
    //insert additional paragraph break
    testeditdm.WordDocument1.Range.InsertParagraphAfter;
    //define number of rows in new table
    rowscount := testeditdm.RedyPaperMemTable.RecordCount;//!!!!
    //set progressbar
    mainform.SetProgressBar(0, rowscount, 1, 0);
     //insert table at the end of the document
    r_beg := testeditdm.WordDocument1.Range.End_ - 1;
    r_end := testeditdm.WordDocument1.Range.End_ - 1;
    testeditdm.WordDocument1.Tables.Add(testeditdm.WordDocument1.Range(r_beg, r_end), rowscount, comulcount, EmptyParam, EmptyParam);
    //apply format style to table
    tab_style := 0; tab_border := 0;
    testeditdm.WordDocument1.Tables.Item(currtable).AutoFormat(tab_style, tab_border, EmptyParam, EmptyParam,
          EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
    //format column width in the table
    testeditdm.WordDocument1.Tables.Item(currtable).Columns.Item(1).Width:=first_col;
    if ShowAnsw then testeditdm.WordDocument1.Tables.Item(currtable).Columns.Item(2).Width:=2*sec_col
    else testeditdm.WordDocument1.Tables.Item(currtable).Columns.Item(2).Width:=sec_col;
    testeditdm.WordDocument1.Tables.Item(currtable).Columns.Item(3).Width:=third_col;

    //define current row number
    currow := 1;
    While not testeditdm.RedyPaperMemTable.Eof do
    //processing all asks for the current sciens
    begin          {2}
      if not testeditdm.RedyPaperMemTable.fieldByName('RecPrefix').IsNull then
      begin        {3}
        testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,1).Range.Text := testeditdm.RedyPaperMemTable.fieldByName('RecPrefix').AsString;
        //select all text without last character - paragraph end
{work OK!}        MainForm.RedyPaperTextDBRichEdit.SelectAll;
{work OK!}        MainForm.RedyPaperTextDBRichEdit.SelLength := MainForm.RedyPaperTextDBRichEdit.SelLength-1;
        //set default font size
        if basevar.Settings.W_SetFontSize = DefAskFormatState then MainForm.RedyPaperTextDBRichEdit.SelAttributes.Size := basevar.Settings.W_FontSize; {font_size;}
        //copy all text to clipboard
{work OK!}        MainForm.RedyPaperTextDBRichEdit.CopyToClipboard;
        //merge cells
        testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,2).Merge(testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,3));
        //paste clipboard content - write ask text to word documnet
        if not testeditdm.RedyPaperMemTable.fieldByName('RecData').IsNull then
{work OK!}            testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,2).Range.Paste;
//{12/10/08}             testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,2).Range.InsertAfter(MainForm.RedyPaperTextDBRichEdit.Text);
        //merge cells
      end          {/3}
      else
      begin        {4}
        if not testeditdm.RedyPaperMemTable.fieldByName('RecPrefix2').IsNull then
        begin      {5}
          testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,2).Range.Text := testeditdm.RedyPaperMemTable.fieldByName('RecPrefix2').AsString;
          //select all text without last character - paragraph end
{work OK!}          MainForm.RedyPaperTextDBRichEdit.SelectAll;
{work OK!}          MainForm.RedyPaperTextDBRichEdit.SelLength := MainForm.RedyPaperTextDBRichEdit.SelLength-1;
          //set default font size
          if basevar.Settings.W_SetFontSize = DefAskFormatState then MainForm.RedyPaperTextDBRichEdit.SelAttributes.Size := basevar.Settings.W_FontSize; {font_size;}
          //copy all text to clipboard
{work OK!}          MainForm.RedyPaperTextDBRichEdit.CopyToClipboard;
          //paste clipboard content - write answer text to word documnet
          if not testeditdm.RedyPaperMemTable.fieldByName('RecData').IsNull then
{work OK!}             testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,3).Range.Paste;
//{12/10/08}             testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,3).Range.InsertAfter(MainForm.RedyPaperTextDBRichEdit.SelText);
        end        {/5}
        else
        begin      {6} //picture for ask or answer
//destroyed 1/06/2009
///          MainForm.RedyDBImage.CopyToClipboard;
///          if not testeditdm.RedyPaperMemTable.fieldByName('RecData').IsNull then
///             testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,3).Range.Paste;
        end;       {/6}
      end;         {/4}
      //goto next question
      testeditdm.RedyPaperMemTable.Next;
      inc (currow); //goto next row in the table
      //change progressbar position
      mainform.ProgressBarStepIt(1);
    end;           {/2}
    doc_end := testeditdm.WordDocument1.Range.End_ - 1;
    testeditdm.WordDocument1.Range(doc_end).ListFormat.ListOutdent;
    //goto next sciens
    testeditdm.TestModDataSet.Next;
    inc (currtable);
    //clear progressbar position
    mainform.ProgressBarPosition(0);
  MainForm.RedyPaperTextDBRichEdit.ReadOnly := false;
  //show main application window
  testeditdm.WordApplication1.Visible := True;
  //show Word document window
  testeditdm.WordApplication1.Activate;
 finally
  //disconnect from document
  testeditdm.WordDocument1.Disconnect;
  //disconnect from word application
  testeditdm.WordApplication1.Disconnect;
 end;
end;
{---------Export current test paper answers in to the MS Word----------------}
procedure ExportAnswersWord(ShowAnsw : boolean);
const
  font_size = 12; //default font size
  comulcount = 2; //count of the column in the table
  first_col = 30;  //width of the first column of the table
  sec_col = 35;   //width of the second column of the table
var
  PageNumberAlignment, FirstPage, tab_style, tab_border, r_beg, r_end, doc_end : OleVariant;
  subject, faculty, semester, person, sign, group, speciality, tmpstr : string;
  tmpfilter : string;
  currtable, currow, rowscount : integer;
        {---------------------------------------------}
        procedure GetLangTitleData(LangIDStr:string);
        begin
          //set default values
          subject := ''; faculty := ''; semester := '';
          person := ''; sign := ''; group := ''; speciality := '';
          //set filter to lang table
          testeditdm.LangsDataSet.Filtered := false;
          testeditdm.LangsDataSet.Filter := 'ID_LANG='+LangIDStr;
          testeditdm.LangsDataSet.Filtered := true;
          person := testeditdm.LangsDataSet.FieldByName('PERSON_TIT').AsString;
          sign := testeditdm.LangsDataSet.FieldByName('SIGN_TIT').AsString;
          group := testeditdm.LangsDataSet.FieldByName('GROUP_TIT').AsString;
          speciality := testeditdm.LangsDataSet.FieldByName('SPEC_TIT').AsString;
          subject := testeditdm.LangsDataSet.FieldByName('SUBJ_TIT').AsString;
          faculty := testeditdm.LangsDataSet.FieldByName('FACULTY_TIT').AsString;
          semester := testeditdm.LangsDataSet.FieldByName('SEMESTR_TIT').AsString;
          //disable filter
          testeditdm.LangsDataSet.Filtered := false;
        end;
        {---------------------------------------------}
begin
  //disable previous filter
  tmpfilter := '';
  if testeditDM.RedyPaperMemTable.Filtered = true then
  begin
    tmpfilter := testeditDM.RedyPaperMemTable.Filter;
    testeditDM.RedyPaperMemTable.Filtered := false;
  end;
  //set new filter
  testeditDM.RedyPaperMemTable.Filter := 'weight<>0';
  testeditDM.RedyPaperMemTable.Filtered := true;
 try
  //hide Microsoft Word main window
  if testeditdm.WordApplication1.Visible = true then testeditdm.WordApplication1.Visible := false;
  //get language title data
  GetLangTitleData(testeditdm.SubjTestDataSet.FieldByName('LANG_ID').AsString);
  //insert page number into document footer
  if basevar.Settings.W_ShowPage = DefAskFormatState then
  begin
    PageNumberAlignment := wdAlignPageNumberCenter;
    FirstPage := true;
    testeditdm.WordDocument1.Sections.Item(1).Footers.Item(1).PageNumbers.Add(PageNumberAlignment, FirstPage);
  end;
  MainForm.RedyPaperTextDBRichEdit.ReadOnly := false;
  //insert date into document header
  if basevar.Settings.W_ShowDate = DefAskFormatState then
      testeditdm.WordDocument1.Sections.Item(1).Headers.Item(1).Range.Text := datetostr(today);
  //set special paragraph format
  testeditdm.WordDocument1.Range.ParagraphFormat.Alignment := 1;
  testeditdm.WordDocument1.Range.ParagraphFormat.SpaceBefore := 6;
  testeditdm.WordDocument1.Range.ParagraphFormat.SpaceAfter := 6;
  //insert name of subject into document
  tmpstr := testeditdm.SubjectDataSet.fieldByName('SUBJNAME').AsString;
  if basevar.Settings.W_ShowSubj = DefAskFormatState then WriteDocumentHeader(subject + ' ' + tmpstr, True);
  //insert name of faculty into document
  tmpstr := testeditdm.SubjectDataSet.fieldByName('FACULTY').AsString;
  if basevar.Settings.W_ShowFaculty = DefAskFormatState then WriteDocumentHeader(faculty + ' ' + tmpstr, True);
  //insert number of semester into document
  tmpstr := testeditdm.SubjectDataSet.fieldByName('SEMESTR').AsString;
  if basevar.Settings.W_ShowSemestr = DefAskFormatState then WriteDocumentHeader(semester + ' ' + tmpstr, True);

  //set normal text paragraph format
  doc_end := testeditdm.WordDocument1.Range.End_ - 1;
  testeditdm.WordDocument1.Range(doc_end).ParagraphFormat.Alignment := 0;
  testeditdm.WordDocument1.Range(doc_end).ParagraphFormat.SpaceBefore := 0;
  testeditdm.WordDocument1.Range(doc_end).ParagraphFormat.SpaceAfter := 0;

  currtable := 1;

    //insert additional paragraph break
    testeditdm.WordDocument1.Range.InsertParagraphAfter;
    //define number of rows in new table
    rowscount := testeditdm.RedyPaperMemTable.RecordCount;
    //set progressbar
    mainform.SetProgressBar(0, rowscount, 1, 0);
     //insert table at the end of the document
    r_beg := testeditdm.WordDocument1.Range.End_ - 1;
    r_end := testeditdm.WordDocument1.Range.End_ - 1;
    testeditdm.WordDocument1.Tables.Add(testeditdm.WordDocument1.Range(r_beg, r_end), rowscount+1, comulcount, EmptyParam, EmptyParam);
    //apply format style to table
    tab_style := 0; tab_border := 1;
    testeditdm.WordDocument1.Tables.Item(currtable).AutoFormat(tab_style, tab_border, EmptyParam, EmptyParam,
          EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
    //format column width in the table
    testeditdm.WordDocument1.Tables.Item(currtable).Columns.Item(1).Width:=first_col;
    if ShowAnsw then testeditdm.WordDocument1.Tables.Item(currtable).Columns.Item(2).Width:=2*sec_col
    else testeditdm.WordDocument1.Tables.Item(currtable).Columns.Item(2).Width:=sec_col;
    //write table header
      testeditdm.WordDocument1.Tables.Item(currtable).Cell(1,1).Range.Text := '№';
      testeditdm.WordDocument1.Tables.Item(currtable).Cell(1,2).Range.Text := testeditdm.OffPapersDataSet.fieldByName('ID_OFFEXAM').AsString;
    //define current row number
    currow := 2;
    testeditdm.RedyPaperMemTable.First;
    While not testeditdm.RedyPaperMemTable.Eof do
    begin         {1}
    //processing all asks for the current sciens
      testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,1).Range.Text := testeditdm.RedyPaperMemTable.fieldByName('Ask_Num_on_Paper').AsString;
      testeditdm.WordDocument1.Tables.Item(currtable).Cell(currow,2).Range.Text := testeditdm.RedyPaperMemTable.fieldByName('RecPrefix2').AsString;
      inc (currow); //goto next row in the table
      testeditdm.RedyPaperMemTable.Next;
      //change progressbar position
      mainform.ProgressBarStepIt(1);
    end;           {/1}
    doc_end := testeditdm.WordDocument1.Range.End_ - 1;
    testeditdm.WordDocument1.Range(doc_end).ListFormat.ListOutdent;
    //goto next sciens
    testeditdm.TestModDataSet.Next;
    inc (currtable);
    //clear progressbar position
    mainform.ProgressBarPosition(0);

  MainForm.RedyPaperTextDBRichEdit.ReadOnly := false;
  //show main application window
  testeditdm.WordApplication1.Visible := True;
  //show Word document window
  testeditdm.WordApplication1.Activate;
 finally
  //disconnect from document
  testeditdm.WordDocument1.Disconnect;
  //disconnect from word application
  testeditdm.WordApplication1.Disconnect;
 end;
  //enable previous filter (if it was exist)
  testeditDM.RedyPaperMemTable.Filtered := false;
  if tmpfilter <>'' then
  begin
    testeditDM.RedyPaperMemTable.Filter := tmpfilter;
    testeditDM.RedyPaperMemTable.Filtered := true;
  end;
end;
{================================================================}
{-----------------export answers to ETALON table-----------------}
procedure ExportAnswersDB;
var
  PageCount, CalckPage, CurrPage, CurrAsk, CurrAnsw, j, tmppos: integer;
  ListPageID : array of integer;
  tmpfieldname : string;
  CurrRightAnswerOrder : TStrings;
begin
  //set detail conditions to immediate access!      {8/11/2009}
  testeditdm.TSect2ScDataSet.DetailConditions := [dcForceOpen];
  //create list for answer order text
  CurrRightAnswerOrder := TStringList.Create;//prepare string list
  //define pages count for the current test
//  PageCount := (testeditdm.OffAsksDataSet.RecordCountFromSrv div (Settings.PageAskLimit+1))+1;
  PageCount := (testeditdm.OffAsksDataSet.RecordCountFromSrv div (testeditdm.SubjTestDataSet.FBN('TESTTIME').AsInteger+1))+1;
  //set array length
  setlength(ListPageID, PageCount);
  //prepare records in the etalon table and write exam ID and page number there
  testeditdm.PrepareEtalonRecords(PageCount, ListPageID);
  //setcurrent ask number and page number
  CurrAsk := 1; CurrPage := 1;
  //set progressbar
  mainform.SetProgressBar(0, testeditdm.OffAsksDataSet.RecordCountFromSrv, 1, 0);
  //set default filter in the etalon table;
  testeditdm.SetEtalonFilter(ListPageID[CurrPage-1]);
  //goto first record in the modules list for this test
  testeditdm.TestModDataSet.First;
  //need process sciens table - list sciens can be REARRANGED
  //(for example - after backup/restore database)
  while not testeditdm.TestModDataSet.Eof do
  //process all test modules
  begin            {1}
   //goto first record in the list of sciens for current test module
   testeditdm.TSect2ScDataSet.First;
   while not testeditdm.TSect2ScDataSet.Eof do
   //process all sciens for current test module
   begin            {1-1}                   {8/11/2009}
    //set filter to the offline asks list table
    testeditdm.OffAsksDataSet.Filtered := false;
    testeditdm.OffAsksDataSet.Filter := 'SCIENS_ID='+testeditdm.TSect2ScDataSet.FieldByName('SCIENS_ID').AsString;
    testeditdm.OffAsksDataSet.Filtered := true;
    //goto first record in the list of asks for current test variant;
    testeditdm.OffAsksDataSet.first;
    While not testeditdm.OffAsksDataSet.Eof do
    //processind all asks for the current test variant on some subject;
    begin            {2}
      //define the current text blank page number
//      CalckPage := (CurrAsk div (Settings.PageAskLimit+1)) + CurrPage;
      CalckPage := (CurrAsk div (testeditdm.SubjTestDataSet.FBN('TESTTIME').AsInteger+1)) + CurrPage;
      if CalckPage > CurrPage then
      //change filter in the etalon table
      begin
        CurrPage := CalckPage;//goto next page of the test paper blank
        testeditdm.SetEtalonFilter(ListPageID[CurrPage-1]);
        CurrAsk := 1;//on each page ask field number start from 1
      end;
      //get right answer order list
      CurrRightAnswerOrder.CommaText := testeditdm.OffAsksDataSet.FBN('RIGHTORDER').AsString;
      //processing all answers
      for CurrAnsw:=1 to CurrRightAnswerOrder.Count do
      //need optimize - when user change record count - error will exist
      begin         {3}
//        testeditdm.OffAnswTextDataSet.Recno := strtoint(CurrRightAnswerOrder.Strings[CurrAnsw-1])-1;
           {not working properly!!!!????????}
        //goto the first answer record
        testeditdm.OffAnswTextDataSet.First;
        //position of the answer in source table
        tmppos := strtoint(CurrRightAnswerOrder.Strings[CurrAnsw-1]);
        //goto record in source table
        for j := 1 to tmppos-1 do testeditdm.OffAnswTextDataSet.Next; //must be j < tmppos
        //chek - curr answer is right or not
        if testeditdm.OffAnswTextDataSet.FieldByName('WEIGHT').AsInteger > 0 then
        //current answer is RIGHT!!
        begin
          tmpfieldname := 'p'+inttostr(CurrAsk);
          testeditdm.AnsEtalonADOTable.Edit;
          testeditdm.AnsEtalonADOTable.FieldByName(tmpfieldname).AsInteger := CurrAnsw;
          testeditdm.AnsEtalonADOTable.Post;
        end;
      end;         {/3}
      //goto next question
      testeditdm.OffAsksDataSet.Next;
      inc(CurrAsk);
      //move progressbar indicator
      mainform.ProgressBarStepIt(1);
    end;             {/2}
    //goto next sciens (module)
    testeditdm.TSect2ScDataSet.Next;
   end;              {1-1}                    {8/11/2009}
   //goto next test module
   testeditdm.TestModDataSet.Next
  end;               {/1}
  //disable filters
  testeditdm.OffAsksDataSet.Filtered := false;
  testeditdm.AnsEtalonADOTable.Filtered := false; {06/06/2007}
  //set progress bar position
  mainform.ProgressBarPosition(0);
  CurrRightAnswerOrder.Free; //destroy string list
  //restore detail conditions
  testeditdm.TSect2ScDataSet.DetailConditions := [dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
end;
{==================IMPORT ASKS FROM MS WORD===========================}
{---------------------main import proedure----------------------------}
procedure ImportFromWord(ImportFileName:OleVariant);
var
  tmp_min_req, i, j, importedaskcount, textlen, err_str_count : integer;
  minFreqStr, tmpstr : string;
                  procedure Disconnect_MSWord;
                  begin
                    //disconnect from document
                    testeditdm.WordDocument1.Disconnect;
                    //disconnect from word application
                    testeditdm.WordApplication1.Quit;
                    testeditdm.WordApplication1.Disconnect;
                  end;
begin
  //geting minimum frequen from ask list table
  try
    if testeditdm.TestAskDataSet.RecordCountFromSrv > 0 then
    begin
      PerformSearchMinimalFrequency(testeditdm.TestAskDataSet.FBN('SCIENS_ID').Asstring, minFreqStr);
      tmp_min_req := strtoint(minFreqStr);
    end
    else tmp_min_req := 0; //default
  except
    tmp_min_req := 0; //default
  end;
  //init values
  err_str_count :=0;
  //run microsoft word
  Word_Run := true;
  testeditdm.WordApplication1.Connect;
  //open word document
  testeditdm.WordApplication1.Documents.Open(ImportFileName,EmptyParam,EmptyParam,EmptyParam,
               	EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,
                EmptyParam,EmptyParam,EmptyParam,EmptyParam,);
  testeditdm.WordDocument1.ConnectTo(testeditdm.WordApplication1.ActiveDocument);
  //hide Microsoft Word main window
  if testeditdm.WordApplication1.Visible = true then testeditdm.WordApplication1.Visible := false;
  //disable spellcheking
  testeditdm.WordApplication1.Options.CheckSpellingAsYouType:=False;
  testeditdm.WordApplication1.Options.CheckGrammarAsYouType:=False;
  //PARSE WORD DOCUMENT CONTENT
  if testeditdm.WordDocument1.Tables.Count < 1 then
  begin //ERROR              {1}
    MessageDlg('В документі відсутні таблиці. Імпорт неможливий', mtError	, [mbOK], 0);
    exit;
  end                        {/1}
  else
  begin                      {2}
    try                      {2`}
      for i := 1 to testeditdm.WordDocument1.Tables.Count do
      //process all tables in the document
      begin                    {3}
        //set progressbar
        mainform.SetProgressBar(0, testeditdm.WordDocument1.Tables.Item(i).Rows.Count, 1, 0);
        importedaskcount := 0; //ask cout fot each table calculated separetely
        for j := 1 to testeditdm.WordDocument1.Tables.Item(i).Rows.Count do
        //process all rows in each table
        begin                  {4}
          //get list marker text
          tmpstr := testeditdm.WordDocument1.Tables.Item(i).Cell(j,1).Range.ListFormat.ListString;
         if tmpstr <> '' then     //chek and skip empty cells or cels without lists
         begin                 {4'}
          if tmpstr[1] in ['0'..'9'] then //detect - ask or answer
          begin                {5} //add ask to current sciens
            //append record
            testeditdm.TestAskDataSet.Append;
            //prepare ask text - delete two spec characters
            textlen := length(testeditdm.WordDocument1.Tables.Item(i).Cell(j,1).Range.text);
            tmpstr := LeftStr(testeditdm.WordDocument1.Tables.Item(i).Cell(j,1).Range.formattedtext.text, textlen-2);
            //write ask text
            testeditdm.TestAskDataSet.FBN('ASKTEXT2').AsVariant := tmpstr;
            testeditdm.TestAskDataSet.FBN('FREQUENT').Asinteger := tmp_min_req; //minimal frequency {9-10-2011}
            //save changes
            testeditdm.TestAskDataSet.post;
            //steep progressbar
            mainform.ProgressBarStepIt(1);
            inc(importedaskcount);
          end                  {/5}
          else
          begin                {6} //add answer to current ask
            //move focus to the current question         {!!! must be present to work in GRID MODE!}
            testeditdm.TestAskDataSet.Last;            {14/10/2011}
            //append record
            testeditdm.AnswerDataSet.Append;
            //prepare answer text - delete two spec characters
            textlen := length(testeditdm.WordDocument1.Tables.Item(i).Cell(j,1).Range.text);
            tmpstr := LeftStr(testeditdm.WordDocument1.Tables.Item(i).Cell(j,1).Range.formattedtext.text, textlen-2);
            //setup right answer
            if Pos(RightAnswerChr, tmpstr) <> 0 then
            begin
              //delete right answer character
              tmpstr := StringReplace(tmpstr, RightAnswerChr, '',[rfReplaceAll, rfIgnoreCase]);
              //write right answer weight
              testeditdm.AnswerDataSet.FBN('WEIGHT').AsInteger := 1;
            end;
            //write answer text
            testeditdm.AnswerDataSet.FBN('ANSWERTEXT1').AsVariant := tmpstr;
            //save changes
            testeditdm.AnswerDataSet.post;
            //steep progressbar
            mainform.ProgressBarStepIt(1);
          end;                 {/6}
         end                  {/4'}//skip empty cells
         else inc(err_str_count);
        end;                   {/4}
        //set progress bar position
        mainform.ProgressBarPosition(0);
        MessageDlg('З таблиці № '+ inttostr(i) +'в документі успішно імпортовано '+ inttostr(importedaskcount) +' питань!', mtInformation , [mbOK], 0);
        if err_str_count <>0 then MessageDlg('Виявлено '+ inttostr(err_str_count) +' клітинок без багаторівневого списку або порожніх!'+#13#10+'Можливі помилки в структурі імпортованих питань!', mtWarning , [mbOK], 0);
      end;                     {/3}
    except
      MessageDlg('Помилка імпорту! Перевірте Ваш документ /роботу мережі /пакету MS Office', mtError	, [mbOK], 0);
      mainform.ProgressBarPosition(0);
      Disconnect_MSWord;
    end;                     {/2`}
  end;                       {/2}
  Disconnect_MSWord;
end;
{==================IMPORT ASKS FROM AIKEN FILE(MOODLE)===========================}
{---------------------main import proedure----------------------------}
procedure ImportFromMoodle(ImportFileName:OleVariant);
const
///  AnswTempl1 = 'ANSWER: ';
  AnswTempl1 = 'ANSWER:';
  LogFileName = 'IMP_AIKEN_ERROR';
  LogFileExt = '.txt';
var
  warning_count, right_answ_num, found_answ_count, tmp_answ_txt_pos, str_pos, str_total, total_questions, sct_start, sct_end, h, j, tmp_min_req : integer;
  ErrorFileName, minFreqStr, tmp_str : string;
  tmp_question, memstr, tmp1str, tmp_log : tstrings;
  ask_found_pos, chr_code_A: integer;
begin
  //init values
  memstr := TStringList.Create;
  tmp1str := TStringList.Create;
  tmp_question := TStringList.Create;
  chr_code_A := ord('A'); //ord('A')=65
  //prepare log list
  tmp_log := TStringList.Create;
  tmp_log.Clear;
  tmp_log.Append('В процесі імпорту винкли наступні проблеми/помилки:');
  warning_count := 0;
  //geting minimum frequen from ask list table
  try
    if testeditdm.TestAskDataSet.RecordCountFromSrv > 0 then
    begin
      PerformSearchMinimalFrequency(testeditdm.TestAskDataSet.FBN('SCIENS_ID').Asstring, minFreqStr);
      tmp_min_req := strtoint(minFreqStr);
    end
    else tmp_min_req := 0; //default
  except
    tmp_min_req := 0; //default
  end;
  //read file
  try
    tmp1str.LoadFromFile(ImportFileName);
    memstr.text := Utf8ToAnsi(tmp1str.Text);
  finally
    tmp1str.Free;
  end;
  //swich off autoupdate transaction
  testeditdm.AnswerDataSet.AutoCommit := false;
  //start procesing
  try
  total_questions := 0;
  str_pos :=0;
  str_total := memstr.Count-1;
  //set progressbar
  mainform.SetProgressBar(0, str_total, 1, 0);
  while str_pos < str_total do
  begin    {1}
    j :=str_pos;
    ask_found_pos := 0; //no more asks available
    //process until string 'ANSWER:' will be present
    repeat
      inc(j);
      ask_found_pos := pos(AnswTempl1, memstr.Strings[j]);
///    until (pos(AnswTempl1, memstr.Strings[j])<>0)or(j=str_total);
    until (ask_found_pos<>0)or(j=str_total);
///    if (j <= str_total)and(pos(AnswTempl1, memstr.Strings[j])<>0) then
    if (j <= str_total)and(ask_found_pos<>0) then
    //section with question ans answer found OK!
    begin   {2}
      inc(total_questions);//new question found!
      {----------------------}
      //copy section to the temporary location
      tmp_question.Clear;
      sct_start := str_pos;
      sct_end := j;
      for h := sct_start to sct_end do
      begin  {3}
        if memstr.Strings[h]<>'' then tmp_question.Append(memstr.Strings[h]);
      end;   {/3}
      //process question text
      testeditdm.TestAskDataSet.Append;//append record
      testeditdm.TestAskDataSet.FBN('ASKTEXT2').AsVariant := tmp_question.Strings[0];//write ask text}
      testeditdm.TestAskDataSet.FBN('FREQUENT').Asinteger := tmp_min_req; //minimal frequency {9-10-2011}
      testeditdm.TestAskDataSet.post;//save changes

      mainform.ProgressBarStepIt(1);//steep progressbar
      {listbox2.Items.Append(tmp_question.Strings[0]);}
      //process answer position
///      tmp_str := copy(tmp_question.Strings[tmp_question.Count-1],length(AnswTempl1)+1,1 );
///      right_answ_num := ord(tmp_str[1])-(ord('A')-1);//ord('A')=65
      h := length(AnswTempl1);
      tmp_str := tmp_question.Strings[tmp_question.Count-1];
      repeat
        inc(h);
      until tmp_str[h] <> ' ';
      right_answ_num := ord(tmp_str[h])-({ord('A')}chr_code_A-1);//ord('A')=65

      //chek right answer
      if right_answ_num < 1 then  //error - answer not avaliable in database!
      begin    {4}
        right_answ_num := 1; //apply default answer A!
        inc(warning_count);
        tmp_log.Append(testeditdm.TestAskDataSet.FBN('ID_ASK').AsString+'-відсутня правильна відповідь. Позначено відповідь А!')
      end;     {/4}
      //process answer text
      found_answ_count := 0; h := 1;
      //move focus to the current question         {!!! must be present to work in GRID MODE!}
      testeditdm.TestAskDataSet.Last;
      repeat   {5}
        tmp_answ_txt_pos := pos(chr({ord('A')}chr_code_A+found_answ_count)+'.', tmp_question.Strings[h]);
        if tmp_answ_txt_pos = 0 then tmp_answ_txt_pos := pos(chr({ord('A')}chr_code_A+found_answ_count)+')', tmp_question.Strings[h]);
        if tmp_answ_txt_pos > 0 then
        begin   {5}
          inc(found_answ_count);//new answer found!
          tmp_str := tmp_question.Strings[h];
          if (tmp_str[tmp_answ_txt_pos+2] = SingSpace) or (tmp_str[tmp_answ_txt_pos+2] = Tab) then
               tmp_str := copy(tmp_question.Strings[h],tmp_answ_txt_pos+2,length(tmp_question.Strings[h])-tmp_answ_txt_pos-1)
          else tmp_str := copy(tmp_question.Strings[h],tmp_answ_txt_pos+1,length(tmp_question.Strings[h])-tmp_answ_txt_pos-1);
          //save answer to database
          testeditdm.AnswerDataSet.Append;//append record
          testeditdm.AnswerDataSet.FBN('ANSWERTEXT1').AsVariant := tmp_str;//write answer text
          if h = right_answ_num then testeditdm.AnswerDataSet.FBN('WEIGHT').AsInteger := 1;//write right answer weight
          testeditdm.AnswerDataSet.post;//save changes
          mainform.ProgressBarStepIt(1);//steep progressbar
        end;     {/5}
        inc(h);
      until h=(tmp_question.Count-1);   {/5}

      if (found_answ_count> 0) and (right_answ_num > found_answ_count) then  //apply default answer -the last answer!
      begin         {6}
        inc(warning_count);
        tmp_log.Append(testeditdm.TestAskDataSet.FBN('ID_ASK').AsString+'-відсутня правильна відповідь. Позначено останню відповідь!');
        testeditdm.AnswerDataSet.Edit;
        testeditdm.AnswerDataSet.FBN('WEIGHT').AsInteger := 1;//write right answer weight
        testeditdm.AnswerDataSet.post;//save changes
      end;          {/6}
      //apply changes to db!
      if found_answ_count > 0 then
      begin
        if testeditdm.AnswerWriteTr.Active then testeditdm.AnswerWriteTr.Commit;
      end
      else
      begin
        if testeditdm.AnswerWriteTr.Active then testeditdm.AnswerWriteTr.Rollback;
        //move active ask to archive due erorr occured!
        testeditdm.TestAskDataSet.edit;//append record
        testeditdm.TestAskDataSet.FBN('ARCHIVE').AsInteger := yes;//
        testeditdm.TestAskDataSet.post;//save changes
        //add error reason
        inc(warning_count);
        tmp_log.Append(testeditdm.TestAskDataSet.FBN('ID_ASK').AsString+'-знайдено 0 відповідей. Питання поміщено в архів!');
       end;
    end;    {/2}
    str_pos := j+1;
  end;     {/1}

    MessageDlg('Успішно імпортовано '+ inttostr(total_questions) +' питань!', mtInformation , [mbOK], 0);
    //save logs                      {15/07/2011}
    ErrorFileName := extractfilepath(ImportFileName)+ LogFileName+LogFileExt;
    if warning_count > 0 then
    begin
      if MessageDlg('Виявлено '+ inttostr(warning_count) +' проблем/помилок! Показати?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      begin
        tmp_log.SaveToFile(ErrorFileName);
        ShellExecute(mainform.Handle, nil, pchar(ErrorFileName), nil, nil, SW_RESTORE);
      end;
    end;
    //set progress bar position
    mainform.ProgressBarPosition(0);
    //delete temporarily objects
    tmp_question.Free;
    memstr.free;
    tmp_log.Free;
    //swich on autoupdate transaction
    testeditdm.AnswerDataSet.AutoCommit := true;
  except
    MessageDlg('Помилка імпорту! Перевірте Ваш документ /роботу мережі.'+#13#10+'Iмпортовано '+ inttostr(total_questions) +' питань!', mtError	, [mbOK], 0);
    //set progress bar position
    mainform.ProgressBarPosition(0);
    //delete temporarily objects
    tmp_question.Free;
    memstr.free;
    tmp_log.Free;
    //swich on autoupdate transaction
    testeditdm.AnswerDataSet.AutoCommit := true;
  end;
end;
{==================IMPORT ASKS FROM MOODLE XML FILE===================}
{---------------------main import proedure----------------------------}
procedure ImportFromMoodleXLM(ImportFileName:OleVariant);
var
  i, j, total, tmp_min_req : integer;
  ModleQuiz : IXMLQuizType;
  minFreqStr, tmpstr : string;
begin
  //geting minimum frequen from ask list table
  try
    PerformSearchMinimalFrequency(testeditdm.TestAskDataSet.FBN('SCIENS_ID').Asstring, minFreqStr);
    tmp_min_req := strtoint(minFreqStr);
  except
    tmp_min_req := 0; //default
  end;
  //set parameters of the XML file
  testeditdm.XMLDocument1.Active := true;
  testeditdm.XMLDocument1.Encoding := 'UTF-8';  //set encoding;
  try
    testeditdm.XMLDocument1.LoadFromFile(ImportFileName);//load file
  except
    MessageDlg('Помилка відкриття файлу! Перевірте Ваш документ /роботу мережі', mtError	, [mbOK], 0);
    abort;
  end;
  //strat processing
  try
    //swich off autoupdate transaction
    testeditdm.AnswerDataSet.AutoCommit := false;
    //load batch from XML file
    ModleQuiz := Loadquiz(ImportFileName);
    //set progressbar
    mainform.SetProgressBar(0, ModleQuiz.Count, 1, 0);
    total := 0;
    for i := 0 to ModleQuiz.Count-1 do
    begin
      if ModleQuiz.Question[i].Type_ = qsttype_multichoice then
      begin
        inc(total);
        //process question text
        testeditdm.TestAskDataSet.Append;//append record
        testeditdm.TestAskDataSet.FBN('ASKTEXT2').AsVariant := ModleQuiz.Question[i].Questiontext.Text;//write ask text
        testeditdm.TestAskDataSet.FBN('FREQUENT').Asinteger := tmp_min_req; //minimal frequency {9-10-2011}        
        testeditdm.TestAskDataSet.post;//save changes
        mainform.ProgressBarStepIt(1);//steep progressbar
        //move focus to the current question         {!!! must be present to work in GRID MODE!}
        testeditdm.TestAskDataSet.Last;
        //process answers for current question
        for j := 0 to ModleQuiz.Question[i].Answer.Count-1 do
        begin
          //delete end paragraph character
          tmpstr := StringReplace(ModleQuiz.Question[i].Answer.Items[j].Text, EndParUtf, '',[rfReplaceAll, rfIgnoreCase]);
          testeditdm.AnswerDataSet.Append;//append record
          testeditdm.AnswerDataSet.FBN('ANSWERTEXT1').AsVariant := tmpstr;//write answer text
          if ModleQuiz.Question[i].Answer.Items[j].Fraction <> 0 then testeditdm.AnswerDataSet.FBN('WEIGHT').AsInteger := 1;//write right answer weight
          testeditdm.AnswerDataSet.post;//save changes
        end;
        //apply changes to db!
        testeditdm.AnswerWriteTr.Commit;
      end;
    end;
    MessageDlg('Успішно імпортовано '+ inttostr(total) +' питань!', mtInformation , [mbOK], 0);
    //set progress bar position
    mainform.ProgressBarPosition(0);
    //del tmp object
    testeditdm.XMLDocument1.Free;
    //normal-swich on autoupdate transaction
    testeditdm.AnswerDataSet.AutoCommit := true;
  except
    MessageDlg('Помилка при імпорті з файлу! Перевірте Ваш документ /роботу мережі', mtError	, [mbOK], 0);
    //set progress bar position
    mainform.ProgressBarPosition(0);
    //error-swich on autoupdate transaction
    testeditdm.AnswerDataSet.AutoCommit := true;
    //del tmp object
    testeditdm.XMLDocument1.Free;
    //normal-swich on autoupdate transaction
    testeditdm.AnswerDataSet.AutoCommit := true;
  end;
end;
{===========Export To Moodle================================}
{---------------main export procedure-----------------------}
procedure ExportToMoodle(ExportFileName:OleVariant);
const
  AnswTempl1 = 'ANSWER: ';
//  LogFileName = 'EXP_AIKEN_ERROR';
  LogFileNameHeader = 'ERROR_';
  LogFileExt = '.txt';
var
  tmp_question, tmp_log : tstrings;
  warning_count, char_title, ask_total, i : integer;
  ErrorFileName, answer_char, tmp_answ_str, tmp_str : string;
begin
  try
    //connect to dataset          {+2012-06-19}
    mainform.AskRxDBRichEdit.DataSource := testeditdm.TestAskDS;
    mainform.AskRxDBRichEdit.DataField := 'ASKTEXT2';
    //mainform.AskRxDBRichEdit.DataField := testeditdm.TestAskDataSetASKTEXT2.Value;
    mainform.AnswerRxDBRichEdit.DataSource := testeditDM.AnswerDS;
    mainform.AnswerRxDBRichEdit.DataField := 'ANSWERTEXT1';
    //mainform.AnswerRxDBRichEdit.DataField := testeditdm.AnswerDataSetANSWERTEXT1.Value;
    //init values
    tmp_question := TStringList.Create;
    tmp_question.Clear;
    tmp_log := TStringList.Create;
    tmp_log.Clear;
    tmp_log.Append('В процесі експорту виникли наступні проблеми/помилки:');
    //goto first question in list
    testeditdm.TestAskDataSet.First;
    ask_total := testeditdm.TestAskDataSet.RecordCountFromSrv;
    //set progressbar
    mainform.SetProgressBar(0, ask_total, 1, 0);
    i := 0;
    warning_count := 0;
    //proces each question
    while not(testeditdm.TestAskDataSet.Eof) do
    begin    {1}
      //skip archive questions
      if testeditdm.TestAskDataSet.FBN('ARCHIVE').AsInteger <> 1 then
      begin  {2}
        //skip questions without answers
        if testeditdm.AnswerDataSet.RecordCountFromSrv > 0 then
        begin {2-1}
          //insert ask text
          tmp_question.Append(AnsiToUTF8(mainform.AskRxDBRichEdit.Text));
          //goto first answer in list
          testeditdm.AnswerDataSet.First;
          //process all answers
          tmp_str := '';
          answer_char := '';
          char_title := 65; //chr(65)='A'

          while not(testeditdm.AnswerDataSet.Eof) do
          begin    {3}
            //insert answer text
            tmp_str := chr(char_title)+'. '+ mainform.AnswerRxDBRichEdit.Text;
            tmp_question.Append(AnsiToUtf8(tmp_str));
            //get right answer
            if testeditdm.AnswerDataSet.FBN('WEIGHT').AsInteger <> 0 then answer_char := chr(char_title);
            //goto the next answr
            testeditdm.AnswerDataSet.Next;
            inc(char_title);
          end;     {/3}
          //insert right answer;
          if answer_char = '' then  //error - answer not avaliable in database!
          begin    {4}
            answer_char := chr(char_title); //apply default answer A!
            inc(warning_count);
            tmp_log.Append(testeditdm.TestAskDataSet.FBN('ID_ASK').AsString+'-відсутня правильна відповідь. Позначено відповідь А!')
          end;     {/4}
          tmp_answ_str := AnswTempl1+ answer_char;
          tmp_question.Append(AnsiToUTF8(tmp_answ_str));
          //insert empty line between asks
          tmp_question.Append('');
          inc(i);
          mainform.ProgressBarStepIt(1);//steep progressbar
        end {/2-1}
        else
        begin
          inc(warning_count);
          tmp_log.Append(testeditdm.TestAskDataSet.FBN('ID_ASK').AsString+'-до питання відсутні відповіді. Пропущено.')
        end;
      end   {/2}
      else
      begin
        inc(warning_count);
        tmp_log.Append(testeditdm.TestAskDataSet.FBN('ID_ASK').AsString+'-питання має архівний статус. Пропущено.')
      end;
      testeditdm.TestAskDataSet.Next; //goto the next question
    end;     {/1}
    tmp_question.SaveToFile(ExportFileName);
    //create filename for the logging info
  //  if pos(LogFileExt, ExportFileName)>0 then ErrorFileName := extractfilepath(ExportFileName)+StringReplace(ExportFileName,LogFileExt,'',[rfIgnoreCase])+LogFileExt;
    ErrorFileName := extractfilepath(ExportFileName)+ LogFileNameHeader+extractfilename(ExportFileName);
    ///ErrorFileName := extractfilepath(ExportFileName)+ LogFileName+LogFileExt;
    MessageDlg('Успішно експортоавно '+ inttostr(i) +' питань!', mtInformation, [mbOK], 0);
    if warning_count > 0 then
    begin
      if MessageDlg('Виявлено '+ inttostr(warning_count) +' проблем/помилок! Показати?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      begin
        tmp_log.SaveToFile(ErrorFileName);
        ShellExecute(mainform.Handle, nil, pchar(ErrorFileName), nil, nil, SW_RESTORE);
      end;
    end;
    //set progress bar position
    mainform.ProgressBarPosition(0);
    //delete temporarily objects
    tmp_question.Free;
    tmp_log.Free;
    //disconnect from datatabse       {+2012-06-19}
    mainform.AskRxDBRichEdit.DataSource := nil;
    mainform.AnswerRxDBRichEdit.DataSource := nil;
  except
    MessageDlg('Помилка експорту! Перевірте Ваш документ /роботу мережі', mtError	, [mbOK], 0);
    //set progress bar position
    mainform.ProgressBarPosition(0);
    //delete temporarily objects
    tmp_question.Free;
    tmp_log.Free;
    //disconnect from datatabse       {+2012-06-19}
    mainform.AskRxDBRichEdit.DataSource := nil;
    mainform.AnswerRxDBRichEdit.DataSource := nil;
  end;

end;
{---------------main export procedure-2013!-quickly-------------------}
procedure ExportToMoodle2(ExportFileName:OleVariant; def_answ_count:integer; ShowArchive: boolean);
const
  AnswTempl1 = 'ANSWER: ';
  AnswErrDef = 'ANSWER: A';
//  LogFileName = 'EXP_AIKEN_ERROR';
  LogFileNameHeader = 'ERROR_';
  LogFileExt = '.txt';
var
  tmp_question, tmp_log : tstrings;
  answ_count, warning_count, ask_total, right_answ_pos : integer;
  ErrorFileName, tmp_answ_str, tmp_str, tmp_str1, tmp_askid_str : string;
  answ_found : boolean;
begin
  try
    //init values
    tmp_question := TStringList.Create;
    tmp_question.Clear;
    tmp_log := TStringList.Create;
    tmp_log.Clear;
    tmp_log.Append('В процесі експорту виникли наступні проблеми/помилки:');
    tmp_log.Append('(Код_питання - текст опису проблеми/помилки)');
    ask_total := 0;
    warning_count := 0;
    //get list of questions with answers by sciens_id
    testeditDM.PrepareCurrentSciensAsksList(testeditDM.SciensDataSet.fbn('ID_sciens').AsString, true, ShowArchive);  {2013-02-13}
    //goto first question in list
    testeditDM.RedyPaperMemTable.First;
    //set progressbar
    mainform.SetProgressBar(0, testeditDM.RedyPaperMemTable.RecordCount, 1, 0);
    while not(testeditDM.RedyPaperMemTable.eof) do //process all questions
    begin
      //check - is the current record is a qestion?
      if testeditDM.RedyPaperMemTable.FieldByName('RecPrefix').AsString <> '' then
      begin
        //start new question
        inc(ask_total);
        //insert ask text
        tmp_question.Append(AnsiToUTF8(mainform.RedyPaperTextDBRichEdit.Text));
        //prepare answes defaults
        tmp_str := '';
        answ_found := false;
        answ_count := 0;
        tmp_askid_str := testeditDM.RedyPaperMemTable.FieldByName('ASK_ID').AsString;
        //goto next record
        testeditDM.RedyPaperMemTable.Next;
        mainform.ProgressBarStepIt(1);//steep progressbar
      end
      else
      begin
        while (not(testeditDM.RedyPaperMemTable.eof))and(testeditDM.RedyPaperMemTable.FieldByName('RecPrefix2').AsString <> '') do
        //recognize each next record as question answer
        begin
          //check is this answer is right
          right_answ_pos := pos('*', testeditDM.RedyPaperMemTable.FieldByName('RecPrefix2').AsString);
          if right_answ_pos > 0 then
          begin
            //remove answer character '*' from answer title 'A/B/C/D ...' etc.
            tmp_str1 := testeditDM.RedyPaperMemTable.FieldByName('RecPrefix2').AsString;
            delete(tmp_str1, right_answ_pos, 1);
            //create answer string based on template
            tmp_answ_str := AnswTempl1 + copy(tmp_str1, 0, 1);
            //create answer texl line
            tmp_str := tmp_str1 + mainform.RedyPaperTextDBRichEdit.Text;
            answ_found := true;
          end
          else tmp_str := testeditDM.RedyPaperMemTable.FieldByName('RecPrefix2').AsString + mainform.RedyPaperTextDBRichEdit.Text;
          //insert answer text
          tmp_question.Append(AnsiToUtf8(tmp_str));
          //goto the next answer
          testeditDM.RedyPaperMemTable.Next;
          mainform.ProgressBarStepIt(1);//steep progressbar
          inc(answ_count);
        end;
        if answ_count > 0 then
        begin
          //insert answer definition text
          if answ_found = true then tmp_question.Append(AnsiToUTF8(tmp_answ_str)) //check - is rigth answer present
          else //error - right answer is not selected!
          begin
            tmp_question.Append(AnsiToUTF8(AnswErrDef));//set default answer
            inc(warning_count);
            tmp_log.Append(tmp_askid_str+'-відсутня правильна відповідь. Позначено відповідь А!');
          end;
          if answ_count <> def_answ_count then  //check - answer count
          begin
            inc(warning_count);
            tmp_log.Append(tmp_askid_str+'-кількість відповідей не рівна '+inttostr(def_answ_count));
          end;
        end
        else //error - answers are not avaliable in the database!
        begin
          inc(warning_count);
          tmp_log.Append(tmp_askid_str+'-відсутні відповіді!');
        end;
        //insert empty line between asks
        tmp_question.Append('');
      end;
    end;
    //save file
    tmp_question.SaveToFile(ExportFileName);
    MessageDlg('Успішно експортоавно '+ inttostr(ask_total) +' питань!', mtInformation, [mbOK], 0);
    //errors list
    if warning_count > 0 then
    begin
      if MessageDlg('Виявлено '+ inttostr(warning_count) +' проблем/помилок! Зберегти звіт і показати?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      begin
        //create filename for the logging info
        ErrorFileName := extractfilepath(ExportFileName)+ LogFileNameHeader+extractfilename(ExportFileName);
        //save and open error file
        tmp_log.SaveToFile(ErrorFileName);
        ShellExecute(mainform.Handle, nil, pchar(ErrorFileName), nil, nil, SW_RESTORE);
      end;
    end;
    //set progress bar position
    mainform.ProgressBarPosition(0);
    //delete temporarily objects
    tmp_question.Free;
    tmp_log.Free;
    testeditDM.RedyPaperMemTable.EmptyTable;
  except
    MessageDlg('Помилка експорту! Перевірте Ваш документ /роботу мережі', mtError	, [mbOK], 0);
    //set progress bar position
    mainform.ProgressBarPosition(0);
    //delete temporarily objects
    tmp_question.Free;
    tmp_log.Free;
    testeditDM.RedyPaperMemTable.EmptyTable;
  end;
end;

end.
