unit AppManagerUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;

type

  { TAppManager }

  TAppManager = class(TDataModule)
    SelectApp: TOpenDialog;
    procedure DataModuleCreate(Sender: TObject);
    procedure SelectAppSelectionChange(Sender: TObject);
  private

  public
    procedure ShowOpenDialog;  // 确保方法声明是正确的
  end;

var
  AppManager: TAppManager;

implementation

{$R *.lfm}

procedure TAppManager.ShowOpenDialog;
begin
  SelectApp.Execute
end;

procedure TAppManager.SelectAppSelectionChange(Sender: TObject);
begin
  ShowMessage('选择了：' + SelectApp.FileName);
end;

procedure TAppManager.DataModuleCreate(Sender: TObject);
begin
    SelectApp.Filter := 'Executable files (*.exe)|*.exe|Shortcuts (*.lnk)|*.lnk';
end;

end.

