unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, Vcl.StdCtrls, IniFiles,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    edtSummonerName: TEdit;
    lblSummonerName: TLabel;
    btnGo: TButton;
    lblChampionId: TLabel;
    lblChest: TLabel;
    lblMastery: TLabel;
    lblLevelMastery: TLabel;
    Image1: TImage;
    procedure btnGoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSummonerNameKeyPress(Sender: TObject; var Key: Char);
  private
    key: string;
    procedure getKey();
    function getSummonerId(summoner: String): String;
    function getChampionName(id: String): String;
  public
  end;

var
  Form1: TForm1;

implementation
uses msxml, superobject;

{$R *.dfm}

procedure TForm1.edtSummonerNameKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnGoClick(self);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  getKey;
end;

function TForm1.getChampionName(id: String): String;
var
  request: IXMLHTTPRequest;
  objeto, champion, tempObj: ISuperObject;
  item: TSuperObjectIter;
  uri, temp: string;
begin
  uri := 'http://ddragon.leagueoflegends.com/cdn/9.24.2/data/en_US/champion.json';

  request := CoXMLHTTP.Create;
  request.open('GET', uri, false, EmptyParam, EmptyParam);
  request.send(EmptyParam);

  objeto := SO(request.responseText);
  champion := SO(objeto.AsObject.S['data']);

  if ObjectFindFirst(champion, item) then
  repeat
    temp := item.key;
    tempObj := SO(champion.AsObject.S[temp]);

    if tempObj.AsObject.S['key'] = id then
      Result := item.key;

  until not ObjectFindNext(item);
  ObjectFindClose(item);
end;

procedure TForm1.getKey();
var
  arquivoIni: TIniFile;
begin
  arquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');

  key := arquivoIni.ReadString('configuracoes', 'key', key);

  arquivoIni.Free;
end;

function TForm1.getSummonerId(summoner: String): String;
var
  request: IXMLHTTPRequest;
  objeto: ISuperObject;
  uri: string;
begin
  uri := 'https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-name/'+summoner+'?api_key=' + key;

  request := CoXMLHTTP.Create;
  request.open('GET', uri, false, EmptyParam, EmptyParam);
  request.send(EmptyParam);

  objeto := SO(request.responseText);

  result := objeto.AsObject.S['id'];
end;

procedure TForm1.btnGoClick(Sender: TObject);
var
  request: IXMLHttpRequest;
  objeto, champion: ISuperObject;
  uri, summoner: String;
begin
  if edtSummonerName.Text = '' then
    raise Exception.Create('Coloque o nome de invocador!');

  summoner := getSummonerId(edtSummonerName.Text);

  uri := 'https://br1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/'+summoner+'?api_key=' + key;

  request := CoXMLHTTP.Create;
  request.open('GET', uri, false, EmptyParam, EmptyParam);
  request.send(EmptyParam);

  objeto := SO(request.responseText);
  champion := SO(objeto.AsArray.S[0]);

  lblChampionId.Caption := 'Champion Name: ' + getChampionName(champion.AsObject.S['championId']);
  lblChest.Caption := 'Chest: ' + champion.AsObject.S['chestGranted'];
  lblMastery.Caption := 'Mastery: '+ champion.AsObject.S['championPoints'];
  lblLevelMastery.Caption := 'Level Mastery: ' + champion.AsObject.S['championLevel'];
end;

end.
