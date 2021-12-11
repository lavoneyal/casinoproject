CREATE TABLE [dbo].[ACTIONS] (
    [ActionID] INT           NOT NULL,
    [Action]   VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([ActionID] ASC)
);


GO
PRINT N'Creating Table [dbo].[COUNTRIES]...';


GO
CREATE TABLE [dbo].[COUNTRIES] (
    [COUNTRYID]   INT           NOT NULL,
    [COUNTRYNAME] VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([COUNTRYID] ASC)
);


GO
PRINT N'Creating Table [dbo].[GAMES]...';


GO
CREATE TABLE [dbo].[GAMES] (
    [GameID]   INT           NOT NULL,
    [GameName] VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([GameID] ASC)
);


GO
PRINT N'Creating Table [dbo].[GENDER]...';


GO
CREATE TABLE [dbo].[GENDER] (
    [GENDERID] BIT           NOT NULL,
    [GENDER]   VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([GENDERID] ASC)
);


GO
PRINT N'Creating Table [dbo].[passwordhistory]...';


GO
CREATE TABLE [dbo].[passwordhistory] (
    [playerid]  INT            NOT NULL,
    [Password]  NVARCHAR (100) NOT NULL,
    [ValidFrom] DATETIME2 (2)  NULL,
    [ValidTo]   DATETIME2 (2)  NULL
);


GO
PRINT N'Creating Table [dbo].[PLAYER]...';


GO
CREATE TABLE [dbo].[PLAYER] (
    [playerID]  INT            IDENTITY (1111, 100) NOT NULL,
    [username]  VARCHAR (10)   NOT NULL,
    [password]  VARCHAR (10)   NOT NULL,
    [FirstName] NVARCHAR (20)  NOT NULL,
    [Lastname]  NVARCHAR (20)  NOT NULL,
    [Address]   NVARCHAR (100) NULL,
    [CountryID] INT            NOT NULL,
    [Email]     NVARCHAR (100) NOT NULL,
    [GenderID]  BIT            NULL,
    [BirthDate] DATETIME       NOT NULL,
    [isblock]   BIT            NULL,
    [NUmFailed] INT            NULL,
    PRIMARY KEY CLUSTERED ([playerID] ASC),
    UNIQUE NONCLUSTERED ([username] ASC)
);


GO
PRINT N'Creating Table [dbo].[playerdata]...';


GO
CREATE TABLE [dbo].[playerdata] (
    [usernaMe]  NVARCHAR (255) NULL,
    [password]  NVARCHAR (255) NULL,
    [FirstNaMe] NVARCHAR (255) NULL,
    [LastnaMe]  NVARCHAR (255) NULL,
    [Address]   NVARCHAR (255) NULL,
    [CountryID] FLOAT (53)     NULL,
    [EMail]     NVARCHAR (255) NULL,
    [GenderID]  FLOAT (53)     NULL,
    [BirthDate] DATETIME       NULL,
    [Balance]   FLOAT (53)     NULL
);


GO
PRINT N'Creating Table [dbo].[ROUNDS]...';


GO
CREATE TABLE [dbo].[ROUNDS] (
    [RoundID]  INT      IDENTITY (100, 1) NOT NULL,
    [GameID]   INT      NOT NULL,
    [PlayerID] INT      NOT NULL,
    [Date]     DATETIME NOT NULL,
    [Bet]      INT      NULL,
    [Win]      INT      NULL,
    PRIMARY KEY CLUSTERED ([RoundID] ASC)
);


GO
PRINT N'Creating Table [dbo].[slotCombo]...';


GO
CREATE TABLE [dbo].[slotCombo] (
    [slotID] INT          NOT NULL,
    [reel1]  VARCHAR (20) NOT NULL,
    [reel2]  VARCHAR (20) NOT NULL,
    [reel3]  VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([slotID] ASC)
);


GO
PRINT N'Creating Table [dbo].[Symbols]...';


GO
CREATE TABLE [dbo].[Symbols] (
    [Number] INT          NULL,
    [Symbol] VARCHAR (10) NULL
);


GO
PRINT N'Creating Table [dbo].[TRANSACTIONS]...';


GO
CREATE TABLE [dbo].[TRANSACTIONS] (
    [TransID]  INT      IDENTITY (100, 10) NOT NULL,
    [PlayerID] INT      NOT NULL,
    [Date]     DATETIME NOT NULL,
    [Amount]   INT      NULL,
    [ActionID] INT      NOT NULL
);


GO
PRINT N'Creating Table [dbo].[userlogin]...';


GO
CREATE TABLE [dbo].[userlogin] (
    [playerid] INT           NULL,
    [UserName] NVARCHAR (50) NOT NULL,
    [LoggedIn] INT           NULL,
    [time]     DATETIME      NULL
);


GO
PRINT N'Creating Table [dbo].[wallet]...';


GO
CREATE TABLE [dbo].[wallet] (
    [playerid] INT      NOT NULL,
    [deposit]  INT      NOT NULL,
    [withdraw] INT      NOT NULL,
    [bet]      INT      NOT NULL,
    [win]      INT      NOT NULL,
    [date]     DATETIME NULL,
    [balance]  AS       (([deposit] - [withdraw]) + ([win] - [bet]))
);


GO
PRINT N'Creating Table [dbo].[WeakPasses]...';


GO
CREATE TABLE [dbo].[WeakPasses] (
    [Password] FLOAT (53) NULL
);


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[PLAYER]...';


GO
ALTER TABLE [dbo].[PLAYER]
    ADD DEFAULT ((0)) FOR [isblock];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[PLAYER]...';


GO
ALTER TABLE [dbo].[PLAYER]
    ADD DEFAULT ((0)) FOR [NUmFailed];


GO
PRINT N'Creating Foreign Key [dbo].[FK_PLAYER_COUNTRY]...';


GO
ALTER TABLE [dbo].[PLAYER]
    ADD CONSTRAINT [FK_PLAYER_COUNTRY] FOREIGN KEY ([CountryID]) REFERENCES [dbo].[COUNTRIES] ([COUNTRYID]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_PLAYER_Genders]...';


GO
ALTER TABLE [dbo].[PLAYER]
    ADD CONSTRAINT [FK_PLAYER_Genders] FOREIGN KEY ([GenderID]) REFERENCES [dbo].[GENDER] ([GENDERID]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_rounds_games]...';


GO
ALTER TABLE [dbo].[ROUNDS]
    ADD CONSTRAINT [FK_rounds_games] FOREIGN KEY ([GameID]) REFERENCES [dbo].[GAMES] ([GameID]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_rounds_player]...';


GO
ALTER TABLE [dbo].[ROUNDS]
    ADD CONSTRAINT [FK_rounds_player] FOREIGN KEY ([PlayerID]) REFERENCES [dbo].[PLAYER] ([playerID]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_trans_action]...';


GO
ALTER TABLE [dbo].[TRANSACTIONS]
    ADD CONSTRAINT [FK_trans_action] FOREIGN KEY ([ActionID]) REFERENCES [dbo].[ACTIONS] ([ActionID]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_trans_player]...';


GO
ALTER TABLE [dbo].[TRANSACTIONS]
    ADD CONSTRAINT [FK_trans_player] FOREIGN KEY ([PlayerID]) REFERENCES [dbo].[PLAYER] ([playerID]);


GO
PRINT N'Creating Procedure [dbo].[Game_slot_machine]...';


GO