unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.TabControl, FMX.Effects,
  FMXDelphiZXIngQRCode,
  System.Math, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.ListBox,
  FMX.Memo, FMX.Edit;

type
  TFPrincipal = class(TForm)
    TabControl: TTabControl;
    tbAluno: TTabItem;
    layAluno: TLayout;
    layPerfilAluno: TLayout;
    layClientAluno: TLayout;
    bckGrndPerfilAluno: TRectangle;
    imgAluno: TCircle;
    layInfoAluno: TLayout;
    lbNomeAluno: TLabel;
    lbProfessorAluno: TLabel;
    lbDisciplinaAluno: TLabel;
    backGroundFrequencia: TRoundRect;
    FrequenciaBar: TRoundRect;
    lbFrequenciaBar: TLabel;
    layQRCode: TLayout;
    imgQRCode: TImage;
    layDiaAtual: TLayout;
    bckGrndDiaAtual: TRoundRect;
    lbDiaAtual: TLabel;
    mvwAluno: TMultiView;
    Rectangle1: TRectangle;
    Image1: TImage;
    tbProfessor: TTabItem;
    layProfessor: TLayout;
    topMenuProfessor: TRectangle;
    layMenuProfessor: TLayout;
    btnMenuProfessor: TImage;
    layCronogramaProfessor: TLayout;
    tituloCronogramaProfessor: TRectangle;
    lbCronogramaProfessor: TLabel;
    layTurmaCronogramaP: TLayout;
    layTurma1CronogramaP: TLayout;
    lbTurmaCronogramaP: TLabel;
    btnTurmaCronogramaP: TRectangle;
    lbNumeroTurma1: TLabel;
    btnOpcoesCronograma: TImage;
    mvwProfessor: TMultiView;
    RetMtvP: TRectangle;
    imgMenuPmtv: TImage;
    bckGrndAluno: TRectangle;
    bckGrndEscuro: TRectangle;
    confirmacaoTurmaIndevida: TRectangle;
    ShadowEffect1: TShadowEffect;
    layTituloTurmaIndevida: TLayout;
    layFrequencia: TLayout;
    msgConfirmacaoTurmaIndevida: TLabel;
    layAcaoConfirmacaoTurma: TLayout;
    tbChamada: TTabItem;
    retTopChamada: TRectangle;
    layMenuChamada: TLayout;
    menuChamada: TImage;
    topMenuAluno: TRectangle;
    layMenuAluno: TLayout;
    btnMenuAluno: TImage;
    mvwChamada: TMultiView;
    Image2: TImage;
    Rectangle3: TRectangle;
    layImgAluno: TLayout;
    layNomeAluno: TLayout;
    layProfessorAluno: TLayout;
    layDisciplinaAluno: TLayout;
    layPerfilProfessor: TLayout;
    layClientProfessor: TLayout;
    bckGrndPerfilProfessor: TRectangle;
    layInfoProfessor: TLayout;
    laySituacaoProfessor: TLayout;
    bckGrndSituacao: TRoundRect;
    lbSituacaoProfessor: TLabel;
    layNomeProfessor: TLayout;
    lbNomeProfessor: TLabel;
    layDisciplinaProfessor: TLayout;
    lbDisciplinaProfessor: TLabel;
    layTurmaProfessor: TLayout;
    lbTurmaProfessor: TLabel;
    layImgProfessor: TLayout;
    imgProfessor: TCircle;
    layOpcoesCronograma: TLayout;
    lbHorarioCronogramaP: TLabel;
    lbTurmaIndevida: TLabel;
    lbConfirmar: TLabel;
    lbCancelar: TLabel;
    TimerDateTime: TTimer;
    TimerDadosQR: TTimer;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure bckGrndEscuroClick(Sender: TObject);
    procedure lbNumeroTurma1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure lbConfirmarClick(Sender: TObject);
    procedure lbCancelarClick(Sender: TObject);
    procedure TimerDateTimeTimer(Sender: TObject);
    procedure TimerDadosQRTimer(Sender: TObject);
    procedure getFieldIndex (Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure QrCodeMobile(imgQRCode: TImage; texto: string);
    procedure QRCodeWin(imgQRCode: TImage; texto: string);
  public
    { Public declarations }
    DataQR: TDateTime;
    ListagemDadosQR: TMemo;
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}

uses ULogin, UModulo;

procedure TFPrincipal.Button1Click(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
end;

procedure TFPrincipal.Button2Click(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
  TabControl.TabIndex:= 2;
end;

procedure TFPrincipal.Button3Click(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
  TabControl.TabIndex:= 2;
end;

procedure TFPrincipal.FormActivate(Sender: TObject);
var
  UsuarioAluno, UsuarioProfessor: string;
  DataQR: TDateTime;
begin

  //Add "ALUNO" name to profile
  {UsuarioAluno:= IntToStr(UsuarioA);}
  UsuarioAluno:= (modulo.queryAluno.Fields[2].asString);
  lbNomeALuno.Text:= (UsuarioAluno);

  //ADD "PROFESSOR" name to profile
  {UsuarioProfessor:= IntToStr(UsuarioP);}
  UsuarioProfessor:= (modulo.queryProfessor.Fields[1].asString);
  lbNomeProfessor.Text:= (UsuarioProfessor);

  //Add the current DateTime
  {modulo.queryGeral.Close;
  modulo.queryGeral.Sql.Clear;
  modulo.queryGeral.SQL.Add('SET time_zone = '+'-2:59'+';');
  modulo.queryGeral.SQL.Add('Select NOW()');}
  modulo.queryGeral.Open;
  modulo.queryGeral.execute;

  //DateTime Formatting
  DataQR:= modulo.queryGeral.Fields[0].AsDateTime;
  lbDiaAtual.text:= (DateTimeToStr(DataQR));

  //Generation of initial information for the QR Code
  //getFieldIndex(Sender);

end;

procedure TFPrincipal.getFieldIndex(Sender: TObject);
var
  DadosAlunoQR: array [0..9] of string;
  I: integer;
begin
  //Saves "ALUNO" information in an array to generate the QR Code
  for I:= 0 to 9 do
    begin
      DadosAlunoQR[I]:= modulo.queryAluno.Fields[I].AsString;
      //ListagemDadosQR.Lines.add(DadosAlunoQR[I]);
    end;

      //Saves the current "DateTime" in the same array to generate the QR Code
      //DadosAlunoQR[10]:= DateTimeToStr(DataQR);
      //ListagemDadosQR.Lines.add(DadosAlunoQR[10]);
end;

procedure TFPrincipal.imgMenuClick(Sender: TObject);
begin
  mvwProfessor.Visible:= true;
end;

procedure TFPrincipal.lbCancelarClick(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
end;

procedure TFPrincipal.lbNumeroTurma1Click(Sender: TObject);
begin
 bckGrndEscuro.Visible:= true;
 confirmacaoTurmaIndevida.Visible:= true;
end;

procedure TFPrincipal.QrCodeMobile(imgQRCode: TImage; texto: string);
const
  downsizeQuality: Integer = 2; // bigger value, better quality, slower rendering
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  pixelColor: TAlphaColor;
  vBitMapData: TBitmapData;
  pixelCount, y, x: Integer;
  columnPixel, rowPixel: Integer;

function GetPixelCount(AWidth, AHeight: Single): Integer;
  begin
    if QRCode.Rows > 0 then
      Result := Trunc(Min(AWidth, AHeight)) div QRCode.Rows
    else
      Result := 0;
  end;
begin
  //Not a good idea to stretch the QR Code...
  if imgQRCode.WrapMode = TImageWrapMode.iwStretch then
    imgQRCode.WrapMode := TImageWrapMode.Fit;

  QRCode := TDelphiZXingQRCode.Create;

  try
    QRCode.Data := '  ' + texto;
    QRCode.Encoding := TQRCodeEncoding.qrAuto;
    QRCode.QuietZone := 4;
    pixelCount := GetPixelCount(imgQRCode.Width, imgQRCode.Height);

    case imgQRCode.WrapMode of
      TImageWrapMode.iwOriginal,
      TImageWrapMode.iwTile,

      TImageWrapMode.iwCenter:
        begin
          if pixelCount > 0 then
          imgQRCode.Bitmap.SetSize(QRCode.Columns * pixelCount,
          QRCode.Rows * pixelCount);
        end;

      TImageWrapMode.iwFit:
        begin
          if pixelCount > 0 then
            begin
              imgQRCode.Bitmap.SetSize(QRCode.Columns * pixelCount * downsizeQuality,
              QRCode.Rows * pixelCount * downsizeQuality);
              pixelCount := pixelCount * downsizeQuality;
            end;
        end;

        //TImageWrapMode.iwStretch:
        //Raise Exception.Create('Not a good idea to stretch the QR Code');
    end;

    if imgQRCode.Bitmap.Canvas.BeginScene then
      begin
        try
          imgQRCode.Bitmap.Canvas.Clear(TAlphaColors.White);
          if pixelCount > 0 then
            begin
              if imgQRCode.Bitmap.Map(TMapAccess.maWrite, vBitMapData)  then
                begin
                  try
                    For Row := 0 to QRCode.Rows - 1 do
                      begin
                        for Column := 0 to QRCode.Columns - 1 do
                          begin
                            if (QRCode.IsBlack[Row, Column]) then
                              pixelColor := TAlphaColors.Black
                            else
                              pixelColor := TAlphaColors.White;

                              columnPixel := Column * pixelCount;
                              rowPixel := Row * pixelCount;
                            for x := 0 to pixelCount - 1 do
                              for y := 0 to pixelCount - 1 do
                                vBitMapData.SetPixel(columnPixel + x,
                                rowPixel + y, pixelColor);
                          end;
                      end;
                  finally
                    imgQRCode.Bitmap.Unmap(vBitMapData);
                  end;
                end;
            end;
      finally
        imgQRCode.Bitmap.Canvas.EndScene;
      end;
    end;

  finally
    QRCode.Free;
  end;
end;

procedure TFPrincipal.QRCodeWin(imgQRCode: TImage; texto: string);
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  pixelColor : TAlphaColor;
  vBitMapData : TBitmapData;
begin
  imgQRCode.DisableInterpolation := true;
  imgQRCode.WrapMode := TImageWrapMode.iwStretch;

  QRCode := TDelphiZXingQRCode.Create;

  try
    QRCode.Data := texto;
    QRCode.Encoding := TQRCodeEncoding.qrAuto;
    QRCode.QuietZone := 4;
    imgQRCode.Bitmap.SetSize(QRCode.Rows, QRCode.Columns);

    for Row := 0 to QRCode.Rows - 1 do
      begin
        for Column := 0 to QRCode.Columns - 1 do
          begin
            if (QRCode.IsBlack[Row, Column]) then
                pixelColor := TAlphaColors.Black
            else
                pixelColor := TAlphaColors.White;

            if imgQRCode.Bitmap.Map(TMapAccess.maWrite, vBitMapData)  then
              try
                vBitMapData.SetPixel(Column, Row, pixelColor);
              finally
                imgQRCode.Bitmap.Unmap(vBitMapData);
              end;
          end;
      end;

  finally
      QRCode.Free;
  end;

end;

procedure TFPrincipal.SpeedButton1Click(Sender: TObject);
begin
  getFieldIndex(Sender);

  {$IFDEF MSWINDOWS}
    QRCodeWin(imgQRCode, ListagemDadosQR.Text);
  {$ELSE}
    QRCodeMobile(imgQRCode, ListagemDadosQR.Text);
  {$ENDIF}
end;

procedure TFPrincipal.TimerDadosQRTimer(Sender: TObject);
begin
  //Generates new information for the new QR Code every 3 minutes
  //getFieldIndex(Sender);
end;

procedure TFPrincipal.TimerDateTimeTimer(Sender: TObject);
begin
  //Update the current DateTime every 1 second
  modulo.queryGeral.execute;

  //DateTime Formatting
  DataQR:= modulo.queryGeral.Fields[0].AsDateTime;
  lbDiaAtual.text:= (DateTimeToStr(DataQR));
end;

procedure TFPrincipal.lbConfirmarClick(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
  TabControl.TabIndex:= 2;
end;

procedure TFPrincipal.bckGrndEscuroClick(Sender: TObject);
begin
  bckGrndEscuro.Visible:= false;
  confirmacaoTurmaIndevida.Visible:= false;
end;

end.
