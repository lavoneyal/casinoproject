create procedure sp_login 
(@username varchar(10) , @password varchar(10))
as begin
	if exists  ( select  1 from players
			where username = @username
			and @password = password and isblocked = 0)
	begin 
		update players 
		set NUmFailed  =0 
		return 1 
	end
	
	else 
	begin 
		if exists  ( select  1 from players
			where username = @username)
		update player 
		set NUmFailed  += 1 
	where username = @username

		if (( select  NUmFailed from player
			where username = @username)=  5)
		update player 	
			set isblock = 1
			where username = @username


	return 0

	end 
 end
GO