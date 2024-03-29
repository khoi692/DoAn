USE [master]
GO
/****** Object:  Database [demo2]    Script Date: 7/22/2023 10:00:27 PM ******/
CREATE DATABASE [demo2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'demo2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LNL20002\MSSQL\DATA\demo2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'demo2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LNL20002\MSSQL\DATA\demo2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [demo2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [demo2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [demo2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [demo2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [demo2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [demo2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [demo2] SET ARITHABORT OFF 
GO
ALTER DATABASE [demo2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [demo2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [demo2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [demo2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [demo2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [demo2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [demo2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [demo2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [demo2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [demo2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [demo2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [demo2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [demo2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [demo2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [demo2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [demo2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [demo2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [demo2] SET RECOVERY FULL 
GO
ALTER DATABASE [demo2] SET  MULTI_USER 
GO
ALTER DATABASE [demo2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [demo2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [demo2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [demo2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [demo2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [demo2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'demo2', N'ON'
GO
ALTER DATABASE [demo2] SET QUERY_STORE = OFF
GO
USE [demo2]
GO
/****** Object:  Table [dbo].[Action]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Blog_id] [int] IDENTITY(1,1) NOT NULL,
	[Category_id] [int] NULL,
	[Time] [datetime] NULL,
	[Title] [varchar](255) NULL,
	[Summary] [varchar](255) NULL,
	[Tag] [varchar](255) NULL,
	[Author] [varchar](255) NULL,
	[Thumbnail] [varchar](100) NULL,
	[Content] [text] NULL,
	[STATUS] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[Category_id] [int] NOT NULL,
	[Category_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[User_id] [int] NOT NULL,
	[scp_id] [int] NOT NULL,
	[Quantity] [int] NULL,
	[addTime] [datetime] NULL,
 CONSTRAINT [cart_pk] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC,
	[scp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_id] [varchar](255) NOT NULL,
	[gender] [varchar](10) NULL,
	[Category_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[Color_id] [varchar](255) NOT NULL,
	[Color_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Contact_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NULL,
	[Message] [varchar](max) NULL,
	[Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[content] [varchar](255) NULL,
	[rating] [int] NULL,
	[product_id] [int] NULL,
	[time] [datetime] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History_action]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_action](
	[action_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[action_name] [varchar](255) NULL,
	[describe_action] [varchar](255) NULL,
	[time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[action_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History_of_change]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_of_change](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_id] [int] NULL,
	[obj_id] [int] NULL,
	[detail] [varchar](max) NULL,
	[time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Object]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [decimal](10, 2) NULL,
	[User_id] [int] NULL,
	[orderTime] [datetime] NULL,
	[orderStatus_id] [int] NULL,
	[address] [varchar](512) NULL,
	[phone] [varchar](255) NULL,
	[customerFullName] [varchar](255) NULL,
	[total_purchase_cost] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[orderStatus_id] [int] NOT NULL,
	[orderStatus_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderStatus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[order_id] [int] NOT NULL,
	[scp_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[Entry_Price] [decimal](10, 2) NULL,
	[Price] [decimal](10, 2) NULL,
 CONSTRAINT [order_detail_pk] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[scp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_name] [varchar](255) NULL,
	[Category_id] [varchar](255) NULL,
	[Describe] [varchar](max) NULL,
	[Entry_Price] [decimal](10, 2) NULL,
	[Price] [decimal](10, 2) NULL,
	[Discount] [decimal](5, 2) NULL,
	[start_discount] [datetime] NULL,
	[end_discount] [datetime] NULL,
	[releaseDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[Product_id] [int] NOT NULL,
	[Color_id] [varchar](255) NOT NULL,
	[image] [varchar](255) NULL,
	[default] [bit] NULL,
 CONSTRAINT [pci_pk] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC,
	[Color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_id] [int] NOT NULL,
	[Role_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[Size_id] [varchar](255) NOT NULL,
	[Size_name] [varchar](255) NULL,
 CONSTRAINT [size_pk] PRIMARY KEY CLUSTERED 
(
	[Size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size_color_product]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size_color_product](
	[scp_id] [int] IDENTITY(1,1) NOT NULL,
	[Color_id] [varchar](255) NULL,
	[Size_id] [varchar](255) NULL,
	[Product_id] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[scp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_id] [int] IDENTITY(1,1) NOT NULL,
	[Full_name] [varchar](255) NULL,
	[Gender] [varchar](255) NULL,
	[Dob] [date] NULL,
	[Phone_number] [varchar](255) NULL,
	[Address] [varchar](512) NULL,
	[Email] [varchar](255) NULL,
	[Username] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[Role_id] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 7/22/2023 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[Code] [varchar](255) NOT NULL,
	[quantity] [int] NULL,
	[describe] [varchar](255) NULL,
	[start_voucher] [datetime] NULL,
	[end_voucher] [datetime] NULL,
	[discount] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Action] ([Id], [Name]) VALUES (1, N'Add')
INSERT [dbo].[Action] ([Id], [Name]) VALUES (2, N'Update')
INSERT [dbo].[Action] ([Id], [Name]) VALUES (3, N'Delete')
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (1, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'The Art of Layering: How to Create a Chic Outfit', N'Learn how to choose outfits that boost your confidence and impress others in any situation.', N'#style#streetstyle', N'Admin', N'images/blog_thumbnail/blog-01.jpg', N'<p>In recent years, street style has become a major source of inspiration in the world of fashion. By carefully observing what stylish trendsetters are wearing on the streets of prominent fashion cities like New York, Paris, London and Milan, you can gain invaluable insights into putting together creative, cutting-edge looks.</p> <p>When you''re out walking in urban areas known for being fashion-forward, pay close attention to the outfits around you. Snap some photos of eye-catching combinations like mixes of feminine dresses with edgy leather jackets and chunky boots. These will serve as a useful reference later when you''re getting dressed and want fresh ideas.</p> <p>Instagram is also an excellent platform for discovering talented street style stars from cities across the globe to follow. There you can find a daily dose of inspiration showcasing how to style and layer pieces in unconventional ways. Take notes on which accounts really align with your personal taste so you can keep up with their latest boundary-pushing looks.</p> <img src="https://images.unsplash.com/photo-1485462537746-965f33f7f6a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80" alt="Woman in street style outfit"> <p>Don''t be afraid to take risks by combining pieces you wouldn''t necessarily expect to go together. A billowy floral dress paired with a cropped leather biker jacket and chunky boots can create a cool contrast. Stack dainty linked chains with bold chokers and other eye-catching statement jewelry. Thrift stores and vintage boutiques can yield one-of-a-kind retro-inspired garments and accessories perfect for channeling iconic street style eras.</p> <p>Modern street style essentials like distressed denim, oversized blazers, graphic slogan tees, fanny packs and retro sneakers are also great investments for your wardrobe. Don''t be afraid to add your own flair with DIY customizations like tie-dye, embroidery, patches or studs. Drawing inspiration from many different decades and cultures will ensure your personal look stands out from the crowd.</p> <p>Street style encourages fearless self-expression through fashion. By mixing and matching current trends with vintage pieces, you can develop your own signature style. Always remember to have fun with your look and project confidence, no matter how bold your outfit choices. After all, street style stars are setting trends by taking risks and showcasing their own unique flair.</p> <p><em>What tips do you have for incorporating street style elements into your own fashion? Share your ideas below!</em></p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (2, 1, CAST(N'2023-05-19T00:00:00.000' AS DateTime), N'The Power of Accessories: How to Elevate Your Look', N'Discover the latest styles, colors, prints and accessories that will make you look fresh and fashionable this spring.', N'#dressforsuccess#stylisttips', N'Admin', N'images/blog_thumbnail/blog-02.jpg', N'<p>Giving your wardrobe a makeover doesn''t require breaking the bank. With some creativity and clever strategies, you can reinvent your style and look like a million bucks, all while being thrifty and sticking to a budget.</p> <p>The first step is taking inventory of everything you already own. Go through your closet with fresh eyes, seeing classic pieces as blank canvases full of potential. Basic items like jeans, t-shirts, button-downs and blazers can be remixed and restyled in innovative ways, breathing new life into your existing wardrobe. Try techniques like tying a shirt around your waist, rolling up sleeves, cuffing jeans, layering necklaces, or adding a belt. Shop your own closet by color, print or texture to discover forgotten coordination opportunities.</p> <p>Don''t underestimate the power of accessories either. The right pair of statement earrings, an eye-catching hat, a pop of color from a scarf or an on-trend bag can transform the simplest outfit. It''s amazing what a difference accessories can make in pulling a look together. Search your jewelry box, hat, and handbag collection for hidden gems waiting to elevate your go-to ensembles.</p> <img src="https://images.unsplash.com/photo-1464863979621-258859e62245?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80" alt="Woman arranging clothes"> <p>Venture beyond your own closet to thrift stores, consignment shops, vintage boutiques and discount retailers. These are treasure troves for infusing your wardrobe with new life in an affordable way. Sift through racks in search of statement pieces and quality basics at a fraction of retail prices. It takes time and dedication, but thrifting allows you to add those special fashion finds that would normally be out of budget. From distressed denim to leather jackets, the options are endless.</p> <p>Accessories are just as important when thrifting. Keep an eye out for embellished shoes, unique jewelry like layered necklaces and charm bracelets, structured handbags, belts with eye-catching buckles, and anything else that catches your eye. The beauty of thrifting is uncovering one-of-a-kind pieces no one else will have. Don''t be afraid to get creative, reconstructing and repurposing items into something stylish and new.</p> <p>Add your own flair through simple DIY customizations. With embroidery floss, you can decorate a jacket. Fabric paint allows you to turn a basic t-shirt into a work of art. Distressed details like ripped knees on jeans can be achieved with sandpaper. Following fashion DIY blogs and YouTube channels will provide endless inspiration on upgrading wardrobe items on a small budget.</p> <p>Drawing fashion inspiration from the world around you is another free way to define your individual style. Let the colors, patterns and textures found in nature, architecture, art and photography influence your clothing and accessory choices. Interpret them in new and unexpected ways as you cultivate your personal aesthetic.</p> <p>Remember that developing personal style relies more on creativity, imagination and fearlessly expressing yourself than money. Take risks combining pieces in unconventional ways. DIY projects allow you to add original embellishments making each item uniquely yours. Shop smart by sticking to a budget. But focus less on staying on trend, and more on crafting signature looks that showcase your individuality. With the right attitude and strategies, you can reinvent your wardrobe and achieve any style you desire while still being thrifty.</p> <p><em>What are your best tips and tricks for revamping your style on a budget? Share your thoughts in the comments!</em></p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (3, 2, CAST(N'2023-05-10T00:00:00.000' AS DateTime), N'The Top 10 Fashion Trends for the Season', N'Find out how to dress appropriately and stylishly for different types of weddings, from formal to casual, and from summer to winter', N'#springfashion #fashiontrends', N'Admin', N'images/blog_thumbnail/blog-03.jpg', N'<p>Finding the perfect jeans can be a struggle. With so many styles, cuts, and sizes to choose from, it can feel overwhelming navigating the denim aisle. Here are some tips for choosing jeans that are flattering, on-trend and make you look and feel your best.</p> <p>Look for stretch material with at least 2% spandex or elastane woven in. The extra give will ensure a comfortable fit that moves with you. Dark indigo wash is classic and slimming. Opt for a straight or slim cut, avoiding anything too baggy or tight. The legs should be long enough to prevent pooling around your ankles.</p> <img src="https://images.unsplash.com/photo-1521341057461-6eb5f40b07ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80" alt="Woman trying on jeans."> <p>Look for a medium to high rise hitting near your natural waist. This is the narrowest part of your torso and will prevent embarrassing gaps in the back. Make sure there is room through the hip and thigh area - too tight and you''ll experience that dreaded front gap. Aim for a leg opening of around 14 to 16 inches for a sleek silhouette.</p> <p>When trying on, wear shoes similar to your everyday style to gauge the proper length. Sit, squat and move around to assess comfort. The waist shouldn''t gap or pinch. Fabric shouldn''t pull or stretch awkwardly. Quality denim will retain shape and structure without sagging.</p> <p>Take the time to find the perfect fit. It makes all the difference in boosting your confidence and letting your inner star shine. The right jeans act as a blank canvas you can dress up or down effortlessly. Investing in denim that fits just right is worth it when it makes you look and feel a million bucks.</p> <p><em>What are your top tips for finding the perfect pair of jeans? Share your thoughts below!</em></p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (4, 2, CAST(N'2023-02-02T00:00:00.000' AS DateTime), N'Dressing for Your Body Type: Tips and Tricks', N'Learn how to create a versatile and timeless wardrobe with a few essential pieces that can be mixed and matched for any occasion', N'#weddingguest #weddingstyle', N'Coga', N'images/blog_thumbnail/blog-04.jpg', N'<p>Experimenting with different silhouettes can breathe new life into your wardrobe. Instead of defaulting to your everyday shapes, shake things up by playing with proportions. Oversized, billowy tops balanced with fitted bottoms create an effortlessly chic contrast. For a feminine vibe, pair a narrow pencil skirt with a loose, flowy blouse. Or layer a boxy cropped jacket over a long maxi dress.</p> <p>Structured coats and blazers with strong shoulders and defined waists put focus on your upper body when worn atop a floaty skirt or wide leg pants. Cinch in baggy shirts and dresses at the waist with a belt to enhance your figure. Go for cropped versions of classic pieces like jackets, sweaters and jeans to show a sliver of skin.</p> <img src="https://images.unsplash.com/photo-1484186139897-d5fc6b908812?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80" alt="Woman posing in oversized jacket."> <p>Plunging necklines and off-the-shoulder silhouettes highlight your décolletage and shoulders, while nipped-in waists emphasize your curves. Throwing on an oversized men''s button-down or blazer taps into the boyfriend look. Contrast skinny jeans with an airy tunic or voluminous sleeves. The options for playing with proportions are endless.</p> <p>Stick to solids if combining dramatically different shapes and scales. Vary textures like distressed denim, soft knits and sleek satin to add visual interest. And don’t forget statement accessories like funky mules, angular earrings and ornate pendants to tie the look together.</p> <p>Stepping out of your comfort zone and challenging style norms can unleash your fashion creativity. Experiment until you find flattering new silhouettes that highlight your best assets and bring out your inner confidence.</p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (5, 1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), N'The Best Colors to Wear for Your Skin Tone', N'Explore the best websites that offer quality, trendy and budget-friendly clothes, with reviews, ratings and recommendations.', N'#style#bag#localbrand', N'Lukaku', N'images/blog_thumbnail/blog-05.jpg', N'<p>Accessorizing can instantly elevate your look. The right accessories act as the perfect finishing touch, tying an entire outfit together. Don’t underestimate the power of small styling details to make a big impact.</p> <p>Jewelry is one of the easiest ways to accessorize. Stacked bangles and arm parties add dimension to simple silhouettes. Layered necklaces in varying lengths, materials and pendants infuse visual interest. Ear stacks mixing studs with hoops and climbers amp up edge. Rings on multiple fingers give off an eclectic vibe.</p> <img src="https://images.unsplash.com/photo-1548861216-17dd1bc8e44f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80" alt="Woman with accessories."> <p>Statement sunglasses instantly make you look fashion forward. Opt for retro cat-eye or geometric shapes in bold hues. Structured handbags add polish, especially styles with interesting hardware and texture. Wide brim hats lend vintage appeal, while baseball caps inject casual cool. <p>The right footwear can ground your whole look. Heels elongate legs and create flattering proportions. Chunky combat or lug sole boots toughen up delicate dresses. Play with texture mixing suede, leather and snakeskin. Ankle straps and bright colors put a modern twist on traditional silhouettes.</p> <p>When selecting accessories, consider your ensemble’s color scheme and mood. Gold jewelry pops against black, while silver complements cool tones. Match metals for a coordinated effect. And don’t be afraid to mix high and low end pieces. Accessorizing infuses self-expression and creativity into any outfit.</p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (6, 1, CAST(N'2023-04-03T00:00:00.000' AS DateTime), N'Mixing and Matching Patterns: A Beginner’s Guide', N'Learn how to combine different prints and patterns in your outfits without clashing or looking too busy.', N'#personalstyle #stylequiz #stylechecklist', N'Menden', N'images/blog_thumbnail/blog-06.jpg', N'<p>Finding the perfect swimsuit can feel daunting with so many styles and trends to choose from. But having a flattering suit you feel confident in can make all the difference when it comes to enjoying beach and pool season. Here are some tips for selecting a swimsuit that makes you look and feel your best.</p> <p>Opt for solid colors or simple prints over busy patterns, which can be distracting. Darker neutrals like black, navy and deep burgundy are universally flattering and slimming. Pieces with some stretch in the fabric will contour your shape without feeling restrictive.</p> <img src="https://images.unsplash.com/photo-1526145511978-7947d2387c4e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80" alt="Woman posing in swimsuit."> <p>Look for adequate coverage in the bust and hip area - neither too skimpy nor too modest. Halter tops and bandeaus with straps flatter smaller chests while providing support. Opt for tummy control panels or high-waisted bottoms if wanting to slenderize the midsection. Boy short and high cut leg lines elongate the legs.</p> <p>Don''t sacrifice comfort for fashion. Make sure the swimsuit doesn''t dig, pinch or gap in any spot. Move around when trying on to assess fit. The suit should hold everything in securely without feeling tight and restrictive. Pay attention to the lining - it shouldn''t bunch or become visible.</p> <p>Mix and match tops and bottoms until you find the most flattering fit for both your top and bottom halves. The right swimsuit highlights your best assets and exudes confidence.Accessorize with sarongs, sun hats and statement sunglasses. With so many options, you can and should find a swimsuit that makes you feel gorgeous inside and out.</p>', 0)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (7, 1, CAST(N'2023-03-04T00:00:00.000' AS DateTime), N'The Versatility of a White T-Shirt: How to Style It', N'Get inspired by the most popular and influential fashionistas on Instagram, who share their outfits, tips, stories and more.', N'#style#bag#localbrand', N'Khan', N'images/blog_thumbnail/blog-07.jpg', N'<p>Finding shoes that are both stylish and comfortable can seem like an impossible feat. But it doesn''t have to be an exercise in misery for your feet. With some savvy tips, you can build a shoe wardrobe that is as painless as it is fashionable.</p> <p>The key is looking for shoes with quality arch support, cushioning and shock absorption. Brands like Clarks, Ecco and Dansko specialize in foot-friendly silhouettes. For heels, aim for a sturdy block heel around 2-3 inches rather than stilettos. Platforms help distribute weight better. Look for straps over the instep to secure the shoe on your foot.</p> <img src="https://images.unsplash.com/photo-1543163521-1bf539c55dd2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80" alt="Woman wearing comfortable shoes."> <p>Wedges and chunky heels offer stability, as long as they aren''t too clunky looking. For flats, round or almond toes create a sleek line. Fabric uppers like suede and leather mold comfortably to your feet over time. Rubber soles provide needed traction. Look for a flexible sole that bends with your foot.</p> <p>Try on shoes at the end of the day when feet are slightly swollen. Walk around the store to assess feel and fit. Your toes shouldn''t hit the front or be jammed in. There should be enough room for feet to spread naturally when stepping down. Proper fit means no slippage, pinching or heel lift as you move.</p> <p>Cushioning inserts and insoles can make a world of difference in elevating comfort. Bringing an extra pair of inserts along when shopping is advisable. Investing in quality, supportive shoes ensures you look stylish and feel great even after hours of wear. Don''t settle for solely form or function - with the right shoes, you can have both.</p>', 0)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (8, 2, CAST(N'2023-02-06T00:00:00.000' AS DateTime), N'Dressing Up Your Sneakers: A Guide to Casual Chic', N'Learn how to choose and wear accessories that complement your outfits and enhance your look.', N'#style#bag#localbrand', N'Khan', N'images/blog_thumbnail/blog-08.jpg', N'<p>Revitalizing your look for a new season can seem daunting. Where do you start when updating your wardrobe? It helps to begin with a clean slate. Clear out cluttered closets and drawers. Donate, consign or recycle anything you haven''t worn in years. Assess what gaps need filling in your existing collection.</p> <p>Create a mood board for inspiration. Clip photos, fabrics and color swatches that capture your vision. Keep an eye out for emerging trends via social media, blogs and magazines. But buy into trends sparingly, investing more in versatile, lasting classics true to your personal style.</p> <img src="https://images.unsplash.com/photo-1496747611176-843222e1e57c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80" alt="Woman organizing closet."> <p>Approach shopping with a strategy. Search resale shops first for quality basics at reduced prices. Then fill in missing pieces with targeted purchases of key trend items, if desired. Seek out comfortable, breathable fabrics that transition across seasons.</p> <p>Try a capsule wardrobe approach when rebuilding. Focus on coordinating color palettes, versatile silhouettes, and mix-and-match layering. The goal is creating multiple outfits from fewer superior pieces. Quality over quantity is the mindset for investment pieces.</p> <p>Revitalizing your look gives you a fresh start. Build a functional wardrobe that makes you feel confident, stylish and perfectly you. The new season awaits.</p>', 0)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (9, 2, CAST(N'2023-02-07T00:00:00.000' AS DateTime), N'Denim Jackets: A Timeless Classic with Endless Possibilities', N'Take a quiz and follow a checklist to discover your unique style personality and preferences.', N'#trend#shirt', N'Menden', N'images/blog_thumbnail/blog-09.jpg', N'<p>Upgrading your accessories game is an easy way to instantly revitalize your look. The right accessories act as the perfect finishing touch, taking an outfit from bland to bold. When chosen thoughtfully, accessories showcase personality and individuality.</p> <p>Jewelry is one of the most versatile accessories. Layered necklaces in varying lengths, materials and pendants add visual interest. Stacked bangles and arm parties inject color and texture. Statement rings, from sculptural designs to stackable bands, express personal flair. Ear stacks with studs, hoops and climbers project playful edge.</p> <img src="https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80" alt="Accessories on table."> <p>Eyewear is another accessory that packs a stylish punch. Make bold statements with geometric sunglasses in bright hues and retro cat-eye shapes. Structured handbags, from classic black leather totes to bejeweled minaudières, add polish. Statement hats, like wide-brimmed sunhats or floppy fisherman styles, lend vintage appeal.</p> <p>Footwear choices ground the whole look. Metallic heels and strappy sandals dress up casual pieces. Chunky combat or lug sole boots add edge to feminine silhouettes. Distressed leather boots project laidback cool. Let creativity shine through funky shoe choices.</p> <p>When curating accessories, consider your personal style, brand story and mood you want to convey. Luxe designer pieces signal aspiration. Vintage and handmade items provide artisanal flair. The freedom to communicate through accessories makes getting dressed each day an opportunity for creative expression.</p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (10, 1, CAST(N'2023-02-08T00:00:00.000' AS DateTime), N'The Magic of Midi Skirts: How to Wear Them Any Season', N'Learn about the evolution of fashion from ancient times to the present day, with examples of the most iconic looks and trends.', N'#diyprojects#upcyclingideas', N'Thao', N'images/blog_thumbnail/blog-10.jpg', N'<p>Breathing new life into tired wardrobe basics is an essential style skill. With clever styling tricks and DIY customizations, you can transform empty garments into fashion statements. Experimentation allows you to see classics in an entirely new light.</p> <p>Start by scrutinizing silhouette, scale and proportion. Oversized button-downs become effortlessly chic as dresses or beach cover-ups. Cropped sweaters and tees spotlight your waistline. Cuff or roll sleeves to freshen up simple shapes. Tuck, knot and tie shirts to change necklines and hemlines.</p> <img src="https://images.unsplash.com/photo-1468495244123-6c6c332eeece?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80" alt="Woman upcycling t-shirt."> <p>Flip pieces inside out or backwards for unconventional styling. Cut, splice and reconfigure garments into new iterations like crop tops. Reinvent the placement of zippers, buttons and other functional details. Contrast multiple textures like leather, suede, silk and denim.</p> <p>Upcycle with artful DIY embellishments. Metallic studs, eyelet trim and lace elevate basics. Paint, bleach or dye garments into colorful works of art. Add patches, personalized embroidery or iron-on decals to customize pieces. Distressed details like shredded hems use negative space creatively.</p> <p>Approach revitalizing your wardrobe as an artistic challenge. Let creativity guide you as you transform basics from bland to bold. The possibilities are endless.</p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (11, 1, CAST(N'2020-06-27T00:00:00.000' AS DateTime), N'Leather Jackets: A Wardrobe Staple with Endless Possibilities ', N'Learn how to transform your old clothes into new and creative items, such as bags, pillows, rugs, etc. ', N'#catwalk#gucci', N'Admin', N'images/blog_thumbnail/blog-11.jpg', N'<p>Minimalism in fashion is all about streamlining your wardrobe down to a curated selection of essentials. Adopting a minimalist mindset allows you to craft a signature style based on intentionality, versatility and quality over quantity.</p> <p>Edit your closet ruthlessly, donating or consigning anything you haven''t worn in years. Keep only pieces that fit impeccably and make you look and feel amazing. Build your wardrobe around neutral basics like crisp white shirts, well-fitted jeans, tailored blazers and soft cashmere sweaters.</p> <img src="https://images.unsplash.com/photo-1497005367839-6e852de72767?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80" alt="Woman in minimalist closet."> <p>Incorporate versatile black and camel pieces that pair effortlessly. Seek out high-quality fabrics like silk, merino wool and premium denim that stand the test of time. Opt for simple, clean silhouettes with minimal embellishment. Use accessories sparingly to provide pops of personality.</p> <p>Aim to create multiple outfits from fewer superior pieces. Mix and match layers using color, texture and shape to provide variety. A minimalist wardrobe requires creativity and styling panache to achieve maximum looks. Treat basics as blank canvases you can dress up or down.</p> <p>Adopting a minimalist mindset keeps your look refined and intentional. Decluttering your wardrobe allows your inner confidence and essence to shine through.</p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (12, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Dressing Up Your Jeans: A Guide to Casual Chic', N'Explore the best apps and websites that help you find outfit ideas, style advice, shopping deals, etc.', N'#trend#makeup', N'Admin', N'images/blog_thumbnail/blog-12.jpg', N'<p>Upgrading your professional wardrobe requires investing in versatile, quality pieces that translate from office to outings with ease. Choose timeless classics over fleeting trends to build a polished capsule wardrobe that carries you between work and play.</p> <p>Focus your budget on tailored pieces like blazers, trousers and sheath dresses in neutral hues like black, navy and gray. Opt for natural fibers like wool, silk and cotton that wear beautifully over time. Build upon classic button-downs, pencil skirts, and trousers for mix-and-match potential.</p> <img src="https://images.unsplash.com/photo-1517411039340-209bafd87903?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80" alt="Woman in professional clothing."> <p>Incorporate versatile 3rd pieces like blazers, cardigans and longer coats that pull polished looks together. Opt for low-heeled pumps and loafers that can handle busy days on the move. A leather tote bag transitions seamlessly from office to evening.</p> <p>Accessories like silk scarves, statement jewelry and color blocked clutches provide easy options for switching up office looks after-hours. Build your professional wardrobe around lasting quality mixed with styling creativity. The goal is stretch each piece to maximize versatility and cost-per-wear.</p> <p>Approach building your work wardrobe as an investment in your personal brand. Timeless style conveys polish whether in the boardroom or out on the town.</p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (13, 1, CAST(N'2023-11-13T00:00:00.000' AS DateTime), N'Black T-Shirts: A Wardrobe Staple with Endless Possibilities', N'Learn how to keep your clothes clean, fresh and in good condition with proper washing, drying, ironing and storing methods.', N'#dressforyourbodytype', N'Admin', N'images/blog_thumbnail/blog-13.jpg', N'<p>Athleisure wear has transformed how we dress for working out and lounging at home. Blurring the line between fitness apparel and streetwear, athleisure allows you to move seamlessly between the gym and running errands. When curating an athleisure wardrobe, focus on versatility, comfort and personality.</p> <p>Leggings are the foundation of any athleisure look. Look for moisture-wicking performance fabrics with contouring compression. Neutral colors like black, gray and navy offer versatility. Bring flair with printed leggings featuring bold patterns, mesh paneling and decorative ankle details.</p> <img src="https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80" alt="Woman in athleisure wear."> <p>Layer with sports bras, loose tanks, cropped hoodies and oversized pullovers for adaptable style. Sneakers are your go-to shoewear, but slides, flip flops and slip-on sandals work for post-workout looks. Top it off with baseball caps, puffer vests, duffel bags and other streetwise accessories.</p> <p>Mixing athleisure pieces with denim, blazers and other casual staples makes them appropriate beyond the gym. Build a sporty capsule wardrobe that keeps you looking chic wherever the day takes you.</p>', 0)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (14, 1, CAST(N'2019-05-19T00:00:00.000' AS DateTime), N'Maxi Dresses: A Summer Essential with Endless Possibilities', N'Learn how to choose clothes that flatter your body shape and size, and avoid common fashion mistakes.', N'#trend', N'Admin', N'images/blog_thumbnail/blog-14.jpg', N'<p>Making eco-friendly choices with your wardrobe has never been more on trend. Sustainable fashion allows you to reduce waste, recycle beloved pieces, and choose ethical and eco-conscious brands. Adopting a sustainable mindset benefits both the planet and your personal style.</p> <p>Thrift vintage finds and locally made pieces with artisanal craftsmanship at the core of a sustainable wardrobe. Seek natural, biodegradable fabrics like organic cotton, linen and lyocell. When shopping new, research brands committed to ethical production and transparent supply chains.</p> <img src="https://images.unsplash.com/photo-1510574018235-577006e762a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80" alt="Sustainable clothing rack."> <p>Repurpose and mend beloved items to extend their lifespan. Swap disposable fashion trends for timeless, quality basics you can wear for years. Seek natural dyeing methods over synthetic colors. Clean out your closet frequently and recycle unusable textiles responsibly.</p> <p>Sustainable fashion choices demonstrate your values. Seek out ethical brands and employ mindful buying habits, purchasing only what you truly love and will wear. Eco-fashion means looking stylish while respecting the planet.</p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (15, 1, CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'Blazers: A Classic Piece with Endless Possibilities', N'Discover the best fashion brands that are environmentally friendly, socially responsible and cruelty-free.', N'#gucci', N'Admin', N'images/blog_thumbnail/blog-15.jpg', N'<p>Exploring different subcultures through fashion allows self-expression beyond mass trends. Punk, goth, streetwear and other distinct styles have unique sensibilities that can inspire you to take risks and embrace nonconformity.</p> <p>Channel punk attitude with leather, plaid, ripped details and combat boots. Offset feminine silhouettes with spiked chokers and other edgy accents. Goth fashion utilizes romantic blouses, flowing maxi skirts and platforms for dramatics.</p> <img src="https://images.unsplash.com/photo-1618005022740-5fb69fe4e1ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80" alt="Woman in alternative subculture clothing."> <p>Streetwear pulls from hip hop influence with graphic tees, oversized hoodies and bold sneakers. Borrow elements from multiple subcultures and eras for an eclectic vibe. Customize basic pieces with patches, studs or bleaching.</p> <p>Experimenting with subcultural styles allows you to challenge fashion norms. Blend aesthetics to create your own distinct look outside the mainstream.</p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (16, 1, CAST(N'2022-05-05T00:00:00.000' AS DateTime), N'Dressing Up Your Leggings: A Guide to Casual Chic', N'Learn how to wear one color from head to toe without looking boring or bland, with examples and ideas.', N'#greenfashion#ecofriendlyclothes', N'Admin', N'images/blog_thumbnail/blog-16.jpg', N'<p>Finding your most flattering colors can elevate your entire look. Determining your color season helps guide clothing and makeup choices to create harmony. Take inspiration from nature when selecting hues that complement your complexion and bring out your best features.</p> <p>Deep, jewel tones like emerald green and sapphire blue are universally flattering. Neutrals like black, white, navy and tan provide versatility. If you have warm undertones, embrace fiery reds, sunny yellows and rich browns. Cool undertones glow in icy pastels like mint and lavender.</p> <img src="https://images.unsplash.com/photo-1574780980839-2aa481b15f49?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80" alt="Woman with color swatches."> <p>Those with high contrast features shine in vibrant hues for impact. Soft complexions dazzle in muted tones like blush pinks and seafoam greens. Avoid colors that seem to disappear against your skin. Delicate palettes need soft pastels, while edgy styles pop in neon brights.</p> <p>Use your best colors creatively throughout your wardrobe. Bold accessories provide affordable ways to experiment. When colors feel harmonious, your whole aura radiates confidence.</p>', 0)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (17, 1, CAST(N'2020-07-26T00:00:00.000' AS DateTime), N'White Button-Down Shirts: A Classic Piece with Endless Possibilities', N'Discover the best podcasts that cover fashion topics, such as trends, news, interviews, tips, etc.', N'#style', N'Fuka', N'images/blog_thumbnail/blog-17.jpg', N'<p>Vintage fashion offers a treasure trove for creating distinctive looks by drawing from past eras. From bohemian 70s inspired pieces to elegant 50s silhouettes, vintage captures iconic styles through the decades.</p> <p>Thrift stores, estate sales and consignment shops are go-to vintage hunting grounds. Look for classic shapes, prints and detailing unique to certain periods. Pay attention to quality construction and fabrics no longer used. Handle pieces gently to preserve condition.</p> <img src="https://images.unsplash.com/photo-1484330732883-57cf7707c0f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80" alt="Woman looking through vintage clothes."> <p>Research eras that resonate with your style. Key silhouettes of the 20s include drop-waist dresses and Mary Jane shoes. 40s influence shows via victory rolls, pin curls and lapel jackets. The 60s and 70s ushered in billowy maxi dresses, peasant tops and retro washed denim.</p> <p>Blend vintage finds with modern pieces to create signature looks. Add your own flair by styling items in unexpected ways. Vintage fashion allows you to honor eras past while putting your distinctive spin on iconic styles.</p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (18, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Crop Tops: A Summer Essential with Endless Possibilities', N'Learn how to shop wisely and save money on clothes, with strategies such as budgeting, planning, comparing, etc.', N'#style#streetstyle', N'Admin', N'images/blog_thumbnail/blog-18.jpg', N'<p>Revitalizing your wardrobe on a budget requires clever solutions like DIY projects and styling tricks. With creativity and resourcefulness, you can reinvent pieces without splurging on new items. Approach revamps as an artistic challenge.</p> <p>Modernize basics by adding on-trend accents like puff shoulders, cut-outs or ruching. Use decorative trims and appliques to embellish hems and necklines. Paint, dye or bleach solid garments for brand new hues. Sew on patches, personalized embroidery or iron-on designs.</p> <img src="https://images.unsplash.com/photo-1586495777744-4413f21062fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80" alt="Woman sewing clothes."> <p>Distressed details like strategic rips, fraying and destroyed effects inject edge into basics. Repurpose oversized pieces into cropped versions. Cut up worn out t-shirts and reconfigure them into headbands or hair accessories. Refashion dated items into modern DIY takes.</p> <p>See wardrobe revamps as a chance to get creative and make something unique. With an artistic eye, you can modernize basics on a budget into fresh fashion statements.</p>', 0)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (19, 1, CAST(N'2022-01-22T00:00:00.000' AS DateTime), N'Little Black Dresses: FPT', N'Learn how to layer your clothes for warmth,', N'#trend#shirt', N'Admin', N'images/blog_thumbnail/blog-19.jpg', N'<p>Capsule wardrobes streamline your closet down to a versatile selection of essentials. Built strategically, capsule wardrobes create multiple outfits from minimal pieces. This pared-down approach keeps you looking chic with less.</p> <p>Edit your closet to identify gaps in basic categories: tops, bottoms, dresses, outerwear. Choose quality over quantity. Seek classic silhouettes in neutral hues with minimal embellishment. Your core palette should coordinate seamlessly.</p> <img src="https://images.unsplash.com/photo-1485462537746-965f33f7f6a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80" alt="Woman choosing capsule wardrobe."> <p>Layering is essential to capsule wardrobes. Opt for interchangeable lightweight knits, button-down shirts, and versatile coats. Accessories like statement jewelry, scarves and shoes transition basics between casual and dressy.</p> <p>A capsule lets you get maximum mileage from minimal garments. Make every piece earn its place by coordinating effortlessly. A streamlined wardrobe keeps you looking pulled-together with less fuss.</p>', 1)
INSERT [dbo].[Blog] ([Blog_id], [Category_id], [Time], [Title], [Summary], [Tag], [Author], [Thumbnail], [Content], [STATUS]) VALUES (20, 2, CAST(N'2021-09-23T00:00:00.000' AS DateTime), N'Dressing Up Your Shorts:', N'Discover the best books ', N'#style#bag#localbrand', N'Admin', N'images/blog_thumbnail/blog-20.jpg', N'<p>Dressing sustainably is the ultimate fashion-forward statement. Seek timeless, ethically made investment pieces over disposable fast fashion trends. Building an eco-conscious wardrobe keeps your style fresh while caring for the planet.</p> <p>Thrift and consign high-quality natural fibers like wool, linen, silk and organic cotton. Seek brands that uphold fair labor practices and use environmentally-friendly textile processes. Vintage finds give cherished materials new life.</p> <img src="https://images.unsplash.com/photo-1513584684374-8bab748fbf90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80" alt="Sustainable fashion pieces."> <p>Repair, mend, and lovingly care for favorite pieces to prolong their lifespan. Swap disposable fashion for convertible classics you can wear for years. Seek natural plant and mineral based dyes. Compost unwearable fabrics to regenerate new textiles.</p> <p>Sustainable style shows your values. Seek quality over quantity and employ mindful buying habits. Eco-conscious fashion is always in vogue.</p>', 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
INSERT [dbo].[BlogCategory] ([Category_id], [Category_name]) VALUES (1, N'Style')
INSERT [dbo].[BlogCategory] ([Category_id], [Category_name]) VALUES (2, N'Trend')
INSERT [dbo].[BlogCategory] ([Category_id], [Category_name]) VALUES (3, N'Fashion')
INSERT [dbo].[BlogCategory] ([Category_id], [Category_name]) VALUES (4, N'Beauty')
GO
INSERT [dbo].[Cart] ([User_id], [scp_id], [Quantity], [addTime]) VALUES (2, 1, 2, CAST(N'2021-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Cart] ([User_id], [scp_id], [Quantity], [addTime]) VALUES (2, 3, 3, CAST(N'2023-05-31T17:32:14.630' AS DateTime))
INSERT [dbo].[Cart] ([User_id], [scp_id], [Quantity], [addTime]) VALUES (6, 24, 7, CAST(N'2023-06-10T21:50:41.470' AS DateTime))
INSERT [dbo].[Cart] ([User_id], [scp_id], [Quantity], [addTime]) VALUES (6, 46, 9, CAST(N'2023-06-10T21:50:46.077' AS DateTime))
INSERT [dbo].[Cart] ([User_id], [scp_id], [Quantity], [addTime]) VALUES (6, 64, 1, CAST(N'2023-06-15T10:34:11.590' AS DateTime))
INSERT [dbo].[Cart] ([User_id], [scp_id], [Quantity], [addTime]) VALUES (6, 65, 1, CAST(N'2023-06-10T21:51:00.040' AS DateTime))
INSERT [dbo].[Cart] ([User_id], [scp_id], [Quantity], [addTime]) VALUES (6, 69, 5, CAST(N'2023-06-09T19:05:57.783' AS DateTime))
GO
INSERT [dbo].[Category] ([Category_id], [gender], [Category_name]) VALUES (N'mcoat', N'man', N'coat')
INSERT [dbo].[Category] ([Category_id], [gender], [Category_name]) VALUES (N'mshirt', N'man', N'shirt')
INSERT [dbo].[Category] ([Category_id], [gender], [Category_name]) VALUES (N'ucoat', N'unisex', N'coat')
INSERT [dbo].[Category] ([Category_id], [gender], [Category_name]) VALUES (N'wcoat', N'women', N'coat')
INSERT [dbo].[Category] ([Category_id], [gender], [Category_name]) VALUES (N'wshirt', N'women', N'shirt')
INSERT [dbo].[Category] ([Category_id], [gender], [Category_name]) VALUES (N'wt-shirt', N'women', N't-shirt')
GO
INSERT [dbo].[Color] ([Color_id], [Color_name]) VALUES (N'black', N'black')
INSERT [dbo].[Color] ([Color_id], [Color_name]) VALUES (N'blue', N'blue')
INSERT [dbo].[Color] ([Color_id], [Color_name]) VALUES (N'brown', N'brown')
INSERT [dbo].[Color] ([Color_id], [Color_name]) VALUES (N'grey', N'grey')
INSERT [dbo].[Color] ([Color_id], [Color_name]) VALUES (N'pink', N'pink')
INSERT [dbo].[Color] ([Color_id], [Color_name]) VALUES (N'red', N'red')
INSERT [dbo].[Color] ([Color_id], [Color_name]) VALUES (N'white', N'white')
INSERT [dbo].[Color] ([Color_id], [Color_name]) VALUES (N'yellow', N'yellow')
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Contact_id], [User_id], [Message], [Time]) VALUES (1, 6, N'I have some problem with my order', CAST(N'2023-07-21T21:12:27.000' AS DateTime))
INSERT [dbo].[Contact] ([Contact_id], [User_id], [Message], [Time]) VALUES (2, 6, N'I have some problem with my order', CAST(N'2023-07-21T21:17:45.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[feedback] ON 

INSERT [dbo].[feedback] ([feedback_id], [user_id], [content], [rating], [product_id], [time], [status]) VALUES (15, 2, N'The product arrived on time and in good condition. I am satisfied with my purchase.', 5, 1, CAST(N'2023-06-25T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[feedback] ([feedback_id], [user_id], [content], [rating], [product_id], [time], [status]) VALUES (16, 3, N'The product did not meet my expectations. The quality was poor.', 2, 2, CAST(N'2023-06-25T12:01:00.000' AS DateTime), 0)
INSERT [dbo].[feedback] ([feedback_id], [user_id], [content], [rating], [product_id], [time], [status]) VALUES (17, 4, N'The product was easy to use and worked as advertised. I am happy with my purchase.', 4, 3, CAST(N'2023-06-25T12:02:00.000' AS DateTime), 1)
INSERT [dbo].[feedback] ([feedback_id], [user_id], [content], [rating], [product_id], [time], [status]) VALUES (18, 5, N'The product arrived damaged and the customer service was unhelpful. I am very disappointed.', 1, 4, CAST(N'2023-06-25T12:03:00.000' AS DateTime), 0)
INSERT [dbo].[feedback] ([feedback_id], [user_id], [content], [rating], [product_id], [time], [status]) VALUES (19, 6, N'The product was delivered quickly and the packaging was secure. I am happy with my purchase.', 4, 5, CAST(N'2023-06-25T12:04:00.000' AS DateTime), 1)
INSERT [dbo].[feedback] ([feedback_id], [user_id], [content], [rating], [product_id], [time], [status]) VALUES (20, 7, N'The product did not work as expected and the instructions were unclear. I am not satisfied with my purchase.', 2, 6, CAST(N'2023-06-25T12:05:00.000' AS DateTime), 1)
INSERT [dbo].[feedback] ([feedback_id], [user_id], [content], [rating], [product_id], [time], [status]) VALUES (21, 8, N'The product was of high quality and worked perfectly. I am very satisfied with my purchase.', 5, 7, CAST(N'2023-06-25T12:06:00.000' AS DateTime), 0)
INSERT [dbo].[feedback] ([feedback_id], [user_id], [content], [rating], [product_id], [time], [status]) VALUES (22, 2, N'The product was not as described and did not meet my expectations. I am disappointed with my purchase.', 2, 8, CAST(N'2023-06-25T12:07:00.000' AS DateTime), 0)
INSERT [dbo].[feedback] ([feedback_id], [user_id], [content], [rating], [product_id], [time], [status]) VALUES (23, 3, N'The product was easy to set up and worked as expected. I am happy with my purchase.', 4, 9, CAST(N'2023-06-25T12:08:00.000' AS DateTime), 1)
INSERT [dbo].[feedback] ([feedback_id], [user_id], [content], [rating], [product_id], [time], [status]) VALUES (24, 4, N'The product arrived late and was not as described. I am not satisfied with my purchase.', 2, 10, CAST(N'2023-06-25T12:09:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[History_of_change] ON 

INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (7, 2, 1, N'Product with id 1 updated. Price changed from "16.64" to "15.00"', CAST(N'2023-06-28T20:38:15.500' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (9, 2, 2, N'Product with id 2 updated. Entry_Price changed from "22.60" to "100.00"', CAST(N'2023-06-28T20:38:26.630' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (10, 2, 2, N'User with id 2 updated. Address changed from "Thach That" to "Tokyo"', CAST(N'2023-06-28T20:38:58.440' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (11, 2, 7, N'User with id 7 updated. Username changed from "Roger" to "Alex"', CAST(N'2023-06-28T20:39:08.207' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (14, 2, 7, N'Blog with id 7 updated. Category_id changed from "2" to "1"', CAST(N'2023-06-28T20:39:58.160' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (19, 2, 1, N'Order with id 1 updated. orderStatus_id changed from "1" to "2"', CAST(N'2023-06-28T20:41:03.383' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (20, 2, 5, N'Order with id 5 updated. orderStatus_id changed from "3" to "1"', CAST(N'2023-06-28T20:41:08.453' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (28, 1, 4, N'Product with id 93 inserted.', CAST(N'2023-06-29T10:40:14.080' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (29, 3, 4, N'Product with id 93 deleted.', CAST(N'2023-06-29T10:45:04.677' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (30, 2, 7, N'Feedback with id 24 updated. Status changed from "0" to "0"', CAST(N'2023-06-29T11:00:34.560' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (31, 2, 7, N'Feedback with id 24 updated. Status changed from "0" to "0"', CAST(N'2023-06-29T11:00:42.163' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (32, 2, 7, N'Feedback with id 24 updated. Status changed from "0" to "0"', CAST(N'2023-06-29T11:01:20.880' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (33, 2, 7, N'Feedback with id 24 updated. Status changed from "0" to "0"', CAST(N'2023-06-29T11:01:29.710' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (34, 2, 7, N'Feedback with id 24 updated. Status changed from "0" to "1"', CAST(N'2023-06-29T11:03:01.060' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (35, 3, 6, N'Voucher with code COZAHJ8ZBaQR deleted.', CAST(N'2023-06-29T11:04:53.930' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (36, 3, 6, N'Voucher with code COZAfIUyHhZc deleted.', CAST(N'2023-06-29T11:04:56.250' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (37, 3, 6, N'Voucher with code COZA0TlfpjQ6 deleted.', CAST(N'2023-06-29T11:05:15.613' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (38, 3, 6, N'Voucher with code COZA1JgbcJs5 deleted.', CAST(N'2023-06-29T11:05:15.613' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (39, 3, 6, N'Voucher with code COZA292IIlMW deleted.', CAST(N'2023-06-29T11:05:15.617' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (40, 3, 6, N'Voucher with code COZA2pweJde9 deleted.', CAST(N'2023-06-29T11:05:15.617' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (41, 3, 6, N'Voucher with code COZA2V4BWN3E deleted.', CAST(N'2023-06-29T11:05:15.617' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (42, 3, 6, N'Voucher with code COZA51lvn4NU deleted.', CAST(N'2023-06-29T11:05:15.617' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (43, 3, 6, N'Voucher with code COZA5x3wssMd deleted.', CAST(N'2023-06-29T11:05:15.617' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (44, 3, 6, N'Voucher with code COZA7Hn1RRDg deleted.', CAST(N'2023-06-29T11:05:15.620' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (45, 3, 6, N'Voucher with code COZA8SPiA4XH deleted.', CAST(N'2023-06-29T11:05:15.620' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (46, 3, 6, N'Voucher with code COZA961VoyMx deleted.', CAST(N'2023-06-29T11:05:15.620' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (47, 3, 6, N'Voucher with code COZAb8cQoPZM deleted.', CAST(N'2023-06-29T11:05:15.620' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (48, 3, 6, N'Voucher with code COZAbDGzJMB8 deleted.', CAST(N'2023-06-29T11:05:15.620' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (49, 3, 6, N'Voucher with code COZAbrluAxal deleted.', CAST(N'2023-06-29T11:05:15.620' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (50, 3, 6, N'Voucher with code COZACB78AkjT deleted.', CAST(N'2023-06-29T11:05:15.620' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (51, 3, 6, N'Voucher with code COZAd19o8e1E deleted.', CAST(N'2023-06-29T11:05:15.620' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (52, 3, 6, N'Voucher with code COZAeF0xnaBG deleted.', CAST(N'2023-06-29T11:05:15.620' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (53, 3, 6, N'Voucher with code COZAEuHRz9LQ deleted.', CAST(N'2023-06-29T11:05:15.620' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (54, 3, 6, N'Voucher with code COZAgTGN8cDr deleted.', CAST(N'2023-06-29T11:05:15.623' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (55, 3, 6, N'Voucher with code COZAH5hLZQHV deleted.', CAST(N'2023-06-29T11:05:15.623' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (56, 3, 6, N'Voucher with code COZAhHE0IuJR deleted.', CAST(N'2023-06-29T11:05:15.623' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (57, 3, 6, N'Voucher with code COZAiiDnScAU deleted.', CAST(N'2023-06-29T11:05:15.623' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (58, 3, 6, N'Voucher with code COZAl4O32lFV deleted.', CAST(N'2023-06-29T11:05:15.623' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (59, 3, 6, N'Voucher with code COZAlr89032 deleted.', CAST(N'2023-06-29T11:05:15.627' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (60, 3, 6, N'Voucher with code COZAlr89033 deleted.', CAST(N'2023-06-29T11:05:15.627' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (61, 3, 6, N'Voucher with code COZAmjFFzhsj deleted.', CAST(N'2023-06-29T11:05:15.627' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (62, 3, 6, N'Voucher with code COZAmN7F4RWQ deleted.', CAST(N'2023-06-29T11:05:15.627' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (63, 3, 6, N'Voucher with code COZApY7m7AmR deleted.', CAST(N'2023-06-29T11:05:15.627' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (64, 3, 6, N'Voucher with code COZAqDR7C66D deleted.', CAST(N'2023-06-29T11:05:15.630' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (65, 3, 6, N'Voucher with code COZAUE2o8XFD deleted.', CAST(N'2023-06-29T11:05:15.630' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (66, 1, 6, N'Voucher with code COZALN7vYhH2 inserted.', CAST(N'2023-06-29T11:06:31.777' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (67, 1, 6, N'Voucher with code COZAf49sVncX inserted.', CAST(N'2023-06-29T11:06:31.777' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (68, 1, 6, N'Voucher with code COZAL8yITxFq inserted.', CAST(N'2023-06-29T11:06:31.777' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (69, 1, 6, N'Voucher with code COZAGzmkiSph inserted.', CAST(N'2023-06-29T11:06:31.777' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (70, 1, 6, N'Voucher with code COZAZq2vbrrh inserted.', CAST(N'2023-06-29T11:06:31.777' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (71, 1, 6, N'Voucher with code COZAl9mGC2Ve inserted.', CAST(N'2023-06-29T11:06:31.777' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (72, 1, 6, N'Voucher with code COZArM6SBY1s inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (73, 1, 6, N'Voucher with code COZAG9cE8eph inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (74, 1, 6, N'Voucher with code COZAbGBUGtu2 inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (75, 1, 6, N'Voucher with code COZArJdtANmC inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (76, 1, 6, N'Voucher with code COZAdt37OU25 inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (77, 1, 6, N'Voucher with code COZABF5f65LB inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (78, 1, 6, N'Voucher with code COZAcVJa4yuM inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (79, 1, 6, N'Voucher with code COZAFwwfjvES inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (80, 1, 6, N'Voucher with code COZAuTgeT1kO inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (81, 1, 6, N'Voucher with code COZAHoSERTM4 inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (82, 1, 6, N'Voucher with code COZALsrQUoRH inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (83, 1, 6, N'Voucher with code COZAglowhFba inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (84, 1, 6, N'Voucher with code COZAn2FPd56i inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (85, 1, 6, N'Voucher with code COZAF3Wduk8k inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (86, 1, 6, N'Voucher with code COZAmvxOVaFr inserted.', CAST(N'2023-06-29T11:06:31.780' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (87, 1, 6, N'Voucher with code COZAUORaI9oG inserted.', CAST(N'2023-06-29T11:45:09.527' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (88, 1, 6, N'Voucher with code COZABXGsXrdx inserted.', CAST(N'2023-06-29T11:49:48.973' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (89, 1, 6, N'Voucher with code COZAeONFO19Q inserted.', CAST(N'2023-06-29T11:49:48.973' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (90, 1, 6, N'Voucher with code COZAeokbbIKs inserted.', CAST(N'2023-06-29T11:49:48.977' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (91, 1, 6, N'Voucher with code COZAdZBEQNzk inserted.', CAST(N'2023-06-29T11:49:48.977' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (92, 1, 6, N'Voucher with code COZAq4ZKA2Gz inserted.', CAST(N'2023-06-29T11:49:48.977' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (93, 1, 6, N'Voucher with code COZA10knpHSJ inserted.', CAST(N'2023-06-29T11:49:48.977' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (94, 1, 6, N'Voucher with code COZAvPdhmmcz inserted.', CAST(N'2023-06-29T11:49:48.977' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (95, 1, 6, N'Voucher with code COZAuhaF8Krx inserted.', CAST(N'2023-06-29T11:49:48.977' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (96, 1, 6, N'Voucher with code COZA9yxbHHUb inserted.', CAST(N'2023-06-29T11:49:48.977' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (97, 1, 6, N'Voucher with code COZALrUVBqC7 inserted.', CAST(N'2023-06-29T11:49:48.977' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (98, 1, 6, N'Voucher with code COZAUKdxuy4v inserted.', CAST(N'2023-06-29T11:49:48.980' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (99, 2, 7, N'Feedback with id 21 updated. Status changed from "1" to "0"', CAST(N'2023-06-29T12:00:10.833' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (100, 2, 7, N'Feedback with id 24 updated. Status changed from "1" to "0"', CAST(N'2023-06-29T12:00:15.823' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (101, 1, 4, N'Product with id 94 inserted.', CAST(N'2023-06-29T12:10:26.350' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (102, 2, 3, N'Order with id 42 updated. orderStatus_id changed from "1" to "3"', CAST(N'2023-06-29T12:20:22.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (103, 1, 3, N'Order with id 45 inserted.', CAST(N'2023-07-06T21:50:04.260' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (104, 2, 3, N'Order with id 45 updated. orderStatus_id changed from "" to "1"', CAST(N'2023-07-06T21:50:23.417' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (105, 2, 3, N'Order with id 45 updated. orderStatus_id changed from "1" to "3"', CAST(N'2023-07-06T21:51:47.040' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (106, 2, 3, N'Order with id 42 updated. orderStatus_id changed from "3" to "1"', CAST(N'2023-07-19T21:21:00.790' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (107, 2, 3, N'Order with id 42 updated. orderStatus_id changed from "1" to "2"', CAST(N'2023-07-19T21:21:09.437' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (108, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "3"', CAST(N'2023-07-21T20:51:05.393' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (109, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "1"', CAST(N'2023-07-21T20:51:21.777' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (110, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "2"', CAST(N'2023-07-21T20:53:08.967' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (111, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "2" to "3"', CAST(N'2023-07-21T20:53:19.713' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (112, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "5"', CAST(N'2023-07-21T20:53:36.743' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (113, 3, 4, N'Product with id 92 deleted.', CAST(N'2023-07-21T21:26:33.010' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (114, 2, 4, N'Product with id 94 updated. Product_name changed from "Timeless Elegance" to "Timeless Elegance Gucci"', CAST(N'2023-07-21T21:28:19.463' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (115, 2, 4, N'Product with id 94 updated. Category_id changed from "mcoat" to "mcoat"', CAST(N'2023-07-21T21:28:19.463' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (116, 2, 4, N'Product with id 94 updated. Describe changed.', CAST(N'2023-07-21T21:28:19.463' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (117, 2, 4, N'Product with id 94 updated. Entry_Price changed from "120.50" to "100.25"', CAST(N'2023-07-21T21:28:19.463' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (118, 2, 4, N'Product with id 94 updated. Price changed from "240.45" to "240.45"', CAST(N'2023-07-21T21:28:19.463' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (119, 2, 4, N'Product with id 94 updated. Discount changed from "10.00" to "10.00"', CAST(N'2023-07-21T21:28:19.467' AS DateTime))
GO
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (120, 2, 4, N'Product with id 94 updated. start_discount changed from "Jun 13 2023 12:00AM" to "Jul 20 2023 12:00AM"', CAST(N'2023-07-21T21:28:19.467' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (121, 2, 4, N'Product with id 94 updated. end_discount changed from "Jun 30 2023 12:00AM" to "Jul 22 2023 12:00AM"', CAST(N'2023-07-21T21:28:19.467' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (122, 1, 4, N'Product with id 95 inserted.', CAST(N'2023-07-21T21:30:48.270' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (123, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "5" to "1"', CAST(N'2023-07-21T21:32:24.320' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (124, 2, 5, N'User with id 5 updated. Email changed from "khoinh161686@fpt.edu.vn" to "khois2p@gmail.com"', CAST(N'2023-07-21T23:31:18.867' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (125, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "2"', CAST(N'2023-07-22T16:48:14.223' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (126, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "2" to "1"', CAST(N'2023-07-22T16:48:33.837' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (127, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "3"', CAST(N'2023-07-22T16:48:41.057' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (128, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "5"', CAST(N'2023-07-22T16:48:46.990' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (129, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "5" to "4"', CAST(N'2023-07-22T16:48:55.290' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (130, 2, 4, N'size_color_product with id 27 updated. quantity changed from "3" to "0"', CAST(N'2023-07-22T16:48:55.300' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (131, 2, 4, N'size_color_product with id 46 updated. quantity changed from "12" to "9"', CAST(N'2023-07-22T16:48:55.303' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (132, 2, 4, N'size_color_product with id 54 updated. quantity changed from "10" to "9"', CAST(N'2023-07-22T16:48:55.307' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (133, 2, 4, N'size_color_product with id 69 updated. quantity changed from "11" to "6"', CAST(N'2023-07-22T16:48:55.307' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (134, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "2"', CAST(N'2023-07-22T16:52:28.217' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (135, 2, 4, N'size_color_product with id 27 updated. quantity changed from "0" to "3"', CAST(N'2023-07-22T16:52:28.240' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (136, 2, 4, N'size_color_product with id 46 updated. quantity changed from "9" to "12"', CAST(N'2023-07-22T16:52:28.240' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (137, 2, 4, N'size_color_product with id 54 updated. quantity changed from "9" to "10"', CAST(N'2023-07-22T16:52:28.243' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (138, 2, 4, N'size_color_product with id 69 updated. quantity changed from "6" to "11"', CAST(N'2023-07-22T16:52:28.243' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (139, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "2" to "1"', CAST(N'2023-07-22T17:03:16.010' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (140, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "2"', CAST(N'2023-07-22T17:03:22.330' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (141, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "2" to "3"', CAST(N'2023-07-22T17:03:25.887' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (142, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T17:03:38.523' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (143, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "5"', CAST(N'2023-07-22T17:03:44.213' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (144, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "5" to "4"', CAST(N'2023-07-22T17:04:33.963' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (145, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "3"', CAST(N'2023-07-22T17:04:46.293' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (146, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "1"', CAST(N'2023-07-22T17:05:17.960' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (147, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "3"', CAST(N'2023-07-22T17:05:25.330' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (148, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "1"', CAST(N'2023-07-22T17:05:49.770' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (149, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "3"', CAST(N'2023-07-22T17:05:52.800' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (150, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "1"', CAST(N'2023-07-22T17:06:25.620' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (151, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "3"', CAST(N'2023-07-22T17:06:29.800' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (152, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T17:43:36.457' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (153, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "3"', CAST(N'2023-07-22T17:44:24.410' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (154, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T17:44:27.967' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (155, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "5"', CAST(N'2023-07-22T17:44:29.830' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (156, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "5" to "3"', CAST(N'2023-07-22T17:45:30.983' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (157, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T17:45:32.890' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (158, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "5"', CAST(N'2023-07-22T17:45:34.230' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (159, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "5" to "3"', CAST(N'2023-07-22T17:45:48.090' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (160, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T17:45:49.700' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (161, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "5"', CAST(N'2023-07-22T17:45:50.817' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (162, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "5" to "1"', CAST(N'2023-07-22T17:46:03.930' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (163, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "3"', CAST(N'2023-07-22T17:46:41.433' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (164, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "2"', CAST(N'2023-07-22T17:46:42.187' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (165, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "2" to "3"', CAST(N'2023-07-22T17:48:50.200' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (166, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T17:49:41.173' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (167, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "5"', CAST(N'2023-07-22T17:49:42.390' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (168, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "5" to "1"', CAST(N'2023-07-22T17:49:43.933' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (169, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "2"', CAST(N'2023-07-22T17:57:53.147' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (170, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "2" to "1"', CAST(N'2023-07-22T17:58:27.573' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (171, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "2"', CAST(N'2023-07-22T18:00:46.773' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (172, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "2" to "3"', CAST(N'2023-07-22T18:01:11.097' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (173, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T18:04:15.250' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (174, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "3"', CAST(N'2023-07-22T18:05:07.953' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (175, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T20:56:44.533' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (176, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "5"', CAST(N'2023-07-22T20:56:48.653' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (177, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "5" to "1"', CAST(N'2023-07-22T20:56:54.510' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (178, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "1" to "3"', CAST(N'2023-07-22T20:57:55.747' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (179, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T21:19:08.200' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (180, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "3"', CAST(N'2023-07-22T21:23:00.447' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (181, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T21:23:35.100' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (182, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "3"', CAST(N'2023-07-22T21:23:53.840' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (183, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T21:24:20.167' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (184, 2, 4, N'size_color_product with id 27 updated. quantity changed from "3" to "0"', CAST(N'2023-07-22T21:24:20.217' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (185, 2, 4, N'size_color_product with id 46 updated. quantity changed from "12" to "9"', CAST(N'2023-07-22T21:24:20.217' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (186, 2, 4, N'size_color_product with id 54 updated. quantity changed from "10" to "9"', CAST(N'2023-07-22T21:24:20.220' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (187, 2, 4, N'size_color_product with id 69 updated. quantity changed from "11" to "6"', CAST(N'2023-07-22T21:24:20.220' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (188, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "5"', CAST(N'2023-07-22T21:24:26.940' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (189, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "5" to "2"', CAST(N'2023-07-22T21:24:37.743' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (190, 2, 4, N'size_color_product with id 27 updated. quantity changed from "0" to "3"', CAST(N'2023-07-22T21:24:37.757' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (191, 2, 4, N'size_color_product with id 46 updated. quantity changed from "9" to "12"', CAST(N'2023-07-22T21:24:37.757' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (192, 2, 4, N'size_color_product with id 54 updated. quantity changed from "9" to "10"', CAST(N'2023-07-22T21:24:37.757' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (193, 2, 4, N'size_color_product with id 69 updated. quantity changed from "6" to "11"', CAST(N'2023-07-22T21:24:37.760' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (194, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "2" to "3"', CAST(N'2023-07-22T21:24:51.950' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (195, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "3" to "4"', CAST(N'2023-07-22T21:26:27.017' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (196, 2, 4, N'size_color_product with id 27 updated. quantity changed from "3" to "0"', CAST(N'2023-07-22T21:26:27.040' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (197, 2, 4, N'size_color_product with id 46 updated. quantity changed from "12" to "9"', CAST(N'2023-07-22T21:26:27.040' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (198, 2, 4, N'size_color_product with id 54 updated. quantity changed from "10" to "9"', CAST(N'2023-07-22T21:26:27.040' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (199, 2, 4, N'size_color_product with id 69 updated. quantity changed from "11" to "6"', CAST(N'2023-07-22T21:26:27.040' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (200, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "4" to "5"', CAST(N'2023-07-22T21:26:32.763' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (201, 2, 3, N'Order with id 32 updated. orderStatus_id changed from "5" to "1"', CAST(N'2023-07-22T21:26:53.110' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (202, 1, 3, N'Order with id 210 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (203, 1, 3, N'Order with id 211 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (204, 1, 3, N'Order with id 212 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (205, 1, 3, N'Order with id 213 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (206, 1, 3, N'Order with id 214 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (207, 1, 3, N'Order with id 215 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (208, 1, 3, N'Order with id 216 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (209, 1, 3, N'Order with id 217 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (210, 1, 3, N'Order with id 218 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (211, 1, 3, N'Order with id 219 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (212, 1, 3, N'Order with id 220 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (213, 1, 3, N'Order with id 221 inserted.', CAST(N'2023-07-22T21:28:07.030' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (214, 1, 3, N'Order with id 222 inserted.', CAST(N'2023-07-22T21:28:07.033' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (215, 1, 3, N'Order with id 223 inserted.', CAST(N'2023-07-22T21:28:07.033' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (216, 1, 3, N'Order with id 224 inserted.', CAST(N'2023-07-22T21:28:07.033' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (217, 1, 3, N'Order with id 225 inserted.', CAST(N'2023-07-22T21:28:07.033' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (218, 1, 3, N'Order with id 226 inserted.', CAST(N'2023-07-22T21:28:07.033' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (219, 1, 3, N'Order with id 227 inserted.', CAST(N'2023-07-22T21:28:07.033' AS DateTime))
GO
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (220, 1, 3, N'Order with id 228 inserted.', CAST(N'2023-07-22T21:28:07.033' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (221, 3, 1, N'Blog with id 1 deleted.', CAST(N'2023-07-22T21:30:17.230' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (222, 3, 1, N'Blog with id 2 deleted.', CAST(N'2023-07-22T21:30:17.233' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (223, 3, 1, N'Blog with id 3 deleted.', CAST(N'2023-07-22T21:30:17.237' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (224, 3, 1, N'Blog with id 4 deleted.', CAST(N'2023-07-22T21:30:17.240' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (225, 3, 1, N'Blog with id 5 deleted.', CAST(N'2023-07-22T21:30:17.243' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (226, 3, 1, N'Blog with id 6 deleted.', CAST(N'2023-07-22T21:30:17.243' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (227, 3, 1, N'Blog with id 7 deleted.', CAST(N'2023-07-22T21:30:17.247' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (228, 3, 1, N'Blog with id 8 deleted.', CAST(N'2023-07-22T21:30:17.250' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (229, 3, 1, N'Blog with id 9 deleted.', CAST(N'2023-07-22T21:30:17.250' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (230, 3, 1, N'Blog with id 10 deleted.', CAST(N'2023-07-22T21:30:17.253' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (231, 3, 1, N'Blog with id 11 deleted.', CAST(N'2023-07-22T21:30:17.257' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (232, 3, 1, N'Blog with id 12 deleted.', CAST(N'2023-07-22T21:30:17.260' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (233, 3, 1, N'Blog with id 13 deleted.', CAST(N'2023-07-22T21:30:17.263' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (234, 3, 1, N'Blog with id 14 deleted.', CAST(N'2023-07-22T21:30:17.263' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (235, 3, 1, N'Blog with id 15 deleted.', CAST(N'2023-07-22T21:30:17.267' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (236, 3, 1, N'Blog with id 16 deleted.', CAST(N'2023-07-22T21:30:17.267' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (237, 3, 1, N'Blog with id 17 deleted.', CAST(N'2023-07-22T21:30:17.270' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (238, 3, 1, N'Blog with id 18 deleted.', CAST(N'2023-07-22T21:30:17.270' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (239, 3, 1, N'Blog with id 19 deleted.', CAST(N'2023-07-22T21:30:17.273' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (240, 3, 1, N'Blog with id 20 deleted.', CAST(N'2023-07-22T21:30:17.277' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (241, 3, 1, N'Blog with id 21 deleted.', CAST(N'2023-07-22T21:30:17.277' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (242, 3, 1, N'Blog with id 22 deleted.', CAST(N'2023-07-22T21:30:17.280' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (243, 3, 1, N'Blog with id 23 deleted.', CAST(N'2023-07-22T21:30:17.280' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (244, 3, 1, N'Blog with id 24 deleted.', CAST(N'2023-07-22T21:30:17.283' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (245, 1, 1, N'Blog with id 1 inserted.', CAST(N'2023-07-22T21:30:26.183' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (246, 1, 1, N'Blog with id 2 inserted.', CAST(N'2023-07-22T21:30:26.183' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (247, 1, 1, N'Blog with id 3 inserted.', CAST(N'2023-07-22T21:30:26.183' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (248, 1, 1, N'Blog with id 4 inserted.', CAST(N'2023-07-22T21:30:26.183' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (249, 1, 1, N'Blog with id 5 inserted.', CAST(N'2023-07-22T21:30:26.187' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (250, 1, 1, N'Blog with id 6 inserted.', CAST(N'2023-07-22T21:30:26.187' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (251, 1, 1, N'Blog with id 7 inserted.', CAST(N'2023-07-22T21:30:26.187' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (252, 1, 1, N'Blog with id 8 inserted.', CAST(N'2023-07-22T21:30:26.187' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (253, 1, 1, N'Blog with id 9 inserted.', CAST(N'2023-07-22T21:30:26.187' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (254, 1, 1, N'Blog with id 10 inserted.', CAST(N'2023-07-22T21:30:26.187' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (255, 1, 1, N'Blog with id 11 inserted.', CAST(N'2023-07-22T21:30:26.187' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (256, 1, 1, N'Blog with id 12 inserted.', CAST(N'2023-07-22T21:30:26.187' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (257, 1, 1, N'Blog with id 13 inserted.', CAST(N'2023-07-22T21:30:26.190' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (258, 1, 1, N'Blog with id 14 inserted.', CAST(N'2023-07-22T21:30:26.190' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (259, 1, 1, N'Blog with id 15 inserted.', CAST(N'2023-07-22T21:30:26.190' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (260, 1, 1, N'Blog with id 16 inserted.', CAST(N'2023-07-22T21:30:26.190' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (261, 1, 1, N'Blog with id 17 inserted.', CAST(N'2023-07-22T21:30:26.190' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (262, 1, 1, N'Blog with id 18 inserted.', CAST(N'2023-07-22T21:30:26.190' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (263, 1, 1, N'Blog with id 19 inserted.', CAST(N'2023-07-22T21:30:26.190' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (264, 1, 1, N'Blog with id 20 inserted.', CAST(N'2023-07-22T21:30:26.190' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (265, 3, 4, N'Product with id 95 deleted.', CAST(N'2023-07-22T21:45:09.777' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (266, 3, 4, N'Product with id 94 deleted.', CAST(N'2023-07-22T21:45:22.953' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (267, 3, 4, N'Product with id 18 deleted.', CAST(N'2023-07-22T21:50:45.830' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (268, 3, 3, N'Order with id 210 deleted.', CAST(N'2023-07-22T21:56:47.873' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (269, 3, 3, N'Order with id 211 deleted.', CAST(N'2023-07-22T21:56:47.877' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (270, 3, 3, N'Order with id 212 deleted.', CAST(N'2023-07-22T21:56:47.877' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (271, 3, 3, N'Order with id 213 deleted.', CAST(N'2023-07-22T21:56:47.877' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (272, 3, 3, N'Order with id 214 deleted.', CAST(N'2023-07-22T21:56:47.877' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (273, 3, 3, N'Order with id 215 deleted.', CAST(N'2023-07-22T21:56:47.880' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (274, 3, 3, N'Order with id 216 deleted.', CAST(N'2023-07-22T21:56:47.880' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (275, 3, 3, N'Order with id 217 deleted.', CAST(N'2023-07-22T21:56:47.880' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (276, 3, 3, N'Order with id 218 deleted.', CAST(N'2023-07-22T21:56:47.880' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (277, 3, 3, N'Order with id 219 deleted.', CAST(N'2023-07-22T21:56:47.880' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (278, 3, 3, N'Order with id 220 deleted.', CAST(N'2023-07-22T21:56:47.880' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (279, 3, 3, N'Order with id 221 deleted.', CAST(N'2023-07-22T21:56:47.880' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (280, 3, 3, N'Order with id 222 deleted.', CAST(N'2023-07-22T21:56:47.880' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (281, 3, 3, N'Order with id 223 deleted.', CAST(N'2023-07-22T21:56:47.880' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (282, 3, 3, N'Order with id 224 deleted.', CAST(N'2023-07-22T21:56:47.883' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (283, 3, 3, N'Order with id 225 deleted.', CAST(N'2023-07-22T21:56:47.883' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (284, 3, 3, N'Order with id 226 deleted.', CAST(N'2023-07-22T21:56:47.883' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (285, 3, 3, N'Order with id 227 deleted.', CAST(N'2023-07-22T21:56:47.887' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (286, 3, 3, N'Order with id 228 deleted.', CAST(N'2023-07-22T21:56:47.887' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (287, 1, 3, N'Order with id 210 inserted.', CAST(N'2023-07-22T21:57:14.923' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (288, 1, 3, N'Order with id 211 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (289, 1, 3, N'Order with id 212 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (290, 1, 3, N'Order with id 213 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (291, 1, 3, N'Order with id 214 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (292, 1, 3, N'Order with id 215 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (293, 1, 3, N'Order with id 216 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (294, 1, 3, N'Order with id 217 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (295, 1, 3, N'Order with id 218 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (296, 1, 3, N'Order with id 219 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (297, 1, 3, N'Order with id 220 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (298, 1, 3, N'Order with id 221 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (299, 1, 3, N'Order with id 222 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (300, 1, 3, N'Order with id 223 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (301, 1, 3, N'Order with id 224 inserted.', CAST(N'2023-07-22T21:57:14.927' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (302, 1, 3, N'Order with id 225 inserted.', CAST(N'2023-07-22T21:57:14.930' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (303, 1, 3, N'Order with id 226 inserted.', CAST(N'2023-07-22T21:57:14.930' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (304, 1, 3, N'Order with id 227 inserted.', CAST(N'2023-07-22T21:57:14.930' AS DateTime))
INSERT [dbo].[History_of_change] ([id], [action_id], [obj_id], [detail], [time]) VALUES (305, 1, 3, N'Order with id 228 inserted.', CAST(N'2023-07-22T21:57:14.930' AS DateTime))
SET IDENTITY_INSERT [dbo].[History_of_change] OFF
GO
SET IDENTITY_INSERT [dbo].[Object] ON 

INSERT [dbo].[Object] ([id], [name]) VALUES (1, N'Blog')
INSERT [dbo].[Object] ([id], [name]) VALUES (2, N'Color')
INSERT [dbo].[Object] ([id], [name]) VALUES (3, N'Order')
INSERT [dbo].[Object] ([id], [name]) VALUES (4, N'Product')
INSERT [dbo].[Object] ([id], [name]) VALUES (5, N'User')
INSERT [dbo].[Object] ([id], [name]) VALUES (6, N'Voucher')
INSERT [dbo].[Object] ([id], [name]) VALUES (7, N'Feedback')
SET IDENTITY_INSERT [dbo].[Object] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (32, CAST(722.57 AS Decimal(10, 2)), 6, CAST(N'2023-06-15T11:10:24.453' AS DateTime), 1, N'Zip/Postal: 0983432, Adam 2987b, Missuiri street, Tomokai building, room 203, Haiwa, New York, US, Coordinate: 21° 0'' 50''''N 105° 31'' 32''''E', N'0904431642', N'Tobi Sharan', 474.2400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (33, CAST(51.00 AS Decimal(10, 2)), 6, CAST(N'2023-06-15T11:10:24.453' AS DateTime), 4, N'Zip/Postal: 0983432, Adam 2987b, Missuiri street, Tomokai building, room 203, Haiwa, New York, US, Coordinate: 21° 0'' 50''''N 105° 31'' 32''''E', N'0377255644', N'Alex roger', 36.8400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (34, CAST(104.25 AS Decimal(10, 2)), 6, CAST(N'2023-06-15T11:10:24.453' AS DateTime), 3, N'Zip/Postal: 0983432, Adam 2987b, Missuiri street, Tomokai building, room 203, Haiwa, New York, US, Coordinate: 21° 0'' 50''''N 105° 31'' 32''''E', N'0878532644', N'Kumuki Kushiro', 36.9000)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (35, CAST(1211.96 AS Decimal(10, 2)), 6, CAST(N'2023-06-15T11:10:24.453' AS DateTime), 2, N'Zip/Postal: 0983432, Adam 2987b, Missuiri street, Tomokai building, room 203, Haiwa, New York, US, Coordinate: 21° 0'' 50''''N 105° 31'' 32''''E', N'0203567446', N'Roger Alex', 600.0000)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (36, CAST(744.74 AS Decimal(10, 2)), 6, CAST(N'2023-06-15T11:45:00.517' AS DateTime), 2, N'Bac Giang', N'0878532644', N'Than Quang phuong', 482.7400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (37, CAST(709.43 AS Decimal(10, 2)), 6, CAST(N'2023-06-18T17:32:47.880' AS DateTime), 3, N'Bac Giang', N'0878532644', N'Than Quang phuong', 460.1400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (38, CAST(709.43 AS Decimal(10, 2)), 6, CAST(N'2023-06-18T17:34:59.697' AS DateTime), 1, N'Bac Giang', N'0878532644', N'Than Quang phuong', 460.1400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (39, CAST(70.62 AS Decimal(10, 2)), 6, CAST(N'2023-06-18T19:06:00.230' AS DateTime), 3, N'Bac Giang', N'0878532644', N'Than Quang phuong', 45.2000)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (41, CAST(709.43 AS Decimal(10, 2)), 6, CAST(N'2023-06-18T19:10:12.763' AS DateTime), 3, N'Bac Giang', N'0878532644', N'Than Quang phuong', 460.1400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (42, CAST(51.00 AS Decimal(10, 2)), 6, CAST(N'2023-05-15T11:10:24.453' AS DateTime), 2, N'Bac Giang', N'0984068859', N'Lai Ngoc Lam', 36.8400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (43, CAST(722.57 AS Decimal(10, 2)), 8, CAST(N'2023-05-15T11:10:24.453' AS DateTime), 1, N'Dai Hoc FPT, Thach Hoa, Thach That, Ha Noi', N'0984068859', N'Nguyen Huy Khoi', 474.2400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (44, CAST(1211.96 AS Decimal(10, 2)), 9, CAST(N'2023-05-15T11:10:24.453' AS DateTime), 1, N'287 Hoang Quoc Viet, Cau Giay, Ha Noi', N'0979708189', N'Lai Ngoc Hung', 600.0000)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (45, CAST(722.57 AS Decimal(10, 2)), 9, CAST(N'2023-07-06T00:00:00.000' AS DateTime), 3, N'287 Hoang Quoc Viet, Cau Giay, Ha Noi', N'0979708189', N'Lai Ngoc Hung', 474.2400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (210, CAST(224.50 AS Decimal(10, 2)), 7, CAST(N'2022-01-22T14:18:16.740' AS DateTime), 1, N'4008 Kshlerin Landing, Apt. 823, 17754-0698, East Magdalenville, Minnesota, United States', N'0904431675', N'Salvador Richmond
', 184.2000)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (211, CAST(22.95 AS Decimal(10, 2)), 7, CAST(N'2022-02-22T14:19:00.877' AS DateTime), 3, N'6848 Delmer View, Apt. 039, 57984-0593, Beerberg, Maryland, United States', N'0943243675', N'Elma Shields
', 18.4200)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (212, CAST(22.95 AS Decimal(10, 2)), 7, CAST(N'2022-03-22T14:41:23.650' AS DateTime), 1, N'Zip/Postal: 21000, 295b, no10 latte, Viet Yen, Bac Giang, Vietnam', N'0954331675', N'Alex Roger', 18.4200)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (213, CAST(22.95 AS Decimal(10, 2)), 7, CAST(N'2022-04-22T14:41:43.097' AS DateTime), 3, N'8719 Otho Shoals, Suite 942, 11457, Considineport, Ohio, United States', N'0905432437', N'Alex Roger', 18.4200)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (214, CAST(201.55 AS Decimal(10, 2)), 7, CAST(N'2022-05-22T14:42:52.047' AS DateTime), 3, N'53067 Buckridge Springs, Apt. 449, 16129-5604, Harveychester, Idaho, United States', N'0987664345', N'Elise Brandt
', 165.7800)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (215, CAST(35.31 AS Decimal(10, 2)), 7, CAST(N'2022-06-22T14:50:40.757' AS DateTime), 5, N'488 Willy Point, Apt. 932, 29756-1236, South Rogers, North Dakota, United States', N'0432654267', N'Neil Phillips
', 22.6000)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (216, CAST(35.31 AS Decimal(10, 2)), 7, CAST(N'2022-07-22T14:51:39.440' AS DateTime), 3, N'2072 Kennedy Inlet, Apt. 513, 99747-4039, West Quentin, New York, United States', N'0543276543', N'Brenton Yoder
', 22.6000)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (217, CAST(22.95 AS Decimal(10, 2)), 7, CAST(N'2022-08-22T15:10:16.920' AS DateTime), 5, N'014 Satterfield Wall, Suite 530, 44748, East Keeganport, Hawaii, United States', N'0543265423', N'Jewell Zavala
', 18.4200)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (218, CAST(22.95 AS Decimal(10, 2)), 7, CAST(N'2022-09-22T15:21:24.990' AS DateTime), 3, N'Zip/Postal: 21000, 295b, no10 latte, Viet Yen, Bac Giang, Vietnam', N'0543254324', N'Cary Rojas
', 18.4200)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (219, CAST(45.90 AS Decimal(10, 2)), 7, CAST(N'2022-10-22T15:23:32.680' AS DateTime), 3, N'49531 Yoshiko Locks, Apt. 257, 50570-4931, West Princessberg, Utah, United States', N'0543254365', N'Lai Ngoc Lam', 36.8400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (220, CAST(45.90 AS Decimal(10, 2)), 7, CAST(N'2022-11-22T15:25:52.093' AS DateTime), 4, N'556 Dibbert Inlet, Suite 405, 04542-3525, Kiehnton, Kansas, United States', N'0687665454', N'Carey Gallegos
', 36.8400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (221, CAST(45.90 AS Decimal(10, 2)), 7, CAST(N'2022-12-22T15:28:16.863' AS DateTime), 3, N'8999 Grady Parkway, Suite 788, 92895-3584, Greenberg, Wyoming, United States', N'0543688987', N'Janine Mckee
', 36.8400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (222, CAST(45.90 AS Decimal(10, 2)), 7, CAST(N'2023-01-22T15:29:27.903' AS DateTime), 1, N'7396 Huel Rapids, Apt. 956, 42823, East Cecile, Hawaii, United States', N'0543265454', N'Yolanda George
', 36.8400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (223, CAST(45.90 AS Decimal(10, 2)), 7, CAST(N'2023-02-22T15:31:34.150' AS DateTime), 1, N'338 Loma Plain, Suite 913, 21357, Denesikfurt, Arkansas, United States', N'0543680988', N'Ida Boone
', 36.8400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (224, CAST(22.95 AS Decimal(10, 2)), 7, CAST(N'2023-03-22T15:39:19.280' AS DateTime), 1, N'27518 Koch Plains, Suite 778, 32034-8343, Bessiestad, New York, United States', N'0676521433', N'Jacinto Knox
', 18.4200)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (225, CAST(45.90 AS Decimal(10, 2)), 7, CAST(N'2023-04-22T15:40:14.237' AS DateTime), 1, N'733 Kurt Forge, Suite 311, 26397-9616, West Kylee, Oregon, United States', N'0432686655', N'Tammy Pham
', 36.8400)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (226, CAST(22.95 AS Decimal(10, 2)), 7, CAST(N'2023-05-22T15:54:42.097' AS DateTime), 1, N'7780 Maggio Plains, Suite 120, 73769-6941, New Freddiemouth, South Dakota, United States', N'0654321454', N'Alex Jumin', 18.4200)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (227, CAST(94.20 AS Decimal(10, 2)), 7, CAST(N'2023-06-22T20:48:23.587' AS DateTime), 1, N'85891 Alanna Wells, Suite 885, 59892-9631, West Gabe, Wisconsin, United States', N'0543654765', N'Zanao Kirana', 68.3200)
INSERT [dbo].[Order] ([Order_id], [Total], [User_id], [orderTime], [orderStatus_id], [address], [phone], [customerFullName], [total_purchase_cost]) VALUES (228, CAST(18.96 AS Decimal(10, 2)), 7, CAST(N'2023-07-22T21:10:44.980' AS DateTime), 1, N'949 Rolfson Spring, Suite 494, 83193-2780, West Nathen, Nevada, United States', N'0904431642', N'Than Quang phuong', 5.3000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[Order_Status] ([orderStatus_id], [orderStatus_name]) VALUES (1, N'successful')
INSERT [dbo].[Order_Status] ([orderStatus_id], [orderStatus_name]) VALUES (2, N'fail')
INSERT [dbo].[Order_Status] ([orderStatus_id], [orderStatus_name]) VALUES (3, N'pending')
INSERT [dbo].[Order_Status] ([orderStatus_id], [orderStatus_name]) VALUES (4, N'preparing order')
INSERT [dbo].[Order_Status] ([orderStatus_id], [orderStatus_name]) VALUES (5, N'shipping')
GO
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (32, 27, 3, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (32, 46, 3, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (32, 54, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (32, 69, 5, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (33, 28, 2, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (34, 29, 3, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (35, 44, 4, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (36, 46, 10, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (36, 64, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (36, 69, 5, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (37, 46, 9, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (37, 64, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (37, 69, 5, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (38, 46, 9, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (38, 64, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (38, 69, 5, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (39, 46, 2, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (41, 46, 9, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (41, 64, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (41, 69, 5, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (42, 28, 2, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (43, 27, 3, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (43, 46, 3, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (43, 54, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (43, 69, 5, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (44, 44, 4, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (45, 27, 3, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (45, 46, 3, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (45, 54, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (45, 69, 5, NULL, NULL)
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (210, 47, 10, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (211, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (212, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (213, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (214, 5, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (214, 47, 8, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (215, 67, 1, CAST(22.60 AS Decimal(10, 2)), CAST(35.31 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (216, 88, 1, CAST(22.60 AS Decimal(10, 2)), CAST(35.31 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (217, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (218, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (219, 5, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (219, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (220, 5, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (220, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (221, 26, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (221, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (222, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (222, 68, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (223, 26, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (223, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (224, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (225, 5, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (225, 68, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (226, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (227, 27, 1, CAST(49.90 AS Decimal(10, 2)), CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (227, 47, 1, CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Entry_Price], [Price]) VALUES (228, 53, 1, CAST(5.30 AS Decimal(10, 2)), CAST(18.96 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (1, N'Esprit Ruffle Shirt', N'wt-shirt', N'This women''s T-shirt features a relaxed fit and a soft, breathable fabric that ensures all-day comfort. With its stylish V-neck design and flattering silhouette, it''s perfect for casual outings or lounging at home.', CAST(7.24 AS Decimal(10, 2)), CAST(16.64 AS Decimal(10, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2023-05-22T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (2, N'Herschel supply', N'wshirt', N'This women''s shirt exudes effortless elegance with its flowing silhouette and delicate floral print. Made from lightweight fabric, it offers a breezy and comfortable fit, perfect for a chic daytime look or a casual evening out.', CAST(22.60 AS Decimal(10, 2)), CAST(35.31 AS Decimal(10, 2)), NULL, NULL, NULL, CAST(N'2023-05-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (3, N'Only Check Trouser', N'mshirt', N'Achieve a polished and sophisticated look with this men''s dress shirt. The tailored fit and fine cotton fabric offer both style and comfort, making it ideal for formal events or professional settings. Pair it with a suit and tie for a sharp and refined appearance.', CAST(18.42 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2023-05-20T00:00:00.000' AS DateTime), CAST(N'2023-06-09T00:00:00.000' AS DateTime), CAST(N'2023-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (4, N'Classic Trench Coat', N'wcoat', N'Stay stylish and cozy with this luxurious women''s coat. Crafted from a blend of wool and cashmere, it offers warmth and elegance in a tailored silhouette. Perfect for any occasion, this coat is a timeless addition to your wardrobe.', CAST(49.90 AS Decimal(10, 2)), CAST(75.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(N'2023-07-21T00:00:00.000' AS DateTime), CAST(N'2023-07-27T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (5, N'Front Pocket Jumper', N'wshirt', N'Embrace a modern and sophisticated style with this tailored women''s shirt. Its clean lines and crisp collar create a polished appearance, while the high-quality cotton fabric ensures all-day comfort. Pair it with tailored pants or a pencil skirt for a professional ensemble.', CAST(12.30 AS Decimal(10, 2)), CAST(34.75 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(N'2023-05-22T00:00:00.000' AS DateTime), CAST(N'2023-05-23T00:00:00.000' AS DateTime), CAST(N'2023-05-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (6, N'Chanel Coat', N'mcoat', N'Elevate your style with this timeless men''s coat. Crafted from premium wool, it combines sophistication and warmth effortlessly. With its tailored fit and refined design, this coat is perfect for any occasion, making it a versatile addition to your wardrobe.', CAST(103.00 AS Decimal(10, 2)), CAST(250.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2023-09-09T00:00:00.000' AS DateTime), CAST(N'2023-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (7, N'Shirt in Stretch Cotton', N'wcoat', N'Elevate your wardrobe with this versatile women''s shirt. The classic button-down design and relaxed fit make it a timeless piece for both casual and formal occasions. The soft and breathable fabric drapes beautifully, providing a flattering and comfortable fit.', CAST(30.34 AS Decimal(10, 2)), CAST(52.66 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2023-05-22T00:00:00.000' AS DateTime), CAST(N'2023-05-29T00:00:00.000' AS DateTime), CAST(N'2023-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (8, N'Pieces Metallic Printed', N'wt-shirt', N'Indulge in ultimate comfort with this women''s T-shirt. Crafted from a lightweight and breathable fabric, it drapes beautifully and feels incredibly soft against your skin. The timeless design and understated elegance make it a wardrobe staple for any season.', CAST(5.30 AS Decimal(10, 2)), CAST(18.96 AS Decimal(10, 2)), NULL, NULL, NULL, CAST(N'2023-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (9, N'Gucci Coat', N'wcoat', N'Stand out in style with this Gucci women''s coat. Crafted with impeccable attention to detail, it showcases the brand''s signature luxury and sophistication. With its unique design and exquisite embellishments, this coat is a statement piece that effortlessly elevates any ensemble. Embrace the essence of Gucci''s iconic fashion with this stunning and fashionable coat.', CAST(150.00 AS Decimal(10, 2)), CAST(356.46 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(N'2023-05-22T00:00:00.000' AS DateTime), CAST(N'2023-07-12T00:00:00.000' AS DateTime), CAST(N'2023-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (10, N'Femme T-Shirt In Stripe', N'wt-shirt', N'Stand out from the crowd in this bold and vibrant women''s T-shirt. Its eye-catching print and relaxed fit make it a statement piece that effortlessly combines comfort and style. Whether you''re running errands or meeting friends for coffee, you''ll turn heads wherever you go.', CAST(9.80 AS Decimal(10, 2)), CAST(25.85 AS Decimal(10, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), CAST(N'2023-05-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (11, N'Herschel supply', N'mshirt', N'Elevate your off-duty style with this stylish men''s shirt. Its modern slim fit and contemporary patterns add a touch of personality to your casual look. Crafted from high-quality fabric, it ensures both comfort and durability for everyday wear.', CAST(30.20 AS Decimal(10, 2)), CAST(63.16 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), CAST(N'2023-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (12, N'Balenciaga Shirt 1', N'wshirt', N'Make a bold statement with this Balenciaga women''s shirt. Crafted with impeccable attention to detail, it showcases the brand''s iconic style and avant-garde aesthetic. The unique design and luxurious fabric create a modern and edgy look, perfect for fashion-forward women who want to stand out from the crowd. Embrace the cutting-edge fashion of Balenciaga with this statement-making women''s shirt.', CAST(263.50 AS Decimal(10, 2)), CAST(350.00 AS Decimal(10, 2)), NULL, NULL, NULL, CAST(N'2023-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (13, N'T-Shirt with Sleeve', N'wt-shirt', N'Embrace timeless simplicity with this women''s white T-shirt. Made from soft and breathable cotton, it offers a comfortable and versatile option for everyday wear. The classic crew neck and relaxed fit make it a wardrobe staple that pairs effortlessly with any outfit.', CAST(7.24 AS Decimal(10, 2)), CAST(18.49 AS Decimal(10, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2023-06-22T00:00:00.000' AS DateTime), CAST(N'2023-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (14, N'Pretty Little Thing', N'wt-shirt', N'TStep up your style game with this trendy and versatile crop top. Designed to hit just above the waistline, it showcases a modern and youthful look. Made from a comfortable and breathable fabric, it''s perfect for warm weather or a night out on the town. Pair it with high-waisted jeans or a skirt for a fashionable and confident ensemble that will turn heads wherever you go. Embrace the cropped trend and add a touch of chic to your wardrobe with this must-have crop top.', CAST(53.40 AS Decimal(10, 2)), CAST(128.47 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2023-06-27T00:00:00.000' AS DateTime), CAST(N'2023-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (15, N'Balenciaga Man Coat', N'ucoat', N'Exude sophistication and contemporary style with this Balenciaga men''s coat. Meticulously crafted with attention to detail, it showcases the brand''s renowned luxury and impeccable tailoring. Made from premium materials, this coat offers both warmth and elegance, making it a versatile choice for any occasion. With its sleek design and modern silhouette, it effortlessly elevates your outerwear collection. Embrace the essence of high fashion with this statement-making Balenciaga coat that combines impeccable craftsmanship with a cutting-edge aesthetic.', CAST(269.34 AS Decimal(10, 2)), CAST(398.60 AS Decimal(10, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2023-06-19T00:00:00.000' AS DateTime), CAST(N'2023-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (16, N'Square Neck Back', N'wt-shirt', N'Experience casual comfort with this women''s T-shirt. Made from soft and breathable fabric, it provides a relaxed and lightweight feel, perfect for everyday wear. The versatile design and classic silhouette make it a wardrobe staple that effortlessly pairs with jeans, shorts, or skirts. Whether you''re running errands or meeting friends for a coffee, this T-shirt is a go-to option that combines style and comfort in one. Stay effortlessly chic with this essential piece for any casual occasion.', CAST(38.50 AS Decimal(10, 2)), CAST(55.78 AS Decimal(10, 2)), NULL, NULL, NULL, CAST(N'2023-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Product_id], [Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) VALUES (17, N'Pink T-Shirt Women', N'wcoat', N'A pink t-shirt for women is a comfortable and stylish garment designed to fit the female body. It is made of soft fabric like cotton, often featuring a crew or V-neckline and varying sleeve lengths. The t-shirt can have different designs, from simple to patterned or graphic. It comes in both loose and fitted styles, with lengths ranging from cropped to hip-length or longer. Pink t-shirts for women are versatile and can be paired with jeans, shorts, skirts, or pants for various casual or dressy looks. They are a popular choice for expressing femininity and personal style.', CAST(13.46 AS Decimal(10, 2)), CAST(32.40 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2023-06-10T00:00:00.000' AS DateTime), CAST(N'2023-06-29T00:00:00.000' AS DateTime), CAST(N'2023-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (1, N'black', N'images/product/1/black.jpg', 0)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (1, N'white', N'images/product/1/white.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (2, N'blue', N'images/product/2/blue.jpg', 0)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (2, N'pink', N'images/product/2/pink.jpg', 0)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (2, N'white', N'images/product/2/white.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (3, N'black', N'images/product/3/black.jpg', 0)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (3, N'blue', N'images/product/3/blue.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (3, N'white', N'images/product/3/white.jpg', 0)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (4, N'brown', N'images/product/4/brown.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (5, N'grey', N'images/product/5/grey.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (6, N'white', N'images/product/6/white.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (7, N'black', N'images/product/7/black.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (8, N'white', N'images/product/8/white.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (9, N'blue', N'images/product/9/blue.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (10, N'black', N'images/product/10/black.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (11, N'blue', N'images/product/11/blue.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (12, N'yellow', N'images/product/12/yellow.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (13, N'white', N'images/product/13/white.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (14, N'black', N'images/product/14/black.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (15, N'white', N'images/product/15/white.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (16, N'grey', N'images/product/16/grey.jpg', 1)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (17, N'blue', N'images/product/17/blue.jpg', 0)
INSERT [dbo].[product_color] ([Product_id], [Color_id], [image], [default]) VALUES (17, N'pink', N'images/product/17/pink.jpg', 1)
GO
INSERT [dbo].[Role] ([Role_id], [Role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Role_id], [Role_name]) VALUES (2, N'Customer')
INSERT [dbo].[Role] ([Role_id], [Role_name]) VALUES (3, N'Marketing')
INSERT [dbo].[Role] ([Role_id], [Role_name]) VALUES (4, N'Seller')
INSERT [dbo].[Role] ([Role_id], [Role_name]) VALUES (5, N'Guest')
GO
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (N'L', N'L')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (N'M', N'M')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (N'S', N'S')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (N'XL', N'XL')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (N'XXL', N'XXL')
GO
SET IDENTITY_INSERT [dbo].[size_color_product] ON 

INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (1, N'white', N'S', 1, 1)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (2, N'blue', N'S', 9, 1)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (3, N'black', N'S', 10, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (4, N'white', N'S', 2, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (5, N'black', N'S', 3, 45)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (6, N'brown', N'S', 4, 11)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (7, N'blue', N'S', 3, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (8, N'grey', N'S', 5, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (10, N'black', N'S', 7, 11)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (11, N'white', N'S', 8, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (12, N'black', N'S', 1, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (13, N'pink', N'S', 2, 30)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (15, N'white', N'S', 3, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (16, N'blue', N'S', 11, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (17, N'yellow', N'S', 12, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (18, N'white', N'S', 13, 5)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (19, N'black', N'S', 14, 16)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (20, N'white', N'S', 15, 15)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (21, N'grey', N'S', 16, 16)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (22, N'white', N'M', 1, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (23, N'blue', N'M', 9, 23)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (24, N'black', N'M', 10, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (25, N'white', N'M', 2, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (26, N'black', N'M', 3, 45)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (27, N'brown', N'M', 4, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (28, N'blue', N'M', 3, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (29, N'grey', N'M', 5, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (30, N'white', N'M', 6, 7)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (31, N'black', N'M', 7, 11)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (32, N'white', N'M', 8, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (34, N'pink', N'M', 2, 30)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (36, N'white', N'M', 3, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (37, N'blue', N'M', 11, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (38, N'yellow', N'M', 12, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (39, N'white', N'M', 13, 5)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (40, N'black', N'M', 14, 16)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (41, N'white', N'M', 15, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (42, N'grey', N'M', 16, 16)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (43, N'white', N'L', 1, 1)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (44, N'blue', N'L', 9, 1)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (45, N'black', N'L', 10, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (46, N'white', N'L', 2, 9)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (47, N'black', N'L', 3, 45)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (48, N'brown', N'L', 4, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (49, N'blue', N'L', 3, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (50, N'grey', N'L', 5, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (51, N'white', N'L', 6, 7)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (52, N'black', N'L', 7, 11)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (53, N'white', N'L', 8, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (54, N'black', N'L', 1, 9)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (55, N'pink', N'L', 2, 30)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (57, N'white', N'L', 3, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (58, N'blue', N'L', 11, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (59, N'yellow', N'L', 12, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (60, N'white', N'L', 13, 5)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (61, N'black', N'L', 14, 16)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (62, N'white', N'L', 15, 15)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (63, N'grey', N'L', 16, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (64, N'white', N'XL', 1, 1)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (65, N'blue', N'XL', 9, 1)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (66, N'black', N'XL', 10, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (67, N'white', N'XL', 2, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (68, N'black', N'XL', 3, 45)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (69, N'brown', N'XL', 4, 6)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (70, N'blue', N'XL', 3, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (71, N'grey', N'XL', 5, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (72, N'white', N'XL', 6, 7)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (73, N'black', N'XL', 7, 11)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (74, N'white', N'XL', 8, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (75, N'black', N'XL', 1, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (76, N'pink', N'XL', 2, 30)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (78, N'white', N'XL', 3, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (79, N'blue', N'XL', 11, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (80, N'yellow', N'XL', 12, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (81, N'white', N'XL', 13, 5)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (82, N'black', N'XL', 14, 16)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (83, N'white', N'XL', 15, 15)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (84, N'grey', N'XL', 16, 16)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (85, N'white', N'XXL', 1, 1)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (86, N'blue', N'XXL', 9, 1)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (87, N'black', N'XXL', 10, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (88, N'white', N'XXL', 2, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (89, N'black', N'XXL', 3, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (90, N'brown', N'XXL', 4, 11)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (91, N'blue', N'XXL', 3, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (92, N'grey', N'XXL', 5, 12)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (93, N'white', N'XXL', 6, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (94, N'black', N'XXL', 7, 11)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (95, N'white', N'XXL', 8, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (96, N'black', N'XXL', 1, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (97, N'pink', N'XXL', 2, 30)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (99, N'white', N'XXL', 3, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (100, N'blue', N'XXL', 11, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (101, N'yellow', N'XXL', 12, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (102, N'white', N'XXL', 13, 5)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (103, N'black', N'XXL', 14, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (104, N'white', N'XXL', 15, 0)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (105, N'grey', N'XXL', 16, 16)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (466, N'blue', N'L', 17, 10)
GO
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (467, N'blue', N'M', 17, 13)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (468, N'blue', N'S', 17, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (469, N'pink', N'L', 17, 10)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (470, N'pink', N'M', 17, 13)
INSERT [dbo].[size_color_product] ([scp_id], [Color_id], [Size_id], [Product_id], [quantity]) VALUES (471, N'pink', N'S', 17, 10)
SET IDENTITY_INSERT [dbo].[size_color_product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (2, N'Trinh Hai Phong', N'1', CAST(N'2003-04-27' AS Date), N'0878532644', N'Thach That', N'phongth171494@fpt.edu.vn', N'phong', N'be5dfa83dc9c98b3884aa7c443dd43fd', 1, 1)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (3, N'Bui Anh Hong', N'0', CAST(N'2002-09-10' AS Date), N'0976106282', N'Ha Noi', N'anhhonghong689@gmail.com', N'hong', N'be5dfa83dc9c98b3884aa7c443dd43fd', 2, 1)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (4, N'Lai Ngoc Lam', N'1', CAST(N'2002-12-31' AS Date), N'0923571085', N'My Dinh', N'lamlnhe161656@fpt.edu.vn', N'lam', N'be5dfa83dc9c98b3884aa7c443dd43fd', 3, 1)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (5, N'Nguyen Huy Khoi', N'1', CAST(N'2002-02-13' AS Date), N'0904431987', N'My Dinh', N'khois2p@gmail.com', N'khoi', N'be5dfa83dc9c98b3884aa7c443dd43fd', 4, 1)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (6, N'Than Quang phuong', N'1', NULL, N'0878532644', N'Bac Giang', N'phuongtqhe176459@fpt.edu.vn', N'phuong', N'5690dddfa28ae085d23518a035707282', 2, 1)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (7, N'Alex Roger', N'1', NULL, N'0904431675', N'Manchester', N'garenaobama@gmail.com', N'Roger', N'202cb962ac59075b964b07152d234b70', 2, 1)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (8, N'Janna Roxiana', N'0', NULL, N'0342382912', N'Paris', N'JannaRox@gmail.com', N'Roxi', N'202cb962ac59075b964b07152d234b70', 2, 0)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (9, N'Truong Trong Hung', N'1', CAST(N'0017-08-23' AS Date), N'0976106282', N'Vinh Phuc', N'anhhonghong689@gmail.com', N'hung', N'900150983cd24fb0d6963f7d28e17f72', 2, 1)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (10, N'Hoang Nhi', N'0', CAST(N'0017-08-23' AS Date), N'0976106282', N'Ha Noi', N'anhhonghong689@gmail.com', N'nhi', N'e2fc714c4727ee9395f324cd2e7f331f', 2, 1)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (11, N'Hoang Lan Nhi', N'0', CAST(N'0032-10-26' AS Date), N'0976106282', N'BacGIang', N'anhhonghong689@gmail.com', N'nhi', N'ab56b4d92b40713acc5af89985d4b786', 2, 1)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (12, N'Than Quang Phong', N'1', CAST(N'0017-08-23' AS Date), N'0976106282', N'BacGIang', N'anhhonghong689@gmail.com', N'phong', N'4122cb13c7a474c1976c9706ae36521d', 2, 1)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (13, N'Tieu Chien', N'0', NULL, N'0976106282', N'Bac Tu Liem', N'hongbahe161650@fpt.edu.vn', N'chien', N'202cb962ac59075b964b07152d234b70', 2, 1)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (14, N'Duong Duong', N'0', NULL, N'0976106282', N'Ca Mau', N'anhhong109@gmail.com', N'duong', N'0f98df87c7440c045496f705c7295344', 2, 0)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (15, N'Nguyen Hoang Anh Tuan', N'1', NULL, N'0976106282', N'Cau Giay', N'buivinh2752006@gmail.com', NULL, N'202cb962ac59075b964b07152d234b70', 2, 0)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (16, N'Bui Anh Hong', N'1', NULL, N'0976106282', N'BacGIang', N'phongth171494@gmail.com', NULL, N'202cb962ac59075b964b07152d234b70', 2, 0)
INSERT [dbo].[User] ([User_id], [Full_name], [Gender], [Dob], [Phone_number], [Address], [Email], [Username], [Password], [Role_id], [status]) VALUES (17, N'Bui Anh Hong', N'1', NULL, N'0976106282', N'BacGIang', N'hong689@gmail.com', NULL, N'de796c6c7137866900d2e59b7c712e47', 2, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZA10knpHSJ', 1, N'Coza wait', CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(12.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZA9yxbHHUb', 1, N'Coza wait', CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(12.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZABF5f65LB', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAbGBUGtu2', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZABXGsXrdx', 1, N'Coza wait', CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(12.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAcVJa4yuM', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAdt37OU25', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAdZBEQNzk', 1, N'Coza wait', CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(12.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAeokbbIKs', 1, N'Coza wait', CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(12.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAeONFO19Q', 1, N'Coza wait', CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(12.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAF3Wduk8k', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAf49sVncX', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAFwwfjvES', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAG9cE8eph', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAglowhFba', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAGzmkiSph', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAHoSERTM4', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAL8yITxFq', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAl9mGC2Ve', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZALN7vYhH2', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZALrUVBqC7', 1, N'Coza wait', CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(12.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZALsrQUoRH', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAmvxOVaFr', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAn2FPd56i', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAq4ZKA2Gz', 1, N'Coza wait', CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(12.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZArJdtANmC', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZArM6SBY1s', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAuhaF8Krx', 1, N'Coza wait', CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(12.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAUKdxuy4v', 1, N'Coza wait', CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(12.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAUORaI9oG', 1, N'Cozaaaaaaaaaaaaaa', CAST(N'2023-06-05T11:44:00.000' AS DateTime), CAST(N'2023-07-02T11:45:00.000' AS DateTime), CAST(324.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAuTgeT1kO', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAUVwGQ5Hn', 1, N'COZA VOucherHidden', CAST(N'2023-06-13T09:11:00.000' AS DateTime), CAST(N'2023-06-30T09:11:00.000' AS DateTime), CAST(3.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAV7pAW9LQ', 1, N'COZA VOucherHidden', CAST(N'2023-06-13T09:11:00.000' AS DateTime), CAST(N'2023-06-30T09:11:00.000' AS DateTime), CAST(3.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAvPdhmmcz', 1, N'Coza wait', CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(N'2023-07-09T11:49:00.000' AS DateTime), CAST(12.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAYLQ2Jvhh', 1, N'COZA VOucherHidden', CAST(N'2023-06-13T09:11:00.000' AS DateTime), CAST(N'2023-06-30T09:11:00.000' AS DateTime), CAST(3.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAZm4M2qdU', 1, N'COZA VOucherHidden', CAST(N'2023-06-13T09:11:00.000' AS DateTime), CAST(N'2023-06-30T09:11:00.000' AS DateTime), CAST(3.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAZq2vbrrh', 5, N'Coza power voucher', CAST(N'2023-06-18T11:06:00.000' AS DateTime), CAST(N'2023-06-20T11:06:00.000' AS DateTime), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'COZAZXxHMsTK', 1, N'COZA VOucherHidden', CAST(N'2023-06-13T09:11:00.000' AS DateTime), CAST(N'2023-06-30T09:11:00.000' AS DateTime), CAST(3.00 AS Decimal(5, 2)))
INSERT [dbo].[Voucher] ([Code], [quantity], [describe], [start_voucher], [end_voucher], [discount]) VALUES (N'PUBLICWK5Tkfpe__MIN200', 200, N'Coza Power ', CAST(N'2023-06-13T09:10:00.000' AS DateTime), CAST(N'2023-07-01T09:10:00.000' AS DateTime), CAST(20.00 AS Decimal(5, 2)))
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [addTime]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([Category_id])
REFERENCES [dbo].[BlogCategory] ([Category_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([scp_id])
REFERENCES [dbo].[size_color_product] ([scp_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([User_id])
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([User_id])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([User_id])
GO
ALTER TABLE [dbo].[History_action]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([User_id])
GO
ALTER TABLE [dbo].[History_of_change]  WITH CHECK ADD FOREIGN KEY([action_id])
REFERENCES [dbo].[Action] ([Id])
GO
ALTER TABLE [dbo].[History_of_change]  WITH CHECK ADD FOREIGN KEY([obj_id])
REFERENCES [dbo].[Object] ([id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([orderStatus_id])
REFERENCES [dbo].[Order_Status] ([orderStatus_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([User_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([Order_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([scp_id])
REFERENCES [dbo].[size_color_product] ([scp_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Category_id])
REFERENCES [dbo].[Category] ([Category_id])
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD FOREIGN KEY([Color_id])
REFERENCES [dbo].[Color] ([Color_id])
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[size_color_product]  WITH CHECK ADD FOREIGN KEY([Color_id])
REFERENCES [dbo].[Color] ([Color_id])
GO
ALTER TABLE [dbo].[size_color_product]  WITH CHECK ADD FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[size_color_product]  WITH CHECK ADD FOREIGN KEY([Size_id])
REFERENCES [dbo].[Size] ([Size_id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Role_id])
REFERENCES [dbo].[Role] ([Role_id])
GO
USE [master]
GO
ALTER DATABASE [demo2] SET  READ_WRITE 
GO
