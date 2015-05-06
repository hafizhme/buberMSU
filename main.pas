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
uses crt, sysutils;

type peserta = record
	nm : string;	// nama
	jk : char;		// jenis kelamin --> l/p
	nu : integer;	// nomor urut;
end;

var
	x: Integer;
	user_sms : string;
	key : string;
	p : array[1..100] of peserta;
	i,j,k : integer;
	fout : text;

procedure Admin_Lihat();
{I.S.	: blank}
{F.S.	: ditampilkan isi dari array p}
var
	x,y: integer;
	tmp : peserta;
begin
	for x := 2 to k do
	begin
		tmp.nu := p[x].nu;	tmp.nm := p[x].nm;	tmp.jk := p[x].jk;
		y := x;
		while ( y > 1 ) and ( tmp.nu < p[y-1].nu ) do
		begin
			p[y].nu := p[y-1].nu;	p[y].nm := p[y-1].nm;	p[y].jk := p[y-1].jk;
			y := y-1;
		end;
		p[y].nm := tmp.nm;	p[y].nu := tmp.nu;	p[y].jk := tmp.jk;
	end;

	for i := 1 to k do
	writeln(p[i].nu,' ',p[i].nm,'	',p[i].jk);
end;

procedure Admin_Cari();
{I.S.	: user diminta memasukkan sebuah nama}
{F.S.	: ditampilkan peserta bernama tersebut}
var
	nama: string;
	z : integer;
begin
	clrscr;
	write('Masukkan nama yang dicari : ');
	readln(nama);
	writeln;
	writeln('Hasil Pencarian :');
	z := 0;

	for i := 1 to k do
		if p[i].nm = nama then
			begin
				z := z + 1;
				writeln(p[i].nu,' ',p[i].nm,'	',p[i].jk);
			end;

	if z = 0 then
		writeln('Hasil pencarian tidak ditemukan')
	else
		writeln('Jumlah hasil pencarian sebanyak ',z);
end;

procedure Admin_Cetak();
{I.S.	: seluruh pendaftaran telah selesai}
{F.S.	: data hasil pendaftaran diperoleh melalui file txt}
begin
	assign(fout,'peserta.txt');
	rewrite(fout);

	writeln(fout,'DAFTAR PESERTA BUBER MSU hari ini');
	writeln(fout);
	writeln(fout,'putra	:');
	for i := 1 to k do
	if p[i].jk = 'l' then
	begin
		if p[i].nu <> 0 then
		writeln(fout,'  ',p[i].nu,'.	',p[i].nm);
	end;

	writeln(fout);
	writeln(fout,'putri	:');
	for i := 1 to j do
	if p[i].jk = 'p' then
	begin
		if p[i].nu <> 0 then
		writeln(fout,'  ',p[i].nu,'.	',p[i].nm);
	end;

	close(fout);

	writeln('Pencetakan berhasil!!');
end;

procedure Admin();
{I.S.	: Menampilkan pilihan menu di dalam mode admin}
{F.S.	: user memasukkan pilihan menu,
		  user dibawa ke pilihan menunya}
begin
	clrscr;
	writeln('---- ADMIN buberMSU');
	writeln;
	writeln('1. Lihat Semua Pendaftar');
	writeln('2. Cari pendaftar');
	writeln('3. Cetak data ke txt');
	writeln('0. Keluar');
	writeln;
	write('Pilihan :');	readln(x);

	if ( x = 1 ) then
		begin
			clrscr;
			Admin_Lihat();
			readln;
			Admin();
		end
	else if ( x = 2 ) then
		begin
			clrscr;
			Admin_Cari();
			readln;
			Admin();
		end
	else if ( x = 3 ) then
		begin
			clrscr;
			Admin_Cetak();
			readln;
			Admin();
		end
	else if ( x <> 0 ) then
		begin
			clrscr;
			writeln('Please input correct menu!!');
			writeln('Try Again!!');
			readln;
			Admin();
		end;
end; // End of Admin() procedure

procedure User_Daftar();
{I.S.	: didapatkan bahwa sms tersebut adalah pendaftaran}
{F.S.	: data pendaftaran dimasukkan ke array}
begin
	k := k+1;
	j := j+1;
	p[k].nu := j;

	p[k].nm := '';
	i := i + 1;
	while user_sms[i] <> '#' do
	begin
		p[k].nm := p[k].nm + user_sms[i];
		i := i + 1;
	end;

	i := i + 1;
	p[k].jk := user_sms[i];

	;

end;

procedure User_Cancel();
{I.S.	: diberikan format sms cancel}
{F.S.	: data yang diinginkan dihapus dari data}
var
	nomor : Integer;
	setring : string;
	z : integer;
begin
	setring := '';
	i := i + 1;
	while user_sms[i] <> '#' do
	begin
		setring := setring + user_sms[i];
		i := i + 1;
	end;
	nomor := StrToInt(setring);

	z := 1;
	while p[z].nu <> nomor do
	begin
		z := z + 1;
	end;

	p[z].nu := 0;
	p[z].nm := '--';
	p[z].jk := '-';

end;

procedure User_Update();
{I.S.	: diperoleh format update data}
{F.S.	: dicari nomor urut peserta, diassign ulang data peserta}
var
	nomor : Integer;
	setring : string;
	z : integer;
begin
	setring := '';
	i := i + 1;
	while user_sms[i] <> '#' do
	begin
		setring := setring + user_sms[i];
		i := i + 1;
	end;
	nomor := StrToInt(setring);

	z := 1;
	while p[z].nu <> nomor do
	begin
		z := z + 1;
	end;

	p[z].nm := '';
	p[z].jk := '-';

	i := i + 1;
	while user_sms[i] <> '#' do
	begin
		p[z].nm := p[z].nm + user_sms[i];
		i := i + 1;
	end;

	i := i + 1;
	p[z].jk := user_sms[i];

end;

procedure User_Format();
{I.S.	: belum diketahui format sms yang berlaku}
{F.S.	: sms dialihkan ke pemrosesan tergantung pada
		  format sms yang dipakai}
begin
	i := 1;
	key := '';

	while user_sms[i] <> '#' do
	begin
		key := key + user_sms[i];
		i := i + 1;
	end;

	if ( key = 'buberr') then
		begin
			User_Daftar();
			writeln('Selamat PENDAFTARAN berhasil, nomor urut anda adalah ',p[k].nu);
		end
	else if ( key = 'buberc' ) then
		begin
			User_Cancel();
			writeln('Selamat PEMBATALAN berhasil');
		end
	else if ( key = 'buberu' ) then
		begin
			User_Update();
			writeln('Selamat UPDATE berhasil');
		end
	else
		writeln('Format yang Anda kirimkan salah!!');
end; // End of User_Format() procedure

procedure User_Manual();
{I. S.	: blank}
{F. S.	: ditampilkan cara penggunaan aplikasi buberMSU
		  terutama terkait format SMS}
begin
	writeln('----PENGGUNAAN aplikasi buberMSU');
	writeln;
	writeln('buberr');
	writeln('	pendaftaran diri');
	writeln('		buberr#nama#jeniskelamin(l/p)#');
	writeln('buberc');
	writeln('	pengunduran diri');
	writeln('		buberc#nomor_urut#');
	writeln('buberu');
	writeln('	perubahan data diri');
	writeln('		buberu#nomor_urut#nama#jeniskelamin(l/p)#');
	writeln;
end; // End of User_Manual() procedure

procedure User();
{I.S.	: tampilan sms user,
		  menampilkan layar sms,
		  menampilkan balasan sms}
{F.S.	: user mengisikan smsnya di sini
		  dari masukan user dapat ditentukan
		  apa yang harus dilakukan}
begin
	clrscr;
	writeln('1. bantuan | 0. keluar');

	writeln('Pesan SMS :');	readln(user_sms);
	writeln;
	writeln('Balasan SMS :');
	if ( user_sms = '1' ) then 
		begin
			User_Manual();	// Lanjut ke User Manual
			readln;
			clrscr;
			User();
		end
	else if ( user_sms[1] <> '0' ) then
		begin
			User_Format();	// Lnjut ke pemrosesan karakter format buberMSU
			readln;
			clrscr;
			User();
		end;
end; // End of User() procedure

procedure Main();
{I.S.	: tidak ada yang dilakukan,
		  menampilkan mode yang tersedia}
{F.S.	: user memasukkan pilihan mode,
		  pilihan mode user diteruskan oleh
		  prosedur Mode_Pindah()}
begin
	clrscr;

	//Pilih Mode, User atau Admin
	clrscr;
	writeln('============BuberMSU=============');
	writeln('---------------------------------');
	writeln('Pilih Mode : ');
	writeln('1. User    --> masuk sebagai pendaftar buber');
	writeln('2. Admin   --> masuk sebagai admin');
	writeln('0. Exit');
	writeln;
	write('Pilihan anda : ');readln(x);

	if ( x = 1 ) then
		begin
			clrscr;
			User();		// Masuk ke mode user
			clrscr;
			Main();
		end
	else if ( x = 2 ) then
		begin
			clrscr;
			Admin();	// Masuk ke mode admin
			clrscr;
			Main();
		end
	else if ( x <> 0 ) then 
		begin
			clrscr;
			writeln('Please input correct menu!!');
			writeln('Try Again!!');
			readln;
			Main();
		end;	

end; // End of Main() procedure

begin
	j := 0;
	k := 0;
	Main();

end.
