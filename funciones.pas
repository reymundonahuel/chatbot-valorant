unit funciones;
{$mode ObjFPC}{$H+}

interface
function replaceString(const SourceStr, OldWord, NewWord: string)
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

function BuscarPalabra(const cadena, palabra: string): boolean;
var
  posicion: integer;
  Result:string;
begin
  // Utilizamos la función Pos para encontrar la posición de la palabra en la cadena
  // Si la palabra no se encuentra, Pos devuelve 0
  posicion := Pos(palabra, cadena);

  // Devolvemos true si la posición es diferente de 0, indicando que la palabra fue encontrada
  // Devolvemos false si la posición es 0, indicando que la palabra no fue encontrada
  Result := (posicion <> 0);
end;


begin
    
end;
