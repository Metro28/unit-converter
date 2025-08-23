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
{
  0: begin // Consumo de combustible
    ComboBox2.Items.AddStrings(['']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
}
  0: begin // Energía
    ComboBox2.Items.AddStrings(['Julio','Kilojulio','Caloría-gramo','Kilocaloría','Vatio-hora','Kilovatio-hora','Electrón-voltio','Unidad térmica británica','Termia estadounidense','Pie-libra fuerza']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;

  1: begin // Frecuencia
    ComboBox2.Items.AddStrings(['Hercio (Hz)','Kilohercio (kHz)','Megahercio (MHz)','Gigahercio (GHz)']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;

  2: begin // Longitud
    ComboBox2.Items.AddStrings(['Kilómetros','Metros','Centímetros','Milímetros','Millas','Pies','Pulgadas']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;

  3: begin // Masa
    ComboBox2.Items.AddStrings(['Toneladas','Kilogramos','Gramos','Miligramos','Microgramos','Libras']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;

  4: begin // Tamaño de datos
    ComboBox2.Items.AddStrings(['Bit','Kilobit','Kibibit','Megabit','Mebibit','Gigabit','Gibibit','Terabit','Tebibit','Petabit','Pebibit','Byte','Kilobyte','Kibibyte','Megabyte','Mebibyte','Gigabyte','Gibibyte','Terabyte','Tebibyte']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;

  5: begin // Temperatura
    ComboBox2.Items.AddStrings(['Celcius','Fahrenheit','Kelvin']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;

  6: begin // Tiempo
    ComboBox2.Items.AddStrings(['Horas','Minutos','Segundos']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;

  7: begin // Velocidad
    ComboBox2.Items.AddStrings(['Kilómetros por hora', 'Metros por segundo', 'Millas por hora', 'Pies por segundo', 'Nudos']);
    ComboBox3.Items.AddStrings(ComboBox2.Items);
    end;

  8: begin // Capacitancia
    ComboBox2.Items.AddStrings(['Faradio','Milifaradio','Microfaradio','Nanofaradio','Picofaradio','Femtofaradio']);
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

  // Consumo de combustible
{ 0: begin
    if unidadDe = '' then valor := valor
    else if unidadDe = '' then valor := valor;

    if unidadA = '' then resultado := valor
    else if unidadA = '' then resultado := valor;
  end;
}
  // Energía
  0: begin
    // pasar todo a Julios
    if unidadDe = 'Julio' then valor := valor
    else if unidadDe = 'Kilojulio' then valor := valor * 1000
    else if unidadDe = 'Caloría-gramo' then valor := valor * 4.184
    else if unidadDe = 'Kilocaloría' then valor := valor * 4184
    else if unidadDe = 'Vatio-hora' then valor := valor * 3600
    else if unidadDe = 'Kilovatio-hora' then valor := valor * 3.6e6
    else if unidadDe = 'Electrón-voltio' then valor := valor * 1.602176634e-19
    else if unidadDe = 'Unidad térmica británica' then valor := valor * 1055.05505
    else if unidadDe = 'Termia estadounidense' then valor := valor * 1.055e8
    else if unidadDe = 'Pie-libra fuerza' then valor := valor * 1.35581795;

    // de Julios a destino
    if unidadA = 'Julio' then resultado := valor
    else if unidadA = 'Kilojulio' then resultado := valor / 1000
    else if unidadA = 'Caloría-gramo' then resultado := valor / 4.184
    else if unidadA = 'Kilocaloría' then resultado := valor / 4184
    else if unidadA = 'Vatio-hora' then resultado := valor / 3600
    else if unidadA = 'Kilovatio-hora' then resultado := valor / 3.6e6
    else if unidadA = 'Electrón-voltio' then resultado := valor / 1.602176634e-19
    else if unidadA = 'Unidad térmica británica' then resultado := valor / 1055.05505
    else if unidadA = 'Termia estadounidense' then resultado := valor / 1.055e8
    else if unidadA = 'Pie-libra fuerza' then resultado := valor / 1.35581795;
  end;

  // Frecuencia
  1: begin
    // pasar todo a Hz
    if unidadDe = 'Hercio (Hz)' then valor := valor
    else if unidadDe = 'Kilohercio (kHz)' then valor := valor * 1000
    else if unidadDe = 'Megahercio (MHz)' then valor := valor * 1000000
    else if unidadDe = 'Gigahercio (GHz)' then valor := valor * 1000000000;

    // de Hz a destino
    if unidadA = 'Hercio (Hz)' then resultado := valor
    else if unidadA = 'Kilohercio (kHz)' then resultado := valor / 1000
    else if unidadA = 'Megahercio (MHz)' then resultado := valor / 1000000
    else if unidadA = 'Gigahercio (GHz)' then resultado := valor / 1000000000;
  end;

  // Longitud
  2: begin
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

  // Masa
  3: begin
    if unidadDe = 'Toneladas' then valor := valor * 1000
    else if unidadDe = 'Gramos' then valor := valor / 1000
    else if unidadDe = 'Miligramos' then valor := valor / 1000000
    else if unidadDe = 'Microgramos' then valor := valor / 1000000000
    else if unidadDe = 'Libras' then valor := valor * 0.453592;

    if unidadA = 'Toneladas' then resultado := valor / 1000
    else if unidadA = 'Gramos' then resultado := valor * 1000
    else if unidadA = 'Miligramos' then resultado := valor * 1000000
    else if unidadA = 'Microgramos' then resultado := valor * 1000000000
    else if unidadA = 'Libras' then resultado := valor / 0.453592
    else resultado := valor;
  end;

  // Tamaño de datos
  4: begin
    if unidadDe = 'Bit' then valor := valor * 8
    else if unidadDe = 'Kilobit' then valor := valor * 125
    else if unidadDe = 'Kibibit' then valor := valor * 128
    else if unidadDe = 'Megabit' then valor := valor * 125000
    else if unidadDe = 'Mebibit' then valor := valor * 131100
    else if unidadDe = 'Gigabit' then valor := valor * 1.25E+8
    else if unidadDe = 'Gibibit' then valor := valor * 1.342E+8
    else if unidadDe = 'Terabit' then valor := valor * 1.25E+11
    else if unidadDe = 'Tebibit' then valor := valor * 1.374E+11
    else if unidadDe = 'Petabit' then valor := valor * 1.25E+14
    else if unidadDe = 'Pebibit' then valor := valor * 1.407E+14
    else if unidadDe = 'Byte' then valor := valor
    else if unidadDe = 'Kilobyte' then valor := valor * 1000
    else if unidadDe = 'Kibibyte' then valor := valor * 1024
    else if unidadDe = 'Megabyte' then valor := valor * 1000000
    else if unidadDe = 'Mebibyte' then valor := valor * 1.049E+6
    else if unidadDe = 'Gigabyte' then valor := valor * 1000000000
    else if unidadDe = 'Gibibyte' then valor := valor * 1.074E+9
    else if unidadDe = 'Tirabyte' then valor := valor * 1000000000000
    else if unidadDe = 'Tibibyte' then valor := valor * 1.1E+12
    else if unidadDe = 'Petabyte' then valor := valor * 1000000000000000
    else if unidadDe = 'Pebibyte' then valor := valor * 1.126E+15;

    if unidadA = 'Bit' then resultado := valor / 8
    else if unidadA = 'Kilobit' then resultado := valor / 125
    else if unidadA = 'Kibibit' then resultado := valor / 128
    else if unidadA = 'Megabit' then resultado := valor / 125000
    else if unidadA = 'Mebibit' then resultado := valor / 131100
    else if unidadA = 'Gigabit' then resultado := valor / 1.25E+8
    else if unidadA = 'Gibibit' then resultado := valor / 1.342E+8
    else if unidadA = 'Terabit' then resultado := valor / 1.25E+11
    else if unidadA = 'Tebibit' then resultado := valor / 1.374E+11
    else if unidadA = 'Petabit' then resultado := valor / 1.25E+14
    else if unidadA = 'Pebibit' then resultado := valor / 1.407E+14
    else if unidadA = 'Byte' then resultado := valor
    else if unidadA = 'Kilobyte' then resultado := valor / 1000
    else if unidadA = 'Kibibyte' then resultado := valor / 1024
    else if unidadA = 'Megabyte' then resultado := valor / 1000000
    else if unidadA = 'Mebibyte' then resultado := valor / 1.049E+6
    else if unidadA = 'Gigabyte' then resultado := valor / 1000000000
    else if unidadA = 'Gibibyte' then resultado := valor / 1.074E+9
    else if unidadA = 'Tirabyte' then resultado := valor / 1000000000000
    else if unidadA = 'Tibibyte' then resultado := valor / 1.1E+12
    else if unidadA = 'Petabyte' then resultado := valor / 1000000000000000
    else if unidadA = 'Pebibyte' then resultado := valor / 1.126E+15
    else resultado := valor;

    end;

  // Temperatura
  5: begin
    if unidadDe = 'Fahrenheit' then valor := (valor - 32) * 5/9
    else if unidadDe = 'Kelvin' then valor := valor - 273.15;

    if unidadA = 'Fahrenheit' then resultado := (valor * 9/5) + 32
    else if unidadA = 'Kelvin' then resultado := valor + 273.15
    else resultado := valor;
  end;

  // Tiempo
  6: begin
    if unidadDe = 'Segundos' then valor := valor
    else if unidadDe = 'Horas' then valor := valor * 3600
    else if unidadDe = 'Minutos' then valor := valor * 60;

    if unidadA = 'Segundos' then resultado := valor
    else if unidadA = 'Horas' then resultado := valor / 3600
    else if unidadA = 'Minutos' then resultado := valor / 60
    else resultado := valor;
  end;

  // Velocidad
  7: begin
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

  // Capacitancia
  8: begin
    if unidadDe = 'Faradio' then valor := valor
    else if unidadDe = 'Milifaradio' then valor := valor * 1E-3
    else if unidadDe = 'Microfaradio' then valor := valor * 1E-6
    else if unidadDe = 'Nanofaradio' then valor := valor * 1E-9
    else if unidadDe = 'Picofaradio' then valor := valor * 1E-12
    else if unidadDe = 'Femtofaradio' then valor := valor * 1E-15;

    if unidadA = 'Faradio' then resultado := valor
    else if unidadA = 'Milifaradio' then resultado := valor / 1E-3
    else if unidadA = 'Microfaradio' then resultado := valor / 1E-6
    else if unidadA = 'Nanofaradio' then resultado := valor / 1E-9
    else if unidadA = 'Picofaradio' then resultado := valor / 1E-12
    else if unidadA = 'Femtofaradio' then resultado := valor / 1E-15
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

