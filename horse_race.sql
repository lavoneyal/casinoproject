create proc Horse_Race (@playerId int,@betid int) 
as
begin

	Declare @date datetime = getdate()--(select top 1 date from dim_date ORDER BY NEWID())
	Declare @gameid  int = 2
	declare @typeid int = (select actionid from Actions where actionid = 3)
	Declare @amount money = (select bet from wallet where bet = @betid)
	declare @winlose int = 0
	declare @Balanc money = (SELECT SUM(balance) FROM wallet WHERE PlayerID = @playerid)

	DECLARE @Counter INT
	declare @bet int = (select top 1 Number from symbols where number <4 ORDER BY NEWID())
	DECLARE @Horse1 VARCHAR(100) = '1...........'
	DECLARE @Horse2 VARCHAR(100) = '2...........'
	DECLARE @Horse3 VARCHAR(100) = '3...........'
	DECLARE @Horse4 VARCHAR(100) = '4...........'
	DECLARE @Horse5 VARCHAR(100) = '5...........'

	DECLARE @a INT = 0
	DECLARE @b INT = 0
	DECLARE @c INT = 0
	DECLARE @d INT = 0
	DECLARE @e INT = 0

	declare @xa int
	declare @xb int
	declare @xc int
	declare @xd int
	declare @xe int
 begin

	 SET @Counter = 1
	 if @balanc<(select bet from wallet where Bet = @betid)
	 begin
	 select 'not enough funds'
	 return
	 end

	 begin
	 if not exists (select 1 from player where PlayerID = @playerid)
	 begin
	 SELECT 'USER IS NOT REGISTERED'
	 RETURN
	 end

	if  (SELECT isblock FROM player where PlayerID = @playerid) =1
	begin
	SELECT 'USER IS BLOCKED'
	RETURN
	end
	end

		WHILE ( @Counter <= 10)	
		BEGIN
			set @xa =(select top 1 Number from symbols where number <4 ORDER BY NEWID())
			set @xb =(select top 1 Number from symbols where number <4 ORDER BY NEWID())
			set @xc =(select top 1 Number from symbols where number <4 ORDER BY NEWID())
			set @xd =(select top 1 Number from symbols where number <4 ORDER BY NEWID())
			set @xe =(select top 1 Number from symbols where number <4 ORDER BY NEWID())
			print RIGHT(@Horse1, @a)  + LEFT(@Horse1, LEN(@Horse1) -@a)
			print RIGHT(@Horse2, @b)  + LEFT(@Horse2, LEN(@Horse2) -@b)
			print RIGHT(@Horse3, @c)  + LEFT(@Horse3, LEN(@Horse3) -@C)
			print RIGHT(@Horse4, @d)  + LEFT(@Horse4, LEN(@Horse4) -@d)
			print RIGHT(@Horse5, @e)  + LEFT(@Horse5, LEN(@Horse5) -@E)
			print '____________________________________________________________________________'

			set @a = @a+@xa
			set @b = @b+@xb
			set @c = @c+@xc
			set @d = @d+@xd
			set @e = @e+@xe

			  IF @a >=9 or @b>=9 or @c >=9 or @d>=9 or @e>=9
			  BEGIN
			  print @a  print @b  print @c  print @d  print @e 
			  BREAK
			  end
	  			SET @Counter  = @Counter  + 1
		end

begin
	 
	  if (@a >@b and @a>@c and @a>@d and @a>@e )
		 begin
		     print 'Horse 1 Is the winner!!!!' +' Round: '+CONVERT(VARCHAR,@counter)+ ' '+'Yore Bet:' + CONVERT(VARCHAR,@bet)
			   if  @bet = 1
			    begin
				set @winlose = 1
					insert into Rounds (GameID,PlayerID,Date,Bet,win)
					values( @gameid, @playerid,@date,@betid,@winlose)

					insert into transactions(playerid,date,amount,actionid)
					values(@playerid,@date,@amount,@typeid)
			    end
			   else 
			    begin
					insert into Rounds (GameID,PlayerID,Date,Bet,win)
					values( @gameid, @playerid,@date,@betid,@winlose)

					insert into transactions(playerid,date,amount,actionid)
					values(@playerid,@date,(-1*@amount),@typeid)
		        end
	      end
	  else if (@b>@a and @b>@c and @b>@d and @b>@e )
		 begin
		     print 'Horse 2 is the winner!!!!'+' Round: '+CONVERT(VARCHAR,@counter)+' '+ 'Yore Bet:' + CONVERT(VARCHAR,@bet)
			   if  @bet = 2
			    begin
				set @winlose = 1
					insert into Rounds (GameID,PlayerID,Date,Bet,win)
					values( @gameid, @playerid,@date,@betid,@winlose)

					insert into transactions(playerid,date,amount,actionid)
					values(@playerid,@date,@amount,@typeid)
			    end

			   else
							insert into Rounds (GameID,PlayerID,Date,Bet,win)
					values( @gameid, @playerid,@date,@betid,@winlose)

					insert into transactions(playerid,date,amount,actionid)
					values(@playerid,@date,(-1*@amount),@typeid)
	     end

	  else if (@c >@a and @c>@b and @c>@d and @c>@e)
		begin
		    print 'Horse 3 is the winner!!!!'+' Round: '+CONVERT(VARCHAR,@counter)+' '+ 'Yore Bet:' + CONVERT(VARCHAR,@bet)
		      if  @bet = 3
			   begin
			   set @winlose = 1
							insert into Rounds (GameID,PlayerID,Date,Bet,win)
					values( @gameid, @playerid,@date,@betid,@winlose)

					insert into transactions(playerid,date,amount,actionid)
					values(@playerid,@date,@amount,@typeid)
			   end

			  else
									insert into Rounds (GameID,PlayerID,Date,Bet,win)
					values( @gameid, @playerid,@date,@betid,@winlose)

					insert into transactions(playerid,date,amount,actionid)
					values(@playerid,@date,(-1*@amount),@typeid)
		end
	  else if (@d >@a and @d>@b and @d>@c and @d>@e)
		begin
		    print 'Horse 4 is the winner!!!!'+' Round: '+CONVERT(VARCHAR,@counter)+' '+ 'Yore Bet:' + CONVERT(VARCHAR,@bet)
			if  @bet = 4
			 begin
			 set @winlose = 1
						insert into Rounds (GameID,PlayerID,Date,Bet,win)
					values( @gameid, @playerid,@date,@betid,@winlose)

					insert into transactions(playerid,date,amount,actionid)
					values(@playerid,@date,@amount,@typeid)
			 end

			else 
										insert into Rounds (GameID,PlayerID,Date,Bet,win)
					values( @gameid, @playerid,@date,@betid,@winlose)

					insert into transactions(playerid,date,amount,actionid)
					values(@playerid,@date,(-1*@amount),@typeid)
		    end
	  else if (@e >@a and @e>@b and @e>@c and @e>@d )
		 begin
		   print 'Horse 5 is the winner!!!!'+' Round: '+CONVERT(VARCHAR,@counter)+' '+ 'Yore Bet:' + CONVERT(VARCHAR,@bet)
		     if  @bet = 5
		      begin
			  set @winlose = 1
						insert into Rounds (GameID,PlayerID,Date,Bet,win)
					values( @gameid, @playerid,@date,@betid,@winlose)

					insert into transactions(playerid,date,amount,actionid)
					values(@playerid,@date,@amount,@typeid)
		      end

		    else
			begin
					insert into Rounds (GameID,PlayerID,Date,Bet,win)
					values( @gameid, @playerid,@date,@betid,@winlose)

					insert into transactions(playerid,date,amount,actionid)
					values(@playerid,@date,(-1*@amount),@typeid)
					end
		 end	
	
	end
end
end
GO