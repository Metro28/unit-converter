unit ConvertidorSource;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Items.Clear;
  ComboBox3.Items.Clear;

  case ComboBox1.ItemIndex of
  0: begin // Longitud
    ComboBox2.Items.AddStrings(['Kilómetros','Metros','Centímetros','Milímetros','Millas','Pies','Pulgadas']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;

  1: begin // Tiempo
    ComboBox2.Items.AddStrings(['Horas','Minutos','Segundos']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;

  2: begin // Masa
    ComboBox2.Items.AddStrings(['Toneladas','Kilogramos','Gramos','Miligramos','Libras']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;

  3: begin // Temperatura
    ComboBox2.Items.AddStrings(['Celcius','Fahrenheit','Kelvin']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;
  4: begin // Velocidad
    ComboBox2.Items.AddStrings(['Kilómetros por hora', 'Metros por segundo', 'Millas por hora', 'Pies por segundo', 'Nudos']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;
  end;

  if ComboBox2.Items.Count > 0 then ComboBox2.ItemIndex := 0;
  if ComboBox3.Items.Count > 0 then ComboBox3.ItemIndex := 1;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  valor, resultado: Double;
  unidadDe, unidadA: String;
begin
  valor := StrToFloatDef(Edit1.Text,0);
  unidadDe := ComboBox2.Text;
  unidadA := ComboBox3.Text;

  case ComboBox1.ItemIndex of

  // Longitud
  0: begin
    if unidadDe = 'Kilómetros' then valor := valor * 1000
    else if unidadDe = 'Centímetros' then valor := valor / 100
    else if unidadDe = 'Milímetros' then valor := valor / 1000
    else if unidadDe = 'Millas' then valor := valor * 1609.34
    else if unidadDe = 'Pies' then valor := valor * 0.3048
    else if unidadDe = 'Pulgadas' then valor := valor * 0.0254;

    if unidadA = 'Kilómetros' then resultado := valor / 1000
    else if unidadA = 'Centímetros' then resultado := valor * 100
    else if unidadA = 'Milímetros' then resultado := valor * 1000
    else if unidadA = 'Millas' then resultado := valor / 1609.34
    else if unidadA = 'Pies' then resultado := valor / 0.3048
    else if unidadA = 'Pulgadas' then resultado := valor / 0.0254
    else resultado := valor;
  end;

  // Tiempo
  1: begin
    if unidadDe = 'Horas' then valor := valor * 3600
    else if unidadDe = 'Minutos' then valor := valor * 60;

    if unidadA = 'Horas' then resultado := valor / 3600
    else if unidadA = 'Minitos' then resultado := valor / 60
    else resultado := valor;
  end;

  // Masa
  2: begin
    if unidadDe = 'Toneladas' then valor := valor * 1000
    else if unidadDe = 'Gramos' then valor := valor / 1000
    else if unidadDe = 'Miligramos' then valor := valor / 1000000
    else if unidadDe = 'Libras' then valor := valor * 0.453592;

    if unidadA = 'Toneladas' then resultado := valor / 1000
    else if unidadA = 'Gramos' then resultado := valor * 1000
    else if unidadA = 'Miligramos' then resultado := valor * 1000000
    else if unidadA = 'Libras' then resultado := valor / 0.453592
    else resultado := valor;
  end;

  // Temperatura
  3: begin
    if unidadDe = 'Fahrenheit' then valor := (valor - 32) * 5/9
    else if unidadDe = 'Kelvin' then valor := valor - 273.15;

    if unidadA = 'Fahrenheit' then resultado := (valor * 9/5) + 32
    else if unidadA = 'Kelvin' then resultado := valor + 273.15
    else resultado := valor;
  end;

  // Velocidad
  4: begin
    if unidadDe = 'Kilómetros por hora' then valor := valor * 0.277778
    else if unidadDe = 'Millas por hora' then valor := valor * 0.44704
    else if unidadDe = 'Pies por segundo' then valor := valor * 0.3048
    else if unidadDe = 'Nudos' then valor := valor * 0.514444;

    if unidadA = 'Kilómetros por hora' then resultado := valor / 0.277778
    else if unidadA = 'Millas por hora' then resultado := valor / 0.44704
    else if unidadA = 'Pies por segundo' then resultado := valor / 0.3048
    else if unidadA = 'Nudos' then resultado := valor / 0.514444
    else resultado := valor;
  end;
end;

  Edit2.Text := FloatToStr(resultado);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

end.

