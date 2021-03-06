
-- =============================================
-- Author:		sareljacobs.com
-- Create date: May 2016
-- Description:	Creates a database to import
--				StackOverflow data into
-- =============================================

USE [master]
GO

CREATE DATABASE [Stackoverflow2]
 ON  PRIMARY 
( NAME = N'Stackoverflow', FILENAME = N'D:\SQL Data\Stackoverflow2.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 524288KB )
 LOG ON 
( NAME = N'Stackoverflow_log', FILENAME = N'D:\SQL Data\Stackoverflow_log2.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 524288KB )
GO

USE [Stackoverflow2]
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

CREATE TABLE [dbo].[Badges](
	[Id] [bigint] NOT NULL,
	[UserId] [bigint] NULL,
	[Name] [nvarchar](255) NULL,
	[Date] [datetime] NULL,
	[Class] [tinyint] NULL,
	[TagBased] [nvarchar](255) NULL,
 CONSTRAINT [PK_Badges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Comments](
	[Id] [bigint] NOT NULL,
	[PostId] [bigint] NULL,
	[Score] [smallint] NULL,
	[Text] [nvarchar](max) NULL,
	[CreationDate] [datetime] NULL,
	[UserId] [bigint] NULL,
	[UserDisplayName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Comments_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[ImportLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[FolderName] [varchar](250) NOT NULL,
	[TableName] [varchar](250) NOT NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ImportLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
 CONSTRAINT [PK_PostHistory_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

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

CREATE TABLE [dbo].[PostLinks](
	[Id] [bigint] NOT NULL,
	[CreationDate] [datetime] NULL,
	[PostId] [bigint] NULL,
	[RelatedPostId] [bigint] NULL,
	[LinkTypeId] [tinyint] NULL,
 CONSTRAINT [PK_PostLinks_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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

CREATE TABLE [dbo].[Posts](
	[Id] [bigint] NOT NULL,
	[PostTypeId] [tinyint] NULL,
	[CreationDate] [datetime] NULL,
	[Score] [smallint] NULL,
	[ViewCount] [int] NULL,
	[Body] [nvarchar](max) NULL,
	[OwnerUserId] [bigint] NULL,
	[LastActivityDate] [datetime] NULL,
	[Title] [nvarchar](500) NULL,
	[Tags] [nvarchar](250) NULL,
	[AnswerCount] [smallint] NULL,
	[CommentCount] [smallint] NULL,
	[FavoriteCount] [smallint] NULL,
	[AcceptedAnswerId] [bigint] NULL,
	[LastEditorUserId] [bigint] NULL,
	[LastEditDate] [datetime] NULL,
	[ParentId] [bigint] NULL,
	[ClosedDate] [datetime] NULL,
	[CommunityOwnedDate] [datetime] NULL,
	[OwnerDisplayName] [nvarchar](100) NULL,
	[LastEditorDisplayName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Posts_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

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

CREATE TABLE [dbo].[Tags](
	[Id] [int] NOT NULL,
	[TagName] [nvarchar](255) NULL,
	[Count] [int] NULL,
	[ExcerptPostId] [bigint] NULL,
	[WikiPostId] [bigint] NULL,
 CONSTRAINT [PK_Tags_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
	[Age] [int] NULL,
	[ProfileImageUrl] [nvarchar](255) NULL,
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Votes](
	[Id] [bigint] NOT NULL,
	[PostId] [bigint] NULL,
	[VoteTypeId] [tinyint] NULL,
	[CreationDate] [datetime] NULL,
	[UserId] [bigint] NULL,
	[BountyAmount] [int] NULL,
 CONSTRAINT [PK_Votes_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
ALTER TABLE [dbo].[Badges]  WITH CHECK ADD  CONSTRAINT [FK_Badges_BadgeClasses] FOREIGN KEY([Class])
REFERENCES [dbo].[BadgeClasses] ([Id])
GO
ALTER TABLE [dbo].[Badges] CHECK CONSTRAINT [FK_Badges_BadgeClasses]
GO
ALTER TABLE [dbo].[Badges]  WITH CHECK ADD  CONSTRAINT [FK_Badges_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Badges] CHECK CONSTRAINT [FK_Badges_Users]
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

	--Some UserID's are missing from the Users table, default those to -1 (a system user)
	UPDATE [dbo].[Badges]
	SET [UserId] = -1
	WHERE [UserId] NOT IN (SELECT [Id] FROM [dbo].[Users]);
	
	UPDATE [dbo].[Comments]
	SET [UserId] = -1
	WHERE [UserId] NOT IN (SELECT [Id] FROM [dbo].[Users]);
	
	UPDATE [dbo].[Posts]
	SET [ParentId] = -1
	WHERE [ParentId] NOT IN (SELECT [Id] FROM [dbo].[Users]);
	
	UPDATE [dbo].[Posts]
	SET [LastEditorUserId] = -1
	WHERE [LastEditorUserId] NOT IN (SELECT [Id] FROM [dbo].[Users]);

	UPDATE [dbo].[Posts]
	SET [OwnerUserId] = -1
	WHERE [OwnerUserId] NOT IN (SELECT [Id] FROM [dbo].[Users]);
	
	UPDATE [dbo].[PostHistory]
	SET [UserId] = -1
	WHERE [UserId] NOT IN (SELECT [Id] FROM [dbo].[Users]);
	
	UPDATE [dbo].[Votes]
	SET [UserId] = -1
	WHERE [UserId] NOT IN (SELECT [Id] FROM [dbo].[Users]);
	
	--[Badges]
	IF OBJECT_ID (N'[FK_Badges_Users]') IS NULL 
		ALTER TABLE [dbo].[Badges] ADD CONSTRAINT [FK_Badges_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users]([Id]);
	IF OBJECT_ID (N'[FK_Badges_BadgeClasses]') IS NULL 
		ALTER TABLE [dbo].[Badges] ADD CONSTRAINT [FK_Badges_BadgeClasses] FOREIGN KEY ([Class]) REFERENCES [dbo].[BadgeClasses]([Id]);

	--[Comments]
	IF OBJECT_ID (N'[FK_Comments_Posts]') IS NULL 
		ALTER TABLE [dbo].[Comments] ADD CONSTRAINT [FK_Comments_Posts] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Posts]([Id]);
	IF OBJECT_ID (N'[FK_Comments_Users]') IS NULL 
		ALTER TABLE [dbo].[Comments] ADD CONSTRAINT [FK_Comments_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users]([Id]);

	--[Posts]
	IF OBJECT_ID (N'[FK_Posts_PostTypes]') IS NULL 
		ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [FK_Posts_PostTypes] FOREIGN KEY ([PostTypeId]) REFERENCES [dbo].[PostTypes]([id]);
	IF OBJECT_ID (N'[FK_Posts_Users_LastEditor]') IS NULL 
		ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [FK_Posts_Users_LastEditor] FOREIGN KEY ([LastEditorUserId]) REFERENCES [dbo].[Users]([Id]);
	IF OBJECT_ID (N'[FK_Posts_Users_Owners]') IS NULL 
		ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [FK_Posts_Users_Owners] FOREIGN KEY ([OwnerUserId]) REFERENCES [dbo].[Users]([Id]);
	IF OBJECT_ID (N'[FK_Posts_Posts]') IS NULL 
		ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [FK_Posts_Posts] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Posts]([Id]);

	--[PostLinks]
	IF OBJECT_ID (N'[FK_PostLinks_PostLinkTypes]') IS NULL 
		ALTER TABLE [dbo].[PostLinks] ADD CONSTRAINT [FK_PostLinks_PostLinkTypes] FOREIGN KEY ([LinkTypeId]) REFERENCES [dbo].[PostLinkTypes]([Id]);

	--[PostHistory]
	IF OBJECT_ID (N'[FK_PostHistory_Posts]') IS NULL 
		ALTER TABLE [dbo].[PostHistory] ADD CONSTRAINT [FK_PostHistory_Posts] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Posts]( [Id]);
	IF OBJECT_ID (N'[FK_PostHistory_Users]') IS NULL 
		ALTER TABLE [dbo].[PostHistory] ADD CONSTRAINT [FK_PostHistory_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users]([Id]);
	IF OBJECT_ID (N'[FK_PostHistory_PostHistoryTypes]') IS NULL 
		ALTER TABLE [dbo].[PostHistory] ADD CONSTRAINT [FK_PostHistory_PostHistoryTypes] FOREIGN KEY ([PostHistoryTypeId]) REFERENCES [dbo].[PostHistoryTypes]([Id]);

	--[Tags]
	IF OBJECT_ID (N'[FK_Tags_ExcerptPosts]') IS NULL 
		ALTER TABLE [dbo].[Tags] ADD CONSTRAINT [FK_Tags_ExcerptPosts] FOREIGN KEY ([ExcerptPostId]) REFERENCES [dbo].[Posts]([Id]);
	IF OBJECT_ID (N'[FK_Tags_WikiPosts]') IS NULL 
		ALTER TABLE [dbo].[Tags] ADD CONSTRAINT [FK_Tags_WikiPosts] FOREIGN KEY ([WikiPostId]) REFERENCES [dbo].[Posts]([Id]);

	--[Votes]
	IF OBJECT_ID (N'[FK_Votes_VoteTypes]') IS NULL 
		ALTER TABLE [dbo].[Votes] ADD CONSTRAINT [FK_Votes_VoteTypes] FOREIGN KEY ([VoteTypeId]) REFERENCES [dbo].[VoteTypes]([Id]);
	IF OBJECT_ID (N'[FK_Votes_Users]') IS NULL 
		ALTER TABLE [dbo].[Votes] ADD CONSTRAINT [FK_Votes_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users]([Id]);

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
	IF OBJECT_ID (N'[FK_Badges_Users]') IS NOT NULL
		ALTER TABLE [dbo].[Badges] DROP CONSTRAINT [FK_Badges_Users];
	IF OBJECT_ID (N'[FK_Badges_BadgeClasses]') IS NOT NULL
		ALTER TABLE [dbo].[Badges] DROP CONSTRAINT [FK_Badges_BadgeClasses];
	
	--[Posts]
	IF OBJECT_ID (N'[FK_Posts_PostTypes]') IS NOT NULL
		ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_PostTypes];
	IF OBJECT_ID (N'[FK_Posts_Users_LastEditor]') IS NOT NULL
		ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Users_LastEditor];
	IF OBJECT_ID (N'[FK_Posts_Users_Owners]') IS NOT NULL
		ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Users_Owners];
	IF OBJECT_ID (N'[FK_Posts_Posts]') IS NOT NULL
		ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Posts];
	
	--[PostLinks]
	IF OBJECT_ID (N'[FK_PostLinks_PostLinkTypes]') IS NOT NULL
		ALTER TABLE [dbo].[PostLinks] DROP CONSTRAINT [FK_PostLinks_PostLinkTypes];
	
	--[PostHistory]
	IF OBJECT_ID (N'[FK_PostHistory_Users]') IS NOT NULL
		ALTER TABLE [dbo].[PostHistory] DROP CONSTRAINT [FK_PostHistory_Users];
	IF OBJECT_ID (N'[FK_PostHistory_Posts]') IS NOT NULL
		ALTER TABLE [dbo].[PostHistory] DROP CONSTRAINT [FK_PostHistory_Posts];
	IF OBJECT_ID (N'[FK_PostHistory_PostHistoryTypes]') IS NOT NULL
		ALTER TABLE [dbo].[PostHistory] DROP CONSTRAINT [FK_PostHistory_PostHistoryTypes];
	
	--[Comments]
	IF OBJECT_ID (N'[FK_Comments_Posts]') IS NOT NULL
		ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Posts];
	IF OBJECT_ID (N'[FK_Comments_Users]') IS NOT NULL
		ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Users];
	
	--[Tags]
	IF OBJECT_ID (N'[FK_Tags_ExcerptPosts]') IS NOT NULL
		ALTER TABLE [dbo].[Tags] DROP CONSTRAINT [FK_Tags_ExcerptPosts];
	IF OBJECT_ID (N'[FK_Tags_WikiPosts]') IS NOT NULL
		ALTER TABLE [dbo].[Tags] DROP CONSTRAINT [FK_Tags_WikiPosts];
	
	--[Votes]
	IF OBJECT_ID (N'[FK_Votes_VoteTypes]') IS NOT NULL
		ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_VoteTypes];
	IF OBJECT_ID (N'[FK_Votes_Users]') IS NOT NULL
		ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_Users];

	--Clean the tables
	TRUNCATE TABLE [Stackoverflow2].[dbo].[Badges];
	TRUNCATE TABLE [Stackoverflow2].[dbo].[Comments];
	TRUNCATE TABLE [Stackoverflow2].[dbo].[Posts];
	TRUNCATE TABLE [Stackoverflow2].[dbo].[PostHistory];
	TRUNCATE TABLE [Stackoverflow2].[dbo].[PostLinks];
	TRUNCATE TABLE [Stackoverflow2].[dbo].[Tags];
	TRUNCATE TABLE [Stackoverflow2].[dbo].[Users];
	TRUNCATE TABLE [Stackoverflow2].[dbo].[Votes];

END


GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sareljacobs.com
-- Create date: May 2016
-- Description:	Log import
-- =============================================
CREATE PROCEDURE [dbo].[usp_LogImport]
	(
		 @Folder VARCHAR(250)
		,@Table VARCHAR(250)
	)
AS
BEGIN
	
	INSERT INTO [dbo].[ImportLog]
	VALUES (@Folder, @Table, GETDATE())

END
GO

ALTER DATABASE [Stackoverflow2] SET  READ_WRITE 
GO

--Insert lookup data

INSERT INTO [dbo].[BadgeClasses]
SELECT 1 as [ID], 'Gold' as [Name] UNION
SELECT 2 as [ID], 'Silver' as [Name] UNION
SELECT 3 as [ID], 'Bronze' as [Name];
GO

INSERT INTO [dbo].[PostHistoryTypes]
SELECT 1 as [Id], 'Initial Title' as [Name] UNION
SELECT 2 as [Id], 'Initial Body' as [Name] UNION
SELECT 3 as [Id], 'Initial Tags' as [Name] UNION
SELECT 4 as [Id], 'Edit Title' as [Name] UNION
SELECT 5 as [Id], 'Edit Body' as [Name] UNION
SELECT 6 as [Id], 'Edit Tags' as [Name] UNION
SELECT 7 as [Id], 'Rollback Title' as [Name] UNION
SELECT 8 as [Id], 'Rollback Body' as [Name] UNION
SELECT 9 as [Id], 'Rollback Tags' as [Name] UNION
SELECT 10 as [Id], 'Post Closed' as [Name] UNION
SELECT 11 as [Id], 'Post Reopened' as [Name] UNION
SELECT 12 as [Id], 'Post Deleted' as [Name] UNION
SELECT 13 as [Id], 'Post Undeleted' as [Name] UNION
SELECT 14 as [Id], 'Post Locked' as [Name] UNION
SELECT 15 as [Id], 'Post Unlocked' as [Name] UNION
SELECT 16 as [Id], 'Community Owned' as [Name] UNION
SELECT 17 as [Id], 'Post Migrated' as [Name] UNION
SELECT 18 as [Id], 'Question Merged' as [Name] UNION
SELECT 19 as [Id], 'Question Protected' as [Name] UNION
SELECT 20 as [Id], 'Question Unprotected' as [Name] UNION
SELECT 22 as [Id], 'Question Unmerged' as [Name] UNION
SELECT 24 as [Id], 'Suggested Edit Applied' as [Name] UNION
SELECT 25 as [Id], 'Post Tweeted' as [Name] UNION
SELECT 31 as [Id], 'Discussion moved to chat' as [Name] UNION
SELECT 33 as [Id], 'Post Notice Added' as [Name] UNION
SELECT 34 as [Id], 'Post Notice Removed' as [Name] UNION
SELECT 35 as [Id], 'Post Migrated Away' as [Name] UNION
SELECT 36 as [Id], 'Post Migrated Here' as [Name] UNION
SELECT 37 as [Id], 'Post Merge Source' as [Name] UNION
SELECT 38 as [Id], 'Post Merge Destination' as [Name];
GO

INSERT INTO [dbo].[PostLinkTypes]
SELECT 1 as [Id], 'Linked' as [Name] UNION
SELECT 3 as [Id], 'Duplicate' as [Name];
GO

INSERT INTO [dbo].[PostTypes]
SELECT 1 as [Id], 'Question' as [Name] UNION
SELECT 2 as [Id], 'Answer' as [Name] UNION
SELECT 3 as [Id], 'Wiki' as [Name] UNION
SELECT 4 as [Id], 'TagWikiExcerpt' as [Name] UNION
SELECT 5 as [Id], 'TagWiki' as [Name] UNION
SELECT 6 as [Id], 'ModeratorNomination' as [Name] UNION
SELECT 7 as [Id], 'WikiPlaceholder' as [Name] UNION
SELECT 8 as [Id], 'PrivilegeWiki' as [Name];
GO

INSERT INTO [dbo].[VoteTypes]
SELECT 1 as [Id], 'AcceptedByOriginator' as [Name] UNION
SELECT 2 as [Id], 'UpMod' as [Name] UNION
SELECT 3 as [Id], 'DownMod' as [Name] UNION
SELECT 4 as [Id], 'Offensive' as [Name] UNION
SELECT 5 as [Id], 'Favorite' as [Name] UNION
SELECT 6 as [Id], 'Close' as [Name] UNION
SELECT 7 as [Id], 'Reopen' as [Name] UNION
SELECT 8 as [Id], 'BountyStart' as [Name] UNION
SELECT 9 as [Id], 'BountyClose' as [Name] UNION
SELECT 10 as [Id], 'Deletion' as [Name] UNION
SELECT 11 as [Id], 'Undeletion' as [Name] UNION
SELECT 12 as [Id], 'Spam' as [Name] UNION
SELECT 15 as [Id], 'ModeratorReview' as [Name] UNION
SELECT 16 as [Id], 'ApproveEditSuggestion' as [Name];
GO
