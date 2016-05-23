unit datamod;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, {CommonType,} ShellApi, ComCtrls,  
  WordXP, OleServer, ADODB, DateUtils, fib, frxClass, frxDBSet,
  frxFIBComponents, frxRich, frxDesgn, frxExportRTF, frxExportHTML,
  DBTables, kbmMemTable, ReportAbstract, WordReports,
  SSWordStream, CommonType, frxExportXML, frxExportText, frxExportTXT,
  frxCross, frxDCtrl, crypt, ShlObj, MyShlObj, xmldom, XMLIntf, msxmldom,
  XMLDoc ;

type
  TtesteditDM = class(TDataModule)
    TestDB: TpFIBDatabase;
    ReadTr: TpFIBTransaction;
    SciensDataSet: TpFIBDataSet;
    SciensDS: TDataSource;
    DepartDataSet: TpFIBDataSet;
    LibSciensDataSet: TpFIBDataSet;
    SciensWriteTr: TpFIBTransaction;
    DepartDS: TDataSource;
    LibSciensDS: TDataSource;
    SciensDataSetID_SCIENS: TFIBIntegerField;
    SciensDataSetSC_NAME: TFIBStringField;
    SciensDataSetSC_DESCR: TFIBStringField;
    SciensDataSetDEP_ID: TFIBIntegerField;
    SciensDataSetLIB_SC_ID: TFIBIntegerField;
    TestaskWriteTr: TpFIBTransaction;
    TestAskDataSet: TpFIBDataSet;
    TestAskDS: TDataSource;
    DepartDataSetDEPID: TFIBIntegerField;
    DepartDataSetDEPNAME: TFIBStringField;
    LibSciensDataSetID_SC_LIB: TFIBIntegerField;
    LibSciensDataSetLIB_SC_NAME: TFIBStringField;
    SciensDataSetID_LANG: TFIBIntegerField;
    LangsDataSet: TpFIBDataSet;
    LangDS: TDataSource;
    SciensDataSetlanng_search: TStringField;
    LangsDataSetID_LANG: TFIBIntegerField;
    LangsDataSetLANG_NAME: TFIBStringField;
    LangWtiteTr: TpFIBTransaction;
    LibSciensWriteTr: TpFIBTransaction;
    LibSciensDataSetDEPID: TFIBIntegerField;
    LibSciensDataSetLIB_SC_DESC: TFIBStringField;
    LibUserDataSet: TpFIBDataSet;
    LibUserDS: TDataSource;
    LibUserWriteTr: TpFIBTransaction;
    LibUserDataSetUSERID: TFIBIntegerField;
    LibUserDataSetUSERNAME: TFIBStringField;
    LibUserDataSetUSERPASS: TFIBStringField;
    LibUserDataSetLASTNAME: TFIBStringField;
    LibUserDataSetFIRSTNAME: TFIBStringField;
    LibUserDataSetMIDDLENAME: TFIBStringField;
    LibUserDataSetEMAIL: TFIBStringField;
    LibUserDataSetID_DEP: TFIBIntegerField;
    LibUserDataSetUSERTYPE_ID: TFIBIntegerField;
    LibUserTypeDataSet: TpFIBDataSet;
    LibUserTypeDS: TDataSource;
    LibUserDataSetusertype_search: TStringField;
    LibAskTypeDataSet: TpFIBDataSet;
    LibAskTypeDS: TDataSource;
    TestAskDataSetID_ASK: TFIBIntegerField;
    TestAskDataSetSCIENS_ID: TFIBIntegerField;
    TestAskDataSetASKTEXT: TFIBStringField;
    TestAskDataSetASKTEXT2: TFIBMemoField;
    TestAskDataSetASKIMAGE: TFIBBlobField;
    TestAskDataSetPOINTS: TFIBIntegerField;
    TestAskDataSetFREQUENT: TFIBIntegerField;
    TestAskDataSetID_ASKTYPE: TFIBIntegerField;
    TestAskDataSetANSWCOUNT: TFIBIntegerField;
    TestAskDataSetARCHIVE: TFIBIntegerField;
    AnswerWriteTr: TpFIBTransaction;
    AnswerDataSet: TpFIBDataSet;
    AnswerDS: TDataSource;
    TestAskDataSetask_tepe_search: TStringField;
    AnswerDataSetID_ANSWER: TFIBIntegerField;
    AnswerDataSetASK_ID: TFIBIntegerField;
    AnswerDataSetWEIGHT: TFIBIntegerField;
    AnswerDataSetANSWERTEXT1: TFIBMemoField;
    AnswerDataSetANSWERIMAG: TFIBBlobField;
    LUserpDataSet: TpFIBDataSet;
    LUserDS: TDataSource;
    LUserpDataSetUSERID: TFIBIntegerField;
    LUserpDataSetUSERNAME: TFIBStringField;
    LUserpDataSetUSERPASS: TFIBStringField;
    LUserpDataSetID_DEP: TFIBIntegerField;
    LUserpDataSetUSERTYPE_ID: TFIBIntegerField;
    SciensDataSetsc_name_search: TStringField;
    FulLIbSciendDataSet: TpFIBDataSet;
    FulLibSciensDS: TDataSource;
    SubjectDataSet: TpFIBDataSet;
    SubjectWriteTr: TpFIBTransaction;
    SubjectDS: TDataSource;
    SubjectDataSetID_SUBJ: TFIBIntegerField;
    SubjectDataSetSUBJNAME: TFIBStringField;
    SubjectDataSetFACULTY: TFIBStringField;
    SubjectDataSetSEMESTR: TFIBIntegerField;
    SubjectDataSetDEP_ID: TFIBIntegerField;
    SubjTestDataSet: TpFIBDataSet;
    SubjTestWriteTr: TpFIBTransaction;
    SubjTestDS: TDataSource;
    SubjTestDataSetID_SUBJTEST: TFIBIntegerField;
    SubjTestDataSetSUBJ_ID: TFIBIntegerField;
    SubjTestDataSetUSER_ID: TFIBIntegerField;
    SubjTestDataSetTESTNAME: TFIBStringField;
    SubjTestDataSetASKCOUNT: TFIBIntegerField;
    SubjTestDataSetTESTTIME: TFIBIntegerField;
    SubjTestDataSetTESTDESCR: TFIBStringField;
    SubjTestDataSetCREATEDATE: TFIBDateTimeField;
    TestModDataSet: TpFIBDataSet;
    TestModWriteTr: TpFIBTransaction;
    TestModDS: TDataSource;
    FullSciensDS: TDataSource;
    FullSciensDataSet: TpFIBDataSet;
    FullSciensDataSetID_SCIENS: TFIBIntegerField;
    FullSciensDataSetSC_NAME: TFIBStringField;
    FullSciensDataSetDEP_ID: TFIBIntegerField;
    FullSciensDataSetLIB_SC_ID: TFIBIntegerField;
    FullSciensDataSetID_LANG: TFIBIntegerField;
    OffPapersDataSet: TpFIBDataSet;
    OffPapersWriteTr: TpFIBTransaction;
    OffPapersDS: TDataSource;
    OffPapersDataSetID_OFFEXAM: TFIBIntegerField;
    OffPapersDataSetTESTONSUBJ_ID: TFIBIntegerField;
    OffPapersDataSetEXAM_DATE: TFIBDateTimeField;
    OffPapersDataSetVAR_NAME: TFIBStringField;
    SubjTestDataSetuser_name_search: TStringField;
    OffAsksDataSet: TpFIBDataSet;
    OffAsksWriteTr: TpFIBTransaction;
    OffAsksDS: TDataSource;
    OffAskTextDataSet: TpFIBDataSet;
    OffAskTextDS: TDataSource;
    OffAskTextDataSetID_ASK: TFIBIntegerField;
    OffAskTextDataSetSCIENS_ID: TFIBIntegerField;
    OffAskTextDataSetASKTEXT2: TFIBMemoField;
    OffAskTextDataSetASKIMAGE: TFIBBlobField;
    OffAskTextDataSetID_ASKTYPE: TFIBIntegerField;
    OffAskTextDataSetANSWCOUNT: TFIBIntegerField;
    OffAskTextDataSetARCHIVE: TFIBIntegerField;
    OffAsksDataSetID_OFFASKS: TFIBIntegerField;
    OffAsksDataSetOFFEXAM_ID: TFIBIntegerField;
    OffAsksDataSetASK_ID: TFIBIntegerField;
    OffAsksDataSetSCIENS_ID: TFIBIntegerField;
    RedyPaperMemTable: TkbmMemTable;
    RedyPaperMemTableIDRec: TIntegerField;
    RedyPaperMemTableRecPrefix: TStringField;
    RedyPaperMemTableRecData: TBlobField;
    RedyPaperDS: TDataSource;
    OffAnswTextDataSet: TpFIBDataSet;
    OffAnswDS: TDataSource;
    RedyPaperMemTableRecprefix2: TStringField;
    OffAnswTextDataSetID_ANSWER: TFIBIntegerField;
    OffAnswTextDataSetASK_ID: TFIBIntegerField;
    OffAnswTextDataSetWEIGHT: TFIBIntegerField;
    OffAnswTextDataSetANSWERTEXT1: TFIBMemoField;
    OffAnswTextDataSetANSWERIMAG: TFIBBlobField;
    RedyPaperMemTableASK_ID: TIntegerField;
    RedyPaperMemTableID_ASKLIST: TIntegerField;
    RedyPaperMemTableID_ASKLIST2: TIntegerField;
    WordApplication1: TWordApplication;
    WordDocument1: TWordDocument;
    AnsEtalonADOConnection: TADOConnection;
    AnsEtalonADOTable: TADOTable;
    AnsEtalonADOTableDSDesigner: TAutoIncField;
    AnsEtalonADOTableStorinka: TFloatField;
    AnsEtalonADOTableVariant: TFloatField;
    AnsEtalonADOTablep1: TFloatField;
    AnsEtalonADOTablep2: TFloatField;
    AnsEtalonADOTablep3: TFloatField;
    AnsEtalonADOTablep4: TFloatField;
    AnsEtalonADOTablep5: TFloatField;
    AnsEtalonADOTablep6: TFloatField;
    AnsEtalonADOTablep7: TFloatField;
    AnsEtalonADOTablep8: TFloatField;
    AnsEtalonADOTablep9: TFloatField;
    AnsEtalonADOTablep10: TFloatField;
    AnsEtalonADOTablep11: TFloatField;
    AnsEtalonADOTablep12: TFloatField;
    AnsEtalonADOTablep13: TFloatField;
    AnsEtalonADOTablep14: TFloatField;
    AnsEtalonADOTablep15: TFloatField;
    AnsEtalonADOTablep16: TFloatField;
    AnsEtalonADOTablep17: TFloatField;
    AnsEtalonADOTablep18: TFloatField;
    AnsEtalonADOTablep19: TFloatField;
    AnsEtalonADOTablep20: TFloatField;
    AnsEtalonADOTablep21: TFloatField;
    AnsEtalonADOTablep22: TFloatField;
    AnsEtalonADOTablep23: TFloatField;
    AnsEtalonADOTablep24: TFloatField;
    AnsEtalonADOTablep25: TFloatField;
    AnsEtalonADOTablep26: TFloatField;
    AnsEtalonADOTablep27: TFloatField;
    AnsEtalonADOTablep28: TFloatField;
    AnsEtalonADOTablep29: TFloatField;
    AnsEtalonADOTablep30: TFloatField;
    AnsEtalonADOTablep31: TFloatField;
    AnsEtalonADOTablep32: TFloatField;
    AnsEtalonADOTablep33: TFloatField;
    AnsEtalonADOTablep34: TFloatField;
    AnsEtalonADOTablep35: TFloatField;
    AnsEtalonADOTablep36: TFloatField;
    AnsEtalonADOTablep37: TFloatField;
    AnsEtalonADOTablep38: TFloatField;
    AnsEtalonADOTablep39: TFloatField;
    AnsEtalonADOTablep40: TFloatField;
    AnsEtalonADOTablep41: TFloatField;
    AnsEtalonADOTablep42: TFloatField;
    AnsEtalonADOTablep43: TFloatField;
    AnsEtalonADOTablep44: TFloatField;
    AnsEtalonADOTablep45: TFloatField;
    AnsEtalonADOTablep46: TFloatField;
    AnsEtalonADOTablep47: TFloatField;
    AnsEtalonADOTablep48: TFloatField;
    AnsEtalonADOTablep49: TFloatField;
    AnsEtalonADOTablep50: TFloatField;
    AnsEtalonADOTablep51: TFloatField;
    AnsEtalonADOTablep52: TFloatField;
    AnsEtalonADOTablep53: TFloatField;
    AnsEtalonADOTablep54: TFloatField;
    AnsEtalonADOTablep55: TFloatField;
    AnsEtalonADOTablep56: TFloatField;
    AnsEtalonADOTablep57: TFloatField;
    AnsEtalonADOTablep58: TFloatField;
    AnsEtalonADOTablep59: TFloatField;
    AnsEtalonADOTablep60: TFloatField;
    AnsEtalonADOTablep61: TFloatField;
    AnsEtalonADOTablep62: TFloatField;
    AnsEtalonADOTablep63: TFloatField;
    AnsEtalonADOTablep64: TFloatField;
    AnsEtalonADOTablep65: TFloatField;
    AnsEtalonADOTablep66: TFloatField;
    AnsEtalonADOTablep67: TFloatField;
    AnsEtalonADOTablep68: TFloatField;
    AnsEtalonADOTablep69: TFloatField;
    AnsEtalonADOTablep70: TFloatField;
    AnsEtalonADOTablep71: TFloatField;
    AnsEtalonADOTablep72: TFloatField;
    AnsEtalonADOTablep73: TFloatField;
    AnsEtalonADOTablep74: TFloatField;
    AnsEtalonADOTablep75: TFloatField;
    AnsEtalonADOTablep76: TFloatField;
    AnsEtalonADOTablep77: TFloatField;
    AnsEtalonADOTablep78: TFloatField;
    AnsEtalonADOTablep79: TFloatField;
    AnsEtalonADOTablep80: TFloatField;
    AnsEtalonADOTablep81: TFloatField;
    AnsEtalonADOTablep82: TFloatField;
    AnsEtalonADOTablep83: TFloatField;
    AnsEtalonADOTablep84: TFloatField;
    AnsEtalonADOTablep85: TFloatField;
    AnsEtalonADOTablep86: TFloatField;
    AnsEtalonADOTablep87: TFloatField;
    AnsEtalonADOTablep88: TFloatField;
    AnsEtalonADOTablep89: TFloatField;
    AnsEtalonADOTablep90: TFloatField;
    AnsEtalonADOTablep91: TFloatField;
    AnsEtalonADOTablep92: TFloatField;
    AnsEtalonADOTablep93: TFloatField;
    AnsEtalonADOTablep94: TFloatField;
    AnsEtalonADOTablep95: TFloatField;
    AnsEtalonADOTablep96: TFloatField;
    AnsEtalonADOTablep97: TFloatField;
    AnsEtalonADOTablep98: TFloatField;
    AnsEtalonADOTablep99: TFloatField;
    AnsEtalonADOTablep100: TFloatField;
    AnsEtalonADOTablep101: TFloatField;
    AnsEtalonADOTablep102: TFloatField;
    AnsEtalonADOTablep103: TFloatField;
    AnsEtalonADOTablep104: TFloatField;
    AnsEtalonADOTablep105: TFloatField;
    AnsEtalonADOTablep106: TFloatField;
    AnsEtalonADOTablep107: TFloatField;
    AnsEtalonADOTablep108: TFloatField;
    AnsEtalonADOTablep109: TFloatField;
    AnsEtalonADOTablep110: TFloatField;
    AnsEtalonADOTablep111: TFloatField;
    AnsEtalonADOTablep112: TFloatField;
    AnsEtalonADOTablep113: TFloatField;
    AnsEtalonADOTablep114: TFloatField;
    AnsEtalonADOTablep115: TFloatField;
    AnsEtalonADOTablep116: TFloatField;
    AnsEtalonADOTablep117: TFloatField;
    AnsEtalonADOTablep118: TFloatField;
    AnsEtalonADOTablep119: TFloatField;
    AnsEtalonADOTablep120: TFloatField;
    AnsEtalonADOTablep121: TFloatField;
    AnsEtalonADOTablep122: TFloatField;
    AnsEtalonADOTablep123: TFloatField;
    AnsEtalonADOTablep124: TFloatField;
    AnsEtalonADOTablep125: TFloatField;
    AnsEtalonADOTablep126: TFloatField;
    AnsEtalonADOTablep127: TFloatField;
    AnsEtalonADOTablep128: TFloatField;
    AnsEtalonADOTablep129: TFloatField;
    AnsEtalonADOTablep130: TFloatField;
    AnsEtalonADOTablep131: TFloatField;
    AnsEtalonADOTablep132: TFloatField;
    AnsEtalonADOTablep133: TFloatField;
    AnsEtalonADOTablep134: TFloatField;
    AnsEtalonADOTablep135: TFloatField;
    AnsEtalonADOTablep136: TFloatField;
    AnsEtalonADOTablep137: TFloatField;
    AnsEtalonADOTablep138: TFloatField;
    AnsEtalonADOTablep139: TFloatField;
    AnsEtalonADOTablep140: TFloatField;
    AnsEtalonADOTablep141: TFloatField;
    AnsEtalonADOTablep142: TFloatField;
    AnsEtalonADOTablep143: TFloatField;
    AnsEtalonADOTablep144: TFloatField;
    AnsEtalonADOTablep145: TFloatField;
    AnsEtalonADOTablep146: TFloatField;
    AnsEtalonADOTablep147: TFloatField;
    AnsEtalonADOTablep148: TFloatField;
    AnsEtalonADOTablep149: TFloatField;
    AnsEtalonADOTablep150: TFloatField;
    AnsEtalonADOTablep151: TFloatField;
    AnsEtalonADOTablep152: TFloatField;
    AnsEtalonADOTablep153: TFloatField;
    AnsEtalonADOTablep154: TFloatField;
    AnsEtalonADOTablep155: TFloatField;
    AnsEtalonADOTablep156: TFloatField;
    AnsEtalonADOTablep157: TFloatField;
    AnsEtalonADOTablep158: TFloatField;
    AnsEtalonADOTablep159: TFloatField;
    AnsEtalonADOTablep160: TFloatField;
    AnsEtalonADOTablep161: TFloatField;
    AnsEtalonADOTablep162: TFloatField;
    AnsEtalonADOTablep163: TFloatField;
    AnsEtalonADOTablep164: TFloatField;
    AnsEtalonADOTablep165: TFloatField;
    AnsEtalonADOTablep166: TFloatField;
    AnsEtalonADOTablep167: TFloatField;
    AnsEtalonADOTablep168: TFloatField;
    AnsEtalonDS: TDataSource;
    TmpFIBQuery: TpFIBQuery;
    ChangeAsksDataSet: TpFIBDataSet;
    ChangeAsksWriteTr: TpFIBTransaction;
    ChangeAsksDS: TDataSource;
    LangsDataSetPERSON_TIT: TFIBStringField;
    LangsDataSetSIGN_TIT: TFIBStringField;
    LangsDataSetGROUP_TIT: TFIBStringField;
    LangsDataSetSPEC_TIT: TFIBStringField;
    LangsDataSetSUBJ_TIT: TFIBStringField;
    LangsDataSetFACULTY_TIT: TFIBStringField;
    LangsDataSetSEMESTR_TIT: TFIBStringField;
    SubjTestDataSetLANG_ID: TFIBIntegerField;
    SubjTestDataSetlanng_search: TStringField;
    ChangeAsksDataSetID_ASK: TFIBIntegerField;
    ChangeAsksDataSetSCIENS_ID: TFIBIntegerField;
    ChangeAsksDataSetPOINTS: TFIBIntegerField;
    ChangeAsksDataSetFREQUENT: TFIBIntegerField;
    ChangeAsksDataSetID_ASKTYPE: TFIBIntegerField;
    ChangeAsksDataSetANSWCOUNT: TFIBIntegerField;
    ChangeAsksDataSetDATEUSE: TFIBDateTimeField;
    ChangeAsksDataSetARCHIVE: TFIBIntegerField;
    RedyPaperMemTableID_OFFEXAM: TIntegerField;
    FullSciensDataSetlanng_search: TStringField;
    FullDepDataSet: TpFIBDataSet;
    FIBIntegerField1: TFIBIntegerField;
    FIBStringField1: TFIBStringField;
    FullDepDS: TDataSource;
    FullSciensDataSet_dep_search: TStringField;
    FullSciensDataSetSC_DESCR: TFIBStringField;
    RedyPaperMemTableANSWER_ID: TIntegerField;
    FullSciensDataSet1: TpFIBDataSet;
    FIBIntegerField2: TFIBIntegerField;
    FIBStringField2: TFIBStringField;
    FIBStringField3: TFIBStringField;
    FIBIntegerField3: TFIBIntegerField;
    FIBIntegerField4: TFIBIntegerField;
    FIBIntegerField5: TFIBIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    FullSciensDS1: TDataSource;
    DepartWriteTr: TpFIBTransaction;
    AskListReport: TfrxReport;
    AskRepDesigner: TfrxDesigner;
    Rep_AskDS: TfrxDBDataset;
    RepFIBComponents: TfrxFIBComponents;
    AskListRTFExport: TfrxRTFExport;
    Rep_AnswerDS: TfrxDBDataset;
    Rep_SciensDS: TfrxDBDataset;
    AskListHTMLExport: TfrxHTMLExport;
    Rep_RichObject: TfrxRichObject;
    TmpQueryWriteTr: TpFIBTransaction;
    SciensDataSetSEMESTR: TFIBIntegerField;
    FullSciensDataSet1SEMESTR: TFIBIntegerField;
    OffAsksDataSetRIGHTORDER: TFIBStringField;
    FullSciensDataSetSEMESTR: TFIBIntegerField;
    SmartWordStream1: TSmartWordStream;
    WordReport1: TWordReport;
    SysLogDataSet: TpFIBDataSet;
    SysLogpWriteTr: TpFIBTransaction;
    SysLogDS: TDataSource;
    SysLogDataSetID_LOG: TFIBIntegerField;
    SysLogDataSetLOG_ACTION: TFIBStringField;
    SysLogDataSetLOG_SUBJECT: TFIBStringField;
    SysLogDataSetLOG_USERID: TFIBIntegerField;
    SysLogDataSetLOG_DATE: TFIBDateTimeField;
    SysLogDataSetuser_name_search: TStringField;
    SysLogDataSetLOG_USERDEPID: TFIBIntegerField;
    SysLogDataSetLOG_SUBJECTID2: TFIBIntegerField;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxXMLExport1: TfrxXMLExport;
    TestModDataSetID_TESTSECTION: TFIBIntegerField;
    TestModDataSetSECT_TITLE: TFIBStringField;
    TestModDataSetSECT_DESCR: TFIBStringField;
    TestModDataSetASKS_TOTAL: TFIBIntegerField;
    TestModDataSetSHOW: TFIBSmallIntField;
    TSect2ScDataSet: TpFIBDataSet;
    TSect2ScDataSetsc_name_search: TStringField;
    TSect2ScDataSetsc_semestr_search: TIntegerField;
    OffAsksDataSetTESTSECT_ID: TFIBIntegerField;
    TSect2ScWriteTr: TpFIBTransaction;
    TSect2SCDS: TDataSource;
    TSect2ScDataSetID_TESTSECT2SCIENS: TFIBIntegerField;
    TSect2ScDataSetTESTSECTION_ID: TFIBIntegerField;
    TSect2ScDataSetSCIENS_ID: TFIBIntegerField;
    TSect2ScDataSetASKCOUNT: TFIBIntegerField;
    TSect2ScDataSetRIGHTORDER: TFIBStringField;
    TestModDataSetSUBJTEST_ID: TFIBIntegerField;
    TestModDataSetORD_NUM: TFIBIntegerField;
    R_SubjDS: TfrxDBDataset;
    R_SubjTestDS: TfrxDBDataset;
    R_OffPaperDS: TfrxDBDataset;
    R_OffAsksDS: TfrxDBDataset;
    RedyPaperMemTableTestModTitle: TStringField;
    SubjTestDataSetperson_tit_srch: TStringField;
    SubjTestDataSetsign_tit_srch: TStringField;
    SubjTestDataSetgroup_tit_srch: TStringField;
    SubjTestDataSetspec_tit_srch: TStringField;
    SubjTestDataSetsubj_tit_srch: TStringField;
    SubjTestDataSetfaculty_tit_srch: TStringField;
    SubjTestDataSetsemestr_tit_srch: TStringField;
    RedyPaperMemTableWeight: TIntegerField;
    frxDBDataset1: TfrxDBDataset;
    frxDialogControls1: TfrxDialogControls;
    Rep_FullSciensDS: TfrxDBDataset;
    RedyPaperMemTableAsk_Number_on_Paper: TStringField;
    LibUserDataSetuserrole_search: TStringField;
    AnswerDataSetEXPLANATION: TFIBStringField;
    XMLDocument1: TXMLDocument;
    tmpFIBDataSet: TpFIBDataSet;
    tmpDS: TDataSource;
    FullSciensDataSet1ASK_COUNT: TFIBIntegerField;
    FullSciensDataSetASK_COUNT: TFIBIntegerField;
    LYearsDataSet: TpFIBDataSet;
    LYearsWriteTr: TpFIBTransaction;
    LYearsDS: TDataSource;
    LYearsDataSetID_EDUYEAR: TFIBIntegerField;
    LYearsDataSetEDUYEAR: TFIBStringField;
    SubjectDataSetEDUYEAR_ID: TFIBIntegerField;
    SubjectDataSeteduyear_serach: TStringField;
    SciensDataSetASK_COUNT: TFIBIntegerField;

    procedure DataModuleCreate(Sender: TObject);
    procedure DatabaseConnect;
    procedure DatabaseUserConnect;
    procedure DatabaseDisconnect;
    procedure DatabaseDisconnect2;
    procedure DataModuleDestroy(Sender: TObject);
    procedure CheckUser(var status:boolean);
    procedure ExistUser(tmpUser, tmppass:string; var result:boolean);
    procedure SetUserTypeFilter;

    procedure OpenFullSciensDataSet;
    procedure CloseFullSciensDataSet;

    procedure DepartDataSetAfterScroll(DataSet: TDataSet);

    procedure LibSciensDataSetAfterPost(DataSet: TDataSet);
    procedure LibSciensDataSetAfterDelete(DataSet: TDataSet);
    procedure SubjTestDataSetNewRecord(DataSet: TDataSet);

    procedure TestModDataSetAfterScroll(DataSet: TDataSet);

    procedure CheckCreateNewAsksList(var result:boolean);
    procedure CreateNewAsksList;

    procedure ConnectEtalonDB(status:boolean);
    procedure PrepareEtalonRecords(RecCount:integer; var ListRecID:array of integer);
    procedure SetEtalonFilter(RecID : integer);
    function ChekEtalonTable(VarID : integer):boolean;

    procedure RedyPaperMemTableBeforePost(DataSet: TDataSet);
    procedure RedyPaperMemTableAddAskText(tmpcurrask : integer);
    procedure RedyPaperMemTableAddAskImage;
    procedure RedyPaperMemTableAddAnswerText(tmpcurrask:integer; tmpprefix:string);
    procedure RedyPaperMemTableAddAnswerImage;
    procedure PrepareCurrentModule(ShowAnswers:boolean);

    procedure TestDBLostConnect(Database: TFIBDatabase; E: EFIBError;
      var Actions: TOnLostConnectActions);
    procedure TestDBErrorRestoreConnect(Database: TFIBDatabase;
      E: EFIBError; var Actions: TOnLostConnectActions);

    procedure GetCurrentTest(var tmpDepID:integer; var tmpSubjID:integer; var tmpTestID:integer; var tmpPaperID:integer; var tmpTestModID:integer);
    procedure SetCurrentTest(tmpSubjID, tmpTestID, tmpParerID, tmpTestModID:integer);
    procedure SetCurrentModule(tmpSciensID, tmpAskID, tmpAnswerID: integer);
    procedure AskDataToStream(var tmpTxtStream:tmemorystream; var tmpImgStream:tmemorystream; var ImgExist:boolean);
    procedure AnswerDataToStream(var tmpTxtStream:tmemorystream; var tmpImgStream:tmemorystream; var ImgExist:boolean);    
    procedure StreamToPreview(tmpTxtStream, tmpImgStream:tmemorystream; ImgExist:boolean);
    procedure SearchDepartment(var EditAskID: integer; var EditAnswerID:integer; var EditSciensID:integer; var SearchDepID:integer);
    function LocateAsk(EditAskID, EditAnswerID, EditSciensID:integer) : boolean;
    procedure SciensDataSetAfterPost(DataSet: TDataSet);

    procedure CheckTestAskDataSet;
    procedure TestAskDataSetAfterOpen(DataSet: TDataSet);
    procedure TestAskDataSetAfterPost(DataSet: TDataSet);
    procedure TestAskDataSetAfterDelete(DataSet: TDataSet);

    procedure CheckAnswerDataSet;
    procedure AnswerDataSetAfterOpen(DataSet: TDataSet);
    procedure AnswerDataSetAfterPost(DataSet: TDataSet);    
    procedure AnswerDataSetAfterDelete(DataSet: TDataSet);

    procedure CheckSubjectDataSet;
    procedure SubjectDataSetAfterOpen(DataSet: TDataSet);
    procedure SubjectDataSetAfterPost(DataSet: TDataSet);
    procedure SubjectDataSetAfterDelete(DataSet: TDataSet);

    procedure CheckSubjTestDataSet;
    procedure SubjTestDataSetAfterOpen(DataSet: TDataSet);
    procedure SubjTestDataSetAfterPost(DataSet: TDataSet);
    procedure SubjTestDataSetAfterDelete(DataSet: TDataSet);

    procedure ChekTestModDataSet;
    procedure TestModDataSetAfterOpen(DataSet: TDataSet);
    procedure TestModDataSetAfterDelete(DataSet: TDataSet);
    procedure TestModDataSetAfterPost(DataSet: TDataSet);

    procedure ChekOffPapersDataSet;
    procedure OffPapersDataSetAfterOpen(DataSet: TDataSet);    
    procedure OffPapersDataSetAfterPost(DataSet: TDataSet);
    procedure OffPapersDataSetAfterDelete(DataSet: TDataSet);

    procedure CheckSciensDataSet;    
    procedure SciensDataSetAfterOpen(DataSet: TDataSet);
    procedure SciensDataSetAfterDelete(DataSet: TDataSet);
    procedure AnswerDataSetBeforePost(DataSet: TDataSet);

    procedure CloneTestPerform;
    procedure SciensDataSetAfterScroll(DataSet: TDataSet);

    function CheckAskUsing(CheckAskID:integer) : boolean;
    procedure CopyAskData(OldAskID: integer; ToArchive: boolean; var NewAskID : integer);
    procedure CopyAnswerData(SourceAskID, DestAskID : integer);    
    procedure MoveAsk(MoveAskList:array of integer; DestSciens:integer; TotalMode:boolean);
    procedure OffPapersDataSetAfterScroll(DataSet: TDataSet);

    procedure PrintToRTF(filename:string);
    procedure WordReport1ReportError(Sender: TObject; mError,
      nError: Cardinal; sError: String);
    procedure WordReport1EndReport(Sender: TObject);
    procedure WordReport1RequestByNum(Sender: TObject;
      sSectionName: String; var iP: Integer; var sStr: String);
    procedure WordReport1MoveTop(Sender: TObject; var bCheck: Boolean);
    procedure WordReport1DataRequest(Sender: TObject; SectionName: String;
      SectionNum: Cardinal; var sData: Variant; var bCheck: Boolean; OutR,
      OutC, InR, InC: Cardinal);
    procedure WordReport1MoveNext(Sender: TObject; var bCheck: Boolean);
    procedure WordReport1SectionComplit(Sender: TObject;
      SectionName: String; SectionNum: Cardinal);
    procedure WordReport1SectionPrepare(Sender: TObject);

    procedure write_log(log_action, log_subject: string; log_userid, log_userdepid, log_subjectid :integer);
    procedure OffPapersDataSetBeforeDelete(DataSet: TDataSet);
    procedure SubjectDataSetBeforeDelete(DataSet: TDataSet);
    procedure SubjTestDataSetBeforeDelete(DataSet: TDataSet);
    procedure TestAskDataSetBeforeScroll(DataSet: TDataSet);
    procedure TestModDataSetBeforePost(DataSet: TDataSet);

    procedure ClonePaperPerform;

    procedure SetOldAskToArchive(ExAsk_ID, ExSciens_ID:integer);
    procedure OffPapersDataSetAfterRefresh(DataSet: TDataSet);
    procedure SubjTestDataSetEndScroll(DataSet: TDataSet);
    procedure LibUserDataSetAfterScroll(DataSet: TDataSet);

    procedure UpdateAskCountPerSciens(tmpsciensid:integer);

    procedure InvalidAskSearch(AskSearchID:integer; var SrcSciensId:integer; var SearchRes:boolean);
    procedure SearchAskWithoutCorrectAnswer( SrcSciensId:string; var FoundRes:Variant; var SearchRes:boolean);
    procedure SearchAskWithIncorrectAnswersCount(SrcSciensId:string; CorrAnswCount:string; var FoundRes:Variant; var SearchRes:boolean);

    procedure PrintQuestionAnswersToHTML(filename:string);
    procedure PrepareCurrentSciensAsksList(strSciensID:string; ShowAnswers:boolean; ShowArchived:boolean);
    procedure FullSciensDataSet1AfterScroll(DataSet: TDataSet);
    procedure FullSciensDataSet1AfterOpen(DataSet: TDataSet);
    procedure FullSciensDataSet1AfterFetchRecord(FromQuery: TFIBQuery;
      RecordNumber: Integer; var StopFetching: Boolean);

  private
    { Private declarations }
    ASKS, ANSWERS : integer;
  public
    { Public declarations }
    curpaperrec, currsciens_ID : integer;
  end;

var
  testeditDM: TtesteditDM;

implementation

uses Forms, main, settings, mykernel, answedit, basevar, Dialogs, login, Variants, Controls, pFIBProps,
  advtestmodedit;
{$R *.dfm}
{====================================================}
procedure TtesteditDM.DataModuleCreate(Sender: TObject);
begin
  //prepare memory table for preview
  RedyPaperMemTable.open;
  RedyPaperMemTable.EmptyTable;
end;
{====================================================}
procedure TtesteditDM.DataModuleDestroy(Sender: TObject);
begin
  //close database
  TestDB.Close;
  //close memory table
  RedyPaperMemTable.Close;
end;
{===============WORKING WITH DATABASE FILE===================}
{----------normal database connect---------------------------}
procedure TtesteditDM.DatabaseConnect;
begin
  {make database connection}
  TestDB.DBName := basevar.Settings.CurrDBFileName;
  TestDB.DBParams.Clear;
  TestDB.DBParams.Add('user_name='+dbusername);
  TestDB.DBParams.Add('password='+dbuserpass);

  TestDB.DBParams.Add('sql_role_name='+'testadm'); {!28/02/2010!}

  TestDB.DBParams.Add('lc_ctype='+locatecode);
  try
    TestDB.Connected := true;
    basevar.Settings.DBConnected := true;
  except
    on Exception do
    begin
      TestDB.Connected := false;
      MessageDlg('Не знайдено файл бази даних'+#13+'Налаштуйте підключення (Сервіс-Налаштування)!', mtError, [mbOk], 0);
      basevar.Settings.DBConnected := false;
    end;
  end;
{  if basevar.Settings.DBConnected = true then
  begin
    //open independent datasets
    FullDepDataSet.Open;

    FulLIbSciendDataSet.Open;

    FullSciensDataSet.Open;
    FullSciensDataSet.First;

    LibUserTypeDataSet.Open;
    LibAskTypeDataSet.Open;
    LangsDataSet.Open;

    ChangeAsksDataSet.Open;

    SysLogDataSet.Open;
    //open only master dataset. ALL DETAIL DATA SET open automaticaly!
    DepartDataSet.Open;
    DepartDataSet.First;
  end;}
end;

procedure TtesteditDM.DatabaseUserConnect;
var
  tmpres : boolean;
  tmppath : string;
begin
  //make database user connection
  TestDB.DBName := basevar.Settings.CurrDBFileName;
  TestDB.DBParams.Clear;
  TestDB.DBParams.Add('user_name='+ basevar.Settings.LUserName);
  TestDB.DBParams.Add('password='+ basevar.Settings.LUserPass);
  TestDB.DBParams.Add('sql_role_name='+basevar.Settings.LUserSQLRole);
  TestDB.DBParams.Add('lc_ctype='+locatecode);
  //set shema cashe options
  tmppath := GetSpecialPath(CSIDL_APPDATA)+ '\' + AppDirName;
  if not DirectoryExists(tmppath)then CreateDir(tmppath); //check folder exist
  TestDB.CacheSchemaOptions.LocalCacheFile := tmppath + '\' + DBShemaCasheFilename;
  //try to connect!
  try
    TestDB.Connected := true;
    basevar.Settings.DBConnected := true;
  except
    on Exception do
    begin
      MessageDlg('Неправильний логін чи пароль. Або не знайдено файл бази даних'+#13+'Перевірте підключення (Сервіс-Налаштування) та роботу мережі!', mtError, [mbOk], 0);
      basevar.Settings.DBConnected := false;
      {+2010-05-25}
      basevar.Settings.CurrDBTitle := 'жодна база даних не підключена';
    end;
  end;
  if TestDB.Connected = true then
  begin
    try
      SciensDataSet.WaitEndMasterInterval := 1000;
      TestAskDataSet.WaitEndMasterInterval := 500;
      //open independent datasets
      FullDepDataSet.Open;

      FulLIbSciendDataSet.Open;

{      FullSciensDataSet.Open;}  {-14/04/2010}
//      FullSciensDataSet.First;

      LibUserTypeDataSet.Open;
      LibAskTypeDataSet.Open;
      LangsDataSet.Open;
      LYearsDataSet.Open;
{      ChangeAsksDataSet.Open; }{-14/04/2010}

      SysLogDataSet.Open;
      //open only master dataset. ALL DETAIL DATA SET open automaticaly!
      DepartDataSet.Open;
//      DepartDataSet.First;
      CheckUser(tmpres);//need to receiv user department data
      //display active database name {+2010-05-25}
      basevar.Settings.CurrDBTitle := SettingsEditForm.DatabasesListEditor.Keys[basevar.Settings.CurrDBServerID]
    except
      on Exception do
      begin
        TestDB.Connected := false;
        MessageDlg('Ви не можете зайти як: '+ basevar.settings.SQLRoleTitle.Strings[basevar.settings.LUserTypeID] , mtError, [mbOk], 0);
        basevar.Settings.DBConnected := false;
        Application.Terminate;
      end;
    end;
  end;
end;
{--------------normal disconnect from database----------------------}
procedure TtesteditDM.DatabaseDisconnect;
begin
  if TestDB.Connected = true then
  begin
    MessageDlg('Активна база даних буде відключена!', mtWarning, [mbOk], 0);
    TestDB.Close;
    basevar.Settings.DBConnected := false;
  end;
end;

procedure TtesteditDM.DatabaseDisconnect2;
begin
  if TestDB.Connected = true then
  begin
    TestDB.Close;
    basevar.Settings.DBConnected := false;
  end;
end;
{-------emergency reconnect to database after disconnect----------}
procedure TtesteditDM.TestDBLostConnect(Database: TFIBDatabase;
  E: EFIBError; var Actions: TOnLostConnectActions);
begin
  TpFIBDatabase(Database).RestoreConnect(Self);
end;
{---------------exit, when reconnect imposible-----------------}
procedure TtesteditDM.TestDBErrorRestoreConnect(Database: TFIBDatabase;
  E: EFIBError; var Actions: TOnLostConnectActions);
begin
  Actions := laTerminateApp;
  MessageDlg('Втрачено зв"язок з сервером бази даних! Перевірте роботу мережі!', mtError, [mbOk], 0);
end;
{=============WORKING WITH USERS===============================}
{-----chek login and password for logging to application-------}
procedure TtesteditDM.CheckUser(var status:boolean);
begin
  status := false;//not loged!
  //set params to dataset
  LUserpDataSet.ParamByName('FINDUSERNAME').AsString := basevar.Settings.LUserName;
//  LUserpDataSet.ParamByName('FINDUSERPASS').AsString := passkey.HideStr(basevar.Settings.LUserPass);
  //prepare and open datasets
  LUserpDataSet.Prepare;
  LUserpDataSet.Open;
  LUserpDataSet.FetchAll;
  if LUserpDataSet.RecordCount < 1 then
  begin
    MessageDlg('Неправильне ім"я або пароль!', mtError, [mbOk], 0);
    Application.Terminate;
  end
  else
  begin
    status := true;
    //store user login data
    basevar.Settings.LUserID := LUserpDataSet.FieldByName('USERID').AsInteger;
    basevar.Settings.LUserDepID := LUserpDataSet.FieldByName('ID_DEP').AsInteger;
///    basevar.Settings.LUserTypeID := LUserpDataSet.FieldByName('USERTYPE_ID').AsInteger;
    //set department dataset to current department;
///    DepartDataSet.Locate('DEPID',VarArrayOf([basevar.Settings.LUserDepID]),[]);
  end;
  LUserpDataSet.Close;
end;
{-----------chek login and password for new user creation-----------}
procedure TtesteditDM.ExistUser(tmpUser, tmppass:string; var result:boolean);
begin
  //test username and password
  result := false; //default - user not find!
  //set params to dataset
  LUserpDataSet.ParamByName('FINDUSERNAME').AsString := tmpUser;
//  LUserpDataSet.ParamByName('FINDUSERPASS').AsString := passkey.HideStr(tmppass);
  //prepare and open datasets
  LUserpDataSet.Prepare;
  LUserpDataSet.Open;
  LUserpDataSet.FetchAll;
  if LUserpDataSet.RecordCount >= 1 then result := true; //user finded!
  LUserpDataSet.Close;
end;
{------hide test_center user types wrom department users-------}
procedure TtesteditDM.SetUserTypeFilter;
//used only for department admins
begin
  //not show users with type "test center admin" and "test center operator"
  LibUserDataSet.Filtered := false;
///  LibUserDataSet.Filter := 'USERTYPE_ID>'+inttostr(test_operator);
  LibUserDataSet.Filtered := true;
  //not show user type "test center admin" and "test center operator"
  LibUserTypeDataSet.Filtered := false;
///  LibUserTypeDataSet.Filter := 'ID_USERTYPE>'+inttostr(test_operator);
  LibUserTypeDataSet.Filtered := true;
end;
{===================WORKING WITH FULL LIST OF THE SCIENS============}
{--------open full list of the sciens for all departments-----------}
procedure TtesteditDM.OpenFullSciensDataSet;
var
  mytmpSQL : tstrings;
begin
  //set cursor face
  MainForm.cursor := crSQLWait;
  //define SQL conditions
  mytmpSQL := tstringlist.Create;   {+20/12/2009}
///  if (Settings.LUserTypeID = dep_admin) or (Settings.LUserTypeID = dep_teacher) then
  if (basevar.Settings.LUserSQLRole = dep_admin) or (basevar.Settings.LUserSQLRole = dep_teacher) then
  begin //limited to the current department    {changed 22/02/2011}
    mytmpSQL.Append('select id_sciens, sc_name, sc_descr, dep_id, lib_sc_id, id_lang, semestr,');
    mytmpSQL.Append(' ask_count from sciens');
    mytmpSQL.Append(' where dep_id = '+ inttostr(basevar.Settings.LUserDepID));
    mytmpSQL.Append(' order by sc_name, sc_descr, id_lang, semestr, lib_sc_id');
//    mytmpSQL.Append('select sciens.id_sciens, sciens.sc_name, sciens.sc_descr, sciens.dep_id, sciens.lib_sc_id, sciens.id_lang, sciens.semestr,');
//    mytmpSQL.Append(' count( testasks.id_ask ) count_of_id_ask from testasks');
//    mytmpSQL.Append(' inner join sciens on (testasks.sciens_id = sciens.id_sciens)');
//    mytmpSQL.Append(' where sciens.dep_id = '+ inttostr(basevar.Settings.LUserDepID));
//    mytmpSQL.Append(' group by sciens.id_sciens, sciens.sc_name, sciens.sc_descr, sciens.dep_id, sciens.lib_sc_id, sciens.id_lang, sciens.semestr');
  end
  else
  begin  //unlimited                         {changed 22/02/2011}
    mytmpSQL.Append('select id_sciens, sc_name, sc_descr, dep_id, lib_sc_id, id_lang, semestr,');
    mytmpSQL.Append(' ask_count from sciens');
    mytmpSQL.Append(' order by dep_id, sc_name, sc_descr, id_lang, semestr, lib_sc_id');
//    mytmpSQL.Append('select sciens.id_sciens, sciens.sc_name, sciens.sc_descr, sciens.dep_id, sciens.lib_sc_id, sciens.id_lang, sciens.semestr,');
//    mytmpSQL.Append(' count( testasks.id_ask ) count_of_id_ask from testasks');
//    mytmpSQL.Append(' inner join sciens on (testasks.sciens_id = sciens.id_sciens)');
//    mytmpSQL.Append(' group by sciens.id_sciens, sciens.sc_name, sciens.sc_descr, sciens.dep_id, sciens.lib_sc_id, sciens.id_lang, sciens.semestr');
  end;
  FullSciensDataSet1.SelectSQL := mytmpSQL; {+20/12/2009}
  //open dataset
  FullSciensDataSet1.Open;   {+17-06-2007}
  FullSciensDataSet1.First;
  //set cursor face
  MainForm.cursor := crDefault;
  //delete tmp data
  mytmpSQL.Free;
end;
{-----------close full list of the sciens for all departmnets-------}
procedure TtesteditDM.CloseFullSciensDataSet;
begin
  FullSciensDataSet1.Close;
end;
{===================WORKING WITH LOOKUP LISTS=======================}
{------set lookup list of sciens types for current department-------}
procedure TtesteditDM.DepartDataSetAfterScroll(DataSet: TDataSet);
begin
  FulLIbSciendDataSet.Filtered := false;
  FulLIbSciendDataSet.Filter := 'DEPID='+inttostr(DepartDataSet.FieldByName('DEPID').AsInteger);
  FulLIbSciendDataSet.Filtered := true;
//  SciensDataSetsc_name_search.RefreshLookupList;
end;
{-------refresh lookup list for siens library-----------}
procedure TtesteditDM.LibSciensDataSetAfterPost(DataSet: TDataSet);
begin
  FulLIbSciendDataSet.Close;
  FulLIbSciendDataSet.Prepare;
  FulLIbSciendDataSet.Open;
  FulLIbSciendDataSet.FetchAll;
  FulLIbSciendDataSet.Filtered := false;
  FulLIbSciendDataSet.Filter := 'DEPID='+inttostr(DepartDataSet.FieldByName('DEPID').AsInteger);
  FulLIbSciendDataSet.Filtered := true;
end;
{-------refresh lookup list for siens library-----------}
procedure TtesteditDM.LibSciensDataSetAfterDelete(DataSet: TDataSet);
begin
  FulLIbSciendDataSet.Close;
  FulLIbSciendDataSet.Prepare;
  FulLIbSciendDataSet.Open;
  FulLIbSciendDataSet.FetchAll;
  FulLIbSciendDataSet.Filtered := false;
  FulLIbSciendDataSet.Filter := 'DEPID='+inttostr(DepartDataSet.FieldByName('DEPID').AsInteger);
  FulLIbSciendDataSet.Filtered := true;
end;
{========================================================}
{--------------store UserID for the new test-------------}
procedure TtesteditDM.SubjTestDataSetNewRecord(DataSet: TDataSet);
begin
  SubjTestDataSet.FieldByName('USER_ID').AsInteger := basevar.Settings.LUserID;
end;
{========================================================}
{========================================================}
{--------insert record in the offline ask table----------}
procedure TtesteditDM.CreateNewAsksList;
begin
  OffPapersDataSet.Append;
  //write default data
  OffPapersDataSet.FieldByName('VAR_NAME').AsString := OffLineVarDefName;
  OffPapersDataSet.FieldByName('EXAM_DATE').AsDateTime := today;
  OffPapersDataSet.post;
end;
{========WORKING WITH PREVIEW LIST(MEMORY TABLE)============}
{----------show asks only for the selected sciens-----------}
procedure TtesteditDM.TestModDataSetAfterScroll(DataSet: TDataSet);
begin
  if (not TestModDataSet.FieldByName('ID_TESTSECTION').IsNull)and(not RedyPaperMemTable.IsEmpty) then
  begin
    RedyPaperMemTable.Filtered := false;
    RedyPaperMemTable.Filter := 'ID_ASKLIST='+TestModDataSet.FieldByName('ID_TESTSECTION').AsString;
    RedyPaperMemTable.Filtered := true;
  end;
end;
{--------show asks only for the selected paper-----------}
procedure TtesteditDM.OffPapersDataSetAfterScroll(DataSet: TDataSet);
begin
  if not OffPapersDataSet.FieldByName('ID_OFFEXAM').IsNull then
  begin
    RedyPaperMemTable.Filtered := false;
    RedyPaperMemTable.Filter := 'ID_OFFEXAM='+OffPapersDataSet.FieldByName('ID_OFFEXAM').AsString;
    RedyPaperMemTable.Filtered := true;
    //check editing actions state
    if RedyPaperMemTable.RecordCount > 0 then
    begin //enable controls
      mainform.ExchangeAsk.Enabled := true;
      mainform.EditSelectedObj.Enabled := true;
      mainform.ExchangeAnswOrder.Enabled := true;
      mainform.PaperAddAnswerCmd.Enabled := true;
      mainform.PaperDelAnswerCmd.Enabled := true;
//      mainform.ExpOffModuleWord.Enabled := true;
    end
    else
    begin //disable controls
      mainform.ExchangeAsk.Enabled := false;
      mainform.EditSelectedObj.Enabled := false;
      mainform.ExchangeAnswOrder.Enabled := false;
      mainform.PaperAddAnswerCmd.Enabled := false;
      mainform.PaperDelAnswerCmd.Enabled := false;
//      mainform.ExpOffModuleWord.Enabled := false;
    end;
  end;
end;
{-----store addition invisible data to memory table------}
procedure TtesteditDM.RedyPaperMemTableBeforePost(DataSet: TDataSet);
begin
  inc(curpaperrec);
  //write current record number (primary key)
  RedyPaperMemTable.FieldByName('IDRec').AsInteger := curpaperrec;
  //write current sciens ID (from global modules list)
  RedyPaperMemTable.FieldByName('SCIENS_ID').AsInteger := TSect2ScDataSet.FieldByName('SCIENS_ID').AsInteger;
  RedyPaperMemTable.FieldByName('ID_ASKLIST').AsInteger := TestModDataSet.FieldByName('ID_TESTSECTION').AsInteger;
  RedyPaperMemTable.FieldByName('TestModTitle').AsString := TestModDataSet.FieldByName('SECT_TITLE').AsString;
  RedyPaperMemTable.FieldByName('ID_OFFEXAM').AsInteger := OffPapersDataSet.FieldByName('ID_OFFEXAM').AsInteger;
end;
{---------store ask text into the memory table------------}
procedure TtesteditDM.RedyPaperMemTableAddAskText(tmpcurrask : integer);
begin
  //insert ask record in memory table
  RedyPaperMemTable.Append;
  RedyPaperMemTable.FieldByName('RecPrefix').AsString := inttostr(tmpcurrask)+'.';
  RedyPaperMemTable.FieldByName('RecData').AsVariant := OffAskTextDataSet.FieldByName('ASKTEXT2').AsVariant;
  RedyPaperMemTable.FieldByName('ASK_ID').AsInteger := OffAsksDataSet.FieldByName('ASK_ID').AsInteger;
  // {+2/01/2010}
  RedyPaperMemTable.FieldByName('Ask_Num_on_Paper').AsString := inttostr(tmpcurrask)+'.';
  RedyPaperMemTable.Post;
end;
{---------store ask image into the memory table-----------}
procedure TtesteditDM.RedyPaperMemTableAddAskImage;
begin
  //insert picture in memory table
  RedyPaperMemTable.Append;
  RedyPaperMemTable.FieldByName('RecData').Assign(OffAskTextDataSet.FieldByName('ASKIMAGE'));
  RedyPaperMemTable.FieldByName('ASK_ID').AsInteger := OffAsksDataSet.FieldByName('ASK_ID').AsInteger;
  RedyPaperMemTable.Post;
end;
{---------store answer text into the memory table------------}
procedure TtesteditDM.RedyPaperMemTableAddAnswerText(tmpcurrask:integer; tmpprefix:string);
begin
  //insert answer record in memory table
  RedyPaperMemTable.Append;
  RedyPaperMemTable.FieldByName('RecPrefix2').AsString := tmpprefix+'.';
  RedyPaperMemTable.FieldByName('RecData').AsVariant :=OffAnswTextDataSet.FBN('ANSWERTEXT1').AsVariant;

///  RedyPaperMemTable.FieldByName('RecData').Assign(OffAnswTextDataSet.FBN('ANSWERTEXT1'));
  {also work properly}
  RedyPaperMemTable.FieldByName('ANSWER_ID').AsInteger := OffAnswTextDataSet.FBN('ID_ANSWER').AsInteger;
  RedyPaperMemTable.FieldByName('ASK_ID').AsInteger := OffAsksDataSet.FBN('ASK_ID').AsInteger;
  RedyPaperMemTable.FieldByName('Weight').AsInteger := OffAnswTextDataSet.FBN('WEIGHT').AsInteger;
  // {+2/01/2010}
  RedyPaperMemTable.FieldByName('Ask_Num_on_Paper').AsString := inttostr(tmpcurrask)+'.';
  RedyPaperMemTable.Post;
end;
{---------store answer image into the memory table-----------}
procedure TtesteditDM.RedyPaperMemTableAddAnswerImage;
begin
  //insert picture in memory table
  RedyPaperMemTable.Append;
  RedyPaperMemTable.FieldByName('RecData').Assign(OffAskTextDataSet.FieldByName('ASKIMAGE'));
  RedyPaperMemTable.FieldByName('ANSWER_ID').AsInteger := OffAnswTextDataSet.FBN('ID_ANSWER').AsInteger;
  RedyPaperMemTable.FieldByName('ASK_ID').AsInteger := OffAsksDataSet.FieldByName('ASK_ID').AsInteger;
  RedyPaperMemTable.Post;
end;
{-----------write data from database to memory table-----------}
procedure TtesteditDM.PrepareCurrentModule(ShowAnswers:boolean);
var
  ask_num_on_paper, currcharcode, i, j, tmppos, A_char_code, currask, PageCount, CalckPage, CurrPage :integer;
  tmpstr1 : string;
  tmpErrAnswOrder, CurrRightAnswerOrder : TStrings;
begin
  //set detail conditions to immediate access!      {8/11/2009}
  TSect2ScDataSet.DetailConditions := [dcForceOpen];
  //clear existing paper data
  RedyPaperMemTable.EmptyTable;
  //setcurrent ask number and page number
  CurrAsk := 1; CurrPage := 1;
  curpaperrec := 0;
  A_char_code := Ord ('A');
  //define pages count for the current test
//  PageCount := (testeditdm.OffAsksDataSet.RecordCountFromSrv div (Settings.PageAskLimit+1))+1;
          {1/05/2009}
  PageCount := (testeditdm.OffAsksDataSet.RecordCountFromSrv div (testeditdm.SubjTestDataSet.FBN('TESTTIME').AsInteger+1))+1;

  CurrRightAnswerOrder := TStringList.Create;//prepare string list
  tmpErrAnswOrder := TStringList.Create;//prepare string list for errors with answers
  //set progressbar
  mainform.SetProgressBar(0, OffAsksDataSet.RecordCountFromSrv, 1, 0);
  //goto the firs test module
  TestModDataSet.First;
  while not TestModDataSet.Eof do
  //process all test modules
  begin             {1}
   //goto the first sciens in the current test module
   TSect2ScDataSet.First;
   while not TSect2ScDataSet.Eof do
   begin            {1-1}                          {7/11/2009}
   //process all sciens in the current test module
    //set filter for questions table with current sciens ID
    OffAsksDataSet.Filtered := false;
    OffAsksDataSet.Filter := 'SCIENS_ID='+TSect2ScDataSet.FieldByName('SCIENS_ID').AsString;
///    OffAsksDataSet.Filter := 'TESTSECT_ID='+TSect2ScDataSet.FieldByName('SCIENS_ID').AsString;
    OffAsksDataSet.Filtered := true;
    //go to the first question
    OffAsksDataSet.First;
    while not OffAsksDataSet.Eof do
    //process all questions in paper
    begin           {2}
      //define the current text blank page number {1/05/2009}
//      CalckPage := (CurrAsk div (Settings.PageAskLimit+1)) + CurrPage;
      CalckPage := (CurrAsk div (testeditdm.SubjTestDataSet.FBN('TESTTIME').AsInteger+1)) + CurrPage;
      if CalckPage > CurrPage {and (asknumercorrected = false)} then
      //change order of numeration if need
      begin
        CurrPage := CalckPage;//goto next page of the test paper blank
        CurrAsk := 1;
      end;                                     {/1/05/2009}
      ask_num_on_paper := currask + (DefPageAskLimit*(CurrPage-1));
      RedyPaperMemTableAddAskText(ask_num_on_paper);//insert ask record in memory table
//disabled 1/06/2009
      //insert picture in memory table
///      if not OffAskTextDataSet.FieldByName('ASKIMAGE').IsNull then RedyPaperMemTableAddAskImage;
      //prepare answers letters
      currcharcode := A_char_code;
      //finding answer order list  {14/10/2007}
      if OffAsksDataSet.FBN('RIGHTORDER').IsNull then
      begin         {2'}
        mykernel.ExchangeAnswerOrder(false); //recreate answer order list
        tmpErrAnswOrder.Append(inttostr(currask + (DefPageAskLimit*(CurrPage-1))));//add ask to list of errors
      end;          {/2'}
      //get answer order list      {13/10/2007}
      CurrRightAnswerOrder.CommaText := OffAsksDataSet.FBN('RIGHTORDER').AsString;
      //compare the real answer count and ordered answer count
      if OffAnswTextDataSet.RecordCountFromSrv <> CurrRightAnswerOrder.Count then
      begin
        mykernel.ExchangeAnswerOrder(false); //recreate answer order list
        tmpErrAnswOrder.Append(inttostr(ask_num_on_paper));//add ask to list of errors
        //get answer order list
        CurrRightAnswerOrder.CommaText := OffAsksDataSet.FBN('RIGHTORDER').AsString;
      end;
      //process all answer for the current ask
      for i:=1 to CurrRightAnswerOrder.Count do
      begin         {3}
///        OffAnswTextDataSet.Recno := strtoint(CurrRightAnswerOrder.Strings[i-1]);
           {not working properly!!!!????????}
        //goto the first answer;
        OffAnswTextDataSet.First;
        //position of the answer in source table
        tmppos := strtoint(CurrRightAnswerOrder.Strings[i-1]);
        //goto record in source table
        for j := 1 to tmppos-1 do OffAnswTextDataSet.Next; //must be j < tmppos
        //set prefix - show or not right answer
        if ShowAnswers then tmpstr1 := chr(currcharcode) + '-' + OffAnswTextDataSet.FBN('WEIGHT').AsString
        else tmpstr1 := chr(currcharcode);//not show right answe
        //insert answer record in memory table
        RedyPaperMemTableAddAnswerText(ask_num_on_paper, tmpstr1);
        //insert picture in memory table
        //TODO:uncomment following line for full functionality!
//        if not OffAnswTextDataSet.FBN('ANSWERIMAG').IsNull then RedyPaperMemTableAddAnswerImage;
        //get naxt answer letter
        inc(currcharcode);
      end;          {/3}
      //get next ask numer
      inc(currask);
      //goto next ask
      OffAsksDataSet.Next;
      //change progressbar position
      mainform.ProgressBarStepIt(1);
    end;             {/2}
    //goto next sciens in the current test module
    TSect2ScDataSet.Next;
   end;              {1-1}
   //goto next test module
   TestModDataSet.Next;
  end;               {/1}
  //clear progressbar position
  mainform.ProgressBarPosition(0);
  //disable filtering
  OffAsksDataSet.Filtered := false;
  //final nessage
  if tmpErrAnswOrder.Count > 0 then
  begin
    tmpstr1 := 'Порядок відповідей було змінено для таких питань:'+tmpErrAnswOrder.CommaText;
    MessageDlg(tmpstr1, mtWarning, [mbOk], 0);
  end; 
  CurrRightAnswerOrder.Free; //destroy string list
  tmpErrAnswOrder.Free; //destroy string list
  //restore detail conditions               {8/11/2009}
  testeditdm.TSect2ScDataSet.DetailConditions := [dcForceOpen, dcForceMasterRefresh, dcWaitEndMasterScroll];
  //goto the firs sciens(module)
  TestModDataSet.First;
end;
{============================================================}
{=============working with ETALON table======================}
{-----connect/disconnect to ETALON database -----------------}
procedure TtesteditDM.ConnectEtalonDB(status:boolean);
begin
  if status = true then
  begin
    //set working directory
    SetCurrentDir(ExtractFilePath(Application.ExeName)+ExpDirName);
    //connect
    AnsEtalonADOConnection.Open;
    AnsEtalonADOTable.Open;
  end
  else     //disconnect
  begin
    AnsEtalonADOTable.Close;
    AnsEtalonADOConnection.Close;
  end;
end;
{---prepare records in the ETALON database for the answers export---}
procedure TtesteditDM.PrepareEtalonRecords(RecCount:integer; var ListRecID:array of integer);
var
  i : integer;
begin
  for i := 1 to RecCount do
  begin
    AnsEtalonADOTable.Append;
    //write current page number
    AnsEtalonADOTable.FieldByName('Storinka').AsInteger := i;
    //write current exam ID
    AnsEtalonADOTable.FieldByName('Variant').AsInteger := OffPapersDataSet.fieldByName('ID_OFFEXAM').AsInteger;
    AnsEtalonADOTable.post;
    ListRecID[i-1] := AnsEtalonADOTable.FieldByName('ID').AsInteger;
  end;
end;
{-------------change filter in the ETALON table----------------}
procedure TtesteditDM.SetEtalonFilter(RecID : integer);
begin
  AnsEtalonADOTable.Filtered := false;
  AnsEtalonADOTable.Filter :='ID='+ inttostr(RecID);
  AnsEtalonADOTable.Filtered := true;
end;
{---chek, if selected paper varianat exist in the ETALON table---}
function TtesteditDM.ChekEtalonTable(VarID : integer):boolean;
begin
  ChekEtalonTable := false;   //default - this paper not exist
  if AnsEtalonADOTable.Locate('Variant',(VarID), []) then ChekEtalonTable := true;//item finded!
end;
{============SUPPORT ASK OR ANSWER EDITING FEATURE======================}
{-------store current position - department, subject, test, paper-------}
procedure TtesteditDM.GetCurrentTest(var tmpDepID:integer; var tmpSubjID:integer; var tmpTestID:integer; var tmpPaperID:integer; var tmpTestModID:integer);
begin
  tmpDepID := DepartDataSet.FieldByName('DEPID').AsInteger;
  tmpSubjID := SubjectDataSet.FieldByName('ID_SUBJ').AsInteger;
  tmpTestID := SubjTestDataSet.FieldByName('ID_SUBJTEST').AsInteger;
  tmpPaperID := OffPapersDataSet.FieldByName('ID_OFFEXAM').AsInteger;
  //TODO: V3?
  tmpTestModID := TestModDataSet.FieldByName('ID_TESTSECTION').AsInteger;
end;
{-----------------------------------------------------------------}
{------restore position - department, subject, test, paper--------}
procedure TtesteditDM.SetCurrentTest(tmpSubjID, tmpTestID, tmpParerID, tmpTestModID:integer);
begin
  SubjectDataSet.WaitEndMasterScroll := false;
  //locate master dataset - subject
  if SubjectDataSet.Locate('ID_SUBJ',(tmpSubjID),[]) then
  begin           {1}
    SubjectDataSet.WaitEndMasterScroll := true;
    SubjTestDataSet.WaitEndMasterScroll := false;
    //search OK - now locate detail dataset - test on subject
    if SubjTestDataSet.Locate('ID_SUBJTEST',(tmpTestID),[]) then
    begin         {2}
      SubjTestDataSet.WaitEndMasterScroll := true;
      //search OK - now locate subdetail dataset - offline exams (papers)
      OffPapersDataSet.WaitEndMasterScroll := false;
      OffPapersDataSet.Locate('ID_OFFEXAM',(tmpParerID),[]);
      OffPapersDataSet.WaitEndMasterScroll := true;

      TestModDataSet.WaitEndMasterScroll := false;
      //search OK - now locate second detail dataset - modules list in test
      //TODO: V3
      if TestModDataSet.Locate('ID_TESTSECTION',(tmpTestModID),[]) then
      begin       {3}
        TestModDataSet.WaitEndMasterScroll := true;
      end;        {/3}
    end;          {/2}
  end;            {/1}
end;
{-----------------------------------------------------------------}
{---------restore position - test module, ask------------------}
procedure TtesteditDM.SetCurrentModule(tmpSciensID, tmpAskID, tmpAnswerID: integer);
begin
  TSect2ScDataSet.WaitEndMasterScroll := false;
  //search OK - now locate second detail dataset - modules list in test
  if TSect2ScDataSet.Locate('SCIENS_ID',(tmpSciensID),[]) then
  begin         {1}
    TSect2ScDataSet.WaitEndMasterScroll := true;
    if tmpAnswerID <> 0 then RedyPaperMemTable.Locate('ANSWER_ID', (tmpAnswerID), [])//scroll prepared paper to edited answer
    else RedyPaperMemTable.Locate('ASK_ID', (tmpAskID), []);//scroll prepared paper to edited ask
  end;          {/1}
end;
{-----------------------------------------------------------------}
{----------write changed ask data temporarily to memory-----------}
procedure TtesteditDM.AskDataToStream(var tmpTxtStream:tmemorystream; var tmpImgStream:tmemorystream; var ImgExist:boolean);
begin
  ImgExist := false; //default - image not present
  //store ask data to memory
  TestAskDataSetASKTEXT2.SaveToStream(tmpTxtStream);
  if not(TestAskDataSetASKIMAGE.IsNull) then
  begin
    //store ask image to memory
    testeditDM.TestAskDataSetASKIMAGE.SaveToStream(tmpImgStream);
    ImgExist := true;//now image present!
  end;
end;
{-----------------------------------------------------------------}
{-------write changed answer data temporarily to memory-----------}
procedure TtesteditDM.AnswerDataToStream(var tmpTxtStream:tmemorystream; var tmpImgStream:tmemorystream; var ImgExist:boolean);
begin
  ImgExist := false; //default - image not present
  //store ask data to memory
  AnswerDataSetANSWERTEXT1.SaveToStream(tmpTxtStream);
  if not(AnswerDataSetANSWERIMAG.IsNull) then
  begin
    //store ask image to memory
    testeditDM.AnswerDataSetANSWERIMAG.SaveToStream(tmpImgStream);
    ImgExist := true;//now image present!
  end;
end;
{-----------------------------------------------------------------}
{---------write changed ask data from memory to preview table-----}
procedure TtesteditDM.StreamToPreview(tmpTxtStream, tmpImgStream:tmemorystream; ImgExist:boolean);
begin
  testeditDM.RedyPaperMemTable.Edit;
  testeditDM.RedyPaperMemTableRecData.LoadFromStream(tmpTxtStream);
  testeditDM.RedyPaperMemTable.Post;
  //TODO:may be need improve adding/replacing/deleting of the image
  if ImgExist = true then
  begin              {1}
    testeditDM.RedyPaperMemTable.Next; //goto next record
    if testeditDM.RedyPaperMemTable.FieldByName('RecPrefix').IsNull then
       if testeditDM.RedyPaperMemTable.FieldByName('RecPrefix2').IsNull then
       begin         {2}
         //image record present - replace data
         testeditDM.RedyPaperMemTable.Edit;
         testeditDM.RedyPaperMemTableRecData.LoadFromStream(tmpImgStream);
         testeditDM.RedyPaperMemTable.Post;
       end           {/2}
       else
       begin         {3}
         //image record not present - insert new recored and write data
         testeditDM.RedyPaperMemTable.Insert;
         testeditDM.RedyPaperMemTableRecData.LoadFromStream(tmpImgStream);
         testeditDM.RedyPaperMemTable.Post;
       end;          {/3}
  end
  else
  begin              {4}
    testeditDM.RedyPaperMemTable.Next; //goto next record
    if testeditDM.RedyPaperMemTable.FieldByName('RecPrefix').IsNull then
       if testeditDM.RedyPaperMemTable.FieldByName('RecPrefix2').IsNull then
       begin //image record was present before editing - delete record
       testeditDM.RedyPaperMemTable.Delete;
       end;          {/4}
  end;               {/1}
end;
{-----------------------------------------------------------------}
{---search full sciens list dataset to department id for selected sciens------}
procedure TtesteditDM.SearchDepartment(var EditAskID:integer; var EditAnswerID:integer; var EditSciensID:integer; var SearchDepID:integer);
begin
  //store objects ID:
  EditAskID := RedyPaperMemTable.FieldByName('ASK_ID').AsInteger;
  EditSciensID := RedyPaperMemTable.FieldByName('SCIENS_ID').AsInteger;
  EditAnswerID := 0;//default
  if not RedyPaperMemTable.FieldByName('ANSWER_ID').IsNull then EditAnswerID := RedyPaperMemTable.FieldByName('ANSWER_ID').AsInteger;
  //default - can not search department ID
  SearchDepID := 0;
  //search appropritate sciens in the full sciens list
    if FullSciensDataSet.Locate('ID_SCIENS',EditSciensID,[]) then
  begin               {1}
    //search OK - now return department ID
    SearchDepID := FullSciensDataSet.FieldByName('DEP_ID').AsInteger;
  end;                {/1}
end;
{-----------------------------------------------------------------}
{---locate sciens list and ask list to selected search full sciens list dataset to department id for selected sciens------}
function TtesteditDM.LocateAsk(EditAskID, EditAnswerID, EditSciensID:integer) : boolean;
begin
  //default - can not locate datasets
  LocateAsk := false;
  //search OK - now locate dstail dataset - sciens list by department
  SciensDataSet.WaitEndMasterScroll := false;
  if SciensDataSet.Locate('ID_SCIENS',(EditSciensID),[]) then
  begin           {1}
    SciensDataSet.WaitEndMasterScroll := true;
    TestAskDataSet.WaitEndMasterScroll := false;
    //search OK - now locate subdetail dataset - asks list
    if TestAskDataSet.Locate('ID_ASK',(EditAskID),[]) then
    begin         {2}
      TestAskDataSet.WaitEndMasterScroll := true;
      if EditAnswerID <> 0 then
      begin       {3}
        AnswerDataSet.WaitEndMasterScroll := false;
        if AnswerDataSet.Locate('ID_ANSWER',(EditAnswerID),[]) then
        begin     {4}
          AnswerDataSet.WaitEndMasterScroll := true;
          LocateAsk := true;
        end;      {/4}
      end         {/3}
      else LocateAsk := true;
    end;          {/2}
  end;            {/1}
end;
{===================check allowed operations integrity===============}
{-----------working with list of the sciens--------------------------}
procedure TtesteditDM.CheckSciensDataSet;
begin
  if SciensDataSet.IsEmpty then
  begin  //disable controls
    mainform.PrintAskList.Enabled := false;
    mainform.PrintAskListWithoutAnsw2.Enabled := false;
    mainform.PrintAskAnswerOnly.Enabled := false;
    mainform.PrintAskListOnly.Enabled := false;
    mainform.BatchAskListWithAnswer.Enabled := false;
    mainform.AskGB.Enabled := false;
    mainform.ImportFromWordCmd.Enabled := false;
    mainform.ExportMoodleCmd.Enabled := false;
    mainform.ImportMoodleCmd.Enabled := false;
    mainform.ImportMoodleXMLCmd.Enabled := false;
  end
  else
  begin  //enable controls
    mainform.PrintAskList.Enabled := true;
    mainform.PrintAskListWithoutAnsw2.Enabled := true;
    mainform.PrintAskAnswerOnly.Enabled := true;
    mainform.PrintAskListOnly.Enabled := true;
    mainform.BatchAskListWithAnswer.Enabled := true;
    mainform.AskGB.Enabled := true;
    mainform.ImportFromWordCmd.Enabled := true;
    mainform.ExportMoodleCmd.Enabled := true;
    mainform.ImportMoodleCmd.Enabled := true;
    mainform.ImportMoodleXMLCmd.Enabled := true;
  end;
end;

procedure TtesteditDM.SciensDataSetAfterOpen(DataSet: TDataSet);
begin
  CheckSciensDataSet;
  //default sorting
  SciensDataSet.DoSort(['ID_SCIENS'], [true]);  {18-06-2007}
end;

procedure TtesteditDM.SciensDataSetAfterDelete(DataSet: TDataSet);
begin
  CheckSciensDataSet;
end;

procedure TtesteditDM.SciensDataSetAfterPost(DataSet: TDataSet);
begin
  CheckSciensDataSet;
   //refetch new data  {21-05-2007}
///  FullSciensDataSet.FullRefresh;
end;
{-----------working with list of the asks-------------------------}
procedure TtesteditDM.CheckTestAskDataSet;
begin
  if TestAskDataSet.IsEmpty then
  begin  //disable controls
    mainform.AskOpenEditorCmd.Enabled := false;
    mainform.DelAskCmd.Enabled := false;
//    mainform.AskListGB.Enabled := false;
  end
  else
  begin  //enable controls
    mainform.AskOpenEditorCmd.Enabled := true;
    mainform.DelAskCmd.Enabled := true;
//    mainform.AskListGB.Enabled := true;
  end;
end;

procedure TtesteditDM.TestAskDataSetAfterOpen(DataSet: TDataSet);
begin
  CheckTestAskDataSet;
  //default sorting
///  TestAskDataSet.DoSort(['ID_ASK'], [true]);  {18-06-2007}
end;

procedure TtesteditDM.TestAskDataSetAfterPost(DataSet: TDataSet);
begin
  CheckTestAskDataSet;
end;

procedure TtesteditDM.TestAskDataSetAfterDelete(DataSet: TDataSet);
begin
  CheckTestAskDataSet;
end;
{-----------working with list of the answers-------------------------}
procedure TtesteditDM.CheckAnswerDataSet;
begin
  if AnswerDataSet.IsEmpty then
  begin  //disable controls
    mainform.AnswerOpenEditorCmd.Enabled := false;
  end
  else
  begin  //enable controls
    mainform.AnswerOpenEditorCmd.Enabled := true;
  end;
end;

procedure TtesteditDM.AnswerDataSetAfterOpen(DataSet: TDataSet);
begin
///  CheckAnswerDataSet;
end;

procedure TtesteditDM.AnswerDataSetAfterPost(DataSet: TDataSet);
begin
  //refresh count answers for current ask
///  TestAskDataSet.Edit;
///  TestAskDataSetANSWCOUNT.Value := AnswerDataSet.RecordCountFromSrv;
///  TestAskDataSet.post;
  //check acessiability status of the controls
///  CheckAnswerDataSet;
end;

procedure TtesteditDM.AnswerDataSetAfterDelete(DataSet: TDataSet);
begin
  //refresh count answers for current ask
///  TestAskDataSet.Edit;
///  TestAskDataSetANSWCOUNT.Value := AnswerDataSet.RecordCountFromSrv;
///  TestAskDataSet.post;
  //check acessiability status of the controls
///  CheckAnswerDataSet;
end;

{------------------working with subjects list----------------------}
procedure TtesteditDM.CheckSubjectDataSet;
begin
  if SubjectDataSet.IsEmpty then mainform.TestGroupBox.Enabled := false //disable control
  else mainform.TestGroupBox.Enabled := true; //enable control
end;

procedure TtesteditDM.SubjectDataSetAfterOpen(DataSet: TDataSet);
begin
  CheckSubjectDataSet;
  //default sorting
  SubjectDataSet.DoSort(['SEMESTR'], [true]);  {18-06-2007}
end;

procedure TtesteditDM.SubjectDataSetAfterPost(DataSet: TDataSet);
begin
  CheckSubjectDataSet;
end;

procedure TtesteditDM.SubjectDataSetAfterDelete(DataSet: TDataSet);
begin
  CheckSubjectDataSet;
end;

procedure TtesteditDM.SubjectDataSetBeforeDelete(DataSet: TDataSet);
begin
  //log action
  write_log('Успішно видалено предмет з усіма тестими і білетами(!):', SubjectDataSet.FieldByName('ID_SUBJ').asString, basevar.Settings.LUserID, basevar.Settings.LUserDepID, SubjectDataSet.FieldByName('ID_SUBJ').asinteger);
end;
{------------------working with tests on subject list-----------------}
procedure TtesteditDM.CheckSubjTestDataSet;
begin
  if SubjTestDataSet.IsEmpty then mainform.TestModGB.Enabled := false //disable control
  else mainform.TestModGB.Enabled := true; //enable control
end;

procedure TtesteditDM.SubjTestDataSetAfterOpen(DataSet: TDataSet);
begin
  CheckSubjTestDataSet;
end;

procedure TtesteditDM.SubjTestDataSetAfterPost(DataSet: TDataSet);
begin
  CheckSubjTestDataSet;
end;

procedure TtesteditDM.SubjTestDataSetAfterDelete(DataSet: TDataSet);
begin
  CheckSubjTestDataSet;
end;

procedure TtesteditDM.SubjTestDataSetBeforeDelete(DataSet: TDataSet);
begin
  //log action
  write_log('Успішно видалено тест з усіма білетами(!):', SubjTestDataSet.FieldByName('ID_SUBJTEST').asString, basevar.Settings.LUserID, basevar.Settings.LUserDepID, SubjTestDataSet.FieldByName('ID_SUBJTEST').asinteger);
end;
{----------------working with modules list ---------------------------}
procedure TtesteditDM.ChekTestModDataSet;
begin
  if TestModDataSet.IsEmpty then
  begin  //disable controls
    mainform.ExpModulesRtf.Enabled := false;
    mainform.PapersGB.Enabled := false;
  end
  else
  begin  //enable controls
    mainform.ExpModulesRtf.Enabled := true;
    mainform.PapersGB.Enabled := true;
  end;
end;

procedure TtesteditDM.TestModDataSetAfterOpen(DataSet: TDataSet);
begin
  ChekTestModDataSet;
  //rearrange modules list {12-06-2007}
  //TODO: V3
  TestModDataSet.DoSort(['ORD_NUM'],[true]);
end;

procedure TtesteditDM.TestModDataSetAfterDelete(DataSet: TDataSet);
begin
  ChekTestModDataSet;
  TestModDataSet.DoSort(['ORD_NUM'],[true]);
end;

procedure TtesteditDM.TestModDataSetAfterPost(DataSet: TDataSet);
begin
  ChekTestModDataSet;
  TestModDataSet.DoSort(['ORD_NUM'],[true]);
end;
{-------------working with offline papers list-------------------------}
procedure TtesteditDM.ChekOffPapersDataSet;
begin
  if OffPapersDataSet.IsEmpty then
  begin
    //TODO:V3
    //NOTE: only if papers not exist - user can change modules list!
//    mainform.TestModDBGridEh.ReadOnly := false;//enable controls
//    mainform.AdvModulesEdit.Enabled := true; //enable controls
    //disable actions (controls)
    mainform.DelOffPaper.Enabled := false;
    mainform.PrepareExport.Enabled := false;
    mainform.ExpPaperWithAnsw.Enabled := false;
    mainform.ExpOffPaper.Enabled := false;
    mainform.ExpOffPaperRTF.Enabled := false;
    mainform.ExpAnswers.Enabled := false;
    mainform.ExpOffModuleWord.Enabled := false;
    mainform.PrintGB.Enabled := false;
    mainform.PrintOffPaperWithAnsw.Enabled := false;
    mainform.ClonePaperCmd.Enabled := false;
    mainform.PrintOffPaperFReport.Enabled := false;
    mainform.ExpAnswersWord.Enabled := false;
  end
  else
  begin
    //TODO:V3
//    mainform.TestModDBGridEh.ReadOnly := true; //disable controls
//    mainform.AdvModulesEdit.Enabled := false; //disable controls
    //enable actions (controls)
    mainform.DelOffPaper.Enabled := true;
    mainform.PrepareExport.Enabled := true;
    mainform.ExpPaperWithAnsw.Enabled := true;
    mainform.ExpOffPaper.Enabled := true;
    mainform.ExpOffPaperRTF.Enabled := true;
    mainform.ExpAnswers.Enabled := true;
    mainform.ExpOffModuleWord.Enabled := true;    
    mainform.PrintGB.Enabled := true;
    //mainform.PrintOffPaperWithAnsw.Enabled := true;
    mainform.PrintOffPaperWithAnsw.Enabled := mainform.AnswRepSB.Enabled; {18/12/2014}
    mainform.ClonePaperCmd.Enabled := true;
    mainform.PrintOffPaperFReport.Enabled := true;
    mainform.ExpAnswersWord.Enabled := true;    
  end;
end;

procedure TtesteditDM.OffPapersDataSetAfterOpen(DataSet: TDataSet);
begin
  ChekOffPapersDataSet;
end;

procedure TtesteditDM.OffPapersDataSetAfterPost(DataSet: TDataSet);
begin
  ChekOffPapersDataSet;
end;

procedure TtesteditDM.OffPapersDataSetAfterDelete(DataSet: TDataSet);
begin
  ChekOffPapersDataSet;
end;
{=======working with answers===================================}
procedure TtesteditDM.AnswerDataSetBeforePost(DataSet: TDataSet);
begin      //TODO:not working correct!? {13-06-2007}
{if AnswEditForm.Visible and (AnswerDataSet.State in [dsEdit, dsInsert]) then
  begin
    if AnswEditForm.PerformTextClean = false then
    begin
      MessageDlg('Відсутній текст відповіді!', mtError, [mbOk], 0);
      abort;
    end;
  end;}
end;
{=============CLONE TEST ON SUBJECT WITH MODULES TOGETHER=============}
procedure TtesteditDM.CloneTestPerform;
var
  TestSectionCount, SorceTestID, i: integer;
  tmpTestSectionList : array of integer;
  tmpSQL : string;
begin
  //get modules count
  TestSectionCount := TestModDataset.VisibleRecordCount;
  //get source test ID
  SorceTestID := SubjTestDataSet.FBN('ID_SUBJTEST').AsInteger;
  //create dinamic array for store data
  setlength(tmpTestSectionList, TestSectionCount);
  //goto first record
  TestModDataset.First; i := 0;
  //store list of the test sections for current test
  while not TestModDataset.Eof do
  begin
    tmpTestSectionList[i] := TestModDataset.FBN('ID_TESTSECTION').AsInteger;
    TestModDataset.Next;
    inc(i);
  end;
  //prepare select SQL text
  tmpSQL := 'select testsections.id_testsection, testsections.subjtest_id, testsections.sect_title, ';
  tmpSQL := tmpSQL + 'testsections.sect_descr, testsections.asks_total, testsections.show, testsections.ord_num, ';
  tmpSQL := tmpSQL + 'testsect2sciens.sciens_id, testsect2sciens.askcount ';
  tmpSQL := tmpSQL + 'from testsections, testsect2sciens ';
  tmpSQL := tmpSQL + 'where (testsections.subjtest_id = '+inttostr(SorceTestID)+')and(testsect2sciens.testsection_id = testsections.id_testsection) ';
  tmpSQL := tmpSQL + 'order by testsections.ord_num;';
  //select data in temp dataset
  tmpFIBDataSet.SelectSQL.Text := tmpSQL;
  tmpFIBDataSet.Prepare;
  tmpFIBDataSet.Open;
  //insert new record in the test table
  SubjTestDataSet.CloneCurRecord(['ID_SUBJTEST']);
  SubjTestDataSet.FBN('CREATEDATE').AsDateTime := today;
  SubjTestDataSet.FBN('USER_ID').AsInteger := basevar.Settings.LUserID;
  SubjTestDataSet.Post;
  //disable master-datail wait
  TSect2ScDataSet.WaitEndMasterScroll := false;
  for i := 0 to TestSectionCount-1 do
  //process all test sections
  begin              {1}
    //change filter
    tmpFIBDataSet.Filtered := false;
    tmpFIBDataSet.Filter := 'ID_TESTSECTION='+inttostr(tmpTestSectionList[i]);
    tmpFIBDataSet.Filtered := true;
    //goto first recors in query result
    tmpFIBDataSet.First;
    //insert record in test section table
    TestModDataset.Append;
    TestModDataset.FBN('SECT_TITLE').AsString := tmpFIBDataSet.FBN('SECT_TITLE').Asstring;
    if not tmpFIBDataSet.FieldByName('SECT_DESCR').IsNull then TestModDataset.FBN('SECT_DESCR').AsString := tmpFIBDataSet.FBN('SECT_DESCR').Asstring;
    TestModDataset.FBN('ASKS_TOTAL').AsInteger := tmpFIBDataSet.FBN('ASKS_TOTAL').AsInteger;
    TestModDataset.Post;
    //main cycle - write data for the new test
    while not tmpFIBDataSet.Eof do
    begin            {2}
      //insert detail record about test section module for current test section
      TSect2ScDataSet.Append;
      TSect2ScDataSet.FBN('SCIENS_ID').AsInteger := tmpFIBDataSet.FieldByName('SCIENS_ID').AsInteger;
      TSect2ScDataSet.FBN('askcount').AsInteger := tmpFIBDataSet.FieldByName('askcount').AsInteger;
      TSect2ScDataSet.Post;
      //goto next record
      tmpFIBDataSet.Next;
    end;             {/2}
  end;               {/1}
  //enable master-datail wait
  TSect2ScDataSet.WaitEndMasterScroll := true;
  //close temp dataset
  tmpFIBDataSet.Close;
  //resort test lists
  SubjTestDataSet.DoSort(['ID_SUBJTEST'], [true]);
end;
{=============CLEAR FILTER WHEN SCIENS IS CHANGED=============}
procedure TtesteditDM.SciensDataSetAfterScroll(DataSet: TDataSet);
begin
//  mainform.AskListDBGridEh.ClearFilter;
//  mainform.AskListDBGridEh.ApplyFilter;
end;
{===================REPLACE UPDATE FOR MOVE ASK=====================}
{---------check if ask used in the offline papers-----------}
function TtesteditDM.CheckAskUsing(CheckAskID:integer) : boolean;
var
  CheckAskSQLText : string;
begin
  //by default - ask is finded!
  result := true;
  //set SQL text
  CheckAskSQLText := 'select distinct ASK_ID from offline_askslist WHERE ASK_ID = ?SEARCH_ASK_ID;';
  //set query options {11/07/2007}
  testeditdm.TmpFIBQuery.Options := [qoStartTransaction];  
  //set SQL query
  TmpFIBQuery.SQL.Text := CheckAskSQLText;
  //set parameters
  TmpFIBQuery.ParamByName('SEARCH_ASK_ID').AsInteger := CheckAskID;
  //run SQL query
  TmpFIBQuery.Prepare;
  TmpFIBQuery.ExecQuery;
  //check - exist record or not
  if TmpFIBQuery.FieldByName('ASK_ID').IsNull then result := false;
  TmpFIBQuery.Close;
end;
{------------Copy Ask Data----------------------------}
procedure TtesteditDM.CopyAskData(OldAskID: integer; ToArchive: boolean; var NewAskID : integer);
var
  tmpStream, tmpImageStream : tmemorystream;
begin
  //init memory buffers
  tmpStream := tmemorystream.Create;
  tmpImageStream := tmemorystream.Create;
  //search next record for coping
  TestAskDataSet.Locate('ID_ASK', OldAskID, []);
  //put in archive - if need
  if ToArchive then
  begin
    TestAskDataSet.Edit;
    TestAskDataSet.FBN('ARCHIVE').AsInteger := yes;
    TestAskDataSet.Post;
  end;
  //store ask text to memory stream
  TestAskDataSetASKTEXT2.SaveToStream(tmpStream);
  {if not(TestAskDataSetASKIMAGE.IsNull) then }TestAskDataSetASKIMAGE.SaveToStream(tmpImageStream);
  //TODO:store ask image to stream
  //clone current record
  TestAskDataSet.CloneCurRecord(['ID_ASK', 'SCIENS_ID']);
  //insert ask text into new record
  TestAskDataSetASKTEXT2.LoadFromStream(tmpStream);
  TestAskDataSetASKIMAGE.LoadFromStream(tmpImageStream);
  //TODO:insert ask image into new record

  //set archive option
  if ToArchive then TestAskDataSet.FBN('ARCHIVE').AsInteger := no;
  //save changes
  TestAskDataSet.Post;
  //change ask id to value of the new cloned record
  NewAskID := TestAskDataSet.FBN('ID_ASK').AsInteger;
  //destroy memory buffers
  tmpStream.Free;
  tmpImageStream.Free;
  //copy answers data
  CopyAnswerData(OldAskID, NewAskID);
end;
{-------------Copy answers from source to destination ask-----------------}
procedure TtesteditDM.CopyAnswerData(SourceAskID, DestAskID : integer);
var
  CurrAnswerID, CopyAnswerSQLText : string;
begin
  //goto source ask record
  TestAskDataSet.Locate('ID_ASK', SourceAskID, []);
  //goto first answer
  AnswerDataSet.First;
  //disable master-detail waiting
  AnswerDataSet.WaitEndMasterScroll := false;
  //set query options {11/07/2007}
///  TmpFIBQuery.Options := [qoStartTransaction, qoAutoCommit];
  try
    TmpFIBQuery.Options := [qoStartTransaction];
    //will be processing all answers
    while not AnswerDataSet.Eof do
    begin
      //store current answer ID
      CurrAnswerID := AnswerDataSet.FBN('ID_ANSWER').AsString;
      //build insert SQL
      CopyAnswerSQLText := 'INSERT INTO ANSWERS (ASK_ID, WEIGHT, ANSWERTEXT1, ANSWERIMAG) ';
      CopyAnswerSQLText := CopyAnswerSQLText + 'SELECT ('+inttostr(DestAskID)+') AS ASK_ID, WEIGHT, ANSWERTEXT1, ANSWERIMAG ';
      CopyAnswerSQLText := CopyAnswerSQLText + 'FROM ANSWERS WHERE ID_ANSWER='+CurrAnswerID;

      //execute insert query
      TmpFIBQuery.SQL.Text := CopyAnswerSQLText;
      TmpFIBQuery.Prepare;
      TmpFIBQuery.ExecQuery;
      TmpFIBQuery.Close;
      //goto next answer
      AnswerDataSet.Next;
    end;
    if TmpFIBQuery.Transaction.Active then TmpFIBQuery.Transaction.Commit;
  except
    if TmpFIBQuery.Transaction.Active then TmpFIBQuery.Transaction.Rollback;      {23/10/2011}
  end;
  //restore master-detail waiting
  AnswerDataSet.WaitEndMasterScroll := true;
end;
{--------------------Main. Move or copy selected asks------------------}
procedure TtesteditDM.MoveAsk(MoveAskList:array of integer; DestSciens:integer; TotalMode:boolean);
var
  minFreqStr, MoveAskSQLText : string;
  tmp_min_req, i, sourcesciensid : integer;
  CurrAskMode, PutInArchive : boolean;
begin
  //get source sciens id
  sourcesciensid := SciensDataSet.FBN('ID_SCIENS').AsInteger;     {+17/04/2012}
  //set progressbar
  mainform.PgBar1.Step:=1;
  mainform.PgBar1.Min := 0;
  mainform.PgBar1.Max := length(MoveAskList);
  mainform.PgBar1.Position := mainform.PgBar1.Min;
  //geting minimum frequen from ask list table
  try
    if testeditdm.TestAskDataSet.RecordCountFromSrv > 0 then
    begin
      PerformSearchMinimalFrequency(inttostr(DestSciens), minFreqStr);
      tmp_min_req := strtoint(minFreqStr);
    end
    else tmp_min_req := 0; //default
  except
    tmp_min_req := 0; //default
  end;

  for i := 0 to length(MoveAskList)-1 do //process all selected questions
  begin             {1}
    //default - not put in archive
    PutInArchive := false;
    if TotalMode = true then CurrAskMode := TotalMode //need copy asks
    else //need move asks
    begin           {2}
      //check - used this ask in paper or not
      if CheckAskUsing(MoveAskList[i]) = true then
      begin         {3}
        CurrAskMode := not TotalMode; //this record will be copied
        PutInArchive := true;  //also - original record will put in archive
      end           {/3}
      else CurrAskMode := TotalMode;  //this record will be moved
    end;            {/2}
    if CurrAskMode then CopyAskData(MoveAskList[i], PutInArchive, MoveAskList[i]);//copy ask record

    //set query options {11/07/2007}
    TmpFIBQuery.Options := [qoStartTransaction, qoAutoCommit];
    //move record - by default
    MoveAskSQLText:= 'update TESTASKS SET SCIENS_ID = ?New_ID_SCIENS, FREQUENT = ?New_FREQUENT WHERE ID_ASK = ?OLD_ID_ASK;';
    //set SQL query
    TmpFIBQuery.SQL.Text := MoveAskSQLText;
    //set parameters
    TmpFIBQuery.ParamByName('New_ID_SCIENS').AsInteger := DestSciens;
    TmpFIBQuery.ParamByName('New_FREQUENT').AsInteger := tmp_min_req;
    TmpFIBQuery.ParamByName('OLD_ID_ASK').AsInteger := MoveAskList[i];
    //run SQL query
    TmpFIBQuery.Prepare;
    TmpFIBQuery.ExecQuery;
    TmpFIBQuery.Close;
    //steep progressbar
    mainform.PgBar1.StepIt;
  end;              {/1}
  //set progress bar position
  mainform.PgBar1.Position := mainform.PgBar1.Min;
  //mandatory update ask count
  UpdateAskCountPerSciens(sourcesciensid);             {+17/04/2012}
  UpdateAskCountPerSciens(DestSciens);                 {+17/04/2012}
  //refresh result recordset
  TestAskDataSet.FullRefresh;
  SciensDataSet.FullRefresh;                            {+17/04/2012}
  //locate scien table
  SciensDataSet.Locate('ID_SCIENS',sourcesciensid,[]);  {+17/04/2012}
end;
///////////////////////////////////////////////////
{=====================WORKING WITH LOGS=====================}
{-------------write log daya into log table-----------------}
procedure TtesteditDM.write_log(log_action, log_subject: string; log_userid, log_userdepid, log_subjectid :integer);
begin
  SysLogDataSet.Append;
  SysLogDataSet.FieldByName('LOG_ACTION').asString := log_action;
  SysLogDataSet.FieldByName('LOG_SUBJECT').asString := log_subject;
  SysLogDataSet.FieldByName('LOG_USERID').AsInteger := log_userid;
  SysLogDataSet.FieldByName('LOG_USERDEPID').AsInteger := log_userdepid;
  SysLogDataSet.FieldByName('LOG_SUBJECTID').AsInteger := log_subjectid;
  SysLogDataSet.FieldByName('LOG_DATE').AsDateTime := now;
  SysLogDataSet.Post;
end;
{----------------log deleting of the test paper-------------}
procedure TtesteditDM.OffPapersDataSetBeforeDelete(DataSet: TDataSet);
begin
  //log action
  write_log('Успішно видалено білет №:', OffPapersDataSet.FieldByName('ID_OFFEXAM').asString, basevar.Settings.LUserID, basevar.Settings.LUserDepID, OffPapersDataSet.FieldByName('ID_OFFEXAM').asinteger);//
end;

///////////////////////////////////////////////////
{==================WORKING WITH VK-REPORT====================}
{--complit RTF-template.WARNING: You must open document in Open Office v.2.2 first!--}
procedure TtesteditDM.PrintToRTF(filename:string);
begin
  WordReport1.InputBlank := ExtractFilePath(Application.ExeName)+Rep_OffPaperRTFTemplate;
  WordReport1.OutputBlank := filename + RTF_ext;
  WordReport1.ReportExecute;
end;
{--------------VK Report Errors-------------------------------------}
procedure TtesteditDM.WordReport1ReportError(Sender: TObject; mError,
  nError: Cardinal; sError: String);
begin
  ShowMessage(sError);
end;
{---------------------VK Report end - open with---------------------}
procedure TtesteditDM.WordReport1EndReport(Sender: TObject);
begin
//TODO: add there selection - open with MS Word or with Open office
  ShellExecute(Application.Handle, Pchar('open'), pChar(WordReport1.OutputBlank), Pchar('/n'), nil, 0);
end;
{----------------VK Report-prepare dynamic sections--------------------}
procedure TtesteditDM.WordReport1SectionPrepare(Sender: TObject);
begin
  ASKS := WordReport1.PrepareSection('ASKS');
  ANSWERS := WordReport1.PrepareSection('ANSWERS');
end;
{---------VK Report-goto first record in the master dataset------------------}
procedure TtesteditDM.WordReport1MoveTop(Sender: TObject;
  var bCheck: Boolean);
begin
  TestModDataSet.First;
  bCheck := TestModDataSet.Eof;
end;
{-----------VK Report-goto next record in the master dataset------------}
procedure TtesteditDM.WordReport1MoveNext(Sender: TObject;
  var bCheck: Boolean);
begin
  TestModDataSet.Next;
  bCheck := TestModDataSet.Eof;
end;
{--------------VK Report-data request by number----------------------}
procedure TtesteditDM.WordReport1RequestByNum(Sender: TObject;
  sSectionName: String; var iP: Integer; var sStr: String);
var
  bCheck: boolean;
  sData: Variant;
  subject, faculty, semester, person, sign, group, speciality  : string;
        {/////////////////////////////////////////////////}
        procedure GetLangTitleData(LangIDStr:string);
        begin
          //set default values
          subject := ''; faculty := ''; semester := '';
          person := ''; sign := ''; group := ''; speciality := '';
          //set filter to lang table
          LangsDataSet.Filtered := false;
          LangsDataSet.Filter := 'ID_LANG='+LangIDStr;
          LangsDataSet.Filtered := true;
          person := LangsDataSet.FieldByName('PERSON_TIT').AsString;
          sign := LangsDataSet.FieldByName('SIGN_TIT').AsString;
          group := LangsDataSet.FieldByName('GROUP_TIT').AsString;
          speciality := LangsDataSet.FieldByName('SPEC_TIT').AsString;
          subject := LangsDataSet.FieldByName('SUBJ_TIT').AsString;
          faculty := LangsDataSet.FieldByName('FACULTY_TIT').AsString;
          semester := LangsDataSet.FieldByName('SEMESTR_TIT').AsString;
          //disable filter
          LangsDataSet.Filtered := false;
        end;
        {////////////////////////////////////////////////}
begin
  if WordReport1.CurrentSectionNum = REPORT_HEADER then
  begin
    sStr := ''; //default title value
    //get language title data
    GetLangTitleData(SubjTestDataSet.FieldByName('LANG_ID').AsString);
    //insert line for person name input
    if (iP = 1)and(basevar.Settings.W_ShowPerson = DefAskFormatState) then sStr := person;
    //insert line for person sign input
    if (iP = 2)and(basevar.Settings.W_ShowSign = DefAskFormatState) then sStr := sign;
    //insert line for group number input
    if (iP = 3)and(basevar.Settings.W_ShowGroup = DefAskFormatState) then sStr := group;
    //insert line speciality name input
    if (iP = 4)and(basevar.Settings.W_ShowSpec = DefAskFormatState) then sStr := speciality;
    //insert name of subject into document
    if (iP = 5)and(basevar.Settings.W_ShowSubj = DefAskFormatState) then sStr := subject + ' ' + SubjectDataSet.fieldByName('SUBJNAME').AsString;
    //insert name of faculty into document
    if (iP = 6)and(basevar.Settings.W_ShowFaculty = DefAskFormatState) then sStr := faculty + ' ' + SubjectDataSet.fieldByName('FACULTY').AsString;
    //insert number of semester into document
    if (iP = 7)and(basevar.Settings.W_ShowSemestr = DefAskFormatState) then sStr := semester + ' ' + SubjectDataSet.fieldByName('SEMESTR').AsString;
    //insert name of variant into document
    if iP = 8 then sStr := OffPapersDataSet.fieldByName('VAR_NAME').AsString + ' ' + OffPapersDataSet.fieldByName('ID_OFFEXAM').AsString;
  end
  else
  begin
    bCheck := false;
    sData := iP;
    WordReport1DataRequest(self, sSectionName, WordReport1.CurrentSectionNum,
      sData, bCheck, 0, 0, 0, 0);
    if bCheck then sStr := VarToStr(sData);
  end;
end;
{-----VK Report-processing dynamical (detailed) sections--------------}
procedure TtesteditDM.WordReport1SectionComplit(Sender: TObject;
  SectionName: String; SectionNum: Cardinal);
begin
  if SectionNum = BODY then
  begin
    RedyPaperMemTable.First;
    while not RedyPaperMemTable.Eof do
    begin
      if not testeditdm.RedyPaperMemTable.fieldByName('RecPrefix').IsNull then
             WordReport1.OutSection('ASKS')
      else WordReport1.OutSection('ANSWERS');
      RedyPaperMemTable.Next;
    end;
  end;
end;
{------------VK Report-Data request by different sections-----------------}
procedure TtesteditDM.WordReport1DataRequest(Sender: TObject;
  SectionName: String; SectionNum: Cardinal; var sData: Variant;
  var bCheck: Boolean; OutR, OutC, InR, InC: Cardinal);
begin
  if SectionNum = REPORT_HEADER then bCheck := false;
  if SectionNum = BODY then
  begin
    if VarType(sData) in [varSmallint, varInteger, varSingle, varDouble, varCurrency] then
    begin
      if sData = 1 then
      begin
        sData := Unassigned;
        sData := inttostr(TestModDataSet.RecNo)+'. '+ TestModDataSet.FieldByName('SECT_TITLE').AsString;
        bCheck := true;
        Exit;
      end;
    end;
  end;
  if SectionNum = ASKS then
  begin
    if VarType(sData) in [varSmallint, varInteger, varSingle, varDouble, varCurrency] then
    begin
      if sData = 1 then
      begin
        sData := Unassigned;
        sData := RedyPaperMemTable.FieldByName('RecPrefix').AsString;
        bCheck := true;
        Exit;
      end;
      if sData = 2 then
      begin
        sData := Unassigned;
        sData := RedyPaperMemTable.FieldByName('RecData').AsVariant;
        bCheck := true;
        Exit;
      end;
    end;
  end;
  if SectionNum = ANSWERS then
  begin
    if VarType(sData) in [varSmallint, varInteger, varSingle, varDouble, varCurrency] then
    begin
      if sData = 1 then
      begin
        sData := Unassigned;
        sData := RedyPaperMemTable.FieldByName('RecPrefix2').AsString;
        bCheck := true;
        Exit;
      end;
      if sData = 2 then begin
        sData := Unassigned;
        sData := RedyPaperMemTable.FieldByName('RecData').AsVariant;
        bCheck := true;
        Exit;
      end;
    end;
  end;
end;
{============================================================}
{=======================V-3==================================}
procedure TtesteditDM.TestAskDataSetBeforeScroll(DataSet: TDataSet);
begin
//TODO: collapse record in cxGrid
//  with mainform.AskGridDBTableView.ViewData do
//  begin
//    if Records[DataController.FocusedRecordIndex].Expanded = true then Records[DataController.FocusedRecordIndex].Expanded :=false;
//  end;
end;

procedure TtesteditDM.TestModDataSetBeforePost(DataSet: TDataSet);
begin
  if TestModDataSet.FBN('ORD_NUM').IsNull then TestModDataSet.FBN('ORD_NUM').AsInteger := TestModDataSet.RecNo;
end;

procedure TtesteditDM.SetOldAskToArchive(ExAsk_ID, ExSciens_ID:integer);
begin
{  ChangeAsksDataSet.Locate('ID_ASK', ExAsk_ID, []);
  ChangeAsksDataSet.Edit;
  ChangeAsksDataSet.FBN('ARCHIVE').AsInteger := yes;
  ChangeAsksDataSet.Post;}
  TmpFibQuery.SQL.Text := 'UPDATE TESTASKS SET ARCHIVE=1 WHERE ID_ASK='+inttostr(ExAsk_ID);
  //set query options
  testeditdm.TmpFIBQuery.Options := [qoStartTransaction, qoAutoCommit];
  testeditdm.TmpFibQuery.ExecQuery;
  TmpFibQuery.Close;
end;
{----create clone of paper with different answer order----------}
procedure TtesteditDM.ClonePaperPerform;
var
  tmpAskCount, tmpAnswCount, i : integer;
  tmpstr : string;
  tmpAskId, tmpSciensId, tmpTestSectId, tmpAnswCountArr : Array of integer;
  CurrRightAnswerOrder : TStrings;
begin
  //init tmp variables
  CurrRightAnswerOrder := TStringList.Create;//prepare string list
  tmpAskCount := OffAsksDataSet.RecordCountFromSrv;
  //TODO:change to SQL conditions
  //set array limit
  setlength(tmpAskId, tmpAskCount);
  setlength(tmpSciensId, tmpAskCount);
  setlength(tmpTestSectId, tmpAskCount);
  setlength(tmpAnswCountArr, tmpAskCount);
  OffAsksDataSet.First; i:= 0;
  //read all asks from current paper
  while not OffAsksDataSet.Eof do
  begin
    //get static data
    tmpAskId[i] := OffAsksDataSet.FBN('ASK_ID').AsInteger;
    tmpSciensId[i] := OffAsksDataSet.FBN('SCIENS_ID').AsInteger;
    tmpTestSectId[i] := OffAsksDataSet.FBN('TESTSECT_ID').AsInteger;
    //get answer count
    CurrRightAnswerOrder.Clear;
    CurrRightAnswerOrder.CommaText := OffAsksDataSet.FBN('RIGHTORDER').AsString;
    tmpAnswCountArr[i] := CurrRightAnswerOrder.Count;
    //goto next record
    inc(i);
    OffAsksDataSet.Next;
  end;
  //insert new record in the paper table
  tmpstr := OffLineVarDefName;
  tmpstr := tmpstr + '-'+OffPapersDataSet.FBN('ID_OFFEXAM').AsString;
  OffPapersDataSet.CloneCurRecord(['ID_OFFEXAM']);
  OffPapersDataSet.FBN('VAR_Name').AsString := tmpstr+'-clone';
  OffPapersDataSet.FieldByName('EXAM_DATE').AsDateTime := today;
  OffPapersDataSet.Post;
  //main cycle - write data for the new paper ask list
  for i := 0 to tmpAskCount-1 do
  begin
    //create new answer order for the current paper
    SetAnswerOrder(tmpAnswCountArr[i], CurrRightAnswerOrder);
    //write data
    OffAsksDataSet.Append;
    OffAsksDataSet.FBN('ASK_ID').AsInteger := tmpAskId[i];
    OffAsksDataSet.FBN('SCIENS_ID').AsInteger := tmpSciensId[i];
    OffAsksDataSet.FBN('TESTSECT_ID').AsInteger := tmpTestSectId[i];
    OffAsksDataSet.FBN('RIGHTORDER').AsString := CurrRightAnswerOrder.CommaText;
    OffAsksDataSet.Post;
  end;
  //make sorting
  OffPapersDataSet.DoSort(['ID_OFFEXAM'],[true]);
end;

procedure TtesteditDM.CheckCreateNewAsksList(var result: boolean);
var
  err_list : tstrings;
  RealAskCount, errCount : integer;
begin
  //init error list
  err_list := tstringlist.Create;
  err_list.Append('Виявлено наступні помилки:');
  //prepare datasets for analysis
  errCount := 0;
  TSect2ScDataSet.WaitEndMasterScroll := false;
  TestModDataSet.First;
  while not TestModDataSet.Eof do
  //process all test modules
  begin
    if TSect2ScDataSet.IsEmpty then
    begin
      inc(errCount);
      err_list.Append(inttostr(errCount)+'. Для тестового модуля "'+TestModDataSet.FBN('SECT_TITLE').AsString+'" відсутній список тематичних модулів');
    end
    else
    begin
      //prepare calculation of the total ask count
      RealAskCount :=0;
      TSect2ScDataSet.First;
      while not TSect2ScDataSet.Eof do
      //process all test module sections
      begin
        RealAskCount := RealAskCount + TSect2ScDataSet.FBN('ASKCOUNT').AsInteger;
        TSect2ScDataSet.Next;
      end;
      if TestModDataSet.FBN('ASKS_TOTAL').AsInteger <> RealAskCount then
      begin
        inc(errCount);
        err_list.Append(inttostr(errCount)+'. Загальна кількість питань тестового модуля "'+TestModDataSet.FBN('SECT_TITLE').AsString+'" відрізняється від суми кількості питань складових тематичних модулів');
      end;
    end;
    TestModDataSet.Next; //goto next record
  end;
  err_list.Append('Всього помилок: '+inttostr(errCount));
  if errCount <>0 then
  begin
    result := false;
    MessageDlg(err_list.Text, mtError, [mbOk], 0);
  end
  else result := true;
  //restore datasets options
  TSect2ScDataSet.WaitEndMasterScroll := true;
  TestModDataSet.First;
  //delete arror list
  err_list.Free;
end;

procedure TtesteditDM.OffPapersDataSetAfterRefresh(DataSet: TDataSet);
begin
  ChekOffPapersDataSet;
end;

procedure TtesteditDM.SubjTestDataSetEndScroll(DataSet: TDataSet);
begin
  ChekOffPapersDataSet;
end;

procedure TtesteditDM.LibUserDataSetAfterScroll(DataSet: TDataSet);
begin
  basevar.settings.UserOldSQLRole := LibUserDataSet.FieldByName('userrole_search').AsString;
end;

{----------implement update count of the ask for each sciens------------------}
procedure TtesteditDM.UpdateAskCountPerSciens(tmpsciensid:integer);
var
  tmpSQL, tmpsciensstr : string;
begin
  tmpsciensstr := inttostr(tmpsciensid);
  if tmpsciensid = 0 then  //all sciens
    tmpSQL := 'update sciens set sciens.ask_count = (select count( testasks.id_ask ) count_of_id_ask from testasks where testasks.sciens_id = sciens.id_sciens);'
  else  //selected sciens only
    tmpSQL := 'update sciens set sciens.ask_count = (select count( testasks.id_ask ) count_of_id_ask from testasks where testasks.sciens_id = '+tmpsciensstr+') where sciens.id_sciens = '+tmpsciensstr+';';
  //set query options
  TmpFibQuery.SQL.Text := tmpSQL;
  TmpFIBQuery.Options := [qoStartTransaction, qoAutoCommit];
  TmpFibQuery.ExecQuery;
  TmpFibQuery.Close;
end;
{--------------search database for the invalid ask by code-----------------}
procedure TtesteditDM.InvalidAskSearch(AskSearchID:integer; var SrcSciensId:integer; var SearchRes:boolean);
begin
  //define query
  TmpFibQuery.SQL.Text := 'SELECT SCIENS_ID from TESTASKS WHERE ID_ASK='+inttostr(AskSearchID);
  //set query options
  TmpFIBQuery.Options := [qoStartTransaction];
  //execute
  TmpFibQuery.Prepare;
  TmpFibQuery.ExecQuery;
  //read data
  SrcSciensId := TmpFibQuery.FieldByName('SCIENS_ID').AsInteger;
  // SrcSciensId = 0 in not anyone record returned
  if SrcSciensId > 0 then SearchRes := true //found!
  else SearchRes := false; //not found!
  TmpFibQuery.Close;
end;
{--------------2013 - search database for the ask without correct answer-----------------}
procedure TtesteditDM.SearchAskWithoutCorrectAnswer( SrcSciensId:string; var FoundRes:Variant; var SearchRes:boolean);
var
  tmpSQL : string;
  i : integer;
begin
  SearchRes := false;
  //define query
  tmpSQL := 'SELECT testasks.id_ask FROM testasks INNER JOIN answers ON (testasks.id_ask= answers.ask_id)';
  tmpSQL := tmpSQL + 'WHERE testasks.sciens_id = '+SrcSciensId;
  tmpSQL := tmpSQL + 'GROUP BY testasks.id_ask HAVING sum( answers.weight ) =0';
  //set query to FIB component
  TmpFibQuery.SQL.Text := tmpSQL;
  //set query options
  TmpFIBQuery.Options := [qoStartTransaction];
  TmpFIBQuery.GoToFirstRecordOnExecute := true;
  //execute
  TmpFibQuery.Prepare;
  TmpFibQuery.ExecQuery;
  //count records
  i := 0;
  while not TmpFibQuery.Eof do
  begin
    TmpFibQuery.Next;
    inc(i);
  end;
  TmpFibQuery.Close;   //close  query
  if i > 0 then  //incorrect records found!
  begin
    //reopen query
    TmpFibQuery.ExecQuery;
    //read data
    SearchRes := true;
    FoundRes := VarArrayCreate([0,i-1], varInteger);
    i := 0;
    while not TmpFibQuery.Eof do
    begin
      FoundRes[i] := TmpFibQuery.FieldByName('ID_ASK').AsInteger;
      TmpFibQuery.Next;
      inc(i);
    end;
    TmpFibQuery.Close;
  end;
end;
{--------------2013- search database for the ask that have an incorrect answer count-----------------}
procedure TtesteditDM.SearchAskWithIncorrectAnswersCount(SrcSciensId:string; CorrAnswCount:string; var FoundRes:Variant; var SearchRes:boolean);
var
  tmpSQL : string;
  i : integer;
begin
  SearchRes := false;
  //define query
  //tmpSQL := 'SELECT testasks.id_ask FROM testasks INNER JOIN answers ON (testasks.id_ask= answers.ask_id)';
  tmpSQL := 'SELECT testasks.id_ask FROM testasks LEFT JOIN answers ON (testasks.id_ask= answers.ask_id)'; {2014-06-30}
  tmpSQL := tmpSQL + 'WHERE testasks.sciens_id = '+SrcSciensId;
  tmpSQL := tmpSQL + 'GROUP BY testasks.id_ask HAVING count( answers.id_answer ) <> '+CorrAnswCount;
  //set query to FIB component
  TmpFibQuery.SQL.Text := tmpSQL;
  //set query options
  TmpFIBQuery.Options := [qoStartTransaction];
  TmpFIBQuery.GoToFirstRecordOnExecute := true;
  //execute
  TmpFibQuery.Prepare;
  TmpFibQuery.ExecQuery;
  //count records
  i := 0;
  while not TmpFibQuery.Eof do
  begin
    TmpFibQuery.Next;
    inc(i);
  end;
  TmpFibQuery.Close;    //close  query
  if i > 0 then //incorrect records found!
  begin
    //reopen query
    TmpFibQuery.ExecQuery;
    //read data
    SearchRes := true;
    FoundRes := VarArrayCreate([0,i-1], varInteger);
    i := 0;
    while not TmpFibQuery.Eof do
    begin
      FoundRes[i] := TmpFibQuery.FieldByName('ID_ASK').AsInteger;
      TmpFibQuery.Next;
      inc(i);
    end;
    TmpFibQuery.Close;
  end;
end;
{-----------export the question answers as a html text then open it as a Word document-----------------}
procedure TtesteditDM.PrintQuestionAnswersToHTML(filename:string);
const
  html_col_count=10; //default column count
var
  tmphtml : TStrings;
  chr_code_A, currask, asknum, answnum : integer;
  tmpanswchar : string;
begin
  //set progressbar
  mainform.PgBar1.Step:=1;
  mainform.PgBar1.Min := 0;
  mainform.PgBar1.Max := TestAskDataSet.RecordCountFromSrv;
  mainform.PgBar1.Position := mainform.PgBar1.Min;
  //prepare HTML document header
  tmphtml := TStringList.Create;//prepare string list
  tmphtml.Append('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">');
  tmphtml.Append('<html><head>');
//  tmphtml.Append('<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-5">');
  tmphtml.Append('<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">');
  tmphtml.Append('<meta http-equiv="Content-Language" content="uk">');
  tmphtml.Append('</head><body>');
  //put title data
  tmphtml.Append('<center><h4>Назва наукового напрямку (модуля):</h4></center>');
  tmphtml.Append('<center><h3>'+SciensDataSet.fbn('SC_NAME').AsString+'</h3></center>');
  tmphtml.Append('<center><h4>Опис:</h4></center>');
  tmphtml.Append('<center><h4>'+SciensDataSet.fbn('SC_DESCR').AsString+'</h4></center>');
  tmphtml.Append('<center><h4>Мова: '+SciensDataSet.fbn('lanng_search').AsString+'. Семестр: '+SciensDataSet.fbn('SEMESTR').AsString+'</h4></center>');
  tmphtml.Append('<center><h2>Перелік правильних відповідей:</h2></center>');
  //start HTML table
//  tmphtml.Append('<table>');
  //start HTML ordered list
  tmphtml.Append('<ol>');
  //set defaults
  chr_code_A := ord('A'); //ord('A')=65
  //define query
  TmpFibQuery.SQL.Text := 'SELECT testasks.id_ask, testasks.SCIENS_ID, answers.WEIGHT from TESTASKS inner join answers on (testasks.id_ask = answers.ask_id)WHERE testasks.sciens_ID = '+SciensDataSet.fbn('ID_sciens').AsString;
  //set query options
  TmpFIBQuery.Options := [qoStartTransaction];
  //execute
  TmpFibQuery.Prepare;
  TmpFibQuery.ExecQuery;
  //currask := TmpFibQuery.FieldByName('id_ask').AsInteger;
  currask := 0;
  answnum := 0;
  asknum:=0;
  //read data
  while not TmpFibQuery.Eof do
  begin           {2}
    if TmpFibQuery.FieldByName('id_ask').AsInteger <> currask then
    begin
      if asknum >0 then
      begin
//        tmphtml.Append('<tr><td>');
        tmphtml.Append('<li>');
        tmphtml.Append(tmpanswchar);
//        tmphtml.Append('</tr></td>');
        tmphtml.Append('</li>');
      end;
      currask := TmpFibQuery.FieldByName('id_ask').AsInteger;
      inc(asknum);
      answnum := 0;
      //tmpanswchar := inttostr(asknum)+'.(-)';
      tmpanswchar := '-';
      mainform.ProgressBarStepIt(1);
    end;
    inc(answnum);
    if TmpFibQuery.FieldByName('WEIGHT').AsInteger <>0 then
    begin
      //tmpanswchar := inttostr(asknum)+ '.('+chr(chr_code_A+answnum-1)+')';
      tmpanswchar := chr(chr_code_A+answnum-1);
    end;
    //put answer text in the HTML

     TmpFibQuery.Next;
  end;
  //put last question answer
//        tmphtml.Append('<tr><td>');
  tmphtml.Append('<li>');
  tmphtml.Append(tmpanswchar);
//        tmphtml.Append('</tr></td>');
  tmphtml.Append('</li>');
  //delete query info
  TmpFibQuery.Close;
  //end of the HTML table
  //tmphtml.Append('</table>');
   //end of the HTML ordered list
  tmphtml.Append('</ol>');
  //HTML document footer
  tmphtml.Append('</body></html>');//end
  //save HTML
  tmphtml.SaveToFile(filename);
  //delete tmp variable
  tmphtml.Free;
  mainform.PgBar1.Position := mainform.PgBar1.Min;
end;
{------------retreive data from the selected sciens (module) to the memory table-------------}
procedure TtesteditDM.PrepareCurrentSciensAsksList(strSciensID:string; ShowAnswers:boolean; ShowArchived:boolean);
var
  A_char_code, currask, asknum, answnum :integer;
  tmpstr1, tmpSQL, tmpsciensstr : string;
begin
  //clear existing paper data
  RedyPaperMemTable.EmptyTable;
  A_char_code := Ord ('A');
  //set progressbar
  mainform.SetProgressBar(0, TestAskDataSet.RecordCountFromSrv, 1, 0);
  //define query
  ///  TmpFibQuery.SQL.Text := 'SELECT testasks.id_ask, testasks.SCIENS_ID, testasks.asktext2, answers.answertext1, answers.weight from TESTASKS inner join answers on (testasks.id_ask = answers.ask_id)WHERE testasks.sciens_ID = '+SciensDataSet.fbn('ID_sciens').AsString+'Order by testasks.id_ask;';
  if ShowArchived then TmpFibQuery.SQL.Text := 'SELECT testasks.id_ask, testasks.SCIENS_ID, testasks.asktext2, answers.answertext1, answers.weight from TESTASKS left join answers on (testasks.id_ask = answers.ask_id) WHERE testasks.sciens_ID = '+strSciensID+';'
  else TmpFibQuery.SQL.Text := 'SELECT testasks.id_ask, testasks.SCIENS_ID, testasks.asktext2, answers.answertext1, answers.weight from TESTASKS left join answers on (testasks.id_ask = answers.ask_id) WHERE (testasks.sciens_ID = '+strSciensID+')AND(testasks.Archive = 0);'; //did not show archive
  //set query options
  TmpFIBQuery.Options := [qoStartTransaction];
  //execute
  TmpFibQuery.Prepare;
  TmpFibQuery.ExecQuery;
  //currask := TmpFibQuery.FieldByName('id_ask').AsInteger;
  currask := 0;
  answnum := 0;
  asknum:=0;
  //read data from query resultset
  while not TmpFibQuery.Eof do
  begin           {2}
    if TmpFibQuery.FieldByName('id_ask').AsInteger <> currask then
    begin
      currask := TmpFibQuery.FieldByName('id_ask').AsInteger;
      inc(asknum);
      answnum := 0;
      RedyPaperMemTable.Append;
      RedyPaperMemTable.FieldByName('RecPrefix').AsString := inttostr(asknum)+'.';
      RedyPaperMemTable.FieldByName('RecData').AsVariant := TmpFibQuery.FieldByName('ASKTEXT2').AsVariant;
      RedyPaperMemTable.FieldByName('ASK_ID').AsInteger := currask;  {+16/02/2013}
      RedyPaperMemTable.Post;
      mainform.ProgressBarStepIt(1);
    end;
    inc(answnum);
    tmpstr1 := chr(A_char_code+answnum-1);
          RedyPaperMemTable.Append;
          RedyPaperMemTable.FieldByName('RecPrefix').AsString := '';
          if (ShowAnswers=true) and (TmpFibQuery.FieldByName('weight').AsInteger > 0) then RedyPaperMemTable.FieldByName('RecPrefix2').AsString := tmpstr1+'. *'
          else RedyPaperMemTable.FieldByName('RecPrefix2').AsString := tmpstr1+'. ';
          RedyPaperMemTable.FieldByName('RecData').AsVariant :=TmpFibQuery.FieldByName('ANSWERTEXT1').AsVariant;
          RedyPaperMemTable.Post;
     TmpFibQuery.Next;
  end;
  TmpFibQuery.Close;
  //clear progressbar position
  mainform.ProgressBarPosition(0);
end;
{===============================================================================}
{-----disale buttons in the Advanced Test Modules Edit dialog box --------------}
procedure TtesteditDM.FullSciensDataSet1AfterScroll(DataSet: TDataSet);
begin
  if FullSciensDataSet1.IsEmpty then AdvTestModEditor.AddModuleSBut.enabled := false
  else AdvTestModEditor.AddModuleSBut.enabled := true;
end;

procedure TtesteditDM.FullSciensDataSet1AfterOpen(DataSet: TDataSet);
begin
  if FullSciensDataSet1.IsEmpty then AdvTestModEditor.AddModuleSBut.enabled := false
  else AdvTestModEditor.AddModuleSBut.enabled := true;
end;

procedure TtesteditDM.FullSciensDataSet1AfterFetchRecord(
  FromQuery: TFIBQuery; RecordNumber: Integer; var StopFetching: Boolean);
begin
  if FullSciensDataSet1.IsEmpty then AdvTestModEditor.AddModuleSBut.enabled := false
  else AdvTestModEditor.AddModuleSBut.enabled := true;
end;

end.
