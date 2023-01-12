CREATE TABLE [dbo].[game] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [theme_id]   INT           NOT NULL,
    [reference]  VARCHAR (30)  NOT NULL,
    [name_of]    VARCHAR (100) NOT NULL,
    [edition_of] VARCHAR (4)   NOT NULL,
    CONSTRAINT [game_pkey] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [game_fkey_1] FOREIGN KEY ([theme_id]) REFERENCES [dbo].[theme] ([id]),
    CONSTRAINT [game_lkey_reference] UNIQUE NONCLUSTERED ([reference] ASC)
);


GO

CREATE TABLE [dbo].[part] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [category_id] INT           NOT NULL,
    [color_id]    INT           NOT NULL,
    [reference]   VARCHAR (30)  NOT NULL,
    [name_of]     VARCHAR (256) NOT NULL,
    CONSTRAINT [part_pkey] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [part_fkey_1] FOREIGN KEY ([category_id]) REFERENCES [dbo].[category] ([id]),
    CONSTRAINT [part_fkey_2] FOREIGN KEY ([color_id]) REFERENCES [dbo].[color] ([id])
);


GO

CREATE TABLE [dbo].[category] (
    [id]      INT          IDENTITY (1, 1) NOT NULL,
    [name_of] VARCHAR (50) NOT NULL,
    CONSTRAINT [category_pkey] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO

CREATE TABLE [dbo].[theme] (
    [id]       INT          IDENTITY (1, 1) NOT NULL,
    [theme_id] INT          NULL,
    [name_of]  VARCHAR (50) NOT NULL,
    CONSTRAINT [theme_pkey] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [theme_fkey_1] FOREIGN KEY ([theme_id]) REFERENCES [dbo].[theme] ([id])
);


GO

CREATE TABLE [dbo].[color] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [num]         INT          NOT NULL,
    [name_of]     VARCHAR (30) NOT NULL,
    [rgb]         VARCHAR (30) NOT NULL,
    [transparent] VARCHAR (1)  NOT NULL,
    CONSTRAINT [color_pkey] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [color_lkey_transparent] CHECK ([transparent]='f' OR [transparent]='t'),
    CONSTRAINT [color_lkey_num] UNIQUE NONCLUSTERED ([num] ASC)
);


GO

CREATE TABLE [dbo].[composition] (
    [id]       INT IDENTITY (1, 1) NOT NULL,
    [game_id]  INT NOT NULL,
    [part_id]  INT NOT NULL,
    [quantity] INT NOT NULL,
    CONSTRAINT [composition_pkey] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [composition_fkey_1] FOREIGN KEY ([game_id]) REFERENCES [dbo].[game] ([id]),
    CONSTRAINT [composition_fkey_2] FOREIGN KEY ([part_id]) REFERENCES [dbo].[part] ([id]),
    CONSTRAINT [composition_lkey_game_part] UNIQUE NONCLUSTERED ([game_id] ASC, [part_id] ASC)
);


GO

