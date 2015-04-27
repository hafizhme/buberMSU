program BuberMSU;
{ ************************************************************************
  * Project Name	: buberMSU
  * File_Name		: Main.pas
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

procedure Main();
begin
	repeat
		Select_Menu();
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
		
	until x = 0;
end;

begin
	Main();
end.
