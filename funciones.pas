unit funciones;
{$mode ObjFPC}{$H+}

interface
const
type
var

implementation

function replaceString(const SourceStr, OldWord, NewWord: string):integer;
var
PosStart, PosEnd, OldWordLength: Integer;
Result:string;
begin
Result := SourceStr;
  OldWordLength := Length(OldWord);
  PosStart := Pos(OldWord, Result);

  while PosStart > 0 do
  begin
    PosEnd := PosStart + OldWordLength - 1;
    Delete(Result, PosStart, OldWordLength);
    Insert(NewWord, Result, PosStart);
    PosStart := Pos(OldWord, Result, PosEnd + 1);
  end;
    
end;


begin
    
end;
