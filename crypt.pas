unit crypt;

interface

uses Windows, SysUtils;

type
  HCRYPTPROV  = ULONG;
  HCRYPTKEY   = ULONG;

  TPassSaver = class
  private
    hProv: HCRYPTPROV;   // криптопровайдер
    hSKey: HCRYPTKEY;    // сессионный ключ
  public
    constructor Create(pass: string);
    {* конструктор }
    destructor Destroy; override;
    {* деструктор }
    function HideStr(s: string): string;
    {* зашифровать строку }
    function ShowStr(s: string): string;
    {* расшифровать строку }
  end;

implementation

const
  ADVAPI32    = 'advapi32.dll';
  PROV_RSA_FULL    = 1;
  CRYPT_VERIFYCONTEXT = $F0000000;
  CALG_RC4         = ((3 shl 13) or (4 shl 9) or 1);
  CALG_RC2         = ((3 shl 13) or (3 shl 9) or 2);
  CALG_SHA         = ((4 shl 13) or 0 or 4);

Type
  ALG_ID = ULONG;
  PHCRYPTPROV = ^HCRYPTPROV;
  PHCRYPTKEY  = ^HCRYPTKEY;
  LPAWSTR = PWideChar;
  HCRYPTHASH  = ULONG;
  PHCRYPTHASH = ^HCRYPTHASH;
function CryptReleaseContext(hProv:HCRYPTPROV;dwFlags:DWORD):BOOL;stdcall;external ADVAPI32 name 'CryptReleaseContext';
function CryptAcquireContext(Prov:PHCRYPTPROV;Container:LPAWSTR;Provider:LPAWSTR;ProvType:DWORD;Flags:DWORD):BOOL;stdcall;external ADVAPI32 name 'CryptAcquireContextW';
function CryptEncrypt(Key:HCRYPTKEY;Hash:HCRYPTHASH;Final:BOOL;Flags:DWORD;Data:PBYTE;Len:PDWORD;BufLen:DWORD):BOOL;stdcall;external ADVAPI32 name 'CryptEncrypt';
function CryptDecrypt(Key:HCRYPTKEY;Hash:HCRYPTHASH;Final:BOOL;Flags:DWORD;Data:PBYTE;Len:PDWORD):BOOL;stdcall;external ADVAPI32 name 'CryptDecrypt';
function CryptCreateHash(Prov:HCRYPTPROV;Algid:ALG_ID;Key:HCRYPTKEY;Flags:LongInt;Hash:PHCRYPTHASH):BOOL;stdcall;external ADVAPI32 name 'CryptCreateHash';
function CryptHashData(Hash:HCRYPTHASH;Data:PBYTE;DataLen :LongInt;Flags:LongInt):BOOL;stdcall;external ADVAPI32 name 'CryptHashData';
function CryptDeriveKey(Prov:HCRYPTPROV;Algid:ALG_ID;BaseData:HCRYPTHASH;Flags:LongInt;Key:PHCRYPTKEY) :BOOL;stdcall;external ADVAPI32 name 'CryptDeriveKey';
function CryptDestroyHash(hHash :HCRYPTHASH) :BOOL;stdcall;external ADVAPI32 name 'CryptDestroyHash';

constructor TPassSaver.Create(pass: string);
var
  hash: HCRYPTHASH;
begin
  inherited Create;
  CryptAcquireContext(@hProv, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT);
  CryptCreateHash(hProv, CALG_SHA, 0, 0, @hash);
  CryptHashData(hash, @pass[1], length(pass) * SizeOf(Char), 0);
  // Если в следующей строке заменить RC4 на RC2, то будет блочное шифрование
  // оно лучше тем, что в закрытом варианте кол-во символов неочевидно
  CryptDeriveKey(hProv, CALG_RC4, hash, 0, @hSKey);
  CryptDestroyHash(hash);
end;

destructor TPassSaver.Destroy;
begin
  CryptReleaseContext(hProv, 0);
  inherited;
end;

function StringToHex(s: string): string;
var
  i: integer;
begin
  result := '';
  for i := 1 to Length(s) do
    result := result + IntToHex(ord(s[i]), 2 * SizeOf(Char));
end;

function HexToString(s: string): string;
var
  i: integer;
begin
  result := '';
  for i := 0 to Length(s) div (2 * SizeOf(Char)) - 1 do
    try result := result + char(StrToInt('$' +
      copy(s, i*2 * SizeOf(Char) + 1, 2 * SizeOf(Char))));
    except result := result + '?'; end;
end;

function TPassSaver.HideStr(s: string): string;
var
  p:  PByte;
  sz: dword;
begin
  sz := Length(s) * SizeOf(Char);
  GetMem(p, sz + 8); move(s[1], p^, sz);
  if CryptEncrypt(hSKey, 0, true, 0, p, @sz, sz + 8) then
  begin
    SetLength(result, sz div SizeOf(Char));
    move(p^, result[1], sz);
    result := StringToHex(result);
  end else result := s;
  FreeMem(p);
end;

function TPassSaver.ShowStr(s: string): string;
var
  p:  PByte;
  sz: dword;
begin
  s := HexToString(s);
  sz := Length(s) * SizeOf(Char);
  GetMem(p, sz); move(s[1], p^, sz);
  if CryptDecrypt(hSKey, 0, true, 0, p, @sz) then
  begin
    SetLength(result, sz div SizeOf(Char));
    move(p^, result[1], sz);
  end else result := s;
  FreeMem(p);
end;

end.
