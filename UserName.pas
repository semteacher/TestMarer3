unit UserName;

interface
uses Windows, SysUtils;

function GetCurrentUserName: string;
implementation

function MyWideCharToString(Source: PWideChar): string;
var
  p: PAnsiChar;
  Len: Integer;
begin
  if Source = nil then begin
    Result := '';
    Exit;
  end;
  Len := WideCharToMultiByte(CP_ACP, 0, Source, -1, nil, 0, nil, nil);
  p := PAnsiChar(LocalAlloc(LMEM_FIXED, Len));
  try
    Len := WideCharToMultiByte(CP_ACP, 0, Source, -1, p, Len, nil, nil);
    if Len = 0 then
      raise Exception.Create(Format('Cannot convert WideChar to MultiByte. Error #%u', [GetLastError]))
    else
      Result := p;
  finally
    LocalFree(HLOCAL(p));
  end;
end;

function GetCurrentUserName: string;
var
  Size: DWORD;
  Buffer: PWideChar;
  WinResult: Boolean;
  LastError: LongWord;
begin
  Size := 0;
  Buffer := nil;
  WinResult :=  Windows.GetUserNameW(Buffer, Size);
  LastError := GetLastError;
  if not WinResult and  (LastError <> ERROR_INSUFFICIENT_BUFFER) then
    raise Exception.Create(Format('Cannot retrieve local user name. Error #%u', [GetLastError]));
  GetMem(Buffer, 2*Size+2);
  try
    WinResult :=  Windows.GetUserNameW(Buffer, Size);
    if not WinResult then
      raise Exception.Create(Format('Cannot retrieve local user name. Error #%u', [GetLastError]));
    Result := MyWideCharToString(Buffer);
  finally
    FreeMem(Buffer);
  end;
end;


end.
