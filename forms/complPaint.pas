unit complPaint;

interface
procedure radiorect (order:byte, _key:char; var tecomp:Tmemo);

implementation
procedure radiorect (order:byte; var tecomp:Tmemo);
var j:byte;
begin
  for j := order to order+5 do        {round(0.08*order)*6 to use 1,2,3}
  begin                           {for memo 4,5,6}
    if j-round(0.08*order)*6<>strtoint(key) then
    begin
      tecomp:=(FindComponent('m'+inttostr(j)) as tmemo);
      rectt(clwhite, tecomp);
    end;
  end;
end;

end.
