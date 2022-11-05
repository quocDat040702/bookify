USE [master]
GO
/****** Object:  Database [bookify]    Script Date: 11/5/2022 6:57:59 PM ******/
CREATE DATABASE [bookify]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookify', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MAYAO\MSSQL\DATA\bookify.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bookify_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MAYAO\MSSQL\DATA\bookify_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bookify] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookify].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookify] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bookify] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bookify] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bookify] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bookify] SET ARITHABORT OFF 
GO
ALTER DATABASE [bookify] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bookify] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bookify] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bookify] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bookify] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bookify] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bookify] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bookify] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bookify] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bookify] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bookify] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bookify] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bookify] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bookify] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bookify] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bookify] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bookify] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bookify] SET RECOVERY FULL 
GO
ALTER DATABASE [bookify] SET  MULTI_USER 
GO
ALTER DATABASE [bookify] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bookify] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bookify] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bookify] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bookify] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bookify] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bookify', N'ON'
GO
ALTER DATABASE [bookify] SET QUERY_STORE = OFF
GO
USE [bookify]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[hotel_id] [varchar](50) NOT NULL,
	[user_id] [varchar](50) NOT NULL,
	[hoteltype_id] [varchar](50) NOT NULL,
	[hotel_name] [nvarchar](50) NULL,
	[background_image] [varchar](150) NULL,
	[is_verified] [bit] NULL,
	[description] [nvarchar](300) NOT NULL,
	[country] [nvarchar](100) NULL,
	[district] [nvarchar](100) NULL,
	[city] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[isAllowPet] [bit] NULL,
	[isHasCamera] [bit] NULL,
	[checkin] [nvarchar](10) NULL,
	[checkout] [nvarchar](10) NULL,
	[closing] [nvarchar](10) NULL,
	[opening] [nvarchar](10) NULL,
 CONSTRAINT [PK__Hotel__45FE7E264DFD887D] PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [varchar](50) NOT NULL,
	[hotel_id] [varchar](50) NULL,
	[room_type_id] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[review_id] [varchar](50) NOT NULL,
	[hotel_id] [varchar](50) NULL,
	[user_id] [varchar](50) NULL,
	[content] [nvarchar](300) NULL,
	[source_id] [int] NULL,
	[communication_point] [int] NULL,
	[accuracy_point] [int] NULL,
	[location_point] [int] NULL,
	[value_point] [int] NULL,
	[create_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[id] [varchar](50) NOT NULL,
	[price] [int] NULL,
	[bed_type] [nvarchar](50) NULL,
	[bed_number] [int] NULL,
	[bathroom_type] [nvarchar](50) NULL,
	[bathroom_number] [int] NULL,
	[is_private_bathroom] [bit] NULL,
	[guests_id] [nvarchar](50) NULL,
	[number_of_guests] [int] NULL,
	[number_of_room] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SearchAdvance]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[SearchAdvance] as
select ht.hotel_id, ht.hotel_name, ht.hoteltype_id, ht.background_image, ht.country, ht.city, ht.district, ht.address, 
AVG(rt.price) as average_price,
(select isnull((select AVG(rv.communication_point + rv.accuracy_point + rv.location_point + rv.value_point)/4 
from review as rv where rv.hotel_id=ht.hotel_id), 0)) as rating,
AVG(rt.number_of_guests) as number_of_guest
from Hotel as ht, Room as rm, RoomType as rt
where ht.hotel_id=rm.hotel_id and rm.room_type_id=rt.id 
group by ht.hotel_id, ht.hotel_name, ht.city, ht.district, ht.address, ht.country, ht.hoteltype_id, ht.background_image
GO
/****** Object:  View [dbo].[getHotel]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[getHotel] as
select ht.*, (select isnull((select AVG(rv.communication_point + rv.accuracy_point + rv.location_point + rv.value_point)/4 
from review as rv where rv.hotel_id=ht.hotel_id), 0)) as rating
from hotel as ht
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[booking_id] [varchar](50) NOT NULL,
	[user_id] [varchar](50) NULL,
	[check_in] [date] NULL,
	[check_out] [date] NULL,
	[adult] [int] NULL,
	[child] [int] NULL,
	[infants] [int] NULL,
	[pets] [int] NULL,
	[room_id] [varchar](50) NOT NULL,
	[status] [int] NULL,
	[bookAt] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[bookingDateRange]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[bookingDateRange] as
select ht.hotel_id, bk.check_in, bk.check_out, rm.room_id from hotel as ht, room as rm, booking as bk 
where ht.hotel_id=rm.hotel_id and bk.room_id=rm.room_id 
GO
/****** Object:  View [dbo].[dateRangeBookingMerged]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[dateRangeBookingMerged] as
with bookingDateRangeMerge as (
    Select p1.check_in, p1.check_out, p1.hotel_id, p1.room_id
    from
        bookingDateRange p1
            left join
        bookingDateRange p2
            on
                p1.check_in = DATEADD(day,1,p2.check_out)
				and p1.hotel_id=p2.hotel_id
    where
        p2.check_in is null
    union all
    select p1.check_in,p2.check_out, p2.hotel_id, p2.room_id
    from
        bookingDateRangeMerge p1
            inner join
        bookingDateRange p2
            on
                p1.check_out = DATEADD(day,-1,p2.check_in)
				and p1.hotel_id=p2.hotel_id
)
select hotel_id, check_in,MAX(check_out) as check_out, room_id
from bookingDateRangeMerge
group by check_in, hotel_id, room_id
GO
/****** Object:  Table [dbo].[Image]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[image_id] [varchar](50) NOT NULL,
	[hotel_id] [varchar](50) NULL,
	[image] [nvarchar](300) NULL,
	[type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[homeHotelsImage]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[homeHotelsImage] as
select ht.hotel_id, img.image from hotel as ht, Image as img where ht.hotel_id=img.hotel_id group by ht.hotel_id, img.image
GO
/****** Object:  View [dbo].[getAllHotelBasicInfo]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[getAllHotelBasicInfo] as
select ht.hotel_id, ht.hotel_name, ht.hoteltype_id, ht.background_image, ht.country, ht.city, ht.district, ht.address, AVG(rt.price) as average_price,
(select isnull((select AVG(rv.communication_point + rv.accuracy_point + rv.location_point + rv.value_point)/4 
from review as rv where rv.hotel_id=ht.hotel_id), 0)) as rating
from Hotel as ht, Room as rm, RoomType as rt
where ht.hotel_id=rm.hotel_id and rm.room_type_id=rt.id 
group by ht.hotel_id, ht.hotel_name, ht.city, ht.district, ht.address, ht.country, ht.hoteltype_id, ht.background_image
GO
/****** Object:  View [dbo].[AdvancedFilter]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AdvancedFilter] as
select ht.hotel_id, ht.hotel_name, ht.hoteltype_id, ht.background_image, ht.country, ht.city, ht.district, ht.address, AVG(rt.price) as average_price,
(select isnull((select AVG(rv.communication_point + rv.accuracy_point + rv.location_point + rv.value_point)/4 
from review as rv where rv.hotel_id=ht.hotel_id), 0)) as rating,
AVG(rt.number_of_room) as number_of_room,
AVG(rt.bed_number) as bed_number,
AVG(rt.bathroom_number) as bath_number
from Hotel as ht, Room as rm, RoomType as rt
where ht.hotel_id=rm.hotel_id and rm.room_type_id=rt.id 
group by ht.hotel_id, ht.hotel_name, ht.city, ht.district, ht.address, ht.country, ht.hoteltype_id, ht.background_image
GO
/****** Object:  Table [dbo].[Amenity]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenity](
	[amenity_id] [varchar](50) NOT NULL,
	[amenity_name] [nvarchar](100) NULL,
	[icon] [varchar](50) NULL,
	[type_id] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[amenity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenity_type]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenity_type](
	[amenity_type_id] [nvarchar](50) NOT NULL,
	[amenity_type_name] [nvarchar](50) NULL,
	[amenity_type_number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[amenity_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingRoom]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRoom](
	[booking_id] [varchar](50) NULL,
	[user_id] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookmark]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookmark](
	[bookmark_id] [varchar](50) NOT NULL,
	[user_id] [varchar](50) NULL,
	[hotel_id] [varchar](50) NULL,
	[bookmark_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookmark_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guests]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guests](
	[guests_id] [varchar](50) NULL,
	[adult] [int] NULL,
	[child] [int] NULL,
	[infant] [int] NULL,
	[pet] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelAmenities]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelAmenities](
	[hotel_amenities_id] [varchar](50) NOT NULL,
	[amenity_id] [varchar](50) NULL,
	[hotel_id] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[hotel_amenities_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotelType]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotelType](
	[hoteltype_id] [varchar](50) NOT NULL,
	[hoteltype] [varchar](50) NULL,
	[icon] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[hoteltype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[notify_id] [varchar](50) NOT NULL,
	[source_id] [varchar](50) NULL,
	[notify_type] [bit] NULL,
	[notify_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[notify_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[report_id] [varchar](50) NOT NULL,
	[hotel_id] [varchar](50) NULL,
	[user_id] [varchar](50) NULL,
	[title] [nvarchar](50) NULL,
	[content] [nvarchar](300) NULL,
	[report_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RuleDetail]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleDetail](
	[rule_id] [varchar](50) NOT NULL,
	[hotel_id] [varchar](50) NULL,
	[context] [nvarchar](100) NULL,
	[icon] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[rule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userDetail]    Script Date: 11/5/2022 6:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userDetail](
	[user_id] [varchar](50) NOT NULL,
	[username] [varchar](50) NULL,
	[user_password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[avatar] [varchar](100) NULL,
	[role] [smallint] NULL,
	[ggid] [varchar](50) NULL,
	[whislist_id] [varchar](50) NULL,
	[self_description] [nvarchar](300) NULL,
	[salt] [varchar](200) NULL,
	[account_number] [varchar](50) NULL,
	[subname] [nvarchar](100) NULL,
	[dob] [date] NULL,
	[signAt] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'Pool', N'faSwimmingPool', N'230198c8-317c-4f60-8a60-78e6ab002963')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'0d9fd954-78d7-49ae-a465-043be9c1d07c', N'Wifi', N'faWifi', N'230198c8-317c-4f60-8a60-78e6ab002963')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'Exercise equipment', N'faDumbbell', N'30550c0c-0985-43ae-890e-9b8979a6e6c6')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'6ac90bf9-0a08-48c2-a2aa-3092c6f3574f', N'BBQ grill', N'faFire', N'b84a89d6-7831-4c72-8a03-8fba95d0d318')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'Fire pit', N'faCampground', N'b84a89d6-7831-4c72-8a03-8fba95d0d318')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'81995780-b20c-4b4b-9219-8187ce831359', N'Indoor fireplace', N'faFireBurner', N'e5db1bd1-4708-44e5-aaf0-089a85ea239b')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'8a436006-7e92-49fa-a9ca-54c0705fcf74', N'Hot tub', N'faHotTub', N'30550c0c-0985-43ae-890e-9b8979a6e6c6')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'Outdoor dining area', N'faChair', N'b84a89d6-7831-4c72-8a03-8fba95d0d318')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'd26df333-4df2-4e84-94ee-80eaa6bd97a9', N'Air conditioning', N'faAirFreshener', N'230198c8-317c-4f60-8a60-78e6ab002963')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'eba60c2c-60e7-4bf3-9376-b55e0028d4c1', N'Patio', N'faCouch', N'b84a89d6-7831-4c72-8a03-8fba95d0d318')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'fe384dc7-b633-4ed8-a86e-60a2fb4705f0', N'Pool table', N'faBraille', N'f7bedf8c-7c2c-43e8-a8ec-fc327eb0f520')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'new-313409d3-3c5b-4956-8d7c-3d529f94731e', N'cam trai', N'faPencil', N'230198c8-317c-4f60-8a60-78e6ab002963')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'new-3d18e756-ae0c-4bfb-a624-awjdaw8dy9', N'Boi Loi', N'faPencil', N'230198c8-317c-4f60-8a60-78e6ab002963')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'new-3d18e756-ae0c-4bfb-a624-e5a9a357a54d', N'Danh nhau', N'faPencil', N'230198c8-317c-4f60-8a60-78e6ab002963')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'new-77c8c771-638e-4cab-8d60-a216573b17ba', N'Lặn san hô', N'faPencil', N'30550c0c-0985-43ae-890e-9b8979a6e6c6')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'new-fc60d550-43f4-41f3-814f-c67d48fc71d0', N'Ban cung', N'faPencil', N'30550c0c-0985-43ae-890e-9b8979a6e6c6')
GO
INSERT [dbo].[Amenity_type] ([amenity_type_id], [amenity_type_name], [amenity_type_number]) VALUES (N'230198c8-317c-4f60-8a60-78e6ab002963', N'Gia đình', 5)
INSERT [dbo].[Amenity_type] ([amenity_type_id], [amenity_type_name], [amenity_type_number]) VALUES (N'30550c0c-0985-43ae-890e-9b8979a6e6c6', N'Dịch vụ', 3)
INSERT [dbo].[Amenity_type] ([amenity_type_id], [amenity_type_name], [amenity_type_number]) VALUES (N'b84a89d6-7831-4c72-8a03-8fba95d0d318', N'Ngoài trời', 5)
INSERT [dbo].[Amenity_type] ([amenity_type_id], [amenity_type_name], [amenity_type_number]) VALUES (N'e5db1bd1-4708-44e5-aaf0-089a85ea239b', N'Đò dùng nấu bếp và ăn uống', 1)
INSERT [dbo].[Amenity_type] ([amenity_type_id], [amenity_type_name], [amenity_type_number]) VALUES (N'f7bedf8c-7c2c-43e8-a8ec-fc327eb0f520', N'Giải trí', 3)
GO
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status], [bookAt]) VALUES (N'05626770-b285-4326-80f9-8e6b5162d886', N'123', CAST(N'2022-11-07' AS Date), CAST(N'2022-11-13' AS Date), 2, 0, 0, 0, N'2ecb71cc-d224-4e15-a245-87b45b1c1628', 0, CAST(N'2022-11-05' AS Date))
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status], [bookAt]) VALUES (N'4c7ed5f9-3f98-4392-a7d3-5651d7ab178b', N'123', CAST(N'2022-11-18' AS Date), CAST(N'2022-11-20' AS Date), 2, 0, 0, 0, N'2706c071-76ea-4645-9741-03b166bad469', 1, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status], [bookAt]) VALUES (N'51c5a3f0-e314-49e1-a344-1930b474923d', N'123', CAST(N'2022-11-06' AS Date), CAST(N'2022-11-16' AS Date), 2, 0, 0, 0, N'7cede936-11cc-4198-9aee-ab57d418aedb', 1, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status], [bookAt]) VALUES (N'5e0ca394-aef1-41ea-b257-926af43b84db', N'123', CAST(N'2022-11-11' AS Date), CAST(N'2022-11-15' AS Date), 2, 0, 0, 0, N'2706c071-76ea-4645-9741-03b166bad469', 1, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status], [bookAt]) VALUES (N'68161ecf-1eb3-4f69-8beb-05cca853817b', N'123', CAST(N'2022-11-08' AS Date), CAST(N'2022-11-12' AS Date), 2, 0, 0, 0, N'f3c98d0a-c264-4ae3-9c2f-5ce6b22e5ffc', 0, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status], [bookAt]) VALUES (N'7f21d276-5c0e-4518-ae5a-dd19e723c2a3', N'123', CAST(N'2022-11-05' AS Date), CAST(N'2022-11-12' AS Date), 2, 0, 0, 0, N'57adeb48-b17c-43bc-80c5-baf365587e17', 0, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status], [bookAt]) VALUES (N'b2f57a85-559f-4a97-bb21-f719c1e2d9f6', N'123', CAST(N'2022-11-07' AS Date), CAST(N'2022-11-10' AS Date), 2, 0, 0, 0, N'2706c071-76ea-4645-9741-03b166bad469', 0, CAST(N'2022-11-05' AS Date))
GO
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'afbd51cf-8353-4303-ab47-f0785dc9c34f', N'Mường Thanh Huế', N'http://localhost:8080/bookify/images/hotels/black.jpg', 0, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', N'Việt Nam', N'Tỉnh Thừa Thiên Huế', N'Thành phố Huế', N'28 Bà Triệu', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'81a8a371-40a8-42f1-808f-a686a4d8bfa3', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'afbd51cf-8353-4303-ab47-f0785dc9c34f', N'Profilosto', N'http://localhost:8080/bookify/images/hotels/380569812.jpg', 0, N'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', N'Việt Nam', N'Thành phố Đà Nẵng', N'Hue', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'df28f4c5-8907-4bcf-a9b7-3849cb860815', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'39ed093c-720a-4fc7-aca5-70b15d338da8', N'Khách sạn Le Duc 2', N'http://localhost:8080/bookify/images/hotels/196860396_109306291389442_3251558626855161876_n.jpg', 0, N'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', N'Việt Nam', N'Tỉnh Thừa Thiên Huế', N'Lang Co', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'39ed093c-720a-4fc7-aca5-70b15d338da8', N'Khách sạn của Đức', N'http://localhost:8080/bookify/images/hotels/download.jpg', 0, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit', N'Việt Nam', N'Thành phố Hà Nội', N'Quan 1', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'f98320c3-235a-4cb7-a0a8-eda132b0e545', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'91bb91b4-adcb-45ba-a0bf-1669a4d5878f', N'AirBnb', N'http://localhost:8080/bookify/images/hotels/revato-275450-12292942-924181.jpg', 0, N'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', N'Việt Nam', N'Thành phố Đà Nẵng', N'Hai Chau', N'89 Bach Dang', 1, 1, N'12:30', N'12:30', N'12:30', N'12:30')
GO
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'016d6a58-9c45-46c6-9ce3-9a1b7e874520', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'f98320c3-235a-4cb7-a0a8-eda132b0e545')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'0191f897-d2a7-4448-aeca-586353eeae08', N'fe384dc7-b633-4ed8-a86e-60a2fb4705f0', N'ee40b247-2a92-4466-ba72-4a95ed32eabd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'0e961b80-b62b-4382-a1d5-9070f102c5eb', N'81995780-b20c-4b4b-9219-8187ce831359', N'df28f4c5-8907-4bcf-a9b7-3849cb860815')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'17b8f2fe-11ee-41e2-9624-1a72833692e7', N'd26df333-4df2-4e84-94ee-80eaa6bd97a9', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'1db5c768-ba9e-4c28-8394-23dad8832dbe', N'6ac90bf9-0a08-48c2-a2aa-3092c6f3574f', N'f98320c3-235a-4cb7-a0a8-eda132b0e545')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'1f490fbd-41b6-454c-ba9a-342649edac73', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'290f42fe-d3c2-4dee-a2e7-4885fd6b482a', N'eba60c2c-60e7-4bf3-9376-b55e0028d4c1', N'f98320c3-235a-4cb7-a0a8-eda132b0e545')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'370407b8-a6ae-4dc0-bdef-3d75ab4f40a8', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'3a779194-a82c-49b9-8063-234baa95d473', N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'ee40b247-2a92-4466-ba72-4a95ed32eabd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'3c9f426e-a074-43c2-8b54-2a8003833713', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'3f0aa9fb-c81d-4bce-bba1-67b5f51758f0', N'fe384dc7-b633-4ed8-a86e-60a2fb4705f0', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'406ace49-7af1-47dc-bdd3-cf6e6b7f15d9', N'0d9fd954-78d7-49ae-a465-043be9c1d07c', N'df28f4c5-8907-4bcf-a9b7-3849cb860815')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'417a3a74-b1b7-48a8-a2ab-ac3229dbe56a', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'5c30100b-1395-4bef-a74e-191e4c047dbe', N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'f98320c3-235a-4cb7-a0a8-eda132b0e545')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'69252926-87d2-4fe9-a6a0-9bda7c398606', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'f98320c3-235a-4cb7-a0a8-eda132b0e545')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'6b049d31-6f1a-4485-bdba-367bebcda039', N'd26df333-4df2-4e84-94ee-80eaa6bd97a9', N'ee40b247-2a92-4466-ba72-4a95ed32eabd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'6c86df0f-6b89-4b9a-aa32-af5ff6755c2c', N'8a436006-7e92-49fa-a9ca-54c0705fcf74', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'84068805-6bf6-4d46-9cc8-004f82bc41da', N'81995780-b20c-4b4b-9219-8187ce831359', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'8594b7fe-168a-4454-bce2-76b905e714d9', N'0d9fd954-78d7-49ae-a465-043be9c1d07c', N'ee40b247-2a92-4466-ba72-4a95ed32eabd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'94e263e9-ea29-4749-b50d-88b5c935d847', N'8a436006-7e92-49fa-a9ca-54c0705fcf74', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'96a864c5-0d3a-4ef5-b539-205cca96f41f', N'0d9fd954-78d7-49ae-a465-043be9c1d07c', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'9da8e217-ac92-4fde-b931-7b5dbeaaec2f', N'eba60c2c-60e7-4bf3-9376-b55e0028d4c1', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'ac9b82da-2e1d-417c-8b37-d41ede6dfb3f', N'81995780-b20c-4b4b-9219-8187ce831359', N'f98320c3-235a-4cb7-a0a8-eda132b0e545')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'b6808579-53c3-4429-9a73-021d67012e50', N'6ac90bf9-0a08-48c2-a2aa-3092c6f3574f', N'df28f4c5-8907-4bcf-a9b7-3849cb860815')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'bd585018-0e6d-435e-ac25-b07075f6247f', N'6ac90bf9-0a08-48c2-a2aa-3092c6f3574f', N'ee40b247-2a92-4466-ba72-4a95ed32eabd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'c953400e-40ca-4ccc-a76b-3cb6c92a6348', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'e31d0dcd-9cbd-4932-8d8f-974ff63f1477', N'new-77c8c771-638e-4cab-8d60-a216573b17ba', N'df28f4c5-8907-4bcf-a9b7-3849cb860815')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'e767cb83-929b-4626-b9e4-69137a209a18', N'6ac90bf9-0a08-48c2-a2aa-3092c6f3574f', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'e9c5d66d-15ea-43d8-b1ff-1107fc76efe4', N'0d9fd954-78d7-49ae-a465-043be9c1d07c', N'f98320c3-235a-4cb7-a0a8-eda132b0e545')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'ebfd25c7-73ad-4a11-8caf-e90d84e5fe76', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'f0d207ef-5e55-41d3-93cf-61a60fe98aa6', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'f98320c3-235a-4cb7-a0a8-eda132b0e545')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'f4fb72d6-c894-444d-b0bb-098d1b352352', N'eba60c2c-60e7-4bf3-9376-b55e0028d4c1', N'ee40b247-2a92-4466-ba72-4a95ed32eabd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'f5d54c73-b86e-4094-b032-7a2b859f4f4d', N'6ac90bf9-0a08-48c2-a2aa-3092c6f3574f', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'f8cb6936-7070-49ef-ac1f-24ad95d96281', N'fe384dc7-b633-4ed8-a86e-60a2fb4705f0', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'f990d1e0-93d4-43f0-9700-dc82afb7182b', N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'df28f4c5-8907-4bcf-a9b7-3849cb860815')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'fc810092-dc49-46b4-bbcb-5b03bc555d93', N'd26df333-4df2-4e84-94ee-80eaa6bd97a9', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd')
GO
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'314ec1bd-204b-4e8e-8b3a-098b4cc110fa', N'House', N'image2.png')
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'39ed093c-720a-4fc7-aca5-70b15d338da8', N'Resort', N'image5.png')
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'Bed and breakfast', N'image5.png')
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'91bb91b4-adcb-45ba-a0bf-1669a4d5878f', N'Apartment', N'image1.png')
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'9d5050f0-3d2f-4c80-a6f5-d82a215dda21', N'Unique space', N'image4.png')
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'afbd51cf-8353-4303-ab47-f0785dc9c34f', N'Hotel', N'image3.png')
GO
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'00a94381-954b-4937-9f75-db4679310416', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3', N'http://localhost:8080/bookify/images/hotels/download.jpg', 0)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'1f09ff21-556e-4fd8-9ea3-710f86ba3a32', N'f98320c3-235a-4cb7-a0a8-eda132b0e545', N'http://localhost:8080/bookify/images/hotels/_V5A9588.jpg', 0)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'1f9684a4-c7e9-471b-9c5b-1fec9beda29d', N'df28f4c5-8907-4bcf-a9b7-3849cb860815', N'http://localhost:8080/bookify/images/hotels/3003.jpg', 0)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'20f9efe3-8505-4243-b9ac-1e78fb0a3875', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'http://localhost:8080/bookify/images/hotels/Screenshot_20221006_033818.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'52194bef-1af1-4ea1-9f43-34c810124853', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd', N'http://localhost:8080/bookify/images/hotels/black4.jpg', 0)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'87133adb-03d2-4197-a3ed-20379a545c18', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'http://localhost:8080/bookify/images/hotels/Download this wallpaper _ oceanofwallpapers_com.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'b11b9aac-30b6-451d-9a4e-eed9e918908f', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3', N'http://localhost:8080/bookify/images/hotels/Main-pool-and-beach-at-Atmosphere-Resorts-Spa.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'b2413a3d-1410-4068-92e6-108cf3c9cebc', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'http://localhost:8080/bookify/images/hotels/Screenshot_20221008_101550.png', 0)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'c307d3ed-2c83-4004-8843-f93667b5864b', N'f98320c3-235a-4cb7-a0a8-eda132b0e545', N'http://localhost:8080/bookify/images/hotels/9636.jpg', 0)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'caeb6dde-66fa-4772-9d97-a098c4897b11', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3', N'http://localhost:8080/bookify/images/hotels/Beaches-Turks-Caicos-Overview.jpg', 0)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'cf82520f-e87a-489c-a060-ecc3328a4429', N'f98320c3-235a-4cb7-a0a8-eda132b0e545', N'http://localhost:8080/bookify/images/hotels/esperanza-at-night.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'd3126101-9bb0-4a08-9ea8-bb809e3a1c0e', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd', N'http://localhost:8080/bookify/images/hotels/black3.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'e1c00015-f8b6-4cbb-abe5-b399279cfa50', N'df28f4c5-8907-4bcf-a9b7-3849cb860815', N'http://localhost:8080/bookify/images/hotels/Lofi Girl on Twitter.png', 1)
GO
INSERT [dbo].[Report] ([report_id], [hotel_id], [user_id], [title], [content], [report_date]) VALUES (N'9ad6286d-d08d-4397-8704-asdasdawd12e1', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd', N'9ad6286d-d08d-4397-8704-b8a1aff07309', N'Khong sach se', N'qwhiuqwdh qwiudhqid hqiwudhq dhqwiuwuic qwibcqiuwcbqwic qwucbqwcoqwc ybca ubcua cbawyuc abwoicua wcoaywcb aowucb awcbaw cbaocbacb zocb', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'057f5cac-fb27-4c4e-9063-d5b2fa809c9f', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd', N'e158df8e-63fb-49a1-9ec4-ce4ccf309ee2')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'0a3a1dbd-5740-4a84-8716-93a1a6584b85', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd', N'e158df8e-63fb-49a1-9ec4-ce4ccf309ee2')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'0d778063-8d32-4cd1-a05b-6940992cef90', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3', N'4e1e9c0a-332a-46a1-b739-ce6a731a514d')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'184d56e6-d3c2-4436-8ce4-0a114604c34f', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd', N'e158df8e-63fb-49a1-9ec4-ce4ccf309ee2')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'2706c071-76ea-4645-9741-03b166bad469', N'f98320c3-235a-4cb7-a0a8-eda132b0e545', N'369a8ae8-ae1c-4b51-92a3-3395495db301')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'279d496c-69e6-4eed-b6ec-6ecc945ad515', N'df28f4c5-8907-4bcf-a9b7-3849cb860815', N'a5292fa8-b2dd-4dce-a985-ebcce8d5060e')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'2b9538e9-eb1b-469f-bcd4-5d2ea42312db', N'df28f4c5-8907-4bcf-a9b7-3849cb860815', N'a5292fa8-b2dd-4dce-a985-ebcce8d5060e')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'2df0b5b4-b117-4b83-87a1-25b32ece04fe', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3', N'4e1e9c0a-332a-46a1-b739-ce6a731a514d')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'2ecb71cc-d224-4e15-a245-87b45b1c1628', N'f98320c3-235a-4cb7-a0a8-eda132b0e545', N'369a8ae8-ae1c-4b51-92a3-3395495db301')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'30e80c13-3bd7-4c87-84cb-33e566add35b', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'bf30dc89-30a1-476e-baad-b49006a154e0')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'3439f07c-5bf4-4654-a29e-460c7dde4265', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'bf30dc89-30a1-476e-baad-b49006a154e0')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'3cceb621-02fb-43fa-a51c-669efaf7489c', N'df28f4c5-8907-4bcf-a9b7-3849cb860815', N'a5292fa8-b2dd-4dce-a985-ebcce8d5060e')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'3ded59a5-3eee-445c-b987-30f8a167eb7c', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'bf30dc89-30a1-476e-baad-b49006a154e0')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'43eee485-e5f7-4b41-8e12-6c230f979327', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'bf30dc89-30a1-476e-baad-b49006a154e0')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'57adeb48-b17c-43bc-80c5-baf365587e17', N'f98320c3-235a-4cb7-a0a8-eda132b0e545', N'369a8ae8-ae1c-4b51-92a3-3395495db301')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'5d3acbf7-fb4d-4b6f-946c-314a5175124e', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'bf30dc89-30a1-476e-baad-b49006a154e0')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'7917972c-5bd4-4802-bc4c-c496106d6038', N'df28f4c5-8907-4bcf-a9b7-3849cb860815', N'a5292fa8-b2dd-4dce-a985-ebcce8d5060e')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'7cede936-11cc-4198-9aee-ab57d418aedb', N'f98320c3-235a-4cb7-a0a8-eda132b0e545', N'369a8ae8-ae1c-4b51-92a3-3395495db301')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'8cbda976-b418-400a-a7a5-105540bfb7b0', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3', N'4e1e9c0a-332a-46a1-b739-ce6a731a514d')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'9ece925f-a147-4e10-ba50-e8e772eea4b3', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'bf30dc89-30a1-476e-baad-b49006a154e0')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'a307ecf3-5a98-44d7-87f5-d8d207184c7d', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'bf30dc89-30a1-476e-baad-b49006a154e0')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'b0a43c73-8e4b-4a6e-b0fc-42a917cc075c', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd', N'e158df8e-63fb-49a1-9ec4-ce4ccf309ee2')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'b350ef52-d9ff-47cd-b8b5-82501b384627', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd', N'e158df8e-63fb-49a1-9ec4-ce4ccf309ee2')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'b6a50255-02ef-48b9-a22d-9a6bb2fd9453', N'df28f4c5-8907-4bcf-a9b7-3849cb860815', N'a5292fa8-b2dd-4dce-a985-ebcce8d5060e')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'bbe412b7-5211-49d3-91f6-f7ed8373bc0f', N'df28f4c5-8907-4bcf-a9b7-3849cb860815', N'a5292fa8-b2dd-4dce-a985-ebcce8d5060e')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'c24129e1-613a-4192-b81a-59123b830072', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3', N'4e1e9c0a-332a-46a1-b739-ce6a731a514d')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'd6fa861d-bdc2-4395-b3b6-67f516a280a5', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3', N'4e1e9c0a-332a-46a1-b739-ce6a731a514d')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'd81cadc7-9d2d-4ec2-a510-e33405e153d0', N'df28f4c5-8907-4bcf-a9b7-3849cb860815', N'a5292fa8-b2dd-4dce-a985-ebcce8d5060e')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'e3eae615-e37a-41cd-be3c-a7ee88078d12', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'bf30dc89-30a1-476e-baad-b49006a154e0')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'e5b192fc-3167-49c0-8dec-18fb19d19ac0', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd', N'e158df8e-63fb-49a1-9ec4-ce4ccf309ee2')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'e9ed05b1-e16c-40a4-9a51-e46ea6ca2c24', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'bf30dc89-30a1-476e-baad-b49006a154e0')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'ec024bd6-f16e-413b-8ce3-f61d01fcfde4', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3', N'4e1e9c0a-332a-46a1-b739-ce6a731a514d')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'edb0a198-79f1-49d6-a27e-e52b8dd4356f', N'81a8a371-40a8-42f1-808f-a686a4d8bfa3', N'4e1e9c0a-332a-46a1-b739-ce6a731a514d')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'edcdd27a-47f0-43a2-a521-1486081ce466', N'df28f4c5-8907-4bcf-a9b7-3849cb860815', N'a5292fa8-b2dd-4dce-a985-ebcce8d5060e')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f025d870-2bc9-49e6-a44f-dde850e63997', N'ee40b247-2a92-4466-ba72-4a95ed32eabd', N'bf30dc89-30a1-476e-baad-b49006a154e0')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f3c98d0a-c264-4ae3-9c2f-5ce6b22e5ffc', N'f98320c3-235a-4cb7-a0a8-eda132b0e545', N'369a8ae8-ae1c-4b51-92a3-3395495db301')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'ff32c4f6-4c86-4d41-b688-3277e9290d98', N'78c3c9e6-9b8c-49fb-bfbe-0b9d616b40bd', N'e158df8e-63fb-49a1-9ec4-ce4ccf309ee2')
GO
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'038967ec-600a-4388-81d6-0ba076d23bb4', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'04e6d3e9-084f-4cc4-ac56-cf00370cd2e2', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'0a45db89-a24e-4754-8a29-86f0c46fe03d', 100, N'Normal bedroom', 3, N'Normal bathroom', 4, 1, N'Guest ID', 6, 4)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'0eae0acd-c4ff-408d-899e-157e5cdc0203', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'0ed93fba-7e9a-4340-a8f2-5c179038707f', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 5)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'17af024f-307d-4753-9a02-444eefc02966', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'1883170a-8e08-486d-ad35-a9da87ae7862', 100, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'369a8ae8-ae1c-4b51-92a3-3395495db301', 104, N'Normal bedroom', 7, N'Normal bathroom', 5, 1, N'Guest ID', 6, 4)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'3dc0ca45-f5bb-40b1-8e7a-6c7543021900', 111, N'Normal bedroom', 6, N'Normal bathroom', 3, 1, N'Guest ID', 4, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'3eeac8cc-d03b-44b5-a723-af0623ff949c', 100, N'Normal bedroom', 3, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'413b09e8-562d-4cdf-8fe2-412912cb5641', 150, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 10, 5)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'4cd441c1-eca3-43b6-b2b9-fe61d743d529', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'4e1e9c0a-332a-46a1-b739-ce6a731a514d', 100, N'Normal bedroom', 6, N'Normal bathroom', 4, 1, N'Guest ID', 5, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'56779998-b6c3-4bd6-bddb-ac90d2bffa43', 100, N'Normal bedroom', 6, N'Normal bathroom', 4, 1, N'Guest ID', 4, 4)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'590c935b-01ef-4417-9f9a-5a64a817bf8c', 111, N'Normal bedroom', 6, N'Normal bathroom', 3, 1, N'Guest ID', 4, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'5b7b301a-da46-42b5-a87a-59e10848f033', 169, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'5dce17cd-631f-407d-949b-d067d1db09cc', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 0)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'5e332bf6-1f79-451f-90bb-465fedeccd01', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'5f3a37d4-30d8-4846-9b2b-aeb4483ee7b0', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'62887a59-491c-4736-86d3-ce0e604e4133', 100, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'693b45a8-3145-4115-95fb-018c37f1c04e', 110, N'Normal bedroom', 2, N'Normal bathroom', 3, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'6affcf39-5c5c-46dc-acb6-08ce9581ba5b', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'6c98a9a3-6c6e-4fd1-858d-79e950ce31f6', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'7143dd4f-e627-4605-bf30-3838ba75a61b', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'798535c2-ee8c-4aa7-adf9-87b92386c25f', 110, N'Normal bedroom', 5, N'Normal bathroom', 5, 1, N'Guest ID', 6, 5)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'7eea8952-965f-4f60-9526-fe3950927b24', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'83ca4337-1f3e-4946-aa07-a87488a894fc', 111, N'Normal bedroom', 6, N'Normal bathroom', 3, 1, N'Guest ID', 4, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'89e42a55-e313-4beb-9032-8ecae0c7b277', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'8d71d13c-9699-4357-9dd1-54f58f08ed1b', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'909cbda5-4a1b-4562-a26c-09605281de3a', 112, N'Normal bedroom', 2, N'Normal bathroom', 1, 1, N'Guest ID', 4, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'98b73f1d-1ebc-45d0-8040-d554e1ae92ce', 111, N'Normal bedroom', 6, N'Normal bathroom', 3, 1, N'Guest ID', 4, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'a5292fa8-b2dd-4dce-a985-ebcce8d5060e', 200, N'Normal bedroom', 10, N'Normal bathroom', 7, 1, N'Guest ID', 8, 6)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'ae8ed5b3-ce86-4f4f-96ac-42fb86098e1f', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'b510e8c5-3959-4d5e-a48b-d0b175f2b2d7', 98, N'Normal bedroom', 3, N'Normal bathroom', 1, 1, N'Guest ID', 1, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'bf30dc89-30a1-476e-baad-b49006a154e0', 120, N'Normal bedroom', 4, N'Normal bathroom', 4, 1, N'Guest ID', 5, 4)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'c2c658a3-d7b3-47b3-969e-3605440ab17e', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'c41ea8b1-3386-4e82-8280-08bd07bf17d4', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'c524413c-d9f2-4dbc-8c1a-c0796bbf49a3', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'c9ba26f5-3c6b-45dd-9879-67f3eac56e17', 100, N'Normal bedroom', 4, N'Normal bathroom', 1, 1, N'Guest ID', 2, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'da5ddda7-ca76-4fa3-98f2-e5d48674e2af', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'dd33d098-5f48-4735-a178-7623d83c6ac8', 100, N'Normal bedroom', 3, N'Normal bathroom', 2, 1, N'Guest ID', 3, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'dda2c8cb-e7c6-4304-b255-89bf7b59881b', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'df35f91e-b9d2-40f2-bdd8-5324a7aae195', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'e158df8e-63fb-49a1-9ec4-ce4ccf309ee2', 105, N'Normal bedroom', 3, N'Normal bathroom', 2, 1, N'Guest ID', 3, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'e1bb1be3-a158-4ecd-9187-7e194a0a8629', 169, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'e667f77e-58ec-43b9-8ca8-7c9f1a006ec9', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'e69685ae-a689-44c3-9e5b-b6eb570f8748', 100, N'Normal bedroom', 6, N'Normal bathroom', 1, 0, N'Guest ID', 1, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'eb92574e-efd0-46ca-a887-7d3781c0279a', 111, N'Normal bedroom', 6, N'Normal bathroom', 3, 1, N'Guest ID', 4, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'ed77c49e-2b67-49b2-b48f-2490a30e6337', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'ffc9c34b-372c-4b1e-a536-61d6c26cd748', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
GO
INSERT [dbo].[userDetail] ([user_id], [username], [user_password], [email], [phone], [name], [avatar], [role], [ggid], [whislist_id], [self_description], [salt], [account_number], [subname], [dob], [signAt]) VALUES (N'123', N'sa', N'123', N'123', N'123', N'123', N'123', 123, N'123', N'123', N'123', N'123', NULL, NULL, NULL, CAST(N'2022-11-01' AS Date))
INSERT [dbo].[userDetail] ([user_id], [username], [user_password], [email], [phone], [name], [avatar], [role], [ggid], [whislist_id], [self_description], [salt], [account_number], [subname], [dob], [signAt]) VALUES (N'9ad6286d-d08d-4397-8704-b8a1aff07309', N'duc', N'hck/iR1by2E1Tx3fjs/Jux05xR471uvfRDOiNV2tI/s=', N'duc@gmail.com', N'12312512556', N'Duc4', N'http://localhost:8080/bookify/images/users/LofiGirlonTwitter.png', 1, NULL, NULL, N'asdasdasdasdasd', N'zL4M79NfLg0Yvi245WS9HRrdwvG7aT', N'7126381212836919283', N'Le Quy DD', CAST(N'2002-07-24' AS Date), CAST(N'2022-11-01' AS Date))
INSERT [dbo].[userDetail] ([user_id], [username], [user_password], [email], [phone], [name], [avatar], [role], [ggid], [whislist_id], [self_description], [salt], [account_number], [subname], [dob], [signAt]) VALUES (N'b955c796-027c-4e11-92ff-1bb942a102c8', N'leduc123', N'OZPJVZpFYQaxVkd8frspwDibUzmbAW8iuZbKnnPeM0o=', N'duc@gmail.com', N'890896756756', N'Duc', N'http://localhost:8080/bookify/images/users/LofiGirlonTwitter.png', NULL, NULL, NULL, N'Day la le duc tesst', N'gKkg5S8AFzQ2SOm2s6m4EcllaQQgMJ', NULL, N'Le', CAST(N'2002-07-24' AS Date), CAST(N'2022-11-01' AS Date))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__userDeta__F3DBC5728063A8EA]    Script Date: 11/5/2022 6:58:00 PM ******/
ALTER TABLE [dbo].[userDetail] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Amenity]  WITH CHECK ADD  CONSTRAINT [FK_Amenity_AmenityType] FOREIGN KEY([type_id])
REFERENCES [dbo].[Amenity_type] ([amenity_type_id])
GO
ALTER TABLE [dbo].[Amenity] CHECK CONSTRAINT [FK_Amenity_AmenityType]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[userDetail] ([user_id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_room_id_ref] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_room_id_ref]
GO
ALTER TABLE [dbo].[BookingRoom]  WITH CHECK ADD FOREIGN KEY([booking_id])
REFERENCES [dbo].[Booking] ([booking_id])
GO
ALTER TABLE [dbo].[BookingRoom]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[userDetail] ([user_id])
GO
ALTER TABLE [dbo].[Bookmark]  WITH CHECK ADD  CONSTRAINT [FK__Bookmark__hotel___4D94879B] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[Bookmark] CHECK CONSTRAINT [FK__Bookmark__hotel___4D94879B]
GO
ALTER TABLE [dbo].[Bookmark]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[userDetail] ([user_id])
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK__Hotel__hoteltype__48CFD27E] FOREIGN KEY([hoteltype_id])
REFERENCES [dbo].[hotelType] ([hoteltype_id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK__Hotel__hoteltype__48CFD27E]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK__Hotel__user_id__49C3F6B7] FOREIGN KEY([user_id])
REFERENCES [dbo].[userDetail] ([user_id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK__Hotel__user_id__49C3F6B7]
GO
ALTER TABLE [dbo].[HotelAmenities]  WITH CHECK ADD FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[HotelAmenities]  WITH CHECK ADD  CONSTRAINT [FK_HotelAmenities_Amenity] FOREIGN KEY([amenity_id])
REFERENCES [dbo].[Amenity] ([amenity_id])
GO
ALTER TABLE [dbo].[HotelAmenities] CHECK CONSTRAINT [FK_HotelAmenities_Amenity]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK__Image__hotel_id__6383C8BA] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK__Image__hotel_id__6383C8BA]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK__Report__hotel_id__5BE2A6F2] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK__Report__hotel_id__5BE2A6F2]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[userDetail] ([user_id])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK__Review__hotel_id__5FB337D6] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK__Review__hotel_id__5FB337D6]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[userDetail] ([user_id])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [fk_hotel] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [fk_hotel]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [fk_room_type] FOREIGN KEY([room_type_id])
REFERENCES [dbo].[RoomType] ([id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [fk_room_type]
GO
ALTER TABLE [dbo].[RuleDetail]  WITH CHECK ADD  CONSTRAINT [FK__RuleDetai__hotel__5629CD9C] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotel] ([hotel_id])
GO
ALTER TABLE [dbo].[RuleDetail] CHECK CONSTRAINT [FK__RuleDetai__hotel__5629CD9C]
GO
/****** Object:  StoredProcedure [dbo].[proc_getAllHotelBasicInfor]    Script Date: 11/5/2022 6:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[proc_getAllHotelBasicInfor]
@userId varchar(50)
as
begin
	select bab.*, 
( select count(*) from Bookmark as bm where bm.hotel_id=bab.hotel_id and bm.user_id=@userId) as isBookmarked
from getAllHotelBasicInfo as bab
end
GO
/****** Object:  StoredProcedure [dbo].[proc_getAllHotelBasicInforByAmenityId]    Script Date: 11/5/2022 6:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[proc_getAllHotelBasicInforByAmenityId]
@userId varchar(50), @amenityId varchar(50)  as
begin
	select bab.*, 
	( select count(*) from Bookmark as bm where bm.hotel_id=bab.hotel_id and bm.user_id=@userId) as isBookmarked
	from getAllHotelBasicInfo as bab where bab.hotel_id in (select hotel_id from HotelAmenities where amenity_id=@amenityId)
end
GO
/****** Object:  StoredProcedure [dbo].[proc_getAllHotelBasicInforByHotelType]    Script Date: 11/5/2022 6:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[proc_getAllHotelBasicInforByHotelType]
@userId varchar(50), @hoteltypeId varchar(50)  as
begin
	select bab.*, 
	( select count(*) from Bookmark as bm where bm.hotel_id=bab.hotel_id and bm.user_id=@userId) as isBookmarked
	from getAllHotelBasicInfo as bab where bab.hoteltype_id=@hoteltypeId
end
GO
/****** Object:  StoredProcedure [dbo].[proc_getAllMergedDayBooking]    Script Date: 11/5/2022 6:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[proc_getAllMergedDayBooking]
@check_in varchar(50), @check_out varchar(50), @hotelId varchar(50)  as
begin
	select r.room_id, dr.check_in, dr.check_out from Room as r, dateRangeBookingMerged as dr
	where dr.room_id=r.room_id 
end
GO
/****** Object:  StoredProcedure [dbo].[proc_getDefaultAmenities]    Script Date: 11/5/2022 6:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[proc_getDefaultAmenities]
as
begin
	select * 
	from Amenity join Amenity_type
	on Amenity.type_id = Amenity_type.amenity_type_id
end
GO
/****** Object:  StoredProcedure [dbo].[proc_getHotelAmenities]    Script Date: 11/5/2022 6:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[proc_getHotelAmenities]
@hotelId varchar(50)
as
begin
	select * 
	from 
		HotelAmenities join Amenity 
		on HotelAmenities.amenity_id = Amenity.amenity_id
		join Amenity_type 
		on Amenity.type_id = Amenity_type.amenity_type_id
	where HotelAmenities.hotel_id = @hotelId
end
GO
/****** Object:  StoredProcedure [dbo].[proc_getRoomType]    Script Date: 11/5/2022 6:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[proc_getRoomType]
@hotelId varchar(50)
as
begin
	select 
		RoomType.id, RoomType.price, RoomType.bed_type, 
		RoomType.bed_number, RoomType.bathroom_type, 
		RoomType.bathroom_number, RoomType.is_private_bathroom, 
		RoomType.is_private_bathroom, RoomType.number_of_guests,
		RoomType.number_of_room, Room.hotel_id, count(Room.room_id) as rooms 
	from RoomType join Room
	on RoomType.id = Room.room_type_id
	group by RoomType.id, RoomType.price, RoomType.bed_type, 
		RoomType.bed_number, RoomType.bathroom_type, 
		RoomType.bathroom_number, RoomType.is_private_bathroom, 
		RoomType.is_private_bathroom, RoomType.number_of_guests,
		RoomType.number_of_room, Room.hotel_id
	having Room.hotel_id = @hotelId
end
GO
USE [master]
GO
ALTER DATABASE [bookify] SET  READ_WRITE 
GO
