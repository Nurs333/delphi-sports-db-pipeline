unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;

  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT player_name, goals, team FROM players WHERE goals > expected_goals ORDER BY goals DESC;');
  FDQuery1.Open;

  Memo1.Lines.Add('/* LIVE DATABASE RECORDS RETRIEVED */');
  while not FDQuery1.Eof do
  begin
    Memo1.Lines.Add(
      FDQuery1.FieldByName('player_name').AsString + ' (' +
      FDQuery1.FieldByName('team').AsString + ') - ' +
      FDQuery1.FieldByName('goals').AsString + ' Goals'
    );
    FDQuery1.Next;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
FDConnection1.Connected := True;

  // Create table
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('CREATE TABLE IF NOT EXISTS players (player_name TEXT, goals INTEGER, expected_goals REAL, team TEXT);');
  FDQuery1.ExecSQL;

  // Insert stats
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('INSERT INTO players VALUES (''Florian Wirtz'', 12, 8.4, ''Bayer Leverkusen'');');
  FDQuery1.ExecSQL;

  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('INSERT INTO players VALUES (''Lionel Messi'', 25, 19.8, ''Inter Miami'');');
  FDQuery1.ExecSQL;

  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('INSERT INTO players VALUES (''Cristiano Ronaldo'', 31, 26.4, ''Al Nassr'');');
  FDQuery1.ExecSQL;

  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('INSERT INTO players VALUES (''Kylian Mbappe'', 29, 27.1, ''Real Madrid'');');
  FDQuery1.ExecSQL;

  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('INSERT INTO players VALUES (''Erling Haaland'', 34, 35.2, ''Manchester City'');');
  FDQuery1.ExecSQL;

  // CRUCIAL: Commit the data safely to the database file structure
  FDConnection1.Commit;
end;

end.
