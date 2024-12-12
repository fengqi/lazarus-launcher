unit SettingUnit;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, process, Forms, Controls, Graphics, Dialogs, Menus,
    StdCtrls, ActnList, ComCtrls, Buttons, ExtCtrls, ShortPathEdit, Types;

type

    { TSettingForm }

    TSettingForm = class(TForm)
        AddButton: TBitBtn;
        BrowseDialog: TSelectDirectoryDialog;
        SumbitBtn: TButton;
        CancelBtn: TButton;
        CopyMenuItem: TMenuItem;
        DeleteButton: TBitBtn;
        DirectoryEdit: TShortPathEdit;
        ExportMenuItem: TMenuItem;
        ImportMenuItem: TMenuItem;
        MoveDownButton: TSpeedButton;
        MoveUpButton: TSpeedButton;
        OpenDialog1: TOpenDialog;
        PasteMenuItem: TMenuItem;
        PathListBox: TListBox;
        PopupMenu1: TPopupMenu;
        SaveDialog1: TSaveDialog;
        SeparMenuItem: TMenuItem;
        UiPanel: TPanel;
        SettingTabControl: TPageControl;
        UiSetting: TTabSheet;
        WatchSetting: TTabSheet;
        OtherSetting: TTabSheet;
        procedure CancelBtnClick(Sender: TObject);
        procedure DirectoryEditChange(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
    private

    public

    end;

var
    SettingForm: TSettingForm;

implementation

{$R *.lfm}

{ TSettingForm }

procedure TSettingForm.FormCreate(Sender: TObject);
begin
    //Self.Position := poScreenCenter;
    Hide;
end;

procedure TSettingForm.FormClose(Sender: TObject; var CloseAction: TCloseAction
    );
begin
    Hide;
    Application.Terminate;
end;

procedure TSettingForm.DirectoryEditChange(Sender: TObject);
begin
    //DirectoryEdit.Text := BrowseDialog.FileName;
    //ShowMessage(DirectoryEdit.Text);
end;

procedure TSettingForm.CancelBtnClick(Sender: TObject);
begin
    Hide;
end;

end.

