unit AppManagerUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs, BufDataset, DB;

type

  { TAppManager }

  TAppManager = class(TDataModule)
    AppList: TBufDataset;
    SelectApp: TOpenDialog;
    procedure AppListAfterInsert(DataSet: TDataSet);
    procedure AppListAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SelectAppSelectionChange(Sender: TObject);
  private
    procedure InitDb;
    procedure SaveDb;
    procedure ShowAll;
    procedure AddApp(const AppName, ExePath: String);
  public
    procedure ShowOpenDialog;
  end;

var
  AppManager: TAppManager;
  Shortcutkey: string;
  AppListDbFile: String;

implementation

{$R *.lfm}

procedure TAppManager.ShowOpenDialog;
var FileNameWithoutExt: string;
begin
  if SelectApp.Execute then
  begin
    if ExtractFileExt(SelectApp.FileName) = '.app' then
    begin
      FileNameWithoutExt := ChangeFileExt(ExtractFileName(SelectApp.FileName), '');
      Self.AddApp(FileNameWithoutExt, SelectApp.FileName);
    end;
  end;
end;

procedure TAppManager.SelectAppSelectionChange(Sender: TObject);
begin
    Shortcutkey:=SelectApp.FileName;
end;

procedure TAppManager.DataModuleCreate(Sender: TObject);
begin
    //SelectApp.Filter := 'Executable files (*.exe)|*.exe|Shortcuts (*.lnk)|*.lnk';
    Self.InitDb;
end;

procedure TAppManager.DataModuleDestroy(Sender: TObject);
begin
    Self.SaveDb;
end;

procedure TAppManager.AppListAfterInsert(DataSet: TDataSet);
begin
    Self.SaveDb;
end;

procedure TAppManager.AppListAfterPost(DataSet: TDataSet);
begin
    Self.SaveDb;
end;

procedure TAppManager.InitDb;
var
    Home:String;
    ConfigDir: String;
begin
    Home := GetEnvironmentVariable('HOME');

    ConfigDir := Home + '/.LazarusLauncher';
    if not DirectoryExists(ConfigDir) then
    begin
      ForceDirectories(ConfigDir);
    end;

    AppList.Create(nil);

    AppListDbFile := ConfigDir + '/applist.db';
    if FileExists(AppListDbFile) then
    begin
        AppList.LoadFromFile(AppListDbFile);
    end
    else
    begin
        AppList.FieldDefs.Add('AppName', ftString, 20);
        AppList.FieldDefs.Add('ExePath', ftString, 20);
        AppList.IndexFieldNames:='ExePath';
        TBufDataset(AppList).CreateDataset;
    end;
end;

procedure TAppManager.SaveDb;
begin
    AppList.SaveToFile(AppListDbFile);
end;

procedure TAppManager.AddApp(const AppName, ExePath: String);
begin
    if not AppList.Locate('ExePath', ExePath, []) then
    begin
        AppList.Append;
        AppList.FieldByName('AppName').AsString := AppName;
        AppList.FieldByName('ExePath').AsString := ExePath;
        AppList.Post;
    end
    else
    begin
        ShowMessage('exist app ' + AppName);
    end;

    Self.ShowAll;
end;

procedure TAppManager.ShowAll;
begin
    //if not (AppList.State in [dsEdit, dsInsert]) then
        //ShowMessage('Open Edit');
        //sAppList.Edit;

    AppList.First;
    while not AppList.EOF do
    begin
        ShowMessage('AppName: ' + AppList.FieldByName('AppName').AsString +
                    ', ExePath: ' + AppList.FieldByName('ExePath').AsString);
        AppList.Next;
    end;
end;

end.

