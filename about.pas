unit about;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RXCtrls, URLLabel;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    OKButton: TButton;
    ProductName1: TRxLabel;
    mailURLLabel: TURLLabel;
    Version1: TRxLabel;
    Copyright1: TRxLabel;
    Comments1: TRxLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses basevar, MyUtils;
{$R *.dfm}

procedure TAboutBox.FormActivate(Sender: TObject);
begin
  ProductName1.Caption := ProductName;
  Version1.Caption := 'Версія: '+CurrFileVersion.FileVersion;
  Copyright1.Caption := copyright;
  mailURLLabel.URLCommand := mail_text;
end;

end.
 
