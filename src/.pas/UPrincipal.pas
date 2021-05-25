unit UPrincipal;

interface

uses
  System.SysUtils,
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
  FMXDelphiZXIngQRCode,

  FMX.Grid.Style,
  FMX.ScrollBox,
  FMX.Grid,
  FMX.ListBox,
  FMX.Memo,
  FMX.Edit;

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
    procedure FormCreate(Sender: TObject);
    procedure horaAula;
  private
    { Private declarations }
    procedure QrCodeMobile(imgQRCode: TImage; texto: string);
    procedure QRCodeWin(imgQRCode: TImage; texto: string);

  public
    { Public declarations }
    DataQR: TDateTime;
    ListagemDadosQR: TMemo;
    HorarioAtual: TTime;
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
  with modulo do
    begin
      //Add "ALUNO" name to profile
      {
        UsuarioAluno:= IntToStr(UsuarioA);
      }
      UsuarioAluno:= (modulo.queryAluno.Fields[2].asString);
      lbNomeALuno.Text:= (UsuarioAluno);

      //ADD "PROFESSOR" name to profile
      {
        UsuarioProfessor:= IntToStr(UsuarioP);
      }
      UsuarioProfessor:= (modulo.queryProfessor.Fields[1].asString);
      lbNomeProfessor.Text:= (UsuarioProfessor);

      //Add the current DateTime
      {
        queryGeral.Close;
        queryGeral.Sql.Clear;
        queryGeral.SQL.Add('SET time_zone = '+'-2:59'+';');
        queryGeral.SQL.Add('Select NOW()');
      }
      queryNow.Open;
      queryNow.execute;

      //DateTime Formatting
      DataQR:= queryNow.Fields[0].AsDateTime;
      lbDiaAtual.text:= (DateTimeToStr(DataQR));

      //Generation of initial information for the QR Code
      //getFieldIndex(Sender);
    end;
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

      queryAula.First;

      //Activate the current DateTime query
      queryNow.active;
      queryNow.execute;

      //DateTime Formatting
      DataQR:= queryNow.Fields[0].AsDateTime;
      lbDiaAtual.text:= (DateTimeToStr(DataQR));

      //INICIALIZA QUERY DE HORA ATUAL DO SISTEMA
      queryTime.Open;

      //IDENTIFICA O PERIODO DA AULA E TURMA
      horaAula;


      if tabcontrol.ActiveTab.Index = 1 then
      begin
        {showmessage(queryAulaP.Params.ParamByName('pProfessor').asstring);
        showmessage(queryAulaP.Params.ParamByName('pSemana').asstring);
        showmessage(queryAulaP.Params.ParamByName('pHorario').asstring);
        showmessage(queryAulaP.Params.ParamByName('pPeriodo').asstring); VERIFICA FUNCIONALIDADE}
        //-----------ADICIONA O PROFESSOR/DISCIPLINA DA TURMA NO PERFIL DO PROFESSOR

        //-----------ADICIONA NOME DO DISCIPLINA
        if (queryProfessor.Fields[0].Value = queryAulaP.Fields[6].value) then
        begin
          if queryAulaP.Fields[0].Value <> Null then
          begin
            lbDisciplinaP.Text:= queryAulaP.Fields[9].Value;

            {showmessage(queryAulaP.Fields[6].asstring); VERIFICA FUNCIONALIDADE
            showmessage(queryAulaP.Fields[9].asstring);}
          end;
        end
        else

        if (queryAulaP.Fields[0].Value = null) then
        begin
          lbDisciplinaP.Text:= '-';
          exit
        end;
      end
      else

      if tabcontrol.ActiveTab.Index = 0 then
      begin
        //-----------ADICIONA O PROFESSOR/DISCIPLINA DA TURMA NO PERFIL DO ALUNO
        if (queryAluno.Fields[1].Value = queryASSOCPD.Fields[2].Value) then
        begin
          if queryASSOCPD.Fields[0].Value <> Null then
          begin
            //-----------ADICIONA NOME DO PROFESSOR/DISCIPLINA
            if (queryAluno.Fields[1].Value = queryASSOCPD.Fields[2].value) then
            begin
              lbProfessorAluno.Text:= queryASSOCPD.Fields[7].AsString;
              lbDisciplinaAluno.Text:= queryASSOCPD.Fields[9].AsString;
            end;
          end
          else
          if (queryASSOCPD.Fields[0].Value = null) then
          begin
            lbProfessorAluno.text:= '-';
            lbDisciplinaAluno.Text:= '-';
            exit
          end;
        end;

        //-----------PEGANDO TODAS AS AULAS DA TURMA
        queryAula.Close;
        queryAula.Sql.Clear;
        queryAula.SQL.Add('SELECT * FROM AULA WHERE ID_TURMA = ' + queryAluno.fields[1].asstring);
        queryAula.Open;

        //-----------COLETAR DADOS PARA ARMAZENAR NO QRCODE
        FStrDados:= TSTringList.Create;
        FStrDados.Add(queryAluno.Fields[0].value); //Matricula do Aluno
        FStrDados.Add(queryAluno.Fields[2].value); //Nome do Aluno
        FStrDados.Add(queryAluno.Fields[1].value); //Turma do Aluno
        FStrDados.Add('--');

        FStrDados.Add(lbProfessorAluno.Text); //Nome do Professor
        FStrDados.Add(lbDisciplinaAluno.Text); //Materia do professor
        FStrDados.Add(lbDataQR.Text); //Data Atual
        FStrDados.Add(TimeToStr(queryGeralH.Fields[0].AsDateTime)); //Hora Atual

        //-----------CRIA플O DO COMPONENTE DE IMAGEM QRCODE
        FQRCodeBitMap:=  TBitMap.Create;

        //-----------GERA플O QRCODE //PROCEDURE//
        Update;

        mm1.Lines.Add(fstrdados.Text);
      end;
    end;
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

procedure TFPrincipal.horaAula;
var
  Turno, TurnoAula, Horario: String;
  ContP, HorarioA: Integer;
begin
  with modulo do
    begin
      horarioA:= 1;

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

      //Treatment of hours (08:30) and period (M) of class
      if (queryTime.Fields[0].Value >= '07:40:00') and
        (queryTime.Fields[0].Value <= '12:30:00') then
        begin
          Turno:= 'M';
          Horario:= ('07:40:00');

          {Tests
            mm1.Lines.Add(pa1);
            mm1.Lines.Add(IntToStr(horarioA));
          Tests}

          //REPETI플O IDENTIFICADOR DO PERIODO EM BASE DA HORA ATUAL
          for contP:= 0 to 6 do
            begin
              Horario:= FormatDateTime('hh:MM:ss',
              IncMinute(StrToTime(horario), 40));

              horarioA:= horarioA + 1;

              if (queryGeralH.Fields[0].AsString <= (pa1)) and
              (queryGeralH.Fields[0].AsString >= queryGeralH.Fields[0].AsString) then
              begin
                pa1:= FormatDateTime('hh:MM:ss',
                IncMinute(StrToTime(pa1), -40));

                horarioA:= horarioA - 1;
                {mm1.Lines.Add(pa1);
                mm1.Lines.Add(IntToStr(horarioA));}
              end;
            end;
      end
      else

      if (queryGeralH.Fields[0].Value >= '13:15:00') and
      (queryGeralH.Fields[0].Value <= '17:30:00') then
      begin
        turno:= 'V';

        pa1:= ('13:15:00');
        {mm1.Lines.Add(pa1);
        mm1.Lines.Add(IntToStr(horarioA));}

        //REPETI플O IDENTIFICADOR DO PERIODO EM BASE DA HORA ATUAL
        for contP:= 0 to 6 do
          begin
            pa1:= FormatDateTime('hh:MM:ss',
            IncMinute(StrToTime(pa1), 40));

            horarioA:= horarioA + 1;

            if (queryGeralH.Fields[0].AsString <= (pa1)) and
            (queryGeralH.Fields[0].AsString >= queryGeralH.Fields[0].AsString) then
            begin
              pa1:= FormatDateTime('hh:MM:ss',
              IncMinute(StrToTime(pa1), -40));

              horarioA:= horarioA - 1;
              {mm1.Lines.Add(pa1);
              mm1.Lines.Add(IntToStr(horarioA));}
            end;
          end;
      end
      else

      if (queryGeralH.Fields[0].value >= '18:30:00') and
      (queryGeralH.Fields[0].value <= '22:00:00') then  //22:00:00
      begin
        turno:= 'N';

        pa1:= ('18:30:00');
        {mm1.Lines.Add(pa1);
        mm1.Lines.Add(IntToStr(horarioA));}

        //REPETI플O IDENTIFICADOR DO PERIODO EM BASE DA HORA ATUAL
        for contP:= 0 to 7 do
          begin
            pa1:= FormatDateTime('hh:MM:ss',
            IncMinute(StrToTime(pa1), 40));

            horarioA:= horarioA + 1;

            if (queryGeralH.Fields[0].AsString <= (pa1)) and
            (queryGeralH.Fields[0].AsString >= queryGeralH.Fields[0].AsString) then
              begin
                pa1:= FormatDateTime('hh:MM:ss',
                IncMinute(StrToTime(pa1), -40));

                horarioA:= horarioA - 1;

                mm1.Lines.Add(pa1);
                mm1.Lines.Add(IntToStr(horarioA));
              end;
          end;
      end;

      //TRATAMEMTO DE PERIODO 'M,V,N'
      case AnsiIndexStr(turno, ['M', 'V', 'N']) of
        0:  Begin

              if tabControl.ActiveTab.Index = 0 then
              begin
                queryASSOCPD.Params.ParamByName('pPeriodo').AsString:= turno;
                queryASSOCPD.Params.ParamByName('pTurma').AsString:= queryAluno.Fields[1].AsString;
                queryASSOCPD.Params.ParamByName('pHorario').AsInteger:= horarioA;
                queryASSOCPD.ExecSQL;

                if (queryAluno.Fields[1].Value = queryASSOCPD.Fields[2].Value) then
                Begin
                  lbProfessorAluno.Text:= queryASSOCPD.Fields[7].Value;
                  lbDisciplinaAluno.Text:= queryASSOCPD.Fields[9].Value;

                  showmessage ('Horario ' + (IntToStr(HorarioA)));
                end;
              End
              else
              if tabControl.ActiveTab.Index = 1 then
              begin
                queryAulaP.Params.ParamByName('pPeriodo').AsString:= turno;
                queryAulaP.Params.ParamByName('pHorario').AsInteger:= horarioA;

                queryAulaP.ExecSQL;
              end;
            End;

        1:  Begin
              if tabControl.ActiveTab.Index = 0 then
              begin
                queryASSOCPD.Params.ParamByName('pPeriodo').AsString:= turno;
                queryASSOCPD.Params.ParamByName('pTurma').AsString:= queryAluno.Fields[1].AsString;
                queryASSOCPD.Params.ParamByName('pHorario').AsInteger:= horarioA;
                queryASSOCPD.ExecSQL;

                if (queryAluno.Fields[1].Value = queryASSOCPD.Fields[2].Value) then
                Begin
                  lbProfessorAluno.Text:= queryASSOCPD.Fields[7].Value;
                  lbDisciplinaAluno.Text:= queryASSOCPD.Fields[9].Value;
                end;
              End
              else

              if tabControl.ActiveTab.Index = 1 then
              begin
                queryAulaP.Params.ParamByName('pPeriodo').AsString:= turno;
                queryAulaP.Params.ParamByName('pHorario').AsInteger:= horarioA;
                queryAulaP.ExecSQL;
              end;
            End;

        2:  Begin
              if tabControl.ActiveTab.Index = 0 then
              begin
                queryASSOCPD.Params.ParamByName('pPeriodo').AsString:= turno;
                queryASSOCPD.Params.ParamByName('pTurma').AsString:= queryAluno.Fields[1].AsString;
                queryASSOCPD.Params.ParamByName('pHorario').AsInteger:= horarioA;
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
                queryAulaP.Params.ParamByName('pPeriodo').AsString:= turno;
                queryAulaP.Params.ParamByName('pHorario').AsInteger:= horarioA;
                queryAulaP.ExecSQL;
              end;
            End;


      end;
    end;
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
