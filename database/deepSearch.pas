unit deepSearch;
interface
uses database, strUtils, basemanipulation, system.SysUtils;
procedure deepSeek(needle: string);

implementation
//uses MainForm;
procedure deepSeek(needle: string); 
var _to:string; s:string;

begin
    with DM2 do
    begin
      dropspot.ExecSQL;
      if ord(needle[1])<128 then //latin
        _to:='Translation'
      else
        _to:='Word';
      s:=Format('UPDATE Dict set spot=true where %s like ''%%%s%%''',[_to, needle]);
      DeepSearch.commandText.Add(s);
      DeepSearch.Execute;
      baserefresh;
      DeepSearch.CommandText.Clear;
    end;
end;

end.
