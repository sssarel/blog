
-- =============================================
-- Author:		sareljacobs.com
-- Create date: May 2016
-- Description:	Creates a database to import
--				StackOverflow data into
-- =============================================

USE [master]
GO


--CHANGE THIS TO YOUR DESIRED LOCATION
CREATE DATABASE [Stackoverflow]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Stackoverflow', FILENAME = N'C:\SqlData\Stackoverflow.mdf' , SIZE = 1717248KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Stackoverflow_log', FILENAME = N'C:\SqlData\Stackoverflow_log.ldf' , SIZE = 1341696KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

USE [Stackoverflow]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BadgeClasses](
	[Id] [tinyint] NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_BadgeClasses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Badges](
	[Id] [bigint] NOT NULL,
	[UserId] [bigint] NULL,
	[Name] [nvarchar](255) NULL,
	[Date] [datetime] NULL,
	[Class] [tinyint] NULL,
	[TagBased] [nvarchar](255) NULL,
	[SiteID] [tinyint] NOT NULL,
 CONSTRAINT [PK_Badges] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [bigint] NOT NULL,
	[PostId] [bigint] NULL,
	[Score] [tinyint] NULL,
	[Text] [nvarchar](max) NULL,
	[CreationDate] [datetime] NULL,
	[UserId] [bigint] NULL,
	[UserDisplayName] [nvarchar](255) NULL,
	[SiteID] [tinyint] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostHistory](
	[Id] [bigint] NOT NULL,
	[PostHistoryTypeId] [tinyint] NULL,
	[PostId] [bigint] NULL,
	[RevisionGUID] [nvarchar](255) NULL,
	[CreationDate] [datetime] NULL,
	[UserId] [bigint] NULL,
	[Comment] [nvarchar](max) NULL,
	[UserDisplayName] [nvarchar](255) NULL,
	[Text] [nvarchar](max) NULL,
	[SiteID] [tinyint] NOT NULL,
 CONSTRAINT [PK_PostHistory] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostHistoryTypes](
	[Id] [tinyint] NOT NULL,
	[Name] [varchar](250) NULL,
 CONSTRAINT [PK_PostHistoryTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostLinks](
	[Id] [bigint] NOT NULL,
	[CreationDate] [datetime] NULL,
	[PostId] [bigint] NULL,
	[RelatedPostId] [bigint] NULL,
	[LinkTypeId] [tinyint] NULL,
	[SiteID] [tinyint] NOT NULL,
 CONSTRAINT [PK_PostLinks] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostLinkTypes](
	[Id] [tinyint] NOT NULL,
	[Name] [varchar](250) NULL,
 CONSTRAINT [PK_PostLinkTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [bigint] NOT NULL,
	[PostTypeId] [tinyint] NULL,
	[CreationDate] [datetime] NULL,
	[Score] [smallint] NULL,
	[ViewCount] [bigint] NULL,
	[Body] [nvarchar](max) NULL,
	[OwnerUserId] [bigint] NULL,
	[LastActivityDate] [datetime] NULL,
	[Title] [nvarchar](255) NULL,
	[Tags] [nvarchar](255) NULL,
	[AnswerCount] [tinyint] NULL,
	[CommentCount] [tinyint] NULL,
	[FavoriteCount] [tinyint] NULL,
	[AcceptedAnswerId] [bigint] NULL,
	[LastEditorUserId] [bigint] NULL,
	[LastEditDate] [datetime] NULL,
	[ParentId] [bigint] NULL,
	[ClosedDate] [datetime] NULL,
	[CommunityOwnedDate] [datetime] NULL,
	[OwnerDisplayName] [nvarchar](255) NULL,
	[LastEditorDisplayName] [nvarchar](255) NULL,
	[SiteID] [tinyint] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTypes](
	[id] [tinyint] NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_PostTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sites](
	[SiteID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[DateAdded] [datetime2](7) NULL,
 CONSTRAINT [PK_Sites] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] NOT NULL,
	[TagName] [nvarchar](255) NULL,
	[Count] [int] NULL,
	[ExcerptPostId] [bigint] NULL,
	[WikiPostId] [bigint] NULL,
	[SiteID] [tinyint] NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] NOT NULL,
	[Reputation] [bigint] NULL,
	[CreationDate] [datetime] NULL,
	[DisplayName] [nvarchar](255) NULL,
	[LastAccessDate] [datetime] NULL,
	[WebsiteUrl] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[AboutMe] [nvarchar](max) NULL,
	[Views] [int] NULL,
	[UpVotes] [int] NULL,
	[DownVotes] [int] NULL,
	[AccountId] [int] NULL,
	[Age] [tinyint] NULL,
	[ProfileImageUrl] [nvarchar](255) NULL,
	[SiteID] [tinyint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[Id] [bigint] NOT NULL,
	[PostId] [bigint] NULL,
	[VoteTypeId] [tinyint] NULL,
	[CreationDate] [datetime] NULL,
	[UserId] [bigint] NULL,
	[BountyAmount] [int] NULL,
	[SiteID] [tinyint] NOT NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VoteTypes](
	[Id] [tinyint] NOT NULL,
	[Name] [varchar](250) NULL,
 CONSTRAINT [PK_VoteTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Sites] ADD  CONSTRAINT [DF__Sites__DateAdded__108B795B]  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[Badges]  WITH CHECK ADD  CONSTRAINT [FK_Badges_BadgeClasses] FOREIGN KEY([Class])
REFERENCES [dbo].[BadgeClasses] ([Id])
GO
ALTER TABLE [dbo].[Badges] CHECK CONSTRAINT [FK_Badges_BadgeClasses]
GO
ALTER TABLE [dbo].[Badges]  WITH CHECK ADD  CONSTRAINT [FK_Badges_Sites] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Sites] ([SiteID])
GO
ALTER TABLE [dbo].[Badges] CHECK CONSTRAINT [FK_Badges_Sites]
GO
ALTER TABLE [dbo].[Badges]  WITH CHECK ADD  CONSTRAINT [FK_Badges_Users] FOREIGN KEY([SiteID], [UserId])
REFERENCES [dbo].[Users] ([SiteID], [Id])
GO
ALTER TABLE [dbo].[Badges] CHECK CONSTRAINT [FK_Badges_Users]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([SiteID], [PostId])
REFERENCES [dbo].[Posts] ([SiteID], [Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Sites] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Sites] ([SiteID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Sites]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([SiteID], [UserId])
REFERENCES [dbo].[Users] ([SiteID], [Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[PostHistory]  WITH CHECK ADD  CONSTRAINT [FK_PostHistory_PostHistoryTypes] FOREIGN KEY([PostHistoryTypeId])
REFERENCES [dbo].[PostHistoryTypes] ([Id])
GO
ALTER TABLE [dbo].[PostHistory] CHECK CONSTRAINT [FK_PostHistory_PostHistoryTypes]
GO
ALTER TABLE [dbo].[PostHistory]  WITH CHECK ADD  CONSTRAINT [FK_PostHistory_Posts] FOREIGN KEY([SiteID], [PostId])
REFERENCES [dbo].[Posts] ([SiteID], [Id])
GO
ALTER TABLE [dbo].[PostHistory] CHECK CONSTRAINT [FK_PostHistory_Posts]
GO
ALTER TABLE [dbo].[PostHistory]  WITH CHECK ADD  CONSTRAINT [FK_PostHistory_Sites] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Sites] ([SiteID])
GO
ALTER TABLE [dbo].[PostHistory] CHECK CONSTRAINT [FK_PostHistory_Sites]
GO
ALTER TABLE [dbo].[PostHistory]  WITH CHECK ADD  CONSTRAINT [FK_PostHistory_Users] FOREIGN KEY([SiteID], [UserId])
REFERENCES [dbo].[Users] ([SiteID], [Id])
GO
ALTER TABLE [dbo].[PostHistory] CHECK CONSTRAINT [FK_PostHistory_Users]
GO
ALTER TABLE [dbo].[PostLinks]  WITH CHECK ADD  CONSTRAINT [FK_PostLinks_PostLinkTypes] FOREIGN KEY([LinkTypeId])
REFERENCES [dbo].[PostLinkTypes] ([Id])
GO
ALTER TABLE [dbo].[PostLinks] CHECK CONSTRAINT [FK_PostLinks_PostLinkTypes]
GO
ALTER TABLE [dbo].[PostLinks]  WITH CHECK ADD  CONSTRAINT [FK_PostLinks_Sites] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Sites] ([SiteID])
GO
ALTER TABLE [dbo].[PostLinks] CHECK CONSTRAINT [FK_PostLinks_Sites]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Posts] FOREIGN KEY([SiteID], [ParentId])
REFERENCES [dbo].[Posts] ([SiteID], [Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Posts]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostTypes] FOREIGN KEY([PostTypeId])
REFERENCES [dbo].[PostTypes] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostTypes]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Sites] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Sites] ([SiteID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Sites]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_LastEditor] FOREIGN KEY([SiteID], [LastEditorUserId])
REFERENCES [dbo].[Users] ([SiteID], [Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_LastEditor]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_Owners] FOREIGN KEY([SiteID], [OwnerUserId])
REFERENCES [dbo].[Users] ([SiteID], [Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_Owners]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_ExcerptPosts] FOREIGN KEY([SiteID], [ExcerptPostId])
REFERENCES [dbo].[Posts] ([SiteID], [Id])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_ExcerptPosts]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_Sites] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Sites] ([SiteID])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_Sites]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_WikiPosts] FOREIGN KEY([SiteID], [WikiPostId])
REFERENCES [dbo].[Posts] ([SiteID], [Id])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_WikiPosts]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Sites] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Sites] ([SiteID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Sites]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Sites] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Sites] ([SiteID])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Sites]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Users] FOREIGN KEY([SiteID], [UserId])
REFERENCES [dbo].[Users] ([SiteID], [Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Users]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_VoteTypes] FOREIGN KEY([VoteTypeId])
REFERENCES [dbo].[VoteTypes] ([Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_VoteTypes]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sareljacobs.com
-- Create date: May 2016
-- Description:	Adds the table relationships
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddRelationships]
AS
BEGIN
	
	--[Badges]
	IF OBJECT_ID (N'[FK_Badges_Users]') IS NULL 
		ALTER TABLE [dbo].[Badges] ADD CONSTRAINT [FK_Badges_Users] FOREIGN KEY ([SiteID], [UserId]) REFERENCES [dbo].[Users]([SiteID], [Id]);
	IF OBJECT_ID (N'[FK_Badges_BadgeClasses]') IS NULL 
		ALTER TABLE [dbo].[Badges] ADD CONSTRAINT [FK_Badges_BadgeClasses] FOREIGN KEY ([Class]) REFERENCES [dbo].[BadgeClasses]([Id]);
	IF OBJECT_ID (N'[FK_Badges_Sites]') IS NULL 
		ALTER TABLE [dbo].[Badges] ADD CONSTRAINT [FK_Badges_Sites] FOREIGN KEY ([SiteID]) REFERENCES [dbo].[Sites]([SiteID]);

	--[Comments]
	IF OBJECT_ID (N'[FK_Comments_Posts]') IS NULL 
		ALTER TABLE [dbo].[Comments] ADD CONSTRAINT [FK_Comments_Posts] FOREIGN KEY ([SiteID], [PostId]) REFERENCES [dbo].[Posts]([SiteID], [Id]);
	IF OBJECT_ID (N'[FK_Comments_Sites]') IS NULL 
		ALTER TABLE [dbo].[Comments] ADD CONSTRAINT [FK_Comments_Sites] FOREIGN KEY ([SiteID]) REFERENCES [dbo].[Sites]([SiteID]);
	IF OBJECT_ID (N'[FK_Comments_Users]') IS NULL 
		ALTER TABLE [dbo].[Comments] ADD CONSTRAINT [FK_Comments_Users] FOREIGN KEY ([SiteID], [UserId]) REFERENCES [dbo].[Users]([SiteID], [Id]);

	--[Posts]
	IF OBJECT_ID (N'[FK_Posts_Sites]') IS NULL 
		ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [FK_Posts_Sites] FOREIGN KEY ([SiteID]) REFERENCES [dbo].[Sites]([SiteID]);
	IF OBJECT_ID (N'[FK_Posts_PostTypes]') IS NULL 
		ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [FK_Posts_PostTypes] FOREIGN KEY ([PostTypeId]) REFERENCES [dbo].[PostTypes]([id]);
	IF OBJECT_ID (N'[FK_Posts_Users_LastEditor]') IS NULL 
		ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [FK_Posts_Users_LastEditor] FOREIGN KEY ([SiteID], [LastEditorUserId]) REFERENCES [dbo].[Users]([SiteID], [Id]);
	IF OBJECT_ID (N'[FK_Posts_Users_Owners]') IS NULL 
		ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [FK_Posts_Users_Owners] FOREIGN KEY ([SiteID], [OwnerUserId]) REFERENCES [dbo].[Users]([SiteID], [Id]);
	IF OBJECT_ID (N'[FK_Posts_Posts]') IS NULL 
		ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [FK_Posts_Posts] FOREIGN KEY ([SiteID], [ParentId]) REFERENCES [dbo].[Posts]([SiteID], [Id]);

	--[PostLinks]
	IF OBJECT_ID (N'[FK_PostLinks_Sites]') IS NULL 
		ALTER TABLE [dbo].[PostLinks] ADD CONSTRAINT [FK_PostLinks_Sites] FOREIGN KEY ([SiteID]) REFERENCES [dbo].[Sites]([SiteID]);
	IF OBJECT_ID (N'[FK_PostLinks_PostLinkTypes]') IS NULL 
		ALTER TABLE [dbo].[PostLinks] ADD CONSTRAINT [FK_PostLinks_PostLinkTypes] FOREIGN KEY ([LinkTypeId]) REFERENCES [dbo].[PostLinkTypes]([Id]);

	--[PostHistory]
	IF OBJECT_ID (N'[FK_PostHistory_Posts]') IS NULL 
		ALTER TABLE [dbo].[PostHistory] ADD CONSTRAINT [FK_PostHistory_Posts] FOREIGN KEY ([SiteID], [PostId]) REFERENCES [dbo].[Posts]([SiteID], [Id]);
	IF OBJECT_ID (N'[FK_PostHistory_Sites]') IS NULL 
		ALTER TABLE [dbo].[PostHistory] ADD CONSTRAINT [FK_PostHistory_Sites] FOREIGN KEY ([SiteID]) REFERENCES [dbo].[Sites]([SiteID]);
	IF OBJECT_ID (N'[FK_PostHistory_Users]') IS NULL 
		ALTER TABLE [dbo].[PostHistory] ADD CONSTRAINT [FK_PostHistory_Users] FOREIGN KEY ([SiteID], [UserId]) REFERENCES [dbo].[Users]([SiteID], [Id]);
	IF OBJECT_ID (N'[FK_PostHistory_PostHistoryTypes]') IS NULL 
		ALTER TABLE [dbo].[PostHistory] ADD CONSTRAINT [FK_PostHistory_PostHistoryTypes] FOREIGN KEY ([PostHistoryTypeId]) REFERENCES [dbo].[PostHistoryTypes]([Id]);

	--[Tags]
	IF OBJECT_ID (N'[FK_Tags_ExcerptPosts]') IS NULL 
		ALTER TABLE [dbo].[Tags] ADD CONSTRAINT [FK_Tags_ExcerptPosts] FOREIGN KEY ([SiteID], [ExcerptPostId]) REFERENCES [dbo].[Posts]([SiteID], [Id]);
	IF OBJECT_ID (N'[FK_Tags_WikiPosts]') IS NULL 
		ALTER TABLE [dbo].[Tags] ADD CONSTRAINT [FK_Tags_WikiPosts] FOREIGN KEY ([SiteID], [WikiPostId]) REFERENCES [dbo].[Posts]([SiteID], [Id]);
	IF OBJECT_ID (N'[FK_Tags_Sites]') IS NULL 
		ALTER TABLE [dbo].[Tags] ADD CONSTRAINT [FK_Tags_Sites] FOREIGN KEY ([SiteID]) REFERENCES [dbo].[Sites]([SiteID]);

	--[Users]
	IF OBJECT_ID (N'[FK_Users_Sites]') IS NULL 
		ALTER TABLE [dbo].[Users] ADD CONSTRAINT [FK_Users_Sites] FOREIGN KEY ([SiteID]) REFERENCES [dbo].[Sites]([SiteID]);

	--[Votes]
	IF OBJECT_ID (N'[FK_Votes_VoteTypes]') IS NULL 
		ALTER TABLE [dbo].[Votes] ADD CONSTRAINT [FK_Votes_VoteTypes] FOREIGN KEY ([VoteTypeId]) REFERENCES [dbo].[VoteTypes]([Id]);
	IF OBJECT_ID (N'[FK_Votes_Sites]') IS NULL 
		ALTER TABLE [dbo].[Votes] ADD CONSTRAINT [FK_Votes_Sites] FOREIGN KEY ([SiteID]) REFERENCES [dbo].[Sites]([SiteID]);
	IF OBJECT_ID (N'[FK_Votes_Users]') IS NULL 
		ALTER TABLE [dbo].[Votes] ADD CONSTRAINT [FK_Votes_Users] FOREIGN KEY ([SiteID], [UserId]) REFERENCES [dbo].[Users]([SiteID], [Id]);

END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sareljacobs.com
-- Create date: May 2016
-- Description:	Adds a new site to the Sites table
--				e.g. dba.stackexchange.com or movies.stackexchange.com
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddSite] 
	 @Name nvarchar(250)
AS
BEGIN
	
	--usp_AddSite 'Test2'
	SET NOCOUNT ON;

	DECLARE @ReturnID INT = 0;

	SELECT @ReturnID = [SiteID]
	FROM [dbo].[Sites]
	WHERE [Name] = @Name;

	IF @ReturnID = 0
	BEGIN

		INSERT INTO [dbo].[Sites]
			(Name)
		VALUES 
			(@Name)

		SET @ReturnID = SCOPE_IDENTITY()

	END

	SELECT @ReturnID as [SiteID]

END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sareljacobs.com
-- Create date: May 2016
-- Description:	Cleans all the import tables
-- =============================================
CREATE PROCEDURE [dbo].[usp_CleanTables]
AS
BEGIN
	
	--[Badges]
	IF OBJECT_ID (N'[FK_Badges_Sites]') IS NOT NULL
		ALTER TABLE [dbo].[Badges] DROP CONSTRAINT [FK_Badges_Sites];
	IF OBJECT_ID (N'[FK_Badges_Users]') IS NOT NULL
		ALTER TABLE [dbo].[Badges] DROP CONSTRAINT [FK_Badges_Users];
	IF OBJECT_ID (N'[FK_Badges_BadgeClasses]') IS NOT NULL
		ALTER TABLE [dbo].[Badges] DROP CONSTRAINT [FK_Badges_BadgeClasses];
	
	--[Posts]
	IF OBJECT_ID (N'[FK_Posts_Sites]') IS NOT NULL
		ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Sites];
	IF OBJECT_ID (N'[FK_Posts_PostTypes]') IS NOT NULL
		ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_PostTypes];
	IF OBJECT_ID (N'[FK_Posts_Users_LastEditor]') IS NOT NULL
		ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Users_LastEditor];
	IF OBJECT_ID (N'[FK_Posts_Users_Owners]') IS NOT NULL
		ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Users_Owners];
	IF OBJECT_ID (N'[FK_Posts_Posts]') IS NOT NULL
		ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Posts];
	
	--[PostLinks]
	IF OBJECT_ID (N'[FK_PostLinks_Sites]') IS NOT NULL
		ALTER TABLE [dbo].[PostLinks] DROP CONSTRAINT [FK_PostLinks_Sites];
	IF OBJECT_ID (N'[FK_PostLinks_PostLinkTypes]') IS NOT NULL
		ALTER TABLE [dbo].[PostLinks] DROP CONSTRAINT [FK_PostLinks_PostLinkTypes];
	
	--[PostHistory]
	IF OBJECT_ID (N'[FK_PostHistory_Sites]') IS NOT NULL
		ALTER TABLE [dbo].[PostHistory] DROP CONSTRAINT [FK_PostHistory_Sites];
	IF OBJECT_ID (N'[FK_PostHistory_Users]') IS NOT NULL
		ALTER TABLE [dbo].[PostHistory] DROP CONSTRAINT [FK_PostHistory_Users];
	IF OBJECT_ID (N'[FK_PostHistory_Posts]') IS NOT NULL
		ALTER TABLE [dbo].[PostHistory] DROP CONSTRAINT [FK_PostHistory_Posts];
	IF OBJECT_ID (N'[FK_PostHistory_PostHistoryTypes]') IS NOT NULL
		ALTER TABLE [dbo].[PostHistory] DROP CONSTRAINT [FK_PostHistory_PostHistoryTypes];
	
	--[Comments]
	IF OBJECT_ID (N'[FK_Comments_Posts]') IS NOT NULL
		ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Posts];
	IF OBJECT_ID (N'[FK_Comments_Sites]') IS NOT NULL
		ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Sites];
	IF OBJECT_ID (N'[FK_Comments_Users]') IS NOT NULL
		ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Users];
	
	--[Tags]
	IF OBJECT_ID (N'[FK_Tags_ExcerptPosts]') IS NOT NULL
		ALTER TABLE [dbo].[Tags] DROP CONSTRAINT [FK_Tags_ExcerptPosts];
	IF OBJECT_ID (N'[FK_Tags_WikiPosts]') IS NOT NULL
		ALTER TABLE [dbo].[Tags] DROP CONSTRAINT [FK_Tags_WikiPosts];
	IF OBJECT_ID (N'[FK_Tags_Sites]') IS NOT NULL
		ALTER TABLE [dbo].[Tags] DROP CONSTRAINT [FK_Tags_Sites];
	
	--[Votes]
	IF OBJECT_ID (N'[FK_Votes_VoteTypes]') IS NOT NULL
		ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_VoteTypes];
	IF OBJECT_ID (N'[FK_Votes_Sites]') IS NOT NULL
		ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_Sites];
	IF OBJECT_ID (N'[FK_Votes_Users]') IS NOT NULL
		ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_Users];

	--[Users]
	IF OBJECT_ID (N'[FK_Users_Sites]') IS NOT NULL
		ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Sites];

	--Clean the tables
	TRUNCATE TABLE [Stackoverflow].[dbo].[Badges];
	TRUNCATE TABLE [Stackoverflow].[dbo].[Comments];
	TRUNCATE TABLE [Stackoverflow].[dbo].[Posts];
	TRUNCATE TABLE [Stackoverflow].[dbo].[PostHistory];
	TRUNCATE TABLE [Stackoverflow].[dbo].[PostLinks];
	TRUNCATE TABLE [Stackoverflow].[dbo].[Tags];
	TRUNCATE TABLE [Stackoverflow].[dbo].[Users];
	TRUNCATE TABLE [Stackoverflow].[dbo].[Votes];

END

GO
