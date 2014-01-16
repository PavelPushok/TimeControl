program Time_Control;

uses
  Forms,
  tm_ctrl_src in 'tm_ctrl_src.pas' {FrmMain},
  PrcStuff in 'PrcStuff.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
