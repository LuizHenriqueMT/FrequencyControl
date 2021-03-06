unit UPrincipal;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.DateUtils,
  System.Math,
  System.Rtti,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.MultiView,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.TabControl,
  FMX.Effects,
  FMX.Grid.Style,
  FMX.ScrollBox,
  FMX.Grid,
  FMX.ListBox,
  FMX.Memo,
  FMX.Edit,

  FMXDelphiZXIngQRCode;

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
    confirmacaoChamadaTurma: TRectangle;
    ShadowEffect1: TShadowEffect;
    layTituloChamadaTurma: TLayout;
    layFrequencia: TLayout;
    msgConfirmacaoTurmaIndevida: TLabel;
    layAcaoConfirmacaoTurma: TLayout;
    tbChamada: TTabItem;
    topMenuAluno: TRectangle;
    layMenuAluno: TLayout;
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
    lbChamadaTurma: TLabel;
    lbConfirmar: TLabel;
    lbCancelar: TLabel;
    TimerDateTime: TTimer;
    TimerDadosQR: TTimer;
    Layout1: TLayout;
    Memo1: TMemo;
    btnMenuAluno: TImage;
    topMenuChamada: TRectangle;
    layMenuChamada: TLayout;
    btnMenuChamada: TImage;
    procedure FormActivate(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure bckGrndEscuroClick(Sender: TObject);
    procedure lbNumeroTurma1Click(Sender: TObject);
    procedure lbConfirmarClick(Sender: TObject);
    procedure lbCancelarClick(Sender: TObject);
    procedure TimerDateTimeTimer(Sender: TObject);
    procedure TimerDadosQRTimer(Sender: TObject);
    procedure getFieldIndex (Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure horaAula;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    FQRCodeBitMap: TBitMap;
    FStrDados: TStringList;
    QRCode: TDelphiZXIngQRCode;

    DataQR: TDateTime;
    HorarioAtual: TTime;

  public
    { Public declarations }
    procedure QrCodeMobile(imgQRCode: TImage; texto: string);
    procedure QRCodeWin(imgQRCode: TImage; texto: string);

  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}

uses ULogin, UModulo;

procedure TFPrincipal.FormActivate(Sender: TObject);
var
  UsuarioAluno, UsuarioProfessor: string;
  DataQR: TDateTime;
begin
  with modulo do
    begin
      //Add "ALUNO" name to profile
      UsuarioAluno:= (queryAluno.Fields[2].asString);
      lbNomeALuno.Text:= (UsuarioAluno);

      //Add "PROFESSOR" name to profile
      UsuarioProfessor:= (queryProfessor.Fields[1].asString);
      lbNomeProfessor.Text:= (UsuarioProfessor);

      //Generation of initial information for the QR Code
      //getFieldIndex(Sender);
    end;
  
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {$IFDEF MSWINDOWS}
    application.Terminate;
  {$ELSE}

  {$ENDIF}
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
var
  UsuarioAluno, UsuarioProfessor, ConsultaHorario: string;
  TodasAulas, Cont, VAulaID:  Integer;
  DataQR: TDATE;
begin
  with modulo do
    begin
      //Activate "ALUNO/PROFESSOR" tab
      if queryAluno.Fields[0].Value > 0 then
        begin
          tabControl.ActiveTab:= tbAluno;
        end
      else
      if queryProfessor.Fields[0].Value > 0 then
        begin
          tabControl.ActiveTab:= tbProfessor;

          queryAulaP.Params.ParamByName('pProfessor').AsInteger:=
          queryProfessor.Fields[0].Value;
        end;

      //Add the current time into the variable
      HorarioAtual:= queryTime.Fields[0].AsDateTime;

      //Initial record of the table
      queryAula.First;

      //DateTime Formatting
      DataQR:= queryNow.Fields[0].AsDateTime;
      lbDiaAtual.text:= (DateTimeToStr(DataQR));

      //Procedure to identify the class period
      HoraAula;
      if tabcontrol.ActiveTab.Index = 1 then
      begin
        {
        Check funcionality
          showmessage(queryAulaP.Params.ParamByName('pProfessor').asstring);
          showmessage(queryAulaP.Params.ParamByName('pSemana').asstring);
          showmessage(queryAulaP.Params.ParamByName('pHorario').asstring);
          showmessage(queryAulaP.Params.ParamByName('pPeriodo').asstring);
        }

        //Add "DISCIPLINA" to the "PROFESSOR" profile
        if (queryProfessor.Fields[0].Value = queryAulaP.Fields[6].value) then
          begin
            if queryAulaP.Fields[0].Value <> Null then
              begin
                lbDisciplinaProfessor.Text:= queryAulaP.Fields[9].Value;
                {
                Check funcionality
                  showmessage(queryAulaP.Fields[6].asstring);
                  showmessage(queryAulaP.Fields[9].asstring);
                }
              end;
          end
        else
        if (queryAulaP.Fields[0].Value = null) then
          begin
            lbDisciplinaProfessor.Text:= '-';
            exit
          end;
      end
      else
      if tabcontrol.ActiveTab.Index = 0 then
        begin
          //Adds the "PROFESSOR" and "DISCIPLINA" to the "ALUNO" profile
          if (queryAluno.Fields[1].Value = queryASSOCPD.Fields[2].Value) then
            begin
              if queryASSOCPD.Fields[0].Value <> Null then
                begin
                  //Adds "PROFESSOR" name and "DISCPLINA" to the "ALUNO" profile
                  if (queryAluno.Fields[1].Value = queryASSOCPD.Fields[2].value) then
                    begin
                      lbProfessorAluno.Text:= queryASSOCPD.Fields[7].AsString;
                      lbDisciplinaAluno.Text:= queryASSOCPD.Fields[9].AsString;
                    end;
                end
              else
              //Clear the "PROFESSOR" fields and "DISCIPLINA" the "ALUNOS" profile
              if (queryASSOCPD.Fields[0].Value = null) then
                begin
                  lbProfessorAluno.text:= '-';
                  lbDisciplinaAluno.Text:= '-';
                  exit
                end;
            end;

        //Get all classes in the class
        queryAula.Close;
        queryAula.Sql.Clear;
        queryAula.SQL.Add('SELECT * FROM AULA WHERE ID_TURMA = ' + queryAluno.fields[1].asstring);
        queryAula.Open;

        //Creating QR Code list component
        FStrDados:= TSTringList.Create;

        //Creation QR Code image component
        FQRCodeBitMap:=  TBitMap.Create;

        //Generates new information for the new QR Code every 3 minutes
        getFieldIndex(Sender);

        {$IFDEF MSWINDOWS}
          //Creating Desktop QR Code
          QRCodeWin(imgQRCode, FStrDados.Text);
        {$ELSE}
          //Creating mobile QR Code
          QRCodeMobile(imgQRCode, FStrDados.Text);
          //Hiding testing button for quick entry into the system
          FLogin.btnEntradaRapida.Visible:= false;
          //Hiding testing memo for view the size layout
          memo1.Visible:= false;

        {$ENDIF}
      end;
    end;
end;

procedure TFPrincipal.FormDestroy(Sender: TObject);
begin
  //Destroy QR Code
  FQRCodeBitMap.DisposeOf;
  FStrDados.DisposeOf;
end;

procedure TFPrincipal.FormResize(Sender: TObject);
begin
  //Align
  if FPrincipal.Width <= 382 then
    begin
      //"ALUNO" name
      lbNomeAluno.TextSettings.VertAlign:= TTextAlign.Leading;
      lbNomeAluno.font.Size:= 16;

      //"PROFESSOR" name
      lbProfessorAluno.font.Size:= 12;

      //"DISCIPLINA" name
      lbDisciplinaAluno.font.Size:= 12;
    end;
  if FPrincipal.Width <= 414 then
    begin
      //Current DateTime
      lbDiaAtual.Font.Size:= 10;
      bckGrndDiaAtual.Margins.Top:= 4;
      bckGrndDiaAtual.Margins.bottom:= 4;
    end;

  memo1.Lines.Clear;
  memo1.Lines.Add(inttostr(FPrincipal.Width));

end;

procedure TFPrincipal.getFieldIndex(Sender: TObject);
var
  DadosAlunoQR: array [0..1] of string;
  I: integer;
begin
  with modulo do
    begin
      FStrDados.Clear;
      //Saves "ALUNO" information in an array to generate the QR Code
        if (queryAluno.Fields[0].IsNull = false) then
          begin
              DadosAlunoQR[0]:= queryAluno.Fields[0].AsString;
              DadosAlunoQR[1]:= queryAluno.Fields[2].AsString;
              FStrDados.Add(DadosAlunoQR[0]);
              FStrDados.Add(DadosAlunoQR[1]);
          end
    end;
end;

procedure TFPrincipal.horaAula;
var
  Turno, TurnoAula, HorarioLetivo: String;
  ContP, HorarioA: Integer;
begin
  with modulo do
    begin
      HorarioA:= 1;

      //Identifies the current week
      case DayOfWeek(queryDate.Fields[0].value) of //StrToDate('06/12/2020')
        1:begin
            //Adds the date of the week as "SUNDAY"
            queryASSOCPD.Params.ParamByName('pSemana').AsInteger:= 1;
            queryAulaP.Params.ParamByName('pSemana').AsInteger:= 1;
          end;

        2:begin
            //Adds the date of the week as "MONDAY"
            queryASSOCPD.Params.ParamByName('pSemana').AsInteger:= 2;
            queryAulaP.Params.ParamByName('pSemana').AsInteger:= 2;
          end;

        3:Begin
            //Adds the date of the week as "TUESDAY"
            queryASSOCPD.Params.ParamByName('pSemana').AsInteger:= 3;
            queryAulaP.Params.ParamByName('pSemana').AsInteger:= 3;
          End;

        4:Begin
            //Adds the date of the week as "WEDNESDAY"
            queryASSOCPD.Params.ParamByName('pSemana').AsInteger:= 4;
            queryAulaP.Params.ParamByName('pSemana').AsInteger:= 4;
          End;

        5:Begin
            //Adds the date of the week as "THURSDAY"
            queryASSOCPD.Params.ParamByName('pSemana').AsInteger:= 5;
            queryAulaP.Params.ParamByName('pSemana').AsInteger:= 5;
          End;

        6:Begin
            //Adds the date of the week as "FRIDAY"
            queryASSOCPD.Params.ParamByName('pSemana').AsInteger:= 6;
            queryAulaP.Params.ParamByName('pSemana').AsInteger:= 6;
          End;

        7:Begin
            //Adds the date of the week as "SATURDAY"
            queryASSOCPD.Params.ParamByName('pSemana').AsInteger:= 7;
            queryAulaP.Params.ParamByName('pSemana').AsInteger:= 7;
          End;
      end;

      //Treatment of hours (07:40) and period (M) of class
      if (queryTime.Fields[0].Value >= '07:40:00') and
        (queryTime.Fields[0].Value <= '12:30:00') then
        begin
          Turno:= 'M';
          HorarioLetivo:= ('07:40:00');

          {Tests
            mm1.Lines.Add(HorarioLetivo);
            mm1.Lines.Add(IntToStr(HorarioA));
          Tests}

          //Identifies the time and period of the current class
          for contP:= 0 to 6 do
            begin
              HorarioLetivo:= FormatDateTime('hh:MM:ss',
              IncMinute(StrToTime(HorarioLetivo), 40));
              HorarioA:= HorarioA + 1;

              if (queryTime.Fields[0].AsString <= (HorarioLetivo)) and
                (queryTime.Fields[0].AsString >= queryTime.Fields[0].AsString) then
                begin
                  HorarioLetivo:= FormatDateTime('hh:MM:ss',
                  IncMinute(StrToTime(HorarioLetivo), -40));
                  HorarioA:= HorarioA - 1;
                  {
                    mm1.Lines.Add(HorarioLetivo);
                    mm1.Lines.Add(IntToStr(HorarioA));
                  }
                end;
            end;
      end
      else
      //Treatment of hours (13:15) and period (V) of class
      if (queryTime.Fields[0].Value >= '13:15:00') and
        (queryTime.Fields[0].Value <= '17:30:00') then
        begin
          turno:= 'V';
          HorarioLetivo:= ('13:15:00');
          {
            mm1.Lines.Add(pa1);
            mm1.Lines.Add(IntToStr(horarioA));
          }

          //Identifies the time and period of the current class
          for contP:= 0 to 6 do
            begin
              HorarioLetivo:= FormatDateTime('hh:MM:ss',
              IncMinute(StrToTime(HorarioLetivo), 40));

              HorarioA:= HorarioA + 1;

              if (queryTime.Fields[0].AsString <= (HorarioLetivo)) and
                (queryTime.Fields[0].AsString >= queryTime.Fields[0].AsString) then
                begin
                  HorarioLetivo:= FormatDateTime('hh:MM:ss',
                  IncMinute(StrToTime(HorarioLetivo), -40));
                  HorarioA:= HorarioA - 1;

                  {
                    mm1.Lines.Add(HorarioLetivo);
                    mm1.Lines.Add(IntToStr(HorarioA));
                  }
                end;
            end;
          end
      else
      //Treatment of hours (18:30) and period (N) of class
      if (queryTime.Fields[0].value >= '18:30:00') and
        (queryTime.Fields[0].value <= '22:00:00') then  //22:00:00
        begin
          Turno:= 'N';
          HorarioLetivo:= ('18:30:00');

          {
            mm1.Lines.Add(pa1);
            mm1.Lines.Add(IntToStr(horarioA));
          }

          //Identifies the time and period of the current class
          for contP:= 0 to 7 do
            begin
              HorarioLetivo:= FormatDateTime('hh:MM:ss',
              IncMinute(StrToTime(HorarioLetivo), 40));
              HorarioA:= HorarioA + 1;

              if (queryTime.Fields[0].AsString <= (HorarioLetivo)) and
                (queryTime.Fields[0].AsString >= queryTime.Fields[0].AsString) then
                begin
                  HorarioLetivo:= FormatDateTime('hh:MM:ss',
                  IncMinute(StrToTime(HorarioLetivo), -40));
                  HorarioA:= HorarioA - 1;

                  {
                    mm1.Lines.Add(HorarioLetivo);
                    mm1.Lines.Add(IntToStr(HorarioA));
                  }
                end;
            end;
        end;

      //Period treatment (M/V/N)
      case AnsiIndexStr(Turno, ['M', 'V', 'N']) of
        0:Begin

            if tabControl.ActiveTab.Index = 0 then
              begin
                queryASSOCPD.Params.ParamByName('pPeriodo').AsString:= Turno;
                queryASSOCPD.Params.ParamByName('pTurma').AsString:= queryAluno.Fields[1].AsString;
                queryASSOCPD.Params.ParamByName('pHorario').AsInteger:= HorarioA;
                queryASSOCPD.ExecSQL;

                if (queryAluno.Fields[1].Value = queryASSOCPD.Fields[2].Value) then
                  Begin
                    lbProfessorAluno.Text:= queryASSOCPD.Fields[7].Value;
                    lbDisciplinaAluno.Text:= queryASSOCPD.Fields[9].Value;
                    showmessage ('Horario ' + (IntToStr(HorarioA)));
                  end;
              end
            else
            if tabControl.ActiveTab.Index = 1 then
              begin
                queryAulaP.Params.ParamByName('pPeriodo').AsString:= Turno;
                queryAulaP.Params.ParamByName('pHorario').AsInteger:= HorarioA;
                queryAulaP.ExecSQL;
              end;
          end;

        1:Begin
            if tabControl.ActiveTab.Index = 0 then
              begin
                queryASSOCPD.Params.ParamByName('pPeriodo').AsString:= Turno;
                queryASSOCPD.Params.ParamByName('pTurma').AsString:= queryAluno.Fields[1].AsString;
                queryASSOCPD.Params.ParamByName('pHorario').AsInteger:= HorarioA;
                queryASSOCPD.ExecSQL;

                if (queryAluno.Fields[1].Value = queryASSOCPD.Fields[2].Value) then
                  Begin
                    lbProfessorAluno.Text:= queryASSOCPD.Fields[7].Value;
                    lbDisciplinaAluno.Text:= queryASSOCPD.Fields[9].Value;
                  end;
              end
              else
            if tabControl.ActiveTab.Index = 1 then
              begin
                queryAulaP.Params.ParamByName('pPeriodo').AsString:= Turno;
                queryAulaP.Params.ParamByName('pHorario').AsInteger:= HorarioA;
                queryAulaP.ExecSQL;
              end;
          end;

        2:Begin
            if tabControl.ActiveTab.Index = 0 then
              begin
                queryASSOCPD.Params.ParamByName('pPeriodo').AsString:= Turno;
                queryASSOCPD.Params.ParamByName('pTurma').AsString:= queryAluno.Fields[1].AsString;
                queryASSOCPD.Params.ParamByName('pHorario').AsInteger:= HorarioA;
                queryASSOCPD.ExecSQL;

                if (queryAluno.Fields[1].Value = queryASSOCPD.Fields[2].Value) then
                  Begin
                    lbProfessorAluno.Text:= queryASSOCPD.Fields[7].Value;
                    lbDisciplinaAluno.Text:= queryASSOCPD.Fields[9].Value;
                  end;
              end
              else
            if tabControl.ActiveTab.Index = 1 then
              begin
                queryAulaP.Params.ParamByName('pPeriodo').AsString:= Turno;
                queryAulaP.Params.ParamByName('pHorario').AsInteger:= HorarioA;
                queryAulaP.ExecSQL;
              end;
          end;
      end;
    end;
end;

procedure TFPrincipal.imgMenuClick(Sender: TObject);
begin
  //Ativates "PROFESSOR" menu
  mvwProfessor.Visible:= true;
end;

procedure TFPrincipal.lbCancelarClick(Sender: TObject);
begin
  //Cancel student call
  bckGrndEscuro.Visible:= false;
  confirmacaoChamadaTurma.Visible:= false;
end;

procedure TFPrincipal.lbNumeroTurma1Click(Sender: TObject);
begin
  //Open the confirmation pop-up
  bckGrndEscuro.Visible:= true;
  confirmacaoChamadaTurma.Visible:= true;
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
    QRCode.QuietZone := 2;
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
                              pixelColor := TAlphaColors.null;

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
    QRCode.QuietZone := 1;
    imgQRCode.Bitmap.SetSize(QRCode.Rows, QRCode.Columns);

    for Row := 0 to QRCode.Rows - 1 do
      begin
        for Column := 0 to QRCode.Columns - 1 do
          begin
            if (QRCode.IsBlack[Row, Column]) then
                pixelColor := TAlphaColors.Black
            else
                pixelColor := TAlphaColors.Null;

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

procedure TFPrincipal.TimerDadosQRTimer(Sender: TObject);
begin
  //Generates new information for the new QR Code every 3 minutes
  getFieldIndex(Sender);

  {$IFDEF MSWINDOWS}
    QRCodeWin(imgQRCode, FStrDados.Text);
  {$ELSE}
    QRCodeMobile(imgQRCode, FStrDados.Text);
  {$ENDIF}
end;

procedure TFPrincipal.TimerDateTimeTimer(Sender: TObject);
begin
  with modulo do
    begin
      //Update the current DateTime every 1 second
      queryNow.execute;

      //DateTime Formatting
      DataQR:= queryNow.Fields[0].AsDateTime;
      lbDiaAtual.text:= (DateTimeToStr(DataQR));
    end;
end;

procedure TFPrincipal.lbConfirmarClick(Sender: TObject);
begin
  //Confirm students call
  bckGrndEscuro.Visible:= false;
  confirmacaoChamadaTurma.Visible:= false;
  TabControl.TabIndex:= 2;
end;

procedure TFPrincipal.bckGrndEscuroClick(Sender: TObject);
begin
  //Close confirmation pop-up
  bckGrndEscuro.Visible:= false;
  confirmacaoChamadaTurma.Visible:= false;
end;

end.
