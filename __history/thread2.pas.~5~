unit thread2;

interface

uses
  SysUtils, Classes, Controls, Forms, basemanipulation;

type
  synchthread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure synchprocess;
  end;

implementation


uses  MainForm, database, dateform;

procedure synchthread.Execute;
begin
     synchronize(synchprocess)
end;


procedure synchthread.synchprocess;
var k,k1:word;
     foundkey:string;
    //tempbook:Tbookmark;
begin
  with form1 do
  begin
      dbgrid2.DataSource.DataSet.DisableControls;
      gauge2.Visible:=true;
      Gauge2.MaxValue:=DBGrid2.SelectedRows.Count-1;
      with DM2.Dict do
      begin
        Active:=false;
        //ReadOnly:=false;
        Active:=true;
      end;

      //datamodule2.Dict.ReadOnly:=false;
      with DM2 do
        begin
          for k:=0 to DBGrid2.SelectedRows.Count-1 do
            begin
            if DBGrid2.Tag=1 then break; //condition of stopping the process
            Dict.Insert;
            dbgrid2.DataSource.DataSet.GotoBookmark(dbgrid2.SelectedRows.items[k]);
            Dict.Fields[1].AsString:=synch.Fields[0].AsString;
            Dict.Fields[2].AsString:=synch.Fields[1].AsString;
            //top.IndexName:='NameInd';
            foundkey:=top.lookup('Name',synch.Fields[2].AsString,'id');
            if foundkey='' then //topic doesn't exist
            begin
              top.Append; //
              top.fields[1].AsString:=synch.Fields[2].AsString; //add into top
              top.Post;
            end;
            Dict.Fields[3].AsInteger:=strtoint(foundkey);//pass key to Dict

            Dict.Fields[4].AsDateTime:=synch.Fields[3].AsDateTime;
            Dict.Fields[5].AsInteger:=synch.Fields[4].AsInteger;
            //Dict.Fields[7].AsBoolean:=false;
            //Dict.Fields[9].AsBoolean:=synch.Fields[6].AsBoolean;
            Dict.Post;
            synch.Next;

            Gauge2.Progress:=k;
            Application.ProcessMessages;
            if synch.Fields[0].AsString='' then break;//additional condition - reason of mistakes
          end;
          baserefresh;
        end;

      with DBGrid2 do
      begin
     { for k:=0 to DBGrid2.SelectedRows.Count-1 do //remove selected records from left greed
        begin
          DataSource.DataSet.GotoBookmark(pointer(dbgrid2.SelectedRows.items[0]));
          //DataSource.DataSet.Delete;
          Refresh;
        end;  }


        for k1:=1 to k do //select new records
        begin
           dbgrid3.SelectedRows.CurrentRowSelected:=true;
           dbgrid3.DataSource.DataSet.Prior;
           if DBGrid2.Tag=1 then break; //condition of stopping the process
        end;



        DataSource.DataSet.First;
      while not DataSource.DataSet.Eof do //remove selection
        begin
             SelectedRows.CurrentRowSelected:=false;
             DataSource.DataSet.next;
        end;
      DataSource.DataSet.First;
      DataSource.DataSet.EnableControls;

      end;
      gauge2.Visible:=false;
      BitBtn1.Visible:=false;
      //DataModule2.synch.ExecSQL; //escape mistakes

  end;
  end;



end.
 