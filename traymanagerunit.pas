unit TrayManagerUnit;

{$mode ObjFPC}{$H+}

interface

uses
    Forms,
    Classes, SysUtils, ExtCtrls, Menus, Dialogs;

type

    { TTrayManager }

    TTrayManager = class(TDataModule)
        AboutApp: TMenuItem;
        ExitApp: TMenuItem;
        SettingApp: TMenuItem;
        TrayMenu: TPopupMenu;
        TrayIcon: TTrayIcon;
        procedure AboutAppClick(Sender: TObject);
        procedure ExitAppClick(Sender: TObject);
        procedure SettingAppClick(Sender: TObject);
        procedure TrayIconClick(Sender: TObject);
    private

    public

    end;

var
    TrayManager: TTrayManager;

implementation

{$R *.lfm}

uses
    MainUnit, SettingUnit;

{ TTrayManager }

procedure TTrayManager.TrayIconClick(Sender: TObject);
begin
     //MainForm.Left := Screen.WorkAreaWidth - MainForm.Width - 15;  // 右侧
     //MainForm.Top := Screen.WorkAreaHeight - MainForm.Height - 45; // 底部
     MainForm.Show;
     Application.BringToFront;
end;

procedure TTrayManager.ExitAppClick(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TTrayManager.SettingAppClick(Sender: TObject);
begin
     SettingForm.Position := poScreenCenter;
     SettingForm.Show;
end;

procedure TTrayManager.AboutAppClick(Sender: TObject);
begin
     ShowMessage('这是一个托盘示例程序');
end;

end.

