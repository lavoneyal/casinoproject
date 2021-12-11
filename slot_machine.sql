create proc Game_slot_machine 
 as
 begin
	declare @reel1 VARCHAR(10) 
	declare @reel2 VARCHAR(10)
	declare @reel3 VARCHAR(10)
	declare @playerid int
	declare @bet int
	declare @r int 
	declare @p int
	declare @win int

	set @reel1 = (select top 1 reel1 from slotcombo ORDER BY NEWID())
	set @reel2 = (select top 1 reel2 from slotcombo ORDER BY NEWID())
	set @reel3 = (select top 1 reel3 from slotcombo ORDER BY NEWID())
	set @playerid = (Select top 1 playerid from player  ORDER BY NEWID())
	set @bet = (Select floor(rand()*1000))
	select @reel1, @reel2, @reel3 

	begin
		if @reel1=@reel2 and @reel2=@reel3
		begin
		set @bet = @bet
		set @win = @bet
		
		insert into rounds (gameid,playerid,[date],BET,win)
		values(1,@playerid, getdate(),@bet,@win)
		end
		else
		begin 
			set @bet = @bet
			set @win = 0

			insert into rounds (gameid,playerid,[date],BET,win)
			values(1,@playerid, getdate(),@bet,@win)
	end
	end
	end
	EXECUTE Game_slot_machine 
	select * from rounds
GO