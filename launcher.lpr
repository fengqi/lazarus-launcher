program launcher;

{$mode objfpc}{$H+}

uses
    {$IFDEF UNIX}
    cthreads,
    {$ENDIF}
    {$IFDEF HASAMIGA}
    athreads,
    {$ENDIF}
    Interfaces, // this includes the LCL widgetset
    Forms, lazcontrols, MainUnit, TrayManagerUnit, SettingUnit, AppItem,
AppManagerUnit
    { you can add units after this };

{$R *.res}

begin
    RequireDerivedFormResource:=True;
    Application.Scaled:=True;
    Application.Initialize;
    //Application.ShowMainForm := False;
    Application.CreateForm(TMainForm, MainForm);
    Application.CreateForm(TSettingForm, SettingForm);
    Application.CreateForm(TTrayManager, TrayManager);
    Application.CreateForm(TAppManager, AppManager);
    Application.Run;
end.

