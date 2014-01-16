unit tm_ctrl_src;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, tlhelp32, ExtCtrls, StdCtrls, PrcStuff, ComCtrls, CheckLst, DB,
  DBClient;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

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
begin
  if chklstprc.Checked[chklstprc.ItemIndex] then
    lstchnprc.Items.Add(chklstprc.Items.Strings[chklstprc.ItemIndex])
  else if lstchnprc.Count > 0 then
   for i:= 0 to lstchnprc.Count - 1 do begin
    if lstchnprc.Items.Strings[i] = chklstprc.Items.Strings[chklstprc.ItemIndex] then begin
      lstchnprc.Items.Delete(i);
      break;
    end;
   end;
end;

end.
