program smschar;
{
	Project Name	: buberMSU
	File Name		: sms.pas
}

var
	key : string;
	teks : string;

	ci : integer;
	cc : char;
	pitaChar : string;

procedure START;
begin
	ci := 1;
	cc := pitaChar[ci];
end;

procedure ADV;
begin
	ci := ci + 1;
	cc := pitaChar[ci];
end;

begin 
	writeln('sms :');
	readln(teks);

	pitaChar := teks;

	START;
	while cc <> '#' do
	begin
		key := key + cc;
		ADV;
	end;

	case key of
		'buber reg': writeln('Anda memilih daftar');
		'buber ccl': writeln('Anda memilih cancel');
		'buber upd': writeln('Anda memilih update');
		else 
			writeln('masukan anda salah');
	end;

readln;
end.
