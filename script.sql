USE [app_info]
GO
/****** Object:  Table [dbo].[activities]    Script Date: 01/02/2019 00:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activities](
	[activity_id] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 01/02/2019 00:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[project_number] [varchar](8) NOT NULL,
	[name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[project_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historical_activity]    Script Date: 01/02/2019 00:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historical_activity](
	[register_id] [int] NOT NULL,
	[start] [datetime] NULL,
	[finish] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[register_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[register_activity]    Script Date: 01/02/2019 00:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[register_activity](
	[register_id] [int] NOT NULL,
	[activity_id] [int] NULL,
	[project_number] [varchar](8) NOT NULL,
	[start_date] [datetime] NULL,
	[final_date] [datetime] NULL,
	[total] [decimal](5, 4) NULL,
	[user_id] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[register_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 01/02/2019 00:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 01/02/2019 00:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [varchar](20) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[pwd] [varbinary](8000) NULL,
	[role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[role] ([role_id], [description]) VALUES (10, N'Admin')
ALTER TABLE [dbo].[historical_activity] ADD  DEFAULT (NULL) FOR [start]
GO
ALTER TABLE [dbo].[historical_activity] ADD  DEFAULT (NULL) FOR [finish]
GO
ALTER TABLE [dbo].[register_activity] ADD  DEFAULT (NULL) FOR [start_date]
GO
ALTER TABLE [dbo].[register_activity] ADD  DEFAULT (NULL) FOR [final_date]
GO
ALTER TABLE [dbo].[register_activity] ADD  DEFAULT (NULL) FOR [total]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT (NULL) FOR [pwd]
GO
ALTER TABLE [dbo].[register_activity]  WITH CHECK ADD FOREIGN KEY([activity_id])
REFERENCES [dbo].[activities] ([activity_id])
GO
ALTER TABLE [dbo].[register_activity]  WITH CHECK ADD FOREIGN KEY([project_number])
REFERENCES [dbo].[client] ([project_number])
GO
ALTER TABLE [dbo].[register_activity]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([role])
REFERENCES [dbo].[role] ([role_id])
GO
