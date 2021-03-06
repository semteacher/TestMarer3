
{***************************************************************************************************************************}
{                                                                                                                           }
{                                                     XML Data Binding                                                      }
{                                                                                                                           }
{         Generated on: 27.04.2010 19:12:34                                                                                 }
{       Generated from: D:\Delphi\moodlexml\test-medical_informatics_2year_-_med_-01-network_technology-27042010-1754.xml   }
{   Settings stored in: D:\Delphi\moodlexml\MoodleXML.xdb                                                                   }
{                                                                                                                           }
{***************************************************************************************************************************}

unit MoodleXML;

interface

uses xmldom, XMLDoc, XMLIntf;

const
  //question type list
  qsttype_multichoice = 'multichoice';
  qsttype_category = 'category';

type

{ Forward Decls }

  IXMLQuizType = interface;
  IXMLQuestionType = interface;
  IXMLCategoryType = interface;
  IXMLNameType = interface;
  IXMLQuestiontextType = interface;
  IXMLGeneralfeedbackType = interface;
  IXMLCorrectfeedbackType = interface;
  IXMLPartiallycorrectfeedbackType = interface;
  IXMLIncorrectfeedbackType = interface;
  IXMLAnswerType = interface;
  IXMLAnswerTypeList = interface;
  IXMLFeedbackType = interface;
  IXMLIntegerList = interface;

{ IXMLQuizType }

  IXMLQuizType = interface(IXMLNodeCollection)
    ['{A758F18B-4970-4EA3-8110-58FA6E2036A9}']
    { Property Accessors }
    function Get_Question(Index: Integer): IXMLQuestionType;
    { Methods & Properties }
    function Add: IXMLQuestionType;
    function Insert(const Index: Integer): IXMLQuestionType;
    property Question[Index: Integer]: IXMLQuestionType read Get_Question; default;
  end;

{ IXMLQuestionType }

  IXMLQuestionType = interface(IXMLNode)
    ['{F8DE97FD-6AC2-411B-9F21-0E0167C05508}']
    { Property Accessors }
    function Get_Type_: WideString;
    function Get_Category: IXMLCategoryType;
    function Get_Name: IXMLNameType;
    function Get_Questiontext: IXMLQuestiontextType;
    function Get_Image: WideString;
    function Get_Generalfeedback: IXMLGeneralfeedbackType;
    function Get_Defaultgrade: Integer;
    function Get_Penalty: WideString;
    function Get_Hidden: Integer;
    function Get_Shuffleanswers: IXMLIntegerList;
    function Get_Single: WideString;
    function Get_Correctfeedback: IXMLCorrectfeedbackType;
    function Get_Partiallycorrectfeedback: IXMLPartiallycorrectfeedbackType;
    function Get_Incorrectfeedback: IXMLIncorrectfeedbackType;
    function Get_Answernumbering: WideString;
    function Get_Answer: IXMLAnswerTypeList;
    procedure Set_Type_(Value: WideString);
    procedure Set_Image(Value: WideString);
    procedure Set_Defaultgrade(Value: Integer);
    procedure Set_Penalty(Value: WideString);
    procedure Set_Hidden(Value: Integer);
    procedure Set_Single(Value: WideString);
    procedure Set_Answernumbering(Value: WideString);
    { Methods & Properties }
    property Type_: WideString read Get_Type_ write Set_Type_;
    property Category: IXMLCategoryType read Get_Category;
    property Name: IXMLNameType read Get_Name;
    property Questiontext: IXMLQuestiontextType read Get_Questiontext;
    property Image: WideString read Get_Image write Set_Image;
    property Generalfeedback: IXMLGeneralfeedbackType read Get_Generalfeedback;
    property Defaultgrade: Integer read Get_Defaultgrade write Set_Defaultgrade;
    property Penalty: WideString read Get_Penalty write Set_Penalty;
    property Hidden: Integer read Get_Hidden write Set_Hidden;
    property Shuffleanswers: IXMLIntegerList read Get_Shuffleanswers;
    property Single: WideString read Get_Single write Set_Single;
    property Correctfeedback: IXMLCorrectfeedbackType read Get_Correctfeedback;
    property Partiallycorrectfeedback: IXMLPartiallycorrectfeedbackType read Get_Partiallycorrectfeedback;
    property Incorrectfeedback: IXMLIncorrectfeedbackType read Get_Incorrectfeedback;
    property Answernumbering: WideString read Get_Answernumbering write Set_Answernumbering;
    property Answer: IXMLAnswerTypeList read Get_Answer;
  end;

{ IXMLCategoryType }

  IXMLCategoryType = interface(IXMLNode)
    ['{63CD2C9E-4C9F-4F9B-A866-4EF8AD68C268}']
    { Property Accessors }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
    { Methods & Properties }
    property Text: WideString read Get_Text write Set_Text;
  end;

{ IXMLNameType }

  IXMLNameType = interface(IXMLNode)
    ['{EDFFE785-1513-4720-9EA5-BFA43F2DD3D3}']
    { Property Accessors }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
    { Methods & Properties }
    property Text: WideString read Get_Text write Set_Text;
  end;

{ IXMLQuestiontextType }

  IXMLQuestiontextType = interface(IXMLNode)
    ['{89096934-6EEE-419C-97E2-3331DC72E732}']
    { Property Accessors }
    function Get_Format: WideString;
    function Get_Text: WideString;
    procedure Set_Format(Value: WideString);
    procedure Set_Text(Value: WideString);
    { Methods & Properties }
    property Format: WideString read Get_Format write Set_Format;
    property Text: WideString read Get_Text write Set_Text;
  end;

{ IXMLGeneralfeedbackType }

  IXMLGeneralfeedbackType = interface(IXMLNode)
    ['{88B89AC1-61A9-4D66-8358-43681A12A0A4}']
    { Property Accessors }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
    { Methods & Properties }
    property Text: WideString read Get_Text write Set_Text;
  end;

{ IXMLCorrectfeedbackType }

  IXMLCorrectfeedbackType = interface(IXMLNode)
    ['{DCC16216-5D2A-4322-8A38-46158F789C4B}']
    { Property Accessors }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
    { Methods & Properties }
    property Text: WideString read Get_Text write Set_Text;
  end;

{ IXMLPartiallycorrectfeedbackType }

  IXMLPartiallycorrectfeedbackType = interface(IXMLNode)
    ['{5DA5C280-5B41-437C-B53C-A59E77C5541E}']
    { Property Accessors }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
    { Methods & Properties }
    property Text: WideString read Get_Text write Set_Text;
  end;

{ IXMLIncorrectfeedbackType }

  IXMLIncorrectfeedbackType = interface(IXMLNode)
    ['{3E9079CC-262C-465E-8C33-93D7E2B690EC}']
    { Property Accessors }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
    { Methods & Properties }
    property Text: WideString read Get_Text write Set_Text;
  end;

{ IXMLAnswerType }

  IXMLAnswerType = interface(IXMLNode)
    ['{3B3CF849-9AAC-44C2-8767-CAEF0A4692EA}']
    { Property Accessors }
    function Get_Fraction: Integer;
    function Get_Text: WideString;
    function Get_Feedback: IXMLFeedbackType;
    procedure Set_Fraction(Value: Integer);
    procedure Set_Text(Value: WideString);
    { Methods & Properties }
    property Fraction: Integer read Get_Fraction write Set_Fraction;
    property Text: WideString read Get_Text write Set_Text;
    property Feedback: IXMLFeedbackType read Get_Feedback;
  end;

{ IXMLAnswerTypeList }

  IXMLAnswerTypeList = interface(IXMLNodeCollection)
    ['{4A80DC98-D859-4C5D-BA0B-9D3BAFFC915E}']
    { Methods & Properties }
    function Add: IXMLAnswerType;
    function Insert(const Index: Integer): IXMLAnswerType;
    function Get_Item(Index: Integer): IXMLAnswerType;
    property Items[Index: Integer]: IXMLAnswerType read Get_Item; default;
  end;

{ IXMLFeedbackType }

  IXMLFeedbackType = interface(IXMLNode)
    ['{364DFAF7-CDCD-48BE-B1F7-7E848C178432}']
    { Property Accessors }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
    { Methods & Properties }
    property Text: WideString read Get_Text write Set_Text;
  end;

{ IXMLIntegerList }

  IXMLIntegerList = interface(IXMLNodeCollection)
    ['{1161CD73-BF79-4693-B745-77D698DD44E9}']
    { Methods & Properties }
    function Add(const Value: Integer): IXMLNode;
    function Insert(const Index: Integer; const Value: Integer): IXMLNode;
    function Get_Item(Index: Integer): Integer;
    property Items[Index: Integer]: Integer read Get_Item; default;
  end;

{ Forward Decls }

  TXMLQuizType = class;
  TXMLQuestionType = class;
  TXMLCategoryType = class;
  TXMLNameType = class;
  TXMLQuestiontextType = class;
  TXMLGeneralfeedbackType = class;
  TXMLCorrectfeedbackType = class;
  TXMLPartiallycorrectfeedbackType = class;
  TXMLIncorrectfeedbackType = class;
  TXMLAnswerType = class;
  TXMLAnswerTypeList = class;
  TXMLFeedbackType = class;
  TXMLIntegerList = class;

{ TXMLQuizType }

  TXMLQuizType = class(TXMLNodeCollection, IXMLQuizType)
  protected
    { IXMLQuizType }
    function Get_Question(Index: Integer): IXMLQuestionType;
    function Add: IXMLQuestionType;
    function Insert(const Index: Integer): IXMLQuestionType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLQuestionType }

  TXMLQuestionType = class(TXMLNode, IXMLQuestionType)
  private
    FShuffleanswers: IXMLIntegerList;
    FAnswer: IXMLAnswerTypeList;
  protected
    { IXMLQuestionType }
    function Get_Type_: WideString;
    function Get_Category: IXMLCategoryType;
    function Get_Name: IXMLNameType;
    function Get_Questiontext: IXMLQuestiontextType;
    function Get_Image: WideString;
    function Get_Generalfeedback: IXMLGeneralfeedbackType;
    function Get_Defaultgrade: Integer;
    function Get_Penalty: WideString;
    function Get_Hidden: Integer;
    function Get_Shuffleanswers: IXMLIntegerList;
    function Get_Single: WideString;
    function Get_Correctfeedback: IXMLCorrectfeedbackType;
    function Get_Partiallycorrectfeedback: IXMLPartiallycorrectfeedbackType;
    function Get_Incorrectfeedback: IXMLIncorrectfeedbackType;
    function Get_Answernumbering: WideString;
    function Get_Answer: IXMLAnswerTypeList;
    procedure Set_Type_(Value: WideString);
    procedure Set_Image(Value: WideString);
    procedure Set_Defaultgrade(Value: Integer);
    procedure Set_Penalty(Value: WideString);
    procedure Set_Hidden(Value: Integer);
    procedure Set_Single(Value: WideString);
    procedure Set_Answernumbering(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCategoryType }

  TXMLCategoryType = class(TXMLNode, IXMLCategoryType)
  protected
    { IXMLCategoryType }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
  end;

{ TXMLNameType }

  TXMLNameType = class(TXMLNode, IXMLNameType)
  protected
    { IXMLNameType }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
  end;

{ TXMLQuestiontextType }

  TXMLQuestiontextType = class(TXMLNode, IXMLQuestiontextType)
  protected
    { IXMLQuestiontextType }
    function Get_Format: WideString;
    function Get_Text: WideString;
    procedure Set_Format(Value: WideString);
    procedure Set_Text(Value: WideString);
  end;

{ TXMLGeneralfeedbackType }

  TXMLGeneralfeedbackType = class(TXMLNode, IXMLGeneralfeedbackType)
  protected
    { IXMLGeneralfeedbackType }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
  end;

{ TXMLCorrectfeedbackType }

  TXMLCorrectfeedbackType = class(TXMLNode, IXMLCorrectfeedbackType)
  protected
    { IXMLCorrectfeedbackType }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
  end;

{ TXMLPartiallycorrectfeedbackType }

  TXMLPartiallycorrectfeedbackType = class(TXMLNode, IXMLPartiallycorrectfeedbackType)
  protected
    { IXMLPartiallycorrectfeedbackType }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
  end;

{ TXMLIncorrectfeedbackType }

  TXMLIncorrectfeedbackType = class(TXMLNode, IXMLIncorrectfeedbackType)
  protected
    { IXMLIncorrectfeedbackType }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
  end;

{ TXMLAnswerType }

  TXMLAnswerType = class(TXMLNode, IXMLAnswerType)
  protected
    { IXMLAnswerType }
    function Get_Fraction: Integer;
    function Get_Text: WideString;
    function Get_Feedback: IXMLFeedbackType;
    procedure Set_Fraction(Value: Integer);
    procedure Set_Text(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAnswerTypeList }

  TXMLAnswerTypeList = class(TXMLNodeCollection, IXMLAnswerTypeList)
  protected
    { IXMLAnswerTypeList }
    function Add: IXMLAnswerType;
    function Insert(const Index: Integer): IXMLAnswerType;
    function Get_Item(Index: Integer): IXMLAnswerType;
  end;

{ TXMLFeedbackType }

  TXMLFeedbackType = class(TXMLNode, IXMLFeedbackType)
  protected
    { IXMLFeedbackType }
    function Get_Text: WideString;
    procedure Set_Text(Value: WideString);
  end;

{ TXMLIntegerList }

  TXMLIntegerList = class(TXMLNodeCollection, IXMLIntegerList)
  protected
    { IXMLIntegerList }
    function Add(const Value: Integer): IXMLNode;
    function Insert(const Index: Integer; const Value: Integer): IXMLNode;
    function Get_Item(Index: Integer): Integer;
  end;

{ Global Functions }

function Getquiz(Doc: IXMLDocument): IXMLQuizType;
function Loadquiz(const FileName: WideString): IXMLQuizType;
function Newquiz: IXMLQuizType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getquiz(Doc: IXMLDocument): IXMLQuizType;
begin
  Result := Doc.GetDocBinding('quiz', TXMLQuizType, TargetNamespace) as IXMLQuizType;
end;

function Loadquiz(const FileName: WideString): IXMLQuizType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('quiz', TXMLQuizType, TargetNamespace) as IXMLQuizType;
end;

function Newquiz: IXMLQuizType;
begin
  Result := NewXMLDocument.GetDocBinding('quiz', TXMLQuizType, TargetNamespace) as IXMLQuizType;
end;

{ TXMLQuizType }

procedure TXMLQuizType.AfterConstruction;
begin
  RegisterChildNode('question', TXMLQuestionType);
  ItemTag := 'question';
  ItemInterface := IXMLQuestionType;
  inherited;
end;

function TXMLQuizType.Get_Question(Index: Integer): IXMLQuestionType;
begin
  Result := List[Index] as IXMLQuestionType;
end;

function TXMLQuizType.Add: IXMLQuestionType;
begin
  Result := AddItem(-1) as IXMLQuestionType;
end;

function TXMLQuizType.Insert(const Index: Integer): IXMLQuestionType;
begin
  Result := AddItem(Index) as IXMLQuestionType;
end;

{ TXMLQuestionType }

procedure TXMLQuestionType.AfterConstruction;
begin
  RegisterChildNode('category', TXMLCategoryType);
  RegisterChildNode('name', TXMLNameType);
  RegisterChildNode('questiontext', TXMLQuestiontextType);
  RegisterChildNode('generalfeedback', TXMLGeneralfeedbackType);
  RegisterChildNode('correctfeedback', TXMLCorrectfeedbackType);
  RegisterChildNode('partiallycorrectfeedback', TXMLPartiallycorrectfeedbackType);
  RegisterChildNode('incorrectfeedback', TXMLIncorrectfeedbackType);
  RegisterChildNode('answer', TXMLAnswerType);
  FShuffleanswers := CreateCollection(TXMLIntegerList, IXMLNode, 'shuffleanswers') as IXMLIntegerList;
  FAnswer := CreateCollection(TXMLAnswerTypeList, IXMLAnswerType, 'answer') as IXMLAnswerTypeList;
  inherited;
end;

function TXMLQuestionType.Get_Type_: WideString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLQuestionType.Set_Type_(Value: WideString);
begin
  SetAttribute('type', Value);
end;

function TXMLQuestionType.Get_Category: IXMLCategoryType;
begin
  Result := ChildNodes['category'] as IXMLCategoryType;
end;

function TXMLQuestionType.Get_Name: IXMLNameType;
begin
  Result := ChildNodes['name'] as IXMLNameType;
end;

function TXMLQuestionType.Get_Questiontext: IXMLQuestiontextType;
begin
  Result := ChildNodes['questiontext'] as IXMLQuestiontextType;
end;

function TXMLQuestionType.Get_Image: WideString;
begin
  Result := ChildNodes['image'].Text;
end;

procedure TXMLQuestionType.Set_Image(Value: WideString);
begin
  ChildNodes['image'].NodeValue := Value;
end;

function TXMLQuestionType.Get_Generalfeedback: IXMLGeneralfeedbackType;
begin
  Result := ChildNodes['generalfeedback'] as IXMLGeneralfeedbackType;
end;

function TXMLQuestionType.Get_Defaultgrade: Integer;
begin
  Result := ChildNodes['defaultgrade'].NodeValue;
end;

procedure TXMLQuestionType.Set_Defaultgrade(Value: Integer);
begin
  ChildNodes['defaultgrade'].NodeValue := Value;
end;

function TXMLQuestionType.Get_Penalty: WideString;
begin
  Result := ChildNodes['penalty'].Text;
end;

procedure TXMLQuestionType.Set_Penalty(Value: WideString);
begin
  ChildNodes['penalty'].NodeValue := Value;
end;

function TXMLQuestionType.Get_Hidden: Integer;
begin
  Result := ChildNodes['hidden'].NodeValue;
end;

procedure TXMLQuestionType.Set_Hidden(Value: Integer);
begin
  ChildNodes['hidden'].NodeValue := Value;
end;

function TXMLQuestionType.Get_Shuffleanswers: IXMLIntegerList;
begin
  Result := FShuffleanswers;
end;

function TXMLQuestionType.Get_Single: WideString;
begin
  Result := ChildNodes['single'].Text;
end;

procedure TXMLQuestionType.Set_Single(Value: WideString);
begin
  ChildNodes['single'].NodeValue := Value;
end;

function TXMLQuestionType.Get_Correctfeedback: IXMLCorrectfeedbackType;
begin
  Result := ChildNodes['correctfeedback'] as IXMLCorrectfeedbackType;
end;

function TXMLQuestionType.Get_Partiallycorrectfeedback: IXMLPartiallycorrectfeedbackType;
begin
  Result := ChildNodes['partiallycorrectfeedback'] as IXMLPartiallycorrectfeedbackType;
end;

function TXMLQuestionType.Get_Incorrectfeedback: IXMLIncorrectfeedbackType;
begin
  Result := ChildNodes['incorrectfeedback'] as IXMLIncorrectfeedbackType;
end;

function TXMLQuestionType.Get_Answernumbering: WideString;
begin
  Result := ChildNodes['answernumbering'].Text;
end;

procedure TXMLQuestionType.Set_Answernumbering(Value: WideString);
begin
  ChildNodes['answernumbering'].NodeValue := Value;
end;

function TXMLQuestionType.Get_Answer: IXMLAnswerTypeList;
begin
  Result := FAnswer;
end;

{ TXMLCategoryType }

function TXMLCategoryType.Get_Text: WideString;
begin
  Result := ChildNodes['text'].Text;
end;

procedure TXMLCategoryType.Set_Text(Value: WideString);
begin
  ChildNodes['text'].NodeValue := Value;
end;

{ TXMLNameType }

function TXMLNameType.Get_Text: WideString;
begin
  Result := ChildNodes['text'].Text;
end;

procedure TXMLNameType.Set_Text(Value: WideString);
begin
  ChildNodes['text'].NodeValue := Value;
end;

{ TXMLQuestiontextType }

function TXMLQuestiontextType.Get_Format: WideString;
begin
  Result := AttributeNodes['format'].Text;
end;

procedure TXMLQuestiontextType.Set_Format(Value: WideString);
begin
  SetAttribute('format', Value);
end;

function TXMLQuestiontextType.Get_Text: WideString;
begin
  Result := ChildNodes['text'].Text;
end;

procedure TXMLQuestiontextType.Set_Text(Value: WideString);
begin
  ChildNodes['text'].NodeValue := Value;
end;

{ TXMLGeneralfeedbackType }

function TXMLGeneralfeedbackType.Get_Text: WideString;
begin
  Result := ChildNodes['text'].Text;
end;

procedure TXMLGeneralfeedbackType.Set_Text(Value: WideString);
begin
  ChildNodes['text'].NodeValue := Value;
end;

{ TXMLCorrectfeedbackType }

function TXMLCorrectfeedbackType.Get_Text: WideString;
begin
  Result := ChildNodes['text'].Text;
end;

procedure TXMLCorrectfeedbackType.Set_Text(Value: WideString);
begin
  ChildNodes['text'].NodeValue := Value;
end;

{ TXMLPartiallycorrectfeedbackType }

function TXMLPartiallycorrectfeedbackType.Get_Text: WideString;
begin
  Result := ChildNodes['text'].Text;
end;

procedure TXMLPartiallycorrectfeedbackType.Set_Text(Value: WideString);
begin
  ChildNodes['text'].NodeValue := Value;
end;

{ TXMLIncorrectfeedbackType }

function TXMLIncorrectfeedbackType.Get_Text: WideString;
begin
  Result := ChildNodes['text'].Text;
end;

procedure TXMLIncorrectfeedbackType.Set_Text(Value: WideString);
begin
  ChildNodes['text'].NodeValue := Value;
end;

{ TXMLAnswerType }

procedure TXMLAnswerType.AfterConstruction;
begin
  RegisterChildNode('feedback', TXMLFeedbackType);
  inherited;
end;

function TXMLAnswerType.Get_Fraction: Integer;
begin
  Result := AttributeNodes['fraction'].NodeValue;
end;

procedure TXMLAnswerType.Set_Fraction(Value: Integer);
begin
  SetAttribute('fraction', Value);
end;

function TXMLAnswerType.Get_Text: WideString;
begin
  Result := ChildNodes['text'].Text;
end;

procedure TXMLAnswerType.Set_Text(Value: WideString);
begin
  ChildNodes['text'].NodeValue := Value;
end;

function TXMLAnswerType.Get_Feedback: IXMLFeedbackType;
begin
  Result := ChildNodes['feedback'] as IXMLFeedbackType;
end;

{ TXMLAnswerTypeList }

function TXMLAnswerTypeList.Add: IXMLAnswerType;
begin
  Result := AddItem(-1) as IXMLAnswerType;
end;

function TXMLAnswerTypeList.Insert(const Index: Integer): IXMLAnswerType;
begin
  Result := AddItem(Index) as IXMLAnswerType;
end;
function TXMLAnswerTypeList.Get_Item(Index: Integer): IXMLAnswerType;
begin
  Result := List[Index] as IXMLAnswerType;
end;

{ TXMLFeedbackType }

function TXMLFeedbackType.Get_Text: WideString;
begin
  Result := ChildNodes['text'].Text;
end;

procedure TXMLFeedbackType.Set_Text(Value: WideString);
begin
  ChildNodes['text'].NodeValue := Value;
end;

{ TXMLIntegerList }

function TXMLIntegerList.Add(const Value: Integer): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLIntegerList.Insert(const Index: Integer; const Value: Integer): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;
function TXMLIntegerList.Get_Item(Index: Integer): Integer;
begin
  Result := List[Index].NodeValue;
end;

end.