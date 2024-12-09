unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
    AppItem,
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
    MaskEdit;

type

    { TMainForm }

    TMainForm = class(TForm)
        AddBtn: TButton;
        CloseBtn: TButton;
        CustomTitle: TLabel;
        AppPanel: TFlowPanel;
        SearchInput: TEdit;
        SearchTimer: TTimer;
        TopPanel: TPanel;
        procedure CloseBtnClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure SearchInputChange(Sender: TObject);
        procedure SearchInputKeyPress(Sender: TObject; var Key: char);
        procedure SearchTimerTimer(Sender: TObject);
    private
        procedure AddControlsToFlowPanel;
    public

    end;

var
    MainForm: TMainForm;
    i: Integer;
    MyApp: TAppItem;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     //Hide;
     //CloseAction :=  caNone;
end;

procedure TMainForm.CloseBtnClick(Sender: TObject);
begin
     Hide;
     Application.Terminate;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     //Self.Left := Screen.WorkAreaWidth - Self.Width - 15;  // 右侧
     //Self.Top := Screen.WorkAreaHeight - Self.Height - 45; // 底部
     //Self.BorderStyle:=bsToolWindow; // 边框

     Self.AddControlsToFlowPanel;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
    ActiveControl := SearchInput
end;

procedure TMainForm.SearchInputChange(Sender: TObject);
begin
    SearchTimer.Enabled:=False;
    SearchTimer.Enabled:=True;
end;

procedure TMainForm.SearchInputKeyPress(Sender: TObject; var Key: char);
begin
     if Key = #13 then
     begin
        Key := #0;
        SearchTimer.Enabled:=False;
        ShowMessage('按下回车，输入内容为：' + SearchInput.Text);
     end;
end;

procedure TMainForm.SearchTimerTimer(Sender: TObject);
begin
    SearchTimer.Enabled:=False;
    ShowMessage('2秒后触发操作，输入内容为：' + SearchInput.Text);
end;

procedure TMainForm.AddControlsToFlowPanel;
var
    pic: TPicture;
begin
    pic := TPicture.create;
    pic.LoadFromFile(GetCurrentDir + '\imgs\immich.png');

    for i := 1 to 10 do
    begin
        MyApp := TAppItem.Create(Self);
        MyApp.Parent := AppPanel;
        MyApp.Name := '';
        MyApp.Title := Format('MyApp_%d', [i]);
        MyApp.Icon := pic;
    end;

    //pic.free;
end;

end.

