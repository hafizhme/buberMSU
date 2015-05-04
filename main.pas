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
	// blabla
	writeln;
end;

procedure User();
begin
	clrscr;
	writeln('1. bantuan | 9. menu sebelumnya | 0. keluar');
	write('Pesan SMS : ');	readln(sms_user);
	if ( sms_user = '1' ) then
	begin
		writeln('----PENGGUNAAN aplikasi buberMSU');
		writeln;
		writeln('buber reg');
		writeln('	pendaftaran diri');
		writeln('		buber reg#nama#jeniskelamin(l/p)#');
		writeln('buber ccl');
		writeln('	pengunduran diri');
		writeln('		buber ccl#nomor_urut#');
		writeln('buber upd');
		writeln('	perubahan data diri');
		writeln('		buber upd#nomor_urut#nama#jeniskelamin(l/p)#');
		writeln;
		writeln('tekan ENTER untuk melanjutan');
		readln;
		User();
	end
	else if ( sms_user = '9' ) then
	begin
		writeln('belum tahu');
	end
	else if ( sms_user <> '0' ) then
	begin
		// masuk ke format
		readln;
		User();
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
