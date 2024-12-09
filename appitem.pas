unit AppItem;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, ExtCtrls, StdCtrls, Graphics;

type

    { TAppItem }

    TAppItem = class(TFrame)
        AppIcon: TImage;
        AppName: TLabel;
    private
        FIcon: TPicture;
        FName: string;
        procedure SetIcon(AValue: TPicture);
        procedure SetTitle(AValue: string);
    public
        property Icon: TPicture read FIcon write SetIcon;
        property Title: string read FName write SetTitle;
    end;

implementation

{$R *.lfm}

{ TAppItem }

procedure TAppItem.SetIcon(AValue: TPicture);
begin
     if FIcon = AValue then Exit;
     FIcon := AValue;
     AppIcon.Picture.Assign(AValue);
end;

procedure TAppItem.SetTitle(AValue: string);
begin
     if FName = AValue then Exit;
     FName := AValue;
     AppName.Caption := AValue;
end;


end.

