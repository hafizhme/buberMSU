program BuberMSU;
{ ************************************************************************
  * File_Name		: BuberMSU.pas
  * Auhtor			: S Hafizh R Harsono
					  M Andika S
					  Fitrah Bima N
					  Medina Diana N
  * Date Start		: 22 April 2015
  * Date Release	: .. ..... ....
  * Description		: To provide registration BuberMSU registration
					  via sms.Please note that we have user and admin
					  interface that simulate user as participant,
					  admin as one who can look for its participant
************************************************************************** }
uses crt;

var
	x: Integer;
	sms_user : string;

procedure Select_Mode();
begin
	writeln('============BuberMSU=============');
	writeln('---------------------------------');
	writeln('Pilih Mode : ');
	writeln('1. User    --> masuk sebagai pendaftar buber');
	writeln('2. Admin   --> masuk sebagai admin');
	writeln('0. Exit');
	writeln;
	write('Pilihan anda : ');read(x);
end;

procedure Admin();
begin
	
end;

procedure User();
begin
	clrscr;
	writeln('1. bantuan | 0. keluar');
	write('Pesan SMS : ');	readln(sms_user);
	if ( sms_user = 1 ) then
	begin
		// tampilkan format daftar, update, delete
	end
	else if ( sms_user <> 0 ) then
	begin
		// KERJAIN YANG INI!!!!! <<<<------------------------<<<<<<<------------------<<<<<<<<<----
		// membaca format
		// ada tiga kemungkinan
		// baca dengan mesin karakter
		// outputkan ke layar
		// penyimpanan ke file biar hafizh aja yang ngerjain kalau bingung
		
	end;

end;

procedure Main();
begin
	clrscr;
	Select_Mode();
	if x = 1 then
		User()
	else if x = 2 then
		Admin()
	else if x <> 0 then 
	begin
		writeln('Please input correct menu!!');
		writeln('Try Again!!');
		readln;
		Main();
	end;	
end;



begin
	Main();
end.
