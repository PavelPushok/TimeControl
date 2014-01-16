unit tm_ctrl_src;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, tlhelp32, ExtCtrls, StdCtrls, PrcStuff, ComCtrls, CheckLst, SQLite3, SQLiteTable3;

type
  TFrmMain = class(TForm)
    Label1: TLabel;
    TmrMain: TTimer;
    btnPrc: TButton;
    Label2: TLabel;
    redt1: TRichEdit;
    chklstprc: TCheckListBox;
    lstchnprc: TListBox;
    Label3: TLabel;
    Label4: TLabel;
    procedure TmrMainTimer(Sender: TObject);
    procedure btnPrcClick(Sender: TObject);
    procedure chklstprcClickCheck(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  sqldb:TSQLiteDatabase;
  database_name: string;
  
implementation

{$R *.dfm}

procedure TFrmMain.TmrMainTimer(Sender: TObject);
begin
  if IsRunning('taskmgr.exe') then
    Label1.Caption:='Running' else Label1.Caption:='Not Running';
end;

procedure TFrmMain.btnPrcClick(Sender: TObject);
begin
  GetProcesses(redt1);
  GetProcesses(chklstprc);
end;

procedure TFrmMain.chklstprcClickCheck(Sender: TObject);
var i: integer;
    sql: string;
begin
  if chklstprc.Checked[chklstprc.ItemIndex] then begin
    lstchnprc.Items.Add(chklstprc.Items.Strings[chklstprc.ItemIndex]);
    if not sqldb.TableExists(database_name) then
  begin
      sql:='INSERT INTO prcCntrl';
      sql:=sql+' (prcName,time)';
      sql:=sql+' values("'+chklstprc.Items.Strings[chklstprc.ItemIndex]+'", 0)';
      sqldb.ExecSQL(sql);
  end;
  end
  else if lstchnprc.Count > 0 then
   for i:= 0 to lstchnprc.Count - 1 do begin
    if lstchnprc.Items.Strings[i] = chklstprc.Items.Strings[chklstprc.ItemIndex] then begin
      lstchnprc.Items.Delete(i);
      break;
    end;
   end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var sql: string;
begin
database_name:='prcDatabase.db';
if FileExists(database_name) then begin
  sqldb := TSQLiteDatabase.Create(database_name);
  try
  except
    MessageBox(0,'������ �2 - ������� ���� ������','������',MB_OK+MB_ICONERROR);
    Application.Terminate;
  end;
end
else begin
     try
      sqldb := TSQLiteDatabase.Create(database_name);
      sql:='CREATE TABLE prcCntrl ';
      sql:=sql+'(id INTEGER PRIMARY KEY AUTOINCREMENT,';
      sql:=sql+'prcName TEXT,';
      sql:=sql+'time INTEGER)';
      sqldb.ExecSQL(sql);
      except
  MessageBox(0,'������ �1 - ������ �������� ����� ���� ������','������',MB_OK+MB_ICONERROR);
end;
end;
end;

end.
