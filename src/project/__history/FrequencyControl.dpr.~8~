program FrequencyControl;

uses
  System.StartUpCopy,
  FMX.Forms,
  ULogin in '..\.pas\ULogin.pas' {FLogin},
  UPrincipal in '..\.pas\UPrincipal.pas' {FPrincipal},
  UModulo in '..\.pas\UModulo.pas' {Modulo: TDataModule},
  FMXDelphiZXIngQRCode in '..\.pas\FMXDelphiZXIngQRCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TModulo, Modulo);
  //Application.CreateForm(TFPrincipal, FPrincipal);

  Application.Run;
end.
