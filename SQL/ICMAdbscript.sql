USE [master]
GO
/****** Object:  Database [ICMA_LEARN]    Script Date: 27/10/2024 22:42:59 ******/
CREATE DATABASE [ICMA_LEARN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ICMA_LEARN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ICMA_LEARN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ICMA_LEARN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ICMA_LEARN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ICMA_LEARN] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ICMA_LEARN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ICMA_LEARN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET ARITHABORT OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ICMA_LEARN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ICMA_LEARN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ICMA_LEARN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ICMA_LEARN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ICMA_LEARN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ICMA_LEARN] SET  MULTI_USER 
GO
ALTER DATABASE [ICMA_LEARN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ICMA_LEARN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ICMA_LEARN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ICMA_LEARN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ICMA_LEARN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ICMA_LEARN] SET QUERY_STORE = ON
GO
ALTER DATABASE [ICMA_LEARN] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ICMA_LEARN]
GO
/****** Object:  Table [dbo].[Attempt]    Script Date: 27/10/2024 22:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attempt](
	[attempt_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[course_id] [int] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[progress_percentage] [decimal](5, 2) NULL,
	[score] [decimal](5, 2) NULL,
	[status] [nvarchar](20) NULL,
	[createdby] [nvarchar](50) NULL,
	[registration_date] [datetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[dateupdated] [datetime] NULL,
	[deletedby] [nvarchar](50) NULL,
	[deletedon] [datetime] NULL,
	[isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[attempt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27/10/2024 22:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
	[createdby] [nvarchar](50) NULL,
	[registration_date] [datetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[dateupdated] [datetime] NULL,
	[deletedby] [nvarchar](50) NULL,
	[isdeleted] [bit] NULL,
	[deletedon] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 27/10/2024 22:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[certificate_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[issued_date] [date] NOT NULL,
	[certificate_url] [nvarchar](255) NULL,
	[createdby] [nvarchar](50) NULL,
	[registration_date] [datetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[dateupdated] [datetime] NULL,
	[deletedby] [nvarchar](50) NULL,
	[deletedon] [datetime] NULL,
	[isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[certificate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 27/10/2024 22:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](150) NOT NULL,
	[description] [text] NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
	[category] [nvarchar](50) NULL,
	[category_id] [int] NULL,
	[instructor_id] [int] NULL,
	[createdby] [nvarchar](50) NULL,
	[registration_date] [datetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[deletedby] [nvarchar](50) NULL,
	[deletedon] [datetime] NULL,
	[isdeleted] [bit] NULL,
 CONSTRAINT [PK__Course__8F1EF7AE74CDB988] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 27/10/2024 22:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[instructor_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[expertise_area] [nvarchar](255) NULL,
	[biography] [text] NULL,
	[profile_image_url] [nvarchar](255) NULL,
	[createdby] [nvarchar](50) NULL,
	[registration_date] [datetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[dateupdated] [datetime] NULL,
	[deletedby] [nvarchar](50) NULL,
	[deletedon] [datetime] NULL,
	[isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 27/10/2024 22:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[lesson_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[title] [nvarchar](150) NOT NULL,
	[content_url] [nvarchar](255) NULL,
	[content_text] [text] NULL,
	[position] [int] NOT NULL,
	[duration] [int] NULL,
	[createdby] [nvarchar](50) NULL,
	[registration_date] [datetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[dateupdated] [datetime] NULL,
	[deletedby] [nvarchar](50) NULL,
	[deletedon] [datetime] NULL,
	[isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[lesson_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27/10/2024 22:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password_hash] [nvarchar](255) NOT NULL,
	[role] [nvarchar](20) NULL,
	[registration_date] [date] NOT NULL,
	[bio] [nvarchar](500) NULL,
	[createdby] [nvarchar](50) NULL,
	[updatedby] [nvarchar](50) NULL,
	[lastupdated] [datetime] NULL,
	[isdeleted] [bit] NULL,
	[deletedby] [nvarchar](50) NULL,
	[deletedon] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attempt] ADD  CONSTRAINT [DF_Attempt_registration_date]  DEFAULT (getdate()) FOR [registration_date]
GO
ALTER TABLE [dbo].[Attempt]  WITH CHECK ADD  CONSTRAINT [FK_Attempt_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Attempt] CHECK CONSTRAINT [FK_Attempt_Course]
GO
ALTER TABLE [dbo].[Attempt]  WITH CHECK ADD  CONSTRAINT [FK_Attempt_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Attempt] CHECK CONSTRAINT [FK_Attempt_User]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_Course]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_User]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Category]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Instructor] FOREIGN KEY([instructor_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Instructor]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_User]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Course]
GO
ALTER TABLE [dbo].[Attempt]  WITH CHECK ADD CHECK  (([status]='Started' OR [status]='In Progress' OR [status]='Completed' OR [status]='Failed'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([role]='Learner' OR [role]='Instructor'))
GO
/****** Object:  StoredProcedure [dbo].[Sp_Course]    Script Date: 27/10/2024 22:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Course Procedure
CREATE PROCEDURE [dbo].[Sp_Course]
    @Status INT = NULL,
    @course_id INT = NULL,  -- Made nullable
	@category NVARCHAR(50) = NULL,
    @title NVARCHAR(150) = NULL,
    @description TEXT = NULL,
    @created_at DATETIME = NULL,
    @updated_at DATETIME = NULL,
    @category_id INT = NULL,
    @instructor_id INT = NULL,
    @createdby NVARCHAR(50) = NULL,
    @registration_date DATETIME = NULL,
    @updatedby NVARCHAR(50) = NULL,
    @deletedby NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Status = 1  -- Insert
    BEGIN
        INSERT INTO [dbo].[Course]
        (
            title,
            description,
			category,
            created_at,
            updated_at,
            category_id,
            instructor_id,
            createdby,
            registration_date 
        )
        VALUES
        (
            @title,
            @description,
			@category,
            GETDATE(),
            @updated_at,
            @category_id,
            @instructor_id,
            @createdby,
            GETDATE()
        );
    END

    IF @Status = 2  -- Update
    BEGIN
        UPDATE [dbo].[Course]
        SET
            title = @title,
            description = @description,
			category = @category,
            category_id = @category_id,
            instructor_id = @instructor_id,
            updatedby = @updatedby,
            updated_at = GETDATE()
        WHERE course_id = @course_id;
    END

    IF @Status = 3  -- Soft Delete
    BEGIN
        UPDATE [dbo].[Course]
        SET
            Isdeleted = 1,
            deletedon = GETDATE(),
            DeletedBy = @DeletedBy
        WHERE course_id = @course_id;
    END

    IF @Status = 4  -- Undo Soft Delete
    BEGIN
        UPDATE [dbo].[Course]
        SET
            Isdeleted = 0
        WHERE course_id = @course_id;
    END

    IF @Status = 5  -- Select All
    BEGIN
        SELECT * FROM [dbo].[Course] WHERE Isdeleted IS NULL OR Isdeleted = 0
        ORDER BY course_id ASC;
    END

    IF @Status = 6  -- Select by course_id with Registration Date Order
    BEGIN
        SELECT * FROM [dbo].[Course]
        WHERE course_id = @course_id
        ORDER BY registration_date DESC;
    END

    IF @Status = 7  -- Select by course_id
    BEGIN
        SELECT * FROM [dbo].[Course]
        WHERE course_id = @course_id
		AND (Isdeleted IS NULL OR Isdeleted = 0);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetLeaderboard]    Script Date: 27/10/2024 22:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Leaderboard StoreProcedures
CREATE PROCEDURE [dbo].[Sp_GetLeaderboard]
AS
BEGIN
    SET NOCOUNT ON;

SELECT 
    u.user_id as ID, 
    CONCAT(u.first_name, ' ', u.last_name) AS FullName,
    c.title as Course,
	c.category as Category,
    a.score as Score
FROM 
    dbo.Users u
INNER JOIN 
    dbo.Attempt a ON u.user_id = a.user_id
INNER JOIN 
    dbo.Course c ON a.course_id = c.course_id
ORDER BY 
	c.category DESC,
    a.score DESC; -- Highest score first

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Users]    Script Date: 27/10/2024 22:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- User Procedure
CREATE PROCEDURE [dbo].[Sp_Users]
    @Status INT = NULL,
    @user_id INT = NULL,
    @first_name VARCHAR(50) = NULL,
    @last_name VARCHAR(50) = NULL,
    @email VARCHAR(100) = NULL,
    @password_hash NVARCHAR(255) = NULL,
    @role NVARCHAR(50) = NULL,       
    @bio NVARCHAR(500) = NULL,
    @createdby NVARCHAR(50) = NULL,
    @updatedby NVARCHAR(50) = NULL,
    @deletedby NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Status = 1 -- Insert new user
    BEGIN
        INSERT INTO [dbo].[Users] (
            first_name,
            last_name,
            email,
            password_hash,
            role,                  
            registration_date,
            bio,
            createdby
        ) VALUES (
            @first_name,
            @last_name,
            @email,
            @password_hash,
            @role,                   
            GETDATE(),
            @bio,
            @first_name
        );
    END

    ELSE IF @Status = 2 -- Update user
    BEGIN
        UPDATE [dbo].[Users]
        SET
            first_name = @first_name,
            last_name = @last_name,
            email = @email,
            password_hash = @password_hash,
            role = @role,              
            bio = @bio,
            updatedby = @first_name,
            lastUpdated = GETDATE()   
    END

    ELSE IF @Status = 3 -- Soft delete user
    BEGIN
        UPDATE [dbo].[Users]
        SET
            IsDeleted = 1,
            deletedon = GETDATE(),
            deletedby = @first_name
        WHERE user_id = @user_id;
    END

    ELSE IF @Status = 4 -- Restore user
    BEGIN
        UPDATE [dbo].[Users]
        SET IsDeleted = 0
        WHERE user_id = @user_id;
    END

    ELSE IF @Status = 5 -- Select all users (non-deleted)
    BEGIN
        SELECT 
            user_id,
            first_name,
            last_name,
            email,
            password_hash,
            role,
            registration_date,
            bio,
            createdby,
            updatedby,
            lastUpdated,
            IsDeleted,
            deletedby,
            deletedon
        FROM [dbo].[Users]
        WHERE IsDeleted = 0 OR IsDeleted IS NULL
        ORDER BY user_id;
    END

    ELSE IF @Status = 6 -- Select specific user by ID
    BEGIN
        SELECT 
            user_id,
            first_name,
            last_name,
            email,
            password_hash,
            role,
            registration_date,
            bio,
            createdby,
            updatedby,
            lastUpdated,
            IsDeleted,
            deletedby,
            deletedon
        FROM [dbo].[Users]
        WHERE user_id = @user_id
        ORDER BY registration_date DESC;
    END

    ELSE IF @Status = 7 -- Select specific non-deleted user by ID
    BEGIN
        SELECT 
            user_id,
            first_name,
            last_name,
            email,
            password_hash,
            role,
            registration_date,
            bio,
            createdby,
            updatedby,
            lastUpdated,
            IsDeleted,
            deletedby,
            deletedon
        FROM [dbo].[Users]
        WHERE user_id = @user_id AND IsDeleted = 0
        ORDER BY registration_date DESC;
    END

    ELSE IF @Status = 8 -- Select user by email
    BEGIN
        SELECT 
            user_id,
            first_name,
            last_name,
            email,
            password_hash,
            role,
            registration_date,
            bio,
            createdby,
            updatedby,
            lastUpdated,
            IsDeleted,
            deletedby,
            deletedon
        FROM [dbo].[Users]
        WHERE email = @email;
    END
END
GO
USE [master]
GO
ALTER DATABASE [ICMA_LEARN] SET  READ_WRITE 
GO
