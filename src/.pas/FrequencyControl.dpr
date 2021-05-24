program FrequencyControl;

uses
  System.StartUpCopy,
  FMX.Forms,
  ULogin in 'ULogin.pas' {FLogin},
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UModulo in 'UModulo.pas' {Modulo: TDataModule},
  FMXDelphiZXIngQRCode in 'FMXDelphiZXIngQRCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TModulo, Modulo);
  Application.CreateForm(TFLogin, FLogin);
  //Application.CreateForm(TFPrincipal, FPrincipal);

  Application.Run;
end.
