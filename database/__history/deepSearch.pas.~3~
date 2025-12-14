unit deepSearch;
interface
uses database, strUtils, basemanipulation;
procedure deepSeek(needle: string);

implementation
//uses MainForm;
procedure deepSeek(needle: string); 
var _to:string;

begin
    with DM2 do
    begin
      dropspot.ExecSQL;
      if ord(needle[1])<128 then //latin
        _to:='Translation'
      else
        _to:='Word';
      deepsearch.commandtext:='UPDATE Dict set spot=true where '+_to+' like ''%'+needle+'%''';
      DeepSearch.Execute;
      baserefresh;
    end;
end;

end.
