object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 1124
  ClientWidth = 1651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Button1: TButton
    Left = 224
    Top = 56
    Width = 475
    Height = 385
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 352
    Top = 560
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=football.db'
      'DriverID=SQLite')
    Left = 816
    Top = 568
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'procedure TForm1.FormCreate(Sender: TObject);'
      'begin'
      '  // Connect and initialize tables natively'
      '  FDConnection1.Connected := True;'
      '  '
      '  FDQuery1.SQL.Clear;'
      '  FDQuery1.SQL.Add('#39'CREATE TABLE IF NOT EXISTS players ('#39');'
      
        '  FDQuery1.SQL.Add('#39'  player_name TEXT, goals INTEGER, expected_' +
        'goals REAL, team TEXT);'#39');'
      '  FDQuery1.ExecSQL;'
      ''
      '  // Populating clean football stats directly into SQLite'
      '  FDQuery1.SQL.Clear;'
      
        '  FDQuery1.SQL.Add('#39'INSERT INTO players SELECT '#39#39'Florian Wirtz'#39#39 +
        ', 12, 8.4, '#39#39'Bayer Leverkusen'#39#39' WHERE NOT EXISTS (SELECT 1 FROM ' +
        'players WHERE player_name='#39#39'Florian Wirtz'#39#39');'#39');'
      '  FDQuery1.ExecSQL;'
      '  '
      '  FDQuery1.SQL.Clear;'
      
        '  FDQuery1.SQL.Add('#39'INSERT INTO players SELECT '#39#39'Harry Kane'#39#39', 3' +
        '6, 31.2, '#39#39'Bayern Munich'#39#39' WHERE NOT EXISTS (SELECT 1 FROM playe' +
        'rs WHERE player_name='#39#39'Harry Kane'#39#39');'#39');'
      '  FDQuery1.ExecSQL;'
      '  '
      '  FDQuery1.SQL.Clear;'
      
        '  FDQuery1.SQL.Add('#39'INSERT INTO players SELECT '#39#39'Serhou Guirassy' +
        #39#39', 28, 22.1, '#39#39'VfB Stuttgart'#39#39' WHERE NOT EXISTS (SELECT 1 FROM ' +
        'players WHERE player_name='#39#39'Serhou Guirassy'#39#39' );'#39');'
      '  FDQuery1.ExecSQL;'
      'end;')
    Left = 968
    Top = 464
  end
end
