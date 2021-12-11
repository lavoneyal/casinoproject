 create proc sp_registration (
@username varchar(100), 
@password varchar(50),
@FirstName varchar(50),
@Lastname varchar(50),
@Countryid   int ,
@Email    varchar(50),
@Genderid    int,
@BirthDate date )
as
begin
declare @i int = 0
while (1 = 1)
 begin
	 if exists ( select 1 from player
		where username = @username ) 
		begin  	
		declare @r int 
		set @r = rand() *100

		while ( 1 =1 ) 
		begin 
			set @r = rand() *100


			if not exists ( select  1 from player
				where username =  concat (@username , @r ) )
				begin
				select  'USERNAME Already EXISTS' +' - '+'Alternative user:  ' +concat (@username , @r ) 
				return 
		end
		BREAK
		end
		end

	 If  CHARINDEX('Password',@password) > 0 or @password = @Username or CHARINDEX('Pass',@password) > 0 or CHARINDEX('Word',@password) > 0
		or @password in(select [password] from weakpasses ) or @password not LIKE '%[0-9]%'
		
		begin	
		select 'Weak password'
		BREAK
		end
	

	 if @email NOT LIKE '%_@__%.__%' or @email in (select Email from player)
		 begin
		 select 'Invalid Email'
		 BREAK
		 end

		
	
	 if DATEDIFF(YEAR, @BirthDate,GETDATE())<18

		 begin
		 SELECT 'NOT OLD ENOUGH'
		 BREAK
		 end
	else 
			insert player(username, password, firstname, lastname, countryid, email,GenderID, BirthDate)

			values(@username , @password, @firstname, @lastname, @Countryid, @email, @Genderid, @BirthDate)

			SELECT 'GOOD LUCK'
			end 
		

		end
GO