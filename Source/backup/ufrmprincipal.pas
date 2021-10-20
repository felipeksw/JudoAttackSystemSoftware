{
  Copyright (c) 2020-2021 Felipe B. Kashiwagura

  This file is part of JASS (Judo Attack System Software).

  JASS is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  JASS is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with Foobar.  If not, see <https://www.gnu.org/licenses/>

  Official repository:
  https://github.com/felipeksw/JudoAttackSystemSoftware
}
unit ufrmPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, ZConnection, ZDataset, LCLType, DBGrids, DBCtrls,
  Buttons, PasLibVlcPlayerUnit, fileinfo, winpeimagereader;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    btLimpaPegada: TSpeedButton;
    btLimpaPosDir: TSpeedButton;
    btLimpaDeslocamento: TSpeedButton;
    btDebugArrs: TButton;
    dbeIdAnalise: TDBEdit;
    dbeVideoPath: TDBEdit;
    dbeNomeAnalise: TDBEdit;
    dbeDataCriacao: TDBEdit;
    dsAnalise: TDataSource;
    dbNavEvento: TDBNavigator;
    dbNavAnalise: TDBNavigator;
    dsEvento: TDataSource;
    dbgEventos: TDBGrid;
    fbConnection: TZConnection;
    gbControles: TGroupBox;
    gbTempo: TGroupBox;
    gbEventos: TGroupBox;
    imgButtons: TImageList;
    lbDebugLuta: TLabel;
    lbDebugVideo: TLabel;
    lbQtdEventos: TLabel;
    lbQuantidade: TLabel;
    lbNomeAnalise: TLabel;
    lbDataCriacao: TLabel;
    lbVideoLoading: TLabel;
    lbVideoPath: TLabel;
    lbCombate: TLabel;
    lbCronoLuta: TLabel;
    lbSituacaoCrono: TLabel;
    lbCronoVideo: TLabel;
    lbVideo: TLabel;
    lbdAnalise: TLabel;
    Memo1: TMemo;
    memoDebug: TMemo;
    odVideo: TOpenDialog;
    pnVideoLoading: TPanel;
    PasLibVlcMediaList1: TPasLibVlcMediaList;
    tblEventoID_ANALISE: TLongintField;
    tblEventoLUTA: TStringField;
    tblEventoVIDEO: TStringField;
    vlcPlayer: TPasLibVlcPlayer;
    pgctrlDados: TPageControl;
    btOpenVideo: TSpeedButton;
    btDownload: TSpeedButton;
    btPlayPause: TSpeedButton;
    btMenosUmSec: TSpeedButton;
    btMaisUmSec: TSpeedButton;
    btGravarEvento: TSpeedButton;
    rdgMaoDireita: TRadioGroup;
    rdgMaoEsquerda: TRadioGroup;
    rdgPosicao: TRadioGroup;
    rdgDirecao: TRadioGroup;
    rdgDeslocaTori: TRadioGroup;
    rdgDeslocaUke: TRadioGroup;
    rdgDeslocaFinal: TRadioGroup;
    rdgSituacao: TRadioGroup;
    rdgPontuacao: TRadioGroup;
    rdgAcoesDeTempo: TRadioGroup;
    btLimpaArbitragem: TSpeedButton;
    tblAnaliseDATA_HORA: TDateTimeField;
    tblAnaliseID_ANALISE: TLongintField;
    tblAnaliseNOME: TStringField;
    tblAnaliseVIDEO: TStringField;
    tblEventoARBI_PONTUACAO: TStringField;
    tblEventoARBI_SITUACAO: TStringField;
    tblEventoARBI_TEMPO: TStringField;
    tblEventoDATA_HORA: TDateTimeField;
    tblEventoDESLOCA_FINAL: TStringField;
    tblEventoDESLOCA_TORI: TStringField;
    tblEventoDESLOCA_UKE: TStringField;
    tblEventoDIRECAO: TStringField;
    tblEventoID_EVENTO: TLongintField;
    tblEventoPEGADA_DIREITA: TStringField;
    tblEventoPEGADA_ESQUERDA: TStringField;
    tblEventoPOSICAO: TStringField;
    tblEventoSEC_LUTA: TLongintField;
    tblEventoSEC_VIDEO: TLongintField;
    tbsLog: TTabSheet;
    tbsReadme: TTabSheet;
    tbsEventos: TTabSheet;
    tbsPegada: TTabSheet;
    tbsArbitragem: TTabSheet;
    tbsDeslocamento: TTabSheet;
    tbsPosDir: TTabSheet;
    tbsCadastro: TTabSheet;
    qryGeral: TZQuery;
    tblEvento: TZTable;
    tblAnalise: TZTable;
    procedure btDebugArrsClick(Sender: TObject);
    procedure btDownloadClick(Sender: TObject);
    procedure btGravarEventoClick(Sender: TObject);
    procedure btLimpaArbitragemClick(Sender: TObject);
    procedure btLimpaDeslocamentoClick(Sender: TObject);
    procedure btLimpaPegadaClick(Sender: TObject);
    procedure btLimpaPosDirClick(Sender: TObject);
    procedure btMaisUmSecClick(Sender: TObject);
    procedure btMenosUmSecClick(Sender: TObject);
    procedure btOpenVideoClick(Sender: TObject);
    procedure btPlayPauseClick(Sender: TObject);
    procedure dbeIdAnaliseChange(Sender: TObject);
    procedure dbgEventosCellClick(Column: TColumn);
    procedure dsEventoDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure odVideoClose(Sender: TObject);
    procedure tblAnaliseAfterCancel(DataSet: TDataSet);
    procedure tblAnaliseAfterDelete(DataSet: TDataSet);
    procedure tblAnaliseAfterInsert(DataSet: TDataSet);
    procedure tblAnaliseAfterPost(DataSet: TDataSet);
    procedure tblAnaliseBeforePost(DataSet: TDataSet);
    procedure tblEventoAfterDelete(DataSet: TDataSet);
    procedure tblEventoBeforeDelete(DataSet: TDataSet);
    procedure tblEventoCalcFields(DataSet: TDataSet);
    procedure tbsCadastroEnter(Sender: TObject);
    procedure tbsCadastroExit(Sender: TObject);
    procedure tbsEventosEnter(Sender: TObject);
    procedure tbsEventosExit(Sender: TObject);
    procedure tbsLogEnter(Sender: TObject);
    procedure tbsLogExit(Sender: TObject);
    procedure tbsReadmeEnter(Sender: TObject);
    procedure tbsReadmeExit(Sender: TObject);
    procedure vlcPlayerMediaPlayerTimeChanged(Sender: TObject; time: int64);
  private
    procedure prcLog(txtLog: string);
    procedure prcClearAcaoTempo();
    procedure prcClearArbitragem();
    procedure prcClearDeslocamento();
    procedure prcClearPosDir();
    procedure prcClearPegada();
    procedure prcClearAllRadios();
    procedure prcRefreshEvento();
    procedure prcBtControleEnable(sts: boolean);
    procedure prcLoadVideo();
    procedure prcPauseVideo();
    procedure prcResumeVideo();
    procedure prcPreLoad();
    procedure prcResetArrays();
    procedure prcLoadArrays();
    procedure prcMaisUmSec();
    procedure prcMenosUmSec();
    procedure prcPlayPause();
    procedure prcGravarEvento();
    procedure prcExibeVersaoAtual();
    procedure prcAddEvento(acao_tempo: longint);
    procedure prcRefreshAcaoTempo(acao: string);
    function getFightCurrentIndex(posMs: longint): longint;
    function getAcaoTempoByIndex(arbi_tempo: string): longint;
    function getIndexByAcaoTempo(arbi_tempo: longint): string;
    function isAcaoArbritro(cur_index: longint; acao_tempo: longint): boolean;

  var
    vLog: boolean;
    fightTimeArr: array of longint; // Array com os tempos start/stop do cronometro
    fightArbiArr: array of longint; // Array com as ações de árbrito para tempo
    fightTimeInc: longint;
    oldVideoPos: longint;
    timerLutaMs: longint;
    timerVideoMs: longint;

  public

  end;

var
  frmPrincipal: TfrmPrincipal;


implementation


{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  dbName: string;
begin

  {Configurações iniciais da conexão}
  dbName := Application.Location + 'dbjass.fdb';
  fbConnection.User := 'SYSDBA';
  fbConnection.Password := 'masterkey';
  fbConnection.Protocol := 'firebird-2.5';
  fbConnection.LibraryLocation := 'fbembed.dll';
  fbConnection.Database := dbName;

  {Verifica se a base de dados existe}
  if not FileExists(dbName) then
    try
      prcLog('Criando o DB');

      fbConnection.Properties.Clear;
      fbConnection.Properties.Values['dialect'] := '3';
      fbConnection.Properties.Values['CreateNewDatabase'] :=
        'CREATE DATABASE ' + QuotedStr(fbConnection.Database) +
        ' USER ' + QuotedStr(fbConnection.User) + ' PASSWORD ' +
        QuotedStr(fbConnection.Password) + ' PAGE_SIZE 4096 DEFAULT CHARACTER SET UTF8';
      fbConnection.Connect;
    except
      on E: Exception do
      begin
        Application.MessageBox(
          PChar('ERRO[001]: Connection component not responding >> ' + E.Message),
          'Erro Fatal', MB_ICONERROR + MB_OK);
        Application.Terminate;
      end
    end;

  {Tenta conectar no banco de dados}
  if not fbConnection.Connected then
  begin
    try
      prcLog('Conectando ao DB');

      fbConnection.Properties.Clear;
      fbConnection.Properties.Values['dialect'] := '3';
      fbConnection.Connect;
    except
      on E: Exception do
      begin
        Application.MessageBox(
          PChar('ERRO[002]: Could not connect to database >> ' +
          E.Message),
          'Erro Fatal', MB_ICONERROR + MB_OK);
        Application.Terminate;
      end
    end;
  end;

  {Verifica se a tabela ANALISE existe e cria se necessário}
  try
    qryGeral.Close;
    qryGeral.SQL.Clear;
    qryGeral.SQL.Add('select 1 from RDB$RELATION_FIELDS rf');
    qryGeral.SQL.Add('where rf.RDB$RELATION_NAME = ' + QuotedStr('ANALISE'));
    qryGeral.Prepare;
    qryGeral.Open;

    if qryGeral.EOF then
    begin
      prcLog('Criando a tabela ANALISE');

      try
        qryGeral.Close;
        qryGeral.SQL.Clear;
        qryGeral.SQL.Add('CREATE TABLE analise (');
        qryGeral.SQL.Add('id_analise INTEGER NOT NULL,');
        qryGeral.SQL.Add('data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,');
        qryGeral.SQL.Add('nome VARCHAR(100),');
        qryGeral.SQL.Add('video VARCHAR(300),');
        qryGeral.SQL.Add('PRIMARY KEY (id_analise)');
        qryGeral.SQL.Add(');');
        qryGeral.Prepare;
        qryGeral.ExecSQL;

        qryGeral.SQL.Clear;
        qryGeral.SQL.Add('CREATE SEQUENCE seq_id_analise;');
        qryGeral.Prepare;
        qryGeral.ExecSQL;

        qryGeral.SQL.Clear;
        qryGeral.SQL.Add('CREATE TRIGGER tbi_seq_analise FOR analise');
        qryGeral.SQL.Add('ACTIVE BEFORE INSERT POSITION 0');
        qryGeral.SQL.Add('AS');
        qryGeral.SQL.Add('BEGIN');
        qryGeral.SQL.Add('NEW.id_analise = NEXT VALUE FOR seq_id_analise;');
        qryGeral.SQL.Add('END');
        qryGeral.Prepare;
        qryGeral.ExecSQL;
      except
        on E: Exception do
        begin
          Application.MessageBox(
            PChar('Erro[004]: Could not create ANALYSIS table >> ' +
            E.Message), 'Erro Fatal', MB_ICONERROR + MB_OK);
          Application.Terminate;
        end
      end;
    end;

  except
    on E: Exception do
    begin
      Application.MessageBox(
        PChar('ERRO[003]: Could not access metadata >> ' +
        E.Message),
        'Erro Fatal', MB_ICONERROR + MB_OK);
      Application.Terminate;
    end
  end;

  {Verifica se a tabela EVENTO existe e cria se necessário}
  try
    qryGeral.Close;
    qryGeral.SQL.Clear;
    qryGeral.SQL.Add('select 1 from RDB$RELATION_FIELDS rf');
    qryGeral.SQL.Add('where rf.RDB$RELATION_NAME = ' + QuotedStr('EVENTO'));
    qryGeral.Prepare;
    qryGeral.Open;

    if qryGeral.EOF then
    begin
      prcLog('Criando a tabela EVENTO');
      try
        qryGeral.Close;
        qryGeral.SQL.Clear;
        qryGeral.SQL.Add('CREATE TABLE evento (');
        qryGeral.SQL.Add('id_evento INTEGER NOT NULL,');
        qryGeral.SQL.Add('id_analise INTEGER NOT NULL,');
        qryGeral.SQL.Add('data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,');
        qryGeral.SQL.Add('sec_video INTEGER,');
        qryGeral.SQL.Add('sec_luta INTEGER,');
        qryGeral.SQL.Add('arbi_tempo VARCHAR(50),');
        qryGeral.SQL.Add('arbi_pontuacao VARCHAR(50),');
        qryGeral.SQL.Add('arbi_situacao VARCHAR(50),');
        qryGeral.SQL.Add('desloca_tori VARCHAR(50),');
        qryGeral.SQL.Add('desloca_uke VARCHAR(50),');
        qryGeral.SQL.Add('desloca_final VARCHAR(50),');
        qryGeral.SQL.Add('posicao VARCHAR(50),');
        qryGeral.SQL.Add('direcao VARCHAR(50),');
        qryGeral.SQL.Add('pegada_direita VARCHAR(50),');
        qryGeral.SQL.Add('pegada_esquerda VARCHAR(50),');
        qryGeral.SQL.Add('PRIMARY KEY (id_evento)');
        qryGeral.SQL.Add(');');
        qryGeral.Prepare;
        qryGeral.ExecSQL;

        qryGeral.SQL.Clear;
        qryGeral.SQL.Add('CREATE SEQUENCE seq_id_evento;');
        qryGeral.Prepare;
        qryGeral.ExecSQL;

        qryGeral.SQL.Clear;
        qryGeral.SQL.Add('CREATE TRIGGER tbi_seq_evento FOR evento');
        qryGeral.SQL.Add('ACTIVE BEFORE INSERT POSITION 0');
        qryGeral.SQL.Add('AS');
        qryGeral.SQL.Add('BEGIN');
        qryGeral.SQL.Add('NEW.id_evento = NEXT VALUE FOR seq_id_evento;');
        qryGeral.SQL.Add('END');
        qryGeral.Prepare;
        qryGeral.ExecSQL;

        qryGeral.SQL.Clear;
        qryGeral.SQL.Add('ALTER TABLE evento');
        qryGeral.SQL.Add('ADD FOREIGN KEY (id_analise)');
        qryGeral.SQL.Add('REFERENCES analise(id_analise)');
        qryGeral.SQL.Add('ON UPDATE CASCADE');
        qryGeral.SQL.Add('ON DELETE CASCADE');
        qryGeral.Prepare;
        qryGeral.ExecSQL;
      except
        on E: Exception do
        begin
          Application.MessageBox(
            PChar('Erro[006]: Could not create EVENT table >> ' + E.Message),
            'Erro Fatal', MB_ICONERROR + MB_OK);
          Application.Terminate;
        end
      end;
    end;

  except
    on E: Exception do
    begin
      Application.MessageBox(
        PChar('ERRO[005]: Could not access metadata >> ' + E.Message),
        'Erro Fatal', MB_ICONERROR + MB_OK);
      Application.Terminate;
    end
  end;

  {Configura o tamanho do array dos tempos de start/stop do cronometro}
  SetLength(fightTimeArr, 50);

  {Configura o tamanho do array das marcações de Hajime/Mate}
  SetLength(fightArbiArr, Length(fightTimeArr));

  {Inicializa os arrays de controle do tempo}
  prcResetArrays();

  {Preparação dos objetos de Bando de Dados}
  tblAnalise.Active := True;
  tblEvento.Active := True;

  {Inicialização Geral}
  self.DouBleBuffered := True;
  pgctrlDados.TabIndex := 0;
  pnVideoLoading.Visible := False;
  vlcPlayer.Tag := 1;
  dbgEventos.Tag := 1;
  fightTimeInc := 0;
  oldVideoPos := 0;
  timerLutaMs := 0;
  timerVideoMs := 0;
  prcBtControleEnable(False);

  {Verifica se entra no modo de Debug/Log}
  vLog := False;
  if FileExists(Application.Location + 'debug') then
  begin
    tbsLog.TabVisible := True;
    dbgEventos.Columns.Items[0].Visible := True; //ID_ANALISE
    dbgEventos.Columns.Items[2].Visible := True; //SEC_VIDEO
    dbgEventos.Columns.Items[4].Visible := True; //SEC_LUTA
    vLog := True;
  end;

  {Atualiza a versão da aplicação}
  //prcExibeVersaoAtual();

  {Adiciona um novo Registro Assim que inicializa o programa}
  tblAnalise.Insert;

end;

procedure TfrmPrincipal.dbeIdAnaliseChange(Sender: TObject);
begin
  btGravarEvento.Enabled := False;

  if dbeIdAnalise.GetTextLen > 0 then
  begin
    prcPreLoad();
    prcBtControleEnable(True);
    prcRefreshEvento();
    prcLoadArrays();
    prcLog('prcLoadArrays()');
  end
  else
  begin
    tblEvento.Active := False;
    prcBtControleEnable(False);
    lbQtdEventos.Caption := '0';
    prcResetArrays();
  end;
end;

procedure TfrmPrincipal.dbgEventosCellClick(Column: TColumn);
begin
  if Column = dbgEventos.Columns[1] then
  begin
    if dbgEventos.Tag = 0 then
    begin
      vlcPlayer.SetVideoPosInMs(tblEvento.FieldByName('SEC_VIDEO').AsInteger);
    end;
  end;
end;

procedure TfrmPrincipal.dsEventoDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TfrmPrincipal.btLimpaArbitragemClick(Sender: TObject);
begin
  prcClearArbitragem();
end;

procedure TfrmPrincipal.btGravarEventoClick(Sender: TObject);
begin
  prcGravarEvento();
end;

procedure TfrmPrincipal.btDebugArrsClick(Sender: TObject);
var
  i: integer = 0;
  x: integer = 0;
begin
  x := getFightCurrentIndex(vlcPlayer.GetVideoPosInMs());
  prcLog('fightTimeInc: ' + fightTimeInc.ToString());
  prcLog('fightCurIndex: ' + x.ToString());

  for i := 0 to (Length(fightArbiArr) - 1) do
  begin
    prcLog('[' + i.ToString() + ']:' + fightTimeArr[i].ToString() +
      '{' + fightArbiArr[i].ToString() + '}');
  end;
end;

procedure TfrmPrincipal.btDownloadClick(Sender: TObject);
var
  exportObj: TStringList;
  exportName: string;
  time_luta: string;
  time_video: string;
  t_luta: integer;
  t_video: integer;
begin

  exportName := Application.Location + 'jass_' +
    FormatDateTime('ddmmyyyhhnn', Now) + '.csv';

  exportObj := TStringList.Create;
  exportObj.Add('ID ANALYSIS;DATE ANALYSIS;ANALYSIS NAME;VIDEO;' +
    'ID EVENT;DATE EVENT;VIDEO MILLISEC;TIMER VIDEO;' +
    'COMBAT MILLISEC;TIMER COMBAT;TIME ACTIONS;SCORE;STATUS;' +
    'TORI´S APPROACH;UKE´S APPROACH;FINAL DISPLACEMENT;' +
    'STANCE;DIRECTION OF ATTACK;RIGHT HAND;LEFT HAND');

  try
    qryGeral.Close;
    qryGeral.SQL.Clear;
    qryGeral.SQL.Add('SELECT');
    qryGeral.SQL.Add('a.id_analise, a.data_hora AS DT_ANALISE, a.nome, a.video,');
    qryGeral.SQL.Add('e.id_evento, e.data_hora AS DT_EVENTO, e.sec_video, e.sec_luta,');
    qryGeral.SQL.Add('e.arbi_tempo, e.arbi_pontuacao, e.arbi_situacao,');
    qryGeral.SQL.Add('e.desloca_tori, e.desloca_uke, e.desloca_final,');
    qryGeral.SQL.Add('e.posicao, e.direcao, e.pegada_direita, e.pegada_esquerda');
    qryGeral.SQL.Add('FROM EVENTO e RIGHT JOIN ANALISE a on');
    qryGeral.SQL.Add('(a.ID_ANALISE = e.ID_ANALISE) ORDER BY a.ID_ANALISE, e.ID_EVENTO');
    qryGeral.Prepare;
    qryGeral.Open;
    qryGeral.First;
    while not qryGeral.EOF do
    begin

      t_video := Round(qryGeral.FieldByName('sec_video').AsInteger / 1000);
      t_luta := Round(qryGeral.FieldByName('sec_luta').AsInteger / 1000);

      time_video := Format('%.2d:%.2d', [t_video div 60, t_video mod 60]);
      time_luta := Format('%.2d:%.2d', [t_luta div 60, t_luta mod 60]);

      exportObj.Add(
        qryGeral.FieldByName('id_analise').AsString + ';' +
        qryGeral.FieldByName('DT_ANALISE').AsString + ';' +
        qryGeral.FieldByName('nome').AsString + ';' +
        qryGeral.FieldByName('video').AsString + ';' +
        qryGeral.FieldByName('id_evento').AsString + ';' +
        qryGeral.FieldByName('DT_EVENTO').AsString + ';' +
        qryGeral.FieldByName('sec_video').AsString + ';' + time_video +
        ';' + qryGeral.FieldByName('sec_luta').AsString + ';' +
        time_luta + ';' + qryGeral.FieldByName('arbi_tempo').AsString +
        ';' + qryGeral.FieldByName('arbi_pontuacao').AsString +
        ';' + qryGeral.FieldByName('arbi_situacao').AsString + ';' +
        qryGeral.FieldByName('desloca_tori').AsString + ';' +
        qryGeral.FieldByName('desloca_uke').AsString + ';' +
        qryGeral.FieldByName('desloca_final').AsString + ';' +
        qryGeral.FieldByName('posicao').AsString + ';' +
        qryGeral.FieldByName('direcao').AsString + ';' +
        qryGeral.FieldByName('pegada_direita').AsString + ';' +
        qryGeral.FieldByName('pegada_esquerda').AsString
        );
      qryGeral.Next;
    end;

    exportObj.SaveToFile(exportName);
    exportObj.Free;
    qryGeral.Close;

    Application.MessageBox(PChar('File ' + exportName + ' exported.'),
      'Export Database', MB_ICONINFORMATION + MB_OK);

  except
    on E: Exception do
    begin
      Application.MessageBox(
        PChar('Erro[007]: Unable to export CSV >> ' + E.Message),
        'Erro Fatal', MB_ICONERROR + MB_OK);
    end;
  end;
end;

procedure TfrmPrincipal.btLimpaDeslocamentoClick(Sender: TObject);
begin
  prcClearDeslocamento();
end;

procedure TfrmPrincipal.btLimpaPegadaClick(Sender: TObject);
begin
  prcClearPegada();
end;

procedure TfrmPrincipal.btLimpaPosDirClick(Sender: TObject);
begin
  prcClearPosDir();
end;

procedure TfrmPrincipal.btMaisUmSecClick(Sender: TObject);
begin
  prcMaisUmSec();
end;

procedure TfrmPrincipal.btMenosUmSecClick(Sender: TObject);
begin
  prcMenosUmSec();
end;

procedure TfrmPrincipal.btOpenVideoClick(Sender: TObject);
begin
  vlcPlayer.Stop();

  prcBtControleEnable(False);
  btGravarEvento.Enabled := False;

  if not odVideo.Execute then
    exit;

  if dbeIdAnalise.GetTextLen > 0 then
    tblAnalise.Edit;

  if dbeVideoPath.Caption = odVideo.FileName then
  begin
    tblAnalise.Cancel;
  end
  else
  begin
    dbeVideoPath.Caption := odVideo.FileName;
    prcPreLoad();
  end;
end;

procedure TfrmPrincipal.btPlayPauseClick(Sender: TObject);
begin
  prcPlayPause();
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  qryGeral.Close;
  fbConnection.Disconnect;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  prcLog(Key.ToString());

  if btPlayPause.Enabled then
  begin
    if key = VK_LEFT then
      prcMenosUmSec();

    if key = VK_RIGHT then
      prcMaisUmSec();

    if key = VK_SPACE then
      prcPlayPause();

    if key = VK_G then
      prcGravarEvento();

    key := 0;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  prcExibeVersaoAtual();
end;


procedure TfrmPrincipal.odVideoClose(Sender: TObject);
begin
  if dbeVideoPath.GetTextLen > 0 then
    prcBtControleEnable(True);
end;


procedure TfrmPrincipal.tblAnaliseAfterCancel(DataSet: TDataSet);
begin
  dbNavAnalise.Tag := 0;
  prcRefreshEvento();
end;

procedure TfrmPrincipal.tblAnaliseAfterDelete(DataSet: TDataSet);
begin
  prcPreLoad();
end;

procedure TfrmPrincipal.tblAnaliseAfterInsert(DataSet: TDataSet);
begin
  dbNavAnalise.Tag := 1;
  prcPreLoad();
  prcRefreshEvento();
  prcBtControleEnable(False);
  btGravarEvento.Enabled := False;
end;

procedure TfrmPrincipal.tblAnaliseAfterPost(DataSet: TDataSet);
begin
  if dbNavAnalise.Tag = 1 then
  begin
    tblAnalise.Refresh;
    tblAnalise.Last;
    dbNavAnalise.Tag := 0;
  end;
end;

procedure TfrmPrincipal.tblAnaliseBeforePost(DataSet: TDataSet);
var
  msg: string;
begin
  msg := '';

  if dbeNomeAnalise.GetTextLen <= 0 then
    msg := msg + '- Analysis Name'#13;

  if dbeVideoPath.GetTextLen <= 0 then
    msg := msg + '- Video'#13;

  if msg.Length > 0 then
  begin
    Application.MessageBox(
      PChar(msg), 'Required fields', MB_ICONERROR + MB_OK);
    tblAnalise.CancelUpdates;
  end;
end;

procedure TfrmPrincipal.tblEventoAfterDelete(DataSet: TDataSet);
begin
  prcRefreshEvento();
  prcLoadArrays();
end;

procedure TfrmPrincipal.tblEventoBeforeDelete(DataSet: TDataSet);
var
  CurFIndex: longint;
begin

  CurFIndex := getFightCurrentIndex(tblEventoSEC_VIDEO.AsLargeInt);

  prcLog('SEC_VIDEO: ' + tblEventoSEC_VIDEO.AsString);
  prcLog('CurFIndex: ' + CurFIndex.ToString());
  prcLog('ARBI_TEMPO: ' + tblEventoARBI_TEMPO.Value);

  if (tblEventoARBI_TEMPO.Value <> '') and (fightArbiArr[CurFIndex + 1] <> 9) then
  begin
    Application.MessageBox(
      PChar('It is not allowed to delete this time action'),
      'Inconsistent action',
      MB_ICONERROR + MB_OK);
    Abort;
  end;

end;

procedure TfrmPrincipal.tblEventoCalcFields(DataSet: TDataSet);
begin
  tblEvento.FieldByName('VIDEO').AsString :=
    Format('%.2d:%.2d', [Round(tblEvento.FieldByName('SEC_VIDEO').AsInteger / 1000) div
    60, Round(tblEvento.FieldByName('SEC_VIDEO').AsInteger / 1000) mod 60]);

  tblEvento.FieldByName('LUTA').AsString :=
    Format('%.2d:%.2d', [Round(tblEvento.FieldByName('SEC_LUTA').AsInteger / 1000) div
    60, Round(tblEvento.FieldByName('SEC_LUTA').AsInteger / 1000) mod 60]);
end;

procedure TfrmPrincipal.tbsCadastroEnter(Sender: TObject);
begin
  frmPrincipal.KeyPreview := False;
end;

procedure TfrmPrincipal.tbsCadastroExit(Sender: TObject);
begin
  frmPrincipal.KeyPreview := True;
end;

procedure TfrmPrincipal.tbsEventosEnter(Sender: TObject);
begin
  frmPrincipal.KeyPreview := False;
end;

procedure TfrmPrincipal.tbsEventosExit(Sender: TObject);
begin
  frmPrincipal.KeyPreview := True;
end;

procedure TfrmPrincipal.tbsLogEnter(Sender: TObject);
begin
  frmPrincipal.KeyPreview := False;
end;

procedure TfrmPrincipal.tbsLogExit(Sender: TObject);
begin
  frmPrincipal.KeyPreview := True;
end;

procedure TfrmPrincipal.tbsReadmeEnter(Sender: TObject);
begin
  frmPrincipal.KeyPreview := False;
end;

procedure TfrmPrincipal.tbsReadmeExit(Sender: TObject);
begin
  frmPrincipal.KeyPreview := True;
end;

procedure TfrmPrincipal.vlcPlayerMediaPlayerTimeChanged(Sender: TObject; time: int64);
var
  i: integer = 0;
  timerLuta: longint = 0;
  videoPosMs: longint = 0;
  fightCurIndex: longint = 0;
  currentVideoPos: longint = 0;
begin

  {Atualiza a visibilidade do texto "Carregando Vídeo..."}
  if pnVideoLoading.Visible then
    pnVideoLoading.Visible := False;

  {Recupera a posição atual do vídeo em ms}
  videoPosMs := vlcPlayer.GetVideoPosInMs();

  {Transforma a posição atual em segundos }
  currentVideoPos := Round((videoPosMs / 1000.0));

  {Verifica se já se passou mais de 500ms desde a ultima atualização}
  if (oldVideoPos <> (currentVideoPos * 500)) and (vlcPlayer.Tag <> 1) then
  begin

    {Atualiza o status visual dos controles de video}
    if not btPlayPause.Enabled then
    begin
      prcBtControleEnable(True);
      btGravarEvento.Enabled := True;
      dbgEventos.Tag := 0;
      dbgEventos.Columns[1].Font.Color := clBlue;
    end;

    {Variável Global para armazenr no DB}
    timerVideoMs := videoPosMs;

    {DEBUG}
    if vLog then
      lbDebugVideo.Caption := timerVideoMs.ToString();

    while i <= Length(fightTimeArr) do
    begin

      if (fightTimeArr[i] > 0) and (fightTimeArr[i] < videoPosMs) then
      begin

        if (fightTimeArr[i + 1] > 0) and (fightTimeArr[i + 1] < videoPosMs) then
        begin
          timerLuta := timerLuta + (fightTimeArr[i + 1] - fightTimeArr[i]);
        end
        else
        begin
          timerLuta := timerLuta + (videoPosMs - fightTimeArr[i]);
        end;

      end
      else
      begin
        Break;
      end;

      Inc(i, 2);
    end;

    timerLutaMs := timerLuta;
    timerLuta := Round(timerLuta / 1000);

    {DEBUG}
    if vLog then
      lbDebugLuta.Caption := timerLutaMs.ToString();


    lbCronoVideo.Caption := Format('%.2d:%.2d', [currentVideoPos div
      60, currentVideoPos mod 60]);
    lbCronoLuta.Caption := Format('%.2d:%.2d', [timerLuta div 60,
      timerLuta mod 60]);

    {inicio: Atualiza cor do cronometro}
    fightCurIndex := getFightCurrentIndex(videoPosMs);

    if fightTimeArr[fightCurIndex] <= videoPosMs then
    begin
      prcRefreshAcaoTempo(getIndexByAcaoTempo(fightArbiArr[fightCurIndex]));
    end;
    {fim: Atualiza cor do cronometro}

    oldVideoPos := (currentVideoPos * 500);
  end;
end;


{
    Custom Procedures and Functions
}

procedure TfrmPrincipal.prcResumeVideo();
begin
  vlcPlayer.Resume();
  btPlayPause.ImageIndex := 3;
  btPlayPause.Caption := 'Pause';
  prcLog('prcResumeVideo()');
end;

procedure TfrmPrincipal.prcPauseVideo();
begin
  vlcPlayer.Pause();
  btPlayPause.ImageIndex := 2;
  btPlayPause.Caption := 'Play';
  prcLog('prcPauseVideo()');
end;

procedure TfrmPrincipal.prcLoadVideo();
begin
  prcBtControleEnable(False);
  btGravarEvento.Enabled := False;

  if FileExists(dbeVideoPath.Caption) then
  begin
    pnVideoLoading.Visible := True;
    vlcPlayer.Play(WideString(dbeVideoPath.Caption));
    vlcPlayer.Tag := 0;
    btPlayPause.ImageIndex := 3;
    btPlayPause.Caption := 'Pause';
    prcLog('vlcPlayer.Tag := 0');
  end
  else
  begin
    Application.MessageBox(
      PChar('Fle ' + dbeVideoPath.Caption +
      ' does not exist, please select a valid video'),
      'File does not exist', MB_ICONERROR + MB_OK);
  end;
  prcLog('prcLoadVideo()');
end;

procedure TfrmPrincipal.prcRefreshEvento();
begin
  if dbeIdAnalise.GetTextLen > 0 then
  begin
    if not tblEvento.Active then
      tblEvento.Active := True;

    tblEvento.Filtered := False;
    tblEvento.Filter := 'ID_ANALISE=' + tblAnaliseID_ANALISE.Value.ToString();
    tblEvento.Filtered := True;
    tblEvento.Refresh;

    lbQtdEventos.Caption := tblEvento.RecordCount.ToString();
  end
  else
  begin
    lbQtdEventos.Caption := '0';
  end;
end;

procedure TfrmPrincipal.prcBtControleEnable(sts: boolean);
begin
  btPlayPause.Enabled := sts;
  btMenosUmSec.Enabled := sts;
  btMaisUmSec.Enabled := sts;
end;

procedure TfrmPrincipal.prcClearAcaoTempo();
begin
  rdgAcoesDeTempo.ItemIndex := -1;
end;

procedure TfrmPrincipal.prcClearArbitragem();
begin
  rdgAcoesDeTempo.ItemIndex := -1;
  rdgPontuacao.ItemIndex := -1;
  rdgSituacao.ItemIndex := -1;
end;

procedure TfrmPrincipal.prcClearDeslocamento();
begin
  rdgDeslocaTori.ItemIndex := -1;
  rdgDeslocaUke.ItemIndex := -1;
  rdgDeslocaFinal.ItemIndex := -1;
end;

procedure TfrmPrincipal.prcClearPosDir();
begin
  rdgPosicao.ItemIndex := -1;
  rdgDirecao.ItemIndex := -1;
end;

procedure TfrmPrincipal.prcClearPegada();
begin
  rdgMaoDireita.ItemIndex := -1;
  rdgMaoEsquerda.ItemIndex := -1;
end;

procedure TfrmPrincipal.prcClearAllRadios();
begin
  prcClearArbitragem();
  prcClearDeslocamento();
  prcClearPosDir();
  prcClearPegada();
end;

procedure TfrmPrincipal.prcPreLoad();
begin
  vlcPlayer.Play(WideString(Application.Location + 'videopreload.jpg'));
  vlcPlayer.Stop();
  vlcPlayer.Tag := 1;
  dbgEventos.Tag := 1;
  dbgEventos.Columns[1].Font.Color := clGray;
  lbCronoVideo.Caption := '00:00';
  lbCronoLuta.Caption := '00:00';
  prcRefreshAcaoTempo('MATE');
  prcResetArrays();

  prcLog('vlcPlayer.Tag := 1');
end;

procedure TfrmPrincipal.prcLog(txtLog: string);
begin
  if vLog then
    memoDebug.Lines.Add(txtLog);
end;

procedure TfrmPrincipal.prcResetArrays();
var
  i: longint = 0;
begin
  for i := 0 to (Length(fightArbiArr) - 1) do
  begin
    fightTimeArr[i] := 0;
    fightArbiArr[i] := 9;
  end;

  fightTimeInc := 0;
end;

procedure TfrmPrincipal.prcLoadArrays();
var
  arbi_tempo: string;
  arbi: longint = 9;
begin
  prcResetArrays();

  tblEvento.First;

  fightTimeInc := 0;
  while not (tblEvento.EOF) do
  begin
    arbi_tempo := tblEvento.FieldByName('ARBI_TEMPO').AsString;
    arbi := 9;

    if (arbi_tempo <> '') and (arbi_tempo <> 'GOLDEN SCORE') then
    begin

      arbi := getAcaoTempoByIndex(arbi_tempo);

      fightTimeArr[fightTimeInc] := tblEvento.FieldByName('SEC_VIDEO').AsInteger;
      fightArbiArr[fightTimeInc] := arbi;
      Inc(fightTimeInc);

    end;

    tblEvento.Next;
  end;

  tblEvento.First;
end;

procedure TfrmPrincipal.prcMenosUmSec();
var
  pos: integer = 0;
begin
  pos := vlcPlayer.GetVideoPosInMs() - 1000;
  if pos < 0 then
    pos := 0;

  vlcPlayer.SetVideoPosInMs(pos);
end;

procedure TfrmPrincipal.prcMaisUmSec();
var
  pos: integer = 0;
begin
  pos := vlcPlayer.GetVideoPosInMs() + 1000;
  if pos > vlcPlayer.GetVideoLenInMs() then
    pos := vlcPlayer.GetVideoLenInMs();

  vlcPlayer.SetVideoPosInMs(pos);
end;

procedure TfrmPrincipal.prcPlayPause();
begin
  if dbeVideoPath.GetTextLen > 0 then
  begin
    if vlcPlayer.Tag <> 1 then
    begin
      if vlcPlayer.IsPlay() then
      begin
        prcPauseVideo();
      end
      else
      begin
        if vlcPlayer.IsPause() then
        begin
          prcResumeVideo();
        end
        else
        begin
          prcLoadVideo();
        end;
      end;
    end
    else
    begin
      prcLoadVideo();
    end;
  end;
end;

procedure TfrmPrincipal.prcGravarEvento();
var
  fightCurIndex: longint = -1;
begin
  if not tblEvento.Active then
    tblEvento.Active := True;

  // Recupera o index da posição atual do video
  fightCurIndex := getFightCurrentIndex(timerVideoMs);

  // Se o conjunto de dados tiver ação de tempo para gravar, verifica as pemissões
  if rdgAcoesDeTempo.ItemIndex > -1 then
  begin
    // Verifica se o momento atual é presente, pois não pode alterar ação de tempo no passado
    if fightTimeArr[fightCurIndex + 1] <= 0 then
    begin
      // Verifica se a Acao de Arbitro tende as regras de combate
      if isAcaoArbritro(fightCurIndex, rdgAcoesDeTempo.ItemIndex) then
      begin
        // Preparar para gravar COM ação de tempo
        prcAddEvento(rdgAcoesDeTempo.ItemIndex);
      end
      else
      begin
        // Colocar aqui o alerta que a combinação de ações de tempo não é permitida
        Application.MessageBox(
          PChar('Chosen time action is inconsistent with combat rules'),
          'Ação Inconsistente',
          MB_ICONERROR + MB_OK);
        prcClearAcaoTempo();
      end;
    end
    else
    begin
      // Colocar aqui o alerta de que não pode alterar a ação de tempo no passado
      Application.MessageBox(
        PChar('It is not allowed to add this time action at this time of combat'),
        'Ação Inconsistente',
        MB_ICONERROR + MB_OK);
      prcClearAcaoTempo();
    end;
  end
  else
  begin
    // Preparar para gravar SEM ação de tempo
    prcAddEvento(-1);
  end;
end;

procedure TfrmPrincipal.prcAddEvento(acao_tempo: longint);
var
  cnt: longint = 0;
begin
  tblEvento.Insert;
  tblEventoID_ANALISE.Value := tblAnaliseID_ANALISE.Value;

  if acao_tempo > -1 then
  begin
    tblEventoARBI_TEMPO.Value := rdgAcoesDeTempo.Items[rdgAcoesDeTempo.ItemIndex];

    // Não grava no array a Acao de Tempo GOLDEN SCORE
    if acao_tempo <> 2 then
    begin
      prcRefreshAcaoTempo(rdgAcoesDeTempo.Items[rdgAcoesDeTempo.ItemIndex]);

      fightTimeArr[fightTimeInc] := timerVideoMs;
      fightArbiArr[fightTimeInc] := acao_tempo;
      Inc(fightTimeInc);
    end;
    Inc(cnt);
  end;

  if rdgPontuacao.ItemIndex > -1 then
  begin
    tblEventoARBI_PONTUACAO.Value := rdgPontuacao.Items[rdgPontuacao.ItemIndex];
    Inc(cnt);
  end;

  if rdgSituacao.ItemIndex > -1 then
  begin
    tblEventoARBI_SITUACAO.Value := rdgSituacao.Items[rdgSituacao.ItemIndex];
    Inc(cnt);
  end;

  if rdgDeslocaTori.ItemIndex > -1 then
  begin
    tblEventoDESLOCA_TORI.Value := rdgDeslocaTori.Items[rdgDeslocaTori.ItemIndex];
    Inc(cnt);
  end;

  if rdgDeslocaUke.ItemIndex > -1 then
  begin
    tblEventoDESLOCA_UKE.Value := rdgDeslocaUke.Items[rdgDeslocaUke.ItemIndex];
    Inc(cnt);
  end;

  if rdgDeslocaFinal.ItemIndex > -1 then
  begin
    tblEventoDESLOCA_FINAL.Value := rdgDeslocaFinal.Items[rdgDeslocaFinal.ItemIndex];
    Inc(cnt);
  end;

  if rdgPosicao.ItemIndex > -1 then
  begin
    tblEventoPOSICAO.Value := rdgPosicao.Items[rdgPosicao.ItemIndex];
    Inc(cnt);
  end;

  if rdgDirecao.ItemIndex > -1 then
  begin
    tblEventoDIRECAO.Value := rdgDirecao.Items[rdgDirecao.ItemIndex];
    Inc(cnt);
  end;

  if rdgMaoDireita.ItemIndex > -1 then
  begin
    tblEventoPEGADA_DIREITA.Value := rdgMaoDireita.Items[rdgMaoDireita.ItemIndex];
    Inc(cnt);
  end;

  if rdgMaoEsquerda.ItemIndex > -1 then
  begin
    tblEventoPEGADA_ESQUERDA.Value := rdgMaoEsquerda.Items[rdgMaoEsquerda.ItemIndex];
    Inc(cnt);
  end;

  if cnt > 0 then
  begin
    tblEventoSEC_LUTA.Value := timerLutaMs;
    tblEventoSEC_VIDEO.Value := timerVideoMs;

    tblEvento.Post;
    prcRefreshEvento();
    prcClearAllRadios();
  end
  else
  begin
    tblEvento.Cancel;
    Application.MessageBox(
      PChar('No event option was selected'),
      'Empty log event', MB_ICONERROR + MB_OK);
  end;
end;

procedure TfrmPrincipal.prcRefreshAcaoTempo(acao: string);
begin
  if acao = 'HAJIME' then
  begin
    lbSituacaoCrono.Caption := acao;
    lbSituacaoCrono.Font.Color := clGreen;
    lbCronoLuta.Font.Color := clGreen;
  end;

  if (acao = 'MATE') or (acao = 'SORE-MADE') then
  begin
    lbSituacaoCrono.Caption := acao;
    lbSituacaoCrono.Font.Color := clRed;
    lbCronoLuta.Font.Color := clRed;
  end;
end;

procedure TfrmPrincipal.prcExibeVersaoAtual();
var
  FileVerInfo: TFileVersionInfo;
begin

  FileVerInfo := TFileVersionInfo.Create(nil);
  try
    FileVerInfo.ReadFileInfo;

    prcLog('-- Info --');
    prcLog(FileVerInfo.VersionStrings.Values['ProductVersion']);
    prcLog(FileVerInfo.VersionStrings.Values['FileVersion']);

    frmPrincipal.Caption:= 'JASS ' + FileVerInfo.VersionStrings.Values['FileVersion'];

  finally
    FileVerInfo.Free;
  end;

end;

function TfrmPrincipal.getFightCurrentIndex(posMs: longint): longint;
var
  i: longint = 0;
begin

  // Identificando se a posição o index do cronometro está no time frame indicado
  for i := 1 to Length(fightTimeArr) do
    if fightTimeArr[i] > posMs then
      Break;

  if fightTimeInc < i then
    i := fightTimeInc;

  if i <= 0 then
    i := 1;

  Result := i - 1;
end;

function TfrmPrincipal.isAcaoArbritro(cur_index: longint; acao_tempo: longint): boolean;

var
  ret: boolean;
  acao_prev: longint;
begin
  ret := False;

  cur_index := cur_index + 1;

  acao_prev := fightArbiArr[cur_index - 1];

  prcLog('acao_tempo = ' + acao_tempo.ToString);
  prcLog('acao_prev = ' + acao_prev.ToString);
  prcLog('cur_index = ' + cur_index.ToString);

  // HAJIME = 0
  // MATE = 1
  // GOLDEN SCORE = 2
  // SORE-MADE = 3

  // Se a ação proposta for um HAJIME,
  // só aceita se a ação anterior for um
  // MATE, SORE-MADE, GOLDEN SCORE ou início do combate
  if (acao_tempo = 0) and ((acao_prev = 1) or (acao_prev = 3) or
    (acao_prev = 2) or (acao_prev = 9)) then
    ret := True;

  // Se a ação proposta for um MATE, só aceita se a ação anterior for um HAJIME
  if (acao_tempo = 1) and (acao_prev = 0) then
    ret := True;

  // Se a ação proposta for um GOLDEN SCORE, só aceita se a ação anterior for um SORE-MADE
  if (acao_tempo = 2) and (acao_prev = 3) then
    ret := True;

  // Se a ação proposta for um SORE-MADE, só aceita se a ação anterior for um HAJIME
  if (acao_tempo = 3) and (acao_prev = 0) then
    ret := True;

  Result := ret;
end;

function TfrmPrincipal.getIndexByAcaoTempo(arbi_tempo: longint): string;
var
  arbi: string;
begin
  arbi := '';

  if arbi_tempo = 0 then
    arbi := 'HAJIME';
  if arbi_tempo = 1 then
    arbi := 'MATE';
  if arbi_tempo = 2 then
    arbi := 'GOLDEN SCORE';
  if arbi_tempo = 3 then
    arbi := 'SORE-MADE';

  Result := arbi;
end;

function TfrmPrincipal.getAcaoTempoByIndex(arbi_tempo: string): longint;
var
  arbi: longint;
begin
  arbi := 9;

  if arbi_tempo = 'HAJIME' then
    arbi := 0;
  if arbi_tempo = 'MATE' then
    arbi := 1;
  if arbi_tempo = 'GOLDEN SCORE' then
    arbi := 2;
  if arbi_tempo = 'SORE-MADE' then
    arbi := 3;

  Result := arbi;
end;


end.
