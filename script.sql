USE [master]
GO
/****** Object:  Database [bookify]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[Hotel]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[RoomType]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  View [dbo].[SearchAdvance]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[Booking]    Script Date: 11/2/2022 10:30:53 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[bookingDateRange]    Script Date: 11/2/2022 10:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[bookingDateRange] as
select ht.hotel_id, bk.check_in, bk.check_out, rm.room_id from hotel as ht, room as rm, booking as bk 
where ht.hotel_id=rm.hotel_id and bk.room_id=rm.room_id 
GO
/****** Object:  View [dbo].[dateRangeBooking]    Script Date: 11/2/2022 10:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[dateRangeBooking] as
with bookingDateRangeMerge as (
    Select p1.check_in, p1.check_out, p1.hotel_id
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
    select p1.check_in,p2.check_out, p2.hotel_id
    from
        bookingDateRangeMerge p1
            inner join
        bookingDateRange p2
            on
                p1.check_out = DATEADD(day,-1,p2.check_in)
				and p1.hotel_id=p2.hotel_id
)
select hotel_id, check_in,MAX(check_out) as EndDate
from bookingDateRangeMerge
group by check_in, hotel_id
GO
/****** Object:  View [dbo].[dateRangeBookingMerged]    Script Date: 11/2/2022 10:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[dateRangeBookingMerged] as
with bookingDateRangeMerge as (
    Select p1.check_in, p1.check_out, p1.hotel_id
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
    select p1.check_in,p2.check_out, p2.hotel_id
    from
        bookingDateRangeMerge p1
            inner join
        bookingDateRange p2
            on
                p1.check_out = DATEADD(day,-1,p2.check_in)
				and p1.hotel_id=p2.hotel_id
)
select hotel_id, check_in,MAX(check_out) as EndDate
from bookingDateRangeMerge
group by check_in, hotel_id
GO
/****** Object:  Table [dbo].[Image]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  View [dbo].[homeHotelsImage]    Script Date: 11/2/2022 10:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[homeHotelsImage] as
select ht.hotel_id, img.image from hotel as ht, Image as img where ht.hotel_id=img.hotel_id group by ht.hotel_id, img.image
GO
/****** Object:  View [dbo].[getAllHotelBasicInfo]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  View [dbo].[AdvancedFilter]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[Amenity]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[Amenity_type]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[BookingRoom]    Script Date: 11/2/2022 10:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRoom](
	[booking_id] [varchar](50) NULL,
	[user_id] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookmark]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[Guests]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[HotelAmenities]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[hotelType]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[Report]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[RuleDetail]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  Table [dbo].[userDetail]    Script Date: 11/2/2022 10:30:53 PM ******/
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
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'new-3d18e756-ae0c-4bfb-a624-e5a9a357a54d', N'Danh nhau', N'faPencil', N'230198c8-317c-4f60-8a60-78e6ab002963')
INSERT [dbo].[Amenity] ([amenity_id], [amenity_name], [icon], [type_id]) VALUES (N'new-fc60d550-43f4-41f3-814f-c67d48fc71d0', N'Ban cung', N'faPencil', N'30550c0c-0985-43ae-890e-9b8979a6e6c6')
GO
INSERT [dbo].[Amenity_type] ([amenity_type_id], [amenity_type_name], [amenity_type_number]) VALUES (N'230198c8-317c-4f60-8a60-78e6ab002963', N'Gia đình', 5)
INSERT [dbo].[Amenity_type] ([amenity_type_id], [amenity_type_name], [amenity_type_number]) VALUES (N'30550c0c-0985-43ae-890e-9b8979a6e6c6', N'Dịch vụ', 3)
INSERT [dbo].[Amenity_type] ([amenity_type_id], [amenity_type_name], [amenity_type_number]) VALUES (N'b84a89d6-7831-4c72-8a03-8fba95d0d318', N'Ngoài trời', 5)
INSERT [dbo].[Amenity_type] ([amenity_type_id], [amenity_type_name], [amenity_type_number]) VALUES (N'e5db1bd1-4708-44e5-aaf0-089a85ea239b', N'Đò dùng nấu bếp và ăn uống', 1)
INSERT [dbo].[Amenity_type] ([amenity_type_id], [amenity_type_name], [amenity_type_number]) VALUES (N'f7bedf8c-7c2c-43e8-a8ec-fc327eb0f520', N'Giải trí', 3)
GO
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status]) VALUES (N'0c0fc890-2863-4e40-a0cc-0fc61750b6e2', N'123', CAST(N'2022-11-07' AS Date), CAST(N'2022-11-10' AS Date), 2, 0, 0, 0, N'674259dd-582e-41c2-9553-f373fd46eabf', NULL)
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status]) VALUES (N'5f5f401d-d56e-443b-8c17-02c04f40d95e', N'123', CAST(N'2022-11-08' AS Date), CAST(N'2022-11-12' AS Date), 2, 0, 0, 0, N'897c5907-c1ca-491a-9d6c-f8fb818fdf6c', NULL)
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status]) VALUES (N'77afa0f2-3946-4563-816b-983e3ad068c3', N'123', CAST(N'2022-11-02' AS Date), CAST(N'2022-11-06' AS Date), 2, 0, 0, 0, N'093b5016-196d-47e7-9a51-21499cf9f284', NULL)
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status]) VALUES (N'b40cfc0f-2856-4585-8d3e-4f0a505aa685', N'123', CAST(N'2022-11-03' AS Date), CAST(N'2022-11-05' AS Date), 2, 0, 0, 0, N'00696f97-6316-440c-b22d-22d9314c8a64', NULL)
INSERT [dbo].[Booking] ([booking_id], [user_id], [check_in], [check_out], [adult], [child], [infants], [pets], [room_id], [status]) VALUES (N'ddef143b-4b75-4a62-91ec-a8cb3cca8736', N'123', CAST(N'2022-11-06' AS Date), CAST(N'2022-11-08' AS Date), 2, 0, 0, 0, N'00696f97-6316-440c-b22d-22d9314c8a64', NULL)
GO
INSERT [dbo].[Bookmark] ([bookmark_id], [user_id], [hotel_id], [bookmark_date]) VALUES (N'132ch191-7a83-452f-8d5d-n190ch19yf', N'9ad6286d-d08d-4397-8704-b8a1aff07309', N'4765fdf0-3f70-41e4-a901-7d838c610614', CAST(N'2022-11-02' AS Date))
INSERT [dbo].[Bookmark] ([bookmark_id], [user_id], [hotel_id], [bookmark_date]) VALUES (N'82522e5a-7a83-452f-8d5d-ffd2175ce8fd', N'123', N'02a6f4d2-fb8c-42db-ade5-2a66fa992197', CAST(N'2022-11-02' AS Date))
INSERT [dbo].[Bookmark] ([bookmark_id], [user_id], [hotel_id], [bookmark_date]) VALUES (N'82522e5a-7a83-452f-8d5d-wd21hd192dh1', N'123', N'0e496299-ba26-4270-8ba9-f642c6843a62', CAST(N'2022-11-02' AS Date))
GO
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'02a6f4d2-fb8c-42db-ade5-2a66fa992197', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'login-api', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221008_050258.png', 0, N'as dasdasd awdqwdqw  dq ', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong asdasd', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'0e496299-ba26-4270-8ba9-f642c6843a62', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'Tim Lee', N'D:/Project/Bookify/src/main/webapp/images/hotels/3003.jpg', 0, N'kajhkadsdhka ashk adsj  akdsa dsak dsjkajadsk kads', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'91bb91b4-adcb-45ba-a0bf-1669a4d5878f', N'Khach san cua Huy', N'D:/Project/bookify-login-feature/public/photo/hotels/Background black.jpg', 0, N'asdasdasdasd asd asd asd', N'Việt Nam', N'Hue', N'Hue', N'28 Ba Trieu', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'2dbba86d-22ff-4700-bef5-db381e65ff26', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'login-api', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221008_050258.png', 0, N'as dasdasd awdqwdqw  dq ', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong asdasd', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'421460af-5c41-47fa-90db-93b28106cb88', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'login-api', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221008_050258.png', 0, N'as dasdasd awdqwdqw  dq ', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong asdasd', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'4765fdf0-3f70-41e4-a901-7d838c610614', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'91bb91b4-adcb-45ba-a0bf-1669a4d5878f', N'muong thanh 15', N'D:/Project/Bookify/src/main/webapp/images/hotels/buffet.png', 0, N'jaowdja wdawd', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'782bd03e-c290-4891-a1e4-37c6c5159769', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'Tim Lee', N'D:/Project/Bookify/src/main/webapp/images/hotels/3003.jpg', 0, N'kajhkadsdhka ashk adsj  akdsa dsak dsjkajadsk kads', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'82f81496-8792-4bf7-af5a-1b0acc153070', N'123', N'39ed093c-720a-4fc7-aca5-70b15d338da8', N'Hotel Quoc Dat', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/users/Screenshot_20221006_102705.png', 0, N'thowhdaw dahwid ahwdiahdawdoha wdih di', N'Vietnam', N'Quang nam', N'Quang Binh', N'Dong Hoi', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'9d5050f0-3d2f-4c80-a6f5-d82a215dda21', N'Khach san moi', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/users/buffet.png', 0, N'asdasdasdasdasdadasd', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'91bb91b4-adcb-45ba-a0bf-1669a4d5878f', N'Muong thanh 3', N'D:/Project/Bookify/src/main/webapp/images/hotels/Download this wallpaper _ oceanofwallpapers_com.png', 0, N'qwuhqw iehqwi dqwhid qhid qwid awiudh ', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'aa20e53c-fc7b-4971-aae4-7f5202833ca4', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'login-api', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221008_050258.png', 0, N'as dasdasd awdqwdqw  dq ', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong asdasd', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'af6c791b-4009-4321-80f6-b6eb5cdbd939', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'39ed093c-720a-4fc7-aca5-70b15d338da8', N'Khach san moi', N'D:/Project/bookify-login-feature/public/photo/hotels/3003.jpg', 0, N'asdasd asdasda as dadada ada das das das da asd ', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong asdasdasd', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'login-api', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221008_050258.png', 0, N'as dasdasd awdqwdqw  dq ', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong asdasd', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'username 2', N'D:/Project/bookify-login-feature/public/photo/hotels/Screenshot_20221008_101550.png', 0, N'asdasdasdad', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'c5a4cba3-870f-4770-98e2-ab998789e168', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'39ed093c-720a-4fc7-aca5-70b15d338da8', N'Khach san Le Duc', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/Screenshot_20221008_101550.png', 0, N'This is a beatifull hotel', N'Việt Nam', N'Thua Thien Hue', N'Hue', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'c80dfb12-6162-4922-a21f-6db077223b68', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'login-api testasdasdasdasdasdasdasdasdadasd', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221008_050258.png', 0, N'as dasdasd awdqwdqw  dq ', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong asdasd', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'cd29fdde-13f5-4f1e-a47b-db313dbe504f', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'afbd51cf-8353-4303-ab47-f0785dc9c34f', N'Muong Thanh 2', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_104336.png', 0, N'iahwidahwiawhdiua daiwh daihawd ihawd awhdiawh awuihaw iuha idh widawidh ', N'Việt Nam', N'Quang Binh', N'Dong Hoi', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'cd7ad72d-bb52-405c-bb48-bf67bac438f0', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'login-api', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221008_050258.png', 0, N'as dasdasd awdqwdqw  dq ', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong asdasd', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'd642b4fe-ac55-415d-a181-5ea066e35594', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'9d5050f0-3d2f-4c80-a6f5-d82a215dda21', N'Muong thanh 5', N'D:/Project/Bookify/src/main/webapp/images/hotels/fb694d7c58ec9db2c4fd.jpg', 0, N'daihdh awidh waidha wi hawidh awid awiud ', N'Việt Nam', N'Hue', N'Hue', N'28 Hung Vuong 2 12e12e', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'f3391c24-3dd6-441b-8d3b-564fdcd9f656', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'afbd51cf-8353-4303-ab47-f0785dc9c34f', N'Muong Thanh', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_104336.png', 0, N'iahwidahwiawhdiua daiwh daihawd ihawd awhdiawh awuihaw iuha idh widawidh ', N'Việt Nam', N'Quang Binh', N'Dong Hoi', N'28 Hung Vuong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'9d5050f0-3d2f-4c80-a6f5-d82a215dda21', N'Khach sạn sau khi merge', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221008_045923.png', 0, N'awdha widhawid haiwd ăd', N'Việt Nam', N'Thành phố Đà Nẵng', N'Hai Chau', N'230 Ly Tu Trong', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'9d5050f0-3d2f-4c80-a6f5-d82a215dda21', N'Khach san quoc dat', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/The Solar System.png', 0, N'asdasdasdzxczxca cawawc awc awczxcqqw azxcqqw xqqwzc awcqw zxqw qw qw', N'Việt Nam', N'Tỉnh Quảng Bình', N'Dong Hoi', N'123 Mac Dang Quan', 0, 0, N'12:30', N'12:30', N'12:30', N'12:30')
INSERT [dbo].[Hotel] ([hotel_id], [user_id], [hoteltype_id], [hotel_name], [background_image], [is_verified], [description], [country], [district], [city], [address], [isAllowPet], [isHasCamera], [checkin], [checkout], [closing], [opening]) VALUES (N'fe1f3fd7-6b6f-4450-b8c5-9f1ccee123a9', N'123', N'91bb91b4-adcb-45ba-a0bf-1669a4d5878f', N'Hotel test dat', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/users/StrawberryEarlGreyLatte.jpg', 0, N'This is a nice hotel ', N'Vietnam', N'quang binh', N'dong hoi', N'36 Bach Dang', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'008984bb-a1d1-4a0d-b105-997ab0cedf1a', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'89de60c9-2a68-4ca6-b33d-5396ae58a656')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'0269db4c-e656-4768-af2a-d8312bab1b83', N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'c5a4cba3-870f-4770-98e2-ab998789e168')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'0459f4f4-77db-4187-881b-90fcb20d113b', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'd642b4fe-ac55-415d-a181-5ea066e35594')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'0b32b30c-29c1-4987-9ba3-7a3eea58c809', N'fe384dc7-b633-4ed8-a86e-60a2fb4705f0', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'0ca08118-fe31-4048-a355-740ebbe7fc74', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'aa20e53c-fc7b-4971-aae4-7f5202833ca4')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'0d12f829-3a4b-4ad1-a1e3-4d436f5cdd52', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'c5a4cba3-870f-4770-98e2-ab998789e168')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'0f99374e-ee95-485c-9cae-631e6fb755e4', N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'89de60c9-2a68-4ca6-b33d-5396ae58a656')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'1360d0da-8f4e-487e-af06-f0b0182250db', N'new-313409d3-3c5b-4956-8d7c-3d529f94731e', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'165eb825-4341-4cb4-9700-625ef81bd7df', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'af6c791b-4009-4321-80f6-b6eb5cdbd939')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'17492d2f-3324-482e-a1fc-3e51b51b4366', N'd26df333-4df2-4e84-94ee-80eaa6bd97a9', N'c5a4cba3-870f-4770-98e2-ab998789e168')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'1d5dfc56-2891-4cd7-ae0d-041f602e2b79', N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'1db8f386-c55f-4eef-a815-2bbd876ba393', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'202af770-1647-4ca8-b444-2857231a871f', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'2411e1ee-ec92-4eb3-87d2-89038a9fd87d', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'0e496299-ba26-4270-8ba9-f642c6843a62')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'245ff557-3ac9-4317-a751-00fbd3458f49', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'82f81496-8792-4bf7-af5a-1b0acc153070')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'2518e1f3-50bb-4f10-a0dd-29323bb720eb', N'eba60c2c-60e7-4bf3-9376-b55e0028d4c1', N'c5a4cba3-870f-4770-98e2-ab998789e168')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'26467b9a-edf2-4009-9443-87fcc4b9a82a', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'd642b4fe-ac55-415d-a181-5ea066e35594')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'27d92d3b-7eee-4c65-b28f-148c2d243b88', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'fe1f3fd7-6b6f-4450-b8c5-9f1ccee123a9')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'2878d80b-e000-4ed9-8b9f-3c44d5bb2025', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'288c9731-8a86-4f3d-b753-1f40eace003d', N'd26df333-4df2-4e84-94ee-80eaa6bd97a9', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'2a97754d-557c-4a15-8ba1-c6436df375f6', N'eba60c2c-60e7-4bf3-9376-b55e0028d4c1', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'2f5a8454-464e-485e-a41c-2d8982df6e60', N'new-313409d3-3c5b-4956-8d7c-3d529f94731e', N'89de60c9-2a68-4ca6-b33d-5396ae58a656')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'31ef693b-be54-4012-882b-f25c1bff0435', N'd26df333-4df2-4e84-94ee-80eaa6bd97a9', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'32010dc9-4876-427c-a04e-7b535847907b', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'335c9e24-82d6-4735-ba3f-28b069440e18', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'34608ff9-51c7-4924-89a7-ba805ee6794c', N'8a436006-7e92-49fa-a9ca-54c0705fcf74', N'c80dfb12-6162-4922-a21f-6db077223b68')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'375d7653-206d-4a18-8222-5eb5a1df00e2', N'eba60c2c-60e7-4bf3-9376-b55e0028d4c1', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'37c79416-a458-4577-adb5-0d7acf04a1bf', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'c80dfb12-6162-4922-a21f-6db077223b68')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'39474af1-abb2-4dea-bcff-dcc16e6bdd08', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'02a6f4d2-fb8c-42db-ade5-2a66fa992197')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'3b6cfdb6-7966-4b9b-bc27-bca9c01156b1', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'3bd28922-05ef-42f6-ba1c-52dbae26456e', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'3be7bd47-895e-4b3a-ad76-343f2952bf04', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'421460af-5c41-47fa-90db-93b28106cb88')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'3f361fa8-c3fb-4aad-998c-37f274d4c047', N'6ac90bf9-0a08-48c2-a2aa-3092c6f3574f', N'fe1f3fd7-6b6f-4450-b8c5-9f1ccee123a9')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'418bf4f6-437a-47a9-b528-cbb0317b0683', N'd26df333-4df2-4e84-94ee-80eaa6bd97a9', N'af6c791b-4009-4321-80f6-b6eb5cdbd939')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'43320b22-c356-4acb-bbc2-a5f39fb3001c', N'8a436006-7e92-49fa-a9ca-54c0705fcf74', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'4789de21-c986-4034-9cc5-22c08ac0cdd8', N'fe384dc7-b633-4ed8-a86e-60a2fb4705f0', N'c5a4cba3-870f-4770-98e2-ab998789e168')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'4cbe214a-ace0-40e4-80a6-59c502926d7a', N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'4e7a2411-cc0f-4043-b2da-d6794b64a421', N'0d9fd954-78d7-49ae-a465-043be9c1d07c', N'c5a4cba3-870f-4770-98e2-ab998789e168')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'52a46e13-4811-4ddd-861f-1220f5cafb05', N'8a436006-7e92-49fa-a9ca-54c0705fcf74', N'4765fdf0-3f70-41e4-a901-7d838c610614')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'59381ed0-21b1-48b8-ad38-d002ea9fa984', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'af6c791b-4009-4321-80f6-b6eb5cdbd939')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'5d645ce9-d671-4f0e-ab48-8892ac3132a0', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'2dbba86d-22ff-4700-bef5-db381e65ff26')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'5dd52fee-615b-4758-bdb0-42c2b4101e3a', N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'0e496299-ba26-4270-8ba9-f642c6843a62')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'6063c1d1-7ed3-4740-9a84-d2ebcde9e78a', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'4765fdf0-3f70-41e4-a901-7d838c610614')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'64a580c1-5daa-4bdb-aa98-be429006e2ac', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'67a99ac3-83ac-4467-a4ac-a18a9788d68b', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'68f47faa-797c-4056-8399-9f32c96d14a7', N'8a436006-7e92-49fa-a9ca-54c0705fcf74', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'6ba7fd8c-dbc5-4e97-9b1e-fa3fe61d910a', N'6ac90bf9-0a08-48c2-a2aa-3092c6f3574f', N'782bd03e-c290-4891-a1e4-37c6c5159769')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'6caf4e78-ea8d-4b56-ab85-c45b64e93d38', N'new-313409d3-3c5b-4956-8d7c-3d529f94731e', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'6e26d21f-c361-4280-986c-274cd13cb892', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'd642b4fe-ac55-415d-a181-5ea066e35594')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'6f352d9c-0688-4c07-a41c-8c357c8b5f51', N'd26df333-4df2-4e84-94ee-80eaa6bd97a9', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'726c57af-0afb-491c-9bd7-d30c696cd971', N'8a436006-7e92-49fa-a9ca-54c0705fcf74', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'776788a7-889c-47d2-9fe4-642c98a59997', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'cd7ad72d-bb52-405c-bb48-bf67bac438f0')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'7be723e8-3253-4eb6-ab8e-ef4639e4933a', N'eba60c2c-60e7-4bf3-9376-b55e0028d4c1', N'89de60c9-2a68-4ca6-b33d-5396ae58a656')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'7ecd1b68-6632-43c5-9c3a-d4c4f076e17a', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'8696310f-df68-484e-80c3-b15986a41e4c', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'86bc49aa-ab09-4dca-a729-1baf9f684741', N'8a436006-7e92-49fa-a9ca-54c0705fcf74', N'af6c791b-4009-4321-80f6-b6eb5cdbd939')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'86dc839c-80dc-4607-8aa3-c9435392ab10', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'2dbba86d-22ff-4700-bef5-db381e65ff26')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'8a122f0f-c19c-4daf-82e9-66373d43fb8b', N'new-313409d3-3c5b-4956-8d7c-3d529f94731e', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'8eb224c6-8967-486f-8edb-3cdd9313e448', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'02a6f4d2-fb8c-42db-ade5-2a66fa992197')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'9325726a-f2c1-44c0-ab29-7345043270e1', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'fe1f3fd7-6b6f-4450-b8c5-9f1ccee123a9')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'948b3c43-e220-43a0-8c70-8db0dc1902ca', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'c80dfb12-6162-4922-a21f-6db077223b68')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'95852d0d-64f9-4551-83f3-84939153f488', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'9756f753-1397-484a-8005-c64efe1a0e4e', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'993a983b-37c0-44a7-83e4-fe76678a9dbd', N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'782bd03e-c290-4891-a1e4-37c6c5159769')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'99ffd804-a981-4ffc-acb3-db4ef61316a5', N'8a436006-7e92-49fa-a9ca-54c0705fcf74', N'd642b4fe-ac55-415d-a181-5ea066e35594')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'9a59a8da-f1de-4669-9fac-d7a1aeb175f1', N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'9ae15f16-00e3-4134-b58f-33736fc2b9a0', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'782bd03e-c290-4891-a1e4-37c6c5159769')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'9f54b4e0-36cb-44db-a91a-329b9946ca56', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'c5a4cba3-870f-4770-98e2-ab998789e168')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'a7370be8-1644-4e7a-ab0f-7cd0971a57b1', N'eba60c2c-60e7-4bf3-9376-b55e0028d4c1', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'a88c12b3-155c-4096-a0fa-1b9d385a4f18', N'new-fc60d550-43f4-41f3-814f-c67d48fc71d0', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'a9c91f5e-3eb8-4ca4-a542-e003d6d78e93', N'81995780-b20c-4b4b-9219-8187ce831359', N'89de60c9-2a68-4ca6-b33d-5396ae58a656')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'aa5755ec-4361-4e6d-ad1f-19ad52207115', N'new-3d18e756-ae0c-4bfb-a624-e5a9a357a54d', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'ab938c3a-a5ac-4e54-90e7-be012537576d', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'aa20e53c-fc7b-4971-aae4-7f5202833ca4')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'ac8c59a7-a961-4535-a2a0-ac97fa20d74e', N'6ac90bf9-0a08-48c2-a2aa-3092c6f3574f', N'0e496299-ba26-4270-8ba9-f642c6843a62')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'b03b2d8d-1e70-4b25-a399-548ea33b9655', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'02a6f4d2-fb8c-42db-ade5-2a66fa992197')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'b65094a6-3f95-4ebd-b4e2-493ae822ba34', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'421460af-5c41-47fa-90db-93b28106cb88')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'c0d10d59-ec31-41b8-ae28-c8537ba2c176', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'cd7ad72d-bb52-405c-bb48-bf67bac438f0')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'c2b0a4e7-2137-4952-8006-b9eac6aa6595', N'new-3d18e756-ae0c-4bfb-a624-e5a9a357a54d', N'af6c791b-4009-4321-80f6-b6eb5cdbd939')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'c6921a09-c396-420c-a4ef-22c81812fc0a', N'eba60c2c-60e7-4bf3-9376-b55e0028d4c1', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'c9659dad-5923-4656-97bd-cba431add011', N'99fd19a0-818b-412f-a6e2-fc13f69dff58', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'cbe86f87-57e9-403c-a927-709574106409', N'81995780-b20c-4b4b-9219-8187ce831359', N'0e496299-ba26-4270-8ba9-f642c6843a62')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'cd6b830c-e1b3-4e33-8b37-a52e755bf985', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'cd7ad72d-bb52-405c-bb48-bf67bac438f0')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'd08e1b4e-e4f4-4680-b11d-0771ece65343', N'0d9fd954-78d7-49ae-a465-043be9c1d07c', N'82f81496-8792-4bf7-af5a-1b0acc153070')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'd193d14c-1c26-44a3-9e90-39a502736130', N'fe384dc7-b633-4ed8-a86e-60a2fb4705f0', N'af6c791b-4009-4321-80f6-b6eb5cdbd939')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'd681733c-3a7c-4ebe-b11e-9cbff46c415a', N'6ac90bf9-0a08-48c2-a2aa-3092c6f3574f', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'd9b78a2c-6d7e-4333-a963-b809ba7c8201', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'421460af-5c41-47fa-90db-93b28106cb88')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'd9c6d727-3e47-4758-8191-9c6f140f557c', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'dac05940-8f92-4641-9868-24cd0b7e9cfd', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'e26bda93-5798-46fb-938a-dadfad2bd894', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'e3367b74-516d-4c59-959f-5e5f9ba4e989', N'd26df333-4df2-4e84-94ee-80eaa6bd97a9', N'c80dfb12-6162-4922-a21f-6db077223b68')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'e535898d-f41b-46f5-9e94-a1e005437edf', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'e79a2a57-6ed2-4959-a9e7-77a743696868', N'81995780-b20c-4b4b-9219-8187ce831359', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'e9b8c205-b88d-4a6d-868f-3828f92bfa9a', N'56b783ce-d881-4287-b0e7-0a8f8f6140cf', N'4765fdf0-3f70-41e4-a901-7d838c610614')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'ed126be5-e1f4-40cf-b296-4b32b192521a', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'ede301be-6b8b-4897-a3cf-c6eea9e41aee', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'82f81496-8792-4bf7-af5a-1b0acc153070')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'efc58128-ee1f-49dc-b25c-7a25556aef43', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'f45b1355-9fb8-456a-9f05-f4b027418fd8', N'81995780-b20c-4b4b-9219-8187ce831359', N'782bd03e-c290-4891-a1e4-37c6c5159769')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'f6423ba9-a3a4-4f1f-b7e8-4e15306ca902', N'01d8e6d4-bd0e-49d4-b21a-660cd2809184', N'c80dfb12-6162-4922-a21f-6db077223b68')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'f850c2a4-9b7d-4785-8d45-d67f34aeb34e', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'aa20e53c-fc7b-4971-aae4-7f5202833ca4')
INSERT [dbo].[HotelAmenities] ([hotel_amenities_id], [amenity_id], [hotel_id]) VALUES (N'ff6e3c01-4bf3-44da-b269-c307191a1a47', N'73c67c79-1657-4b03-9b8b-925d4f38d48d', N'2dbba86d-22ff-4700-bef5-db381e65ff26')
GO
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'314ec1bd-204b-4e8e-8b3a-098b4cc110fa', N'House', N'image2.png')
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'39ed093c-720a-4fc7-aca5-70b15d338da8', N'Resort', N'image5.png')
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'5403d2ea-0c94-44b8-81f7-7b4986051570', N'Bed and breakfast', N'image5.png')
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'91bb91b4-adcb-45ba-a0bf-1669a4d5878f', N'Apartment', N'image1.png')
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'9d5050f0-3d2f-4c80-a6f5-d82a215dda21', N'Unique space', N'image4.png')
INSERT [dbo].[hotelType] ([hoteltype_id], [hoteltype], [icon]) VALUES (N'afbd51cf-8353-4303-ab47-f0785dc9c34f', N'Hotel', N'image3.png')
GO
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'00644322-73f9-4fd3-a8ff-b80d7048ad24', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'D:/Project/Bookify/src/main/webapp/images/hotels/fb694d7c58ec9db2c4fd.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'016c00a8-07ab-49e1-9648-324b9a5315e4', N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb', N'D:/Project/bookify-login-feature/public/photo/hotels/Screenshot_20221008_101550.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'051d4685-a304-4e45-88ed-4ee638c8282f', N'd642b4fe-ac55-415d-a181-5ea066e35594', N'D:/Project/Bookify/src/main/webapp/images/hotels/GongChaMilkFoamAlisanTea.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'07d279fb-67bd-4200-b18b-d3fff094a6f9', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'D:/Project/bookify-login-feature/public/photo/hotels/black2.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'08b76e11-c69a-4586-ab66-86d5160e16cb', N'fe1f3fd7-6b6f-4450-b8c5-9f1ccee123a9', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/OkinawaLatte.jpg', NULL)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'0b0d54f9-b892-4c8d-b23e-87ebe3053469', N'd642b4fe-ac55-415d-a181-5ea066e35594', N'D:/Project/Bookify/src/main/webapp/images/hotels/Since you liked the previous version so much, I decided to make a v2 of the Windows Gruvbox wallpaper [3840x2160] (dark_light, all res available).png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'0f0279b5-c43c-4846-bc89-6503a71cccfa', N'af6c791b-4009-4321-80f6-b6eb5cdbd939', N'D:/Project/bookify-login-feature/public/photo/hotels/buffet.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'0fbace7d-645c-4520-8000-42fbd4063eaa', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_040229.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'12bcfa0c-ad70-4868-9caa-f4c6b38c0433', N'd642b4fe-ac55-415d-a181-5ea066e35594', N'D:/Project/Bookify/src/main/webapp/images/hotels/fb694d7c58ec9db2c4fd.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'19a9933e-69d7-4d98-b839-a8a5ca1a8665', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_033818.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'1ad0f17e-ce91-4d5f-ae63-0cd143737c9f', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/Lockscreen Addict.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'1b86c6ba-53b0-4fad-a673-51a6a69ab5de', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'D:/Project/Bookify/src/main/webapp/images/hotels/buffet.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'1b986665-06e2-47d6-ae9c-ec1da54f5a0d', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'D:/Project/bookify-login-feature/public/photo/hotels/black2.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'1d1d88a5-fe93-4466-90c2-0084c547ae52', N'fe1f3fd7-6b6f-4450-b8c5-9f1ccee123a9', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/MangoMatchaLatte.jpg', NULL)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'1e4bdc93-6aff-4885-bdc4-751a2f86bc7e', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/293788.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'24a2c968-98f9-4f39-80fc-238c3454d236', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/Screenshot_20221006_105256.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'292f66d0-f762-4914-9b0a-d07ba457333e', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff', N'D:/Project/Bookify/src/main/webapp/images/hotels/293788.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'2c7598c1-a3f8-411b-a3cb-8fd9437cd199', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/3003.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'2d97f975-33a2-4d4a-a12e-eb1e0ed0652d', N'd642b4fe-ac55-415d-a181-5ea066e35594', N'D:/Project/Bookify/src/main/webapp/images/hotels/Since you liked the previous version so much, I decided to make a v2 of the Windows Gruvbox wallpaper [3840x2160] (dark_light, all res available).png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'318ed4d7-04dc-4d5f-82bc-7e9f0b134067', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/Edited version of _The Great Wave off Kanagawa_ [3840x2160].png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'319000f8-073d-4f4b-8bde-b894ab079880', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/black3.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'337bd19a-f3d5-4463-9a30-29ba83160bb3', N'4765fdf0-3f70-41e4-a901-7d838c610614', N'D:/Project/Bookify/src/main/webapp/images/hotels/buffet.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'35b630b5-9b43-43d7-864e-aef4ffdeb25b', N'82f81496-8792-4bf7-af5a-1b0acc153070', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/Screenshot_20221008_050258.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'35ed279a-2383-4fb8-bbbb-f3a0f7ee4d4d', N'c80dfb12-6162-4922-a21f-6db077223b68', N'D:/Project/Bookify/src/main/webapp/images/hotels/GongChaMilkFoamOoLongTea.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'36db04c0-9a77-4fe6-b213-30dcbb6db207', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'D:/Project/Bookify/src/main/webapp/images/hotels/Download this wallpaper _ oceanofwallpapers_com.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'383c3ee2-bd7d-4c9f-8aae-2acb152f40b6', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/293788.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'3ca7df02-8b56-4e06-b21e-89842ac390eb', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/Screenshot_20221006_104336.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'41473dae-f51c-4c15-bb75-0d0849aff943', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'D:/Project/bookify-login-feature/public/photo/hotels/fondo de pantalla PC (mundo).jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'418761d3-dc60-4497-bcf8-9e8e59337c22', N'782bd03e-c290-4891-a1e4-37c6c5159769', N'D:/Project/Bookify/src/main/webapp/images/hotels/3003.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'41a24fd4-bcdd-4e3f-b82b-32e8154bc9cc', N'82f81496-8792-4bf7-af5a-1b0acc153070', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/Screenshot_20221008_045923.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'42a8c799-0d87-427b-a3ef-74bb02f11fad', N'c80dfb12-6162-4922-a21f-6db077223b68', N'D:/Project/Bookify/src/main/webapp/images/hotels/color.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'45ff7ede-7bc9-4c1a-9bba-c27fce71468f', N'd642b4fe-ac55-415d-a181-5ea066e35594', N'D:/Project/Bookify/src/main/webapp/images/hotels/fb694d7c58ec9db2c4fd.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'4de06dab-52c3-42f8-8752-d7bef4a06ecb', N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb', N'D:/Project/bookify-login-feature/public/photo/hotels/Lofi Girl on Twitter.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'50931858-60b8-4afb-a415-4a4ba5a10b03', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'D:/Project/bookify-login-feature/public/photo/hotels/Lofi Girl on Twitter.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'52bb2386-4351-4c98-8ca9-f1a24948cb5c', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_033818.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'579181a7-5e66-4ee5-936e-1b1125e0e7ad', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/26534.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'57c9376b-944d-4e72-9ec6-6fbe0503ee6c', N'782bd03e-c290-4891-a1e4-37c6c5159769', N'D:/Project/Bookify/src/main/webapp/images/hotels/Edited version of _The Great Wave off Kanagawa_ [3840x2160].png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'58b9576f-913b-4475-8a4e-82c7f1f7527e', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_033818.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'5dd91d90-6b8b-4686-ac25-8da764c6c86f', N'd642b4fe-ac55-415d-a181-5ea066e35594', N'D:/Project/Bookify/src/main/webapp/images/hotels/GongChaMilkFoamAlisanTea.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'5f6ec2c1-5c8e-4b9d-9462-0ae24a321eca', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'D:/Project/Bookify/src/main/webapp/images/hotels/Edited version of _The Great Wave off Kanagawa_ [3840x2160].png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'611ca516-2b41-4a27-b60a-677df35b7a57', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'D:/Project/bookify-login-feature/public/photo/hotels/fondo de pantalla PC (mundo).jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'69a14d9d-37e7-4245-b0ac-bb0f6a4b7b00', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/dfeb14bb012bc4759d3a.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'6a2e12d1-ace4-4665-b0ab-b538b5b3983b', N'af6c791b-4009-4321-80f6-b6eb5cdbd939', N'D:/Project/bookify-login-feature/public/photo/hotels/26534.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'6ba431b7-72b6-4424-9011-1b66d1324d10', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/buffet.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'6c9460c7-9a21-4d0d-9c92-ecc442c3550c', N'c80dfb12-6162-4922-a21f-6db077223b68', N'D:/Project/Bookify/src/main/webapp/images/hotels/GongChaMilkFoamGreenTea.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'6d64c688-3433-4187-b064-5e4baf3ea83e', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/26534.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'6e21a1af-5569-4d5e-9a0c-13d7103186f3', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'D:/Project/bookify-login-feature/public/photo/hotels/black.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'70cb49fc-bd6a-4f23-8295-e2590b1399c0', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'D:/Project/bookify-login-feature/public/photo/hotels/Background black.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'711edec8-fc31-49f6-9ff9-09ec6dd52df8', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/Screenshot_20221006_105210.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'724400e8-4c5b-4c7f-8a3f-847aa5cb8821', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/dfeb14bb012bc4759d3a.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'74f03f7f-bdd4-4644-a295-d4dfac8ab5fe', N'4765fdf0-3f70-41e4-a901-7d838c610614', N'D:/Project/Bookify/src/main/webapp/images/hotels/Any good MacOs Dynamic Wallpapers _ Here''s mine_ [1920x1080].png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'78ba04ed-efe4-46da-ae56-9b29e16ef150', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/Edited version of _The Great Wave off Kanagawa_ [3840x2160].png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'78c40d36-7985-4fc9-abbc-9bc8470949a9', N'782bd03e-c290-4891-a1e4-37c6c5159769', N'D:/Project/Bookify/src/main/webapp/images/hotels/fb694d7c58ec9db2c4fd.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'7a483afd-e38d-4cfc-814e-26d944fa163d', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/3003.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'7a78845e-f39d-486a-a644-c7153af2adef', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_040229.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'7b707549-9cba-4e37-bb9b-9e63e2a405b0', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/Screenshot_20221006_105256.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'7e3cafb8-691e-4366-b792-50aeb2bc1bfe', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/The Solar System.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'7fc44764-fe79-4b1d-8e16-2b0240d34a4c', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'D:/Project/Bookify/src/main/webapp/images/hotels/Edited version of _The Great Wave off Kanagawa_ [3840x2160].png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'847a3ee4-8124-4f1d-b05c-ada78aa03394', N'4765fdf0-3f70-41e4-a901-7d838c610614', N'D:/Project/Bookify/src/main/webapp/images/hotels/Any good MacOs Dynamic Wallpapers _ Here''s mine_ [1920x1080].png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'86b898c3-dcc9-4eb4-b3ab-482465841fbe', N'af6c791b-4009-4321-80f6-b6eb5cdbd939', N'D:/Project/bookify-login-feature/public/photo/hotels/buffet.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'88547404-f5e7-44d0-ab2e-934bd01800e7', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221008_045923.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'88e6d96b-2f37-430a-92a7-c8190e6c2a7a', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/Screenshot_20221006_104336.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'89f93054-e22c-4027-87d6-49be7c65ee52', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'D:/Project/bookify-login-feature/public/photo/hotels/black.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'8cacc055-8eaa-4000-8e62-650458b9bfc9', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_033818.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'8ccc0424-bb21-43ae-bb08-e17d02a2b210', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/fondo de pantalla PC (mundo).jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'8e8df455-ab30-4d44-89ee-10b7702c9e13', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_040229.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'8ed73e26-810b-482c-a711-a1c022c16938', N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb', N'D:/Project/bookify-login-feature/public/photo/hotels/Lofi Girl on Twitter.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'9229b65a-e595-42df-ac52-fbe7e0e4e782', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'D:/Project/bookify-login-feature/public/photo/hotels/Background black.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'97659e82-d262-4382-a836-5e9c191999f9', N'82f81496-8792-4bf7-af5a-1b0acc153070', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/Screenshot_20221006_102705.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'97a0dbe4-7695-467e-a4b2-eac27b388940', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_104336.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'9a5da71e-3afa-4dd6-98b6-f18171771cc0', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/fondo de pantalla PC (mundo).jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'9b373bd9-2879-4bcf-bf1e-a51e31421203', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_040229.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'9b5f5b12-3182-4057-944f-cd8304a1bb7f', N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb', N'D:/Project/bookify-login-feature/public/photo/hotels/download.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'9b6cc34b-82b4-4a9d-b259-e6cdb2d531c6', N'4765fdf0-3f70-41e4-a901-7d838c610614', N'D:/Project/Bookify/src/main/webapp/images/hotels/OkinawaFreshMilk.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'9d47ca1c-b2c6-4aed-9222-a77136d33696', N'c80dfb12-6162-4922-a21f-6db077223b68', N'D:/Project/Bookify/src/main/webapp/images/hotels/293788.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'9dbc2639-2fcb-4bcf-938e-b23a7bb8004b', N'af6c791b-4009-4321-80f6-b6eb5cdbd939', N'D:/Project/bookify-login-feature/public/photo/hotels/26534.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'9df979ca-8467-46a4-81cc-03410f7c9ee6', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'D:/Project/bookify-login-feature/public/photo/hotels/Lofi Girl on Twitter.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'9f6ca011-471d-4ac5-85c9-c4afe3b94c0e', N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb', N'D:/Project/bookify-login-feature/public/photo/hotels/Screenshot_20221008_101550.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'9fb1334e-d8fb-45a8-9f0c-7362c3610a6e', N'af6c791b-4009-4321-80f6-b6eb5cdbd939', N'D:/Project/bookify-login-feature/public/photo/hotels/3003.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'a082f85a-ef58-4739-acb9-50946a2119c0', N'c80dfb12-6162-4922-a21f-6db077223b68', N'D:/Project/Bookify/src/main/webapp/images/hotels/MangoMatchaLatte.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'a15df9a4-7425-47f5-b686-e3fab0d41f9b', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/buffet.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'a210239e-25e3-43df-8ec9-440d3f55d1b2', N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb', N'D:/Project/bookify-login-feature/public/photo/hotels/download.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'a2cb75a6-0909-4378-82fd-5543c53e345f', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/3003.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'a3ddaab4-07f3-4736-9649-5ab58c2f7385', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/3003.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'a490c87a-b480-400a-812d-10e92319c40c', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'D:/Project/Bookify/src/main/webapp/images/hotels/uthappizza.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'ab7bfd76-aef5-49db-90c8-746910db5a4d', N'782bd03e-c290-4891-a1e4-37c6c5159769', N'D:/Project/Bookify/src/main/webapp/images/hotels/fb694d7c58ec9db2c4fd.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'acb08bf6-1976-41c2-8881-67709b05f892', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'D:/Project/Bookify/src/main/webapp/images/hotels/fb694d7c58ec9db2c4fd.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'ade3cbf3-12d3-446e-b631-268288f073f9', N'82f81496-8792-4bf7-af5a-1b0acc153070', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/Screenshot_20221008_051641.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'b3192abd-d5b6-4aed-8f3f-cbb41857af5e', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'D:/Project/Bookify/src/main/webapp/images/hotels/196860396_109306291389442_3251558626855161876_n.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'b85f9f20-e5ff-4f27-a7c7-e48d21d6607b', N'c80dfb12-6162-4922-a21f-6db077223b68', N'D:/Project/Bookify/src/main/webapp/images/hotels/196860396_109306291389442_3251558626855161876_n.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'b87a58c4-b574-487c-86e5-b4943d6540ab', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/Screenshot_20221006_105210.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'ba79b076-1c0c-41ae-a54b-221915fe1d7d', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_104336.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'baa96d29-72a5-457b-bd7d-73458eab4079', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_074824.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'c03bf858-1d15-4204-ad55-07925e0bdafb', N'4765fdf0-3f70-41e4-a901-7d838c610614', N'D:/Project/Bookify/src/main/webapp/images/hotels/OkinawaFreshMilk.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'c0d4b738-4e8c-4326-adb1-2f5e42ab2a53', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_104336.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'c19fc9a0-0821-4f45-ad90-e14e0b59c379', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/Screenshot_20221008_101550.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'c6e4d6b0-be1f-442d-b03f-b76fe23274ab', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221008_045923.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'c7c8738b-bf98-4b14-9315-ce1dc7746b20', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/black3.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'd100f757-e1db-45aa-89d2-93ff7bfd6827', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/Lockscreen Addict.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'd2e240ef-ef09-4b3f-8ae8-a6d01cb75691', N'fe1f3fd7-6b6f-4450-b8c5-9f1ccee123a9', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/StrawberryEarlGreyLatte.jpg', NULL)
GO
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'd4ef4409-6660-4d4e-ab4f-181a7d9ae5d6', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff', N'D:/Project/Bookify/src/main/webapp/images/hotels/Lofi Girl on Twitter.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'd9599976-f86d-4701-97ec-6a41f533686e', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/fb694d7c58ec9db2c4fd.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'dfb0858c-9594-4226-a976-bc3fb48c6963', N'c80dfb12-6162-4922-a21f-6db077223b68', N'D:/Project/Bookify/src/main/webapp/images/hotels/dfeb14bb012bc4759d3a.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'e33a7e78-1336-438b-a165-91dc4836c139', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/The Solar System.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'e66a3316-2b9c-4c4c-b6c2-9e866e03d910', N'af6c791b-4009-4321-80f6-b6eb5cdbd939', N'D:/Project/bookify-login-feature/public/photo/hotels/3003.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'e69a7429-cd66-4503-9adb-c9b9fefd043a', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'D:/Project/Bookify/src/main/webapp/images/hotels/dfeb14bb012bc4759d3a.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'e99237d2-0e85-4f82-8906-011ad7cbc45b', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/Screenshot_20221008_101550.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'eabdbba4-1f34-463c-a442-6040d02b1b92', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'D:/Project/Bookify/src/main/webapp/images/hotels/Download this wallpaper _ oceanofwallpapers_com.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'eb279843-fd4c-4d71-9a09-be9e7d61d56e', N'782bd03e-c290-4891-a1e4-37c6c5159769', N'D:/Project/Bookify/src/main/webapp/images/hotels/3003.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'f033b4ee-dae1-404f-bd1c-531d50e0c0fd', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'D:/Project/Bookify/src/main/webapp/images/hotels/196860396_109306291389442_3251558626855161876_n.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'f3bb89ee-fcf5-4b5d-9b79-4e3614386d5a', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'D:/Project/Bookify/src/main/webapp/images/hotels/3003.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'f540fa0f-c28f-43e6-af6b-752941fd8403', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'D:/Project/Bookify/src/main/webapp/images/hotels/dfeb14bb012bc4759d3a.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'f5d03151-2996-4a75-b62c-aeb831c5cbab', N'4765fdf0-3f70-41e4-a901-7d838c610614', N'D:/Project/Bookify/src/main/webapp/images/hotels/buffet.png', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'f64eea7a-4b92-4f45-9050-72339b372cb7', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'D:/Project/Bookify/src/main/webapp/images/hotels/3003.jpg', 1)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'f6851a7d-3912-4e6b-9646-15c2b0fa6507', N'fe1f3fd7-6b6f-4450-b8c5-9f1ccee123a9', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/hotels/OkinawaFreshMilk.jpg', NULL)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'f84b8ea1-60aa-4e3a-9908-7ee634a0836e', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'D:/netbeanJavaWeb/Bookify/bookify/bookify/src/main/webapp/images/hotels/fb694d7c58ec9db2c4fd.jpg', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'fb978bbf-ad3e-4f8b-98ae-678cd3237fbb', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f', N'D:/Project/Bookify/src/main/webapp/images/hotels/Screenshot_20221006_104336.png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'fc17b9bb-01d9-4ca5-b593-b03eec2c9502', N'782bd03e-c290-4891-a1e4-37c6c5159769', N'D:/Project/Bookify/src/main/webapp/images/hotels/Edited version of _The Great Wave off Kanagawa_ [3840x2160].png', 2)
INSERT [dbo].[Image] ([image_id], [hotel_id], [image], [type]) VALUES (N'fe5a38f8-102d-4db6-a325-7384055ae955', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'D:/Project/Bookify/src/main/webapp/images/hotels/color.jpg', 1)
GO
INSERT [dbo].[Review] ([review_id], [hotel_id], [user_id], [content], [source_id], [communication_point], [accuracy_point], [location_point], [value_point], [create_at]) VALUES (N'1a79c3ff-1839-4bd0-adfa-b13a92ff15cb', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'9ad6286d-d08d-4397-8704-b8a1aff07309', N'Day la 1 khach san tot', 0, 5, 5, 2, 3, CAST(N'2022-11-02T16:06:20.150' AS DateTime))
INSERT [dbo].[Review] ([review_id], [hotel_id], [user_id], [content], [source_id], [communication_point], [accuracy_point], [location_point], [value_point], [create_at]) VALUES (N'9330d7d9-5f08-4da0-a270-f9718cbd8606', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'b955c796-027c-4e11-92ff-1bb942a102c8', N'Day la 1 khach san tot', 0, 4, 4, 5, 5, CAST(N'2022-11-02T16:06:20.150' AS DateTime))
INSERT [dbo].[Review] ([review_id], [hotel_id], [user_id], [content], [source_id], [communication_point], [accuracy_point], [location_point], [value_point], [create_at]) VALUES (N'awd132f1h-zc13-c421-gvetg-hqwaodh191d', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'123', N'Day la 1 khach san tot', 0, 5, 4, 5, 3, CAST(N'2022-11-02T16:06:20.150' AS DateTime))
GO
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'00696f97-6316-440c-b22d-22d9314c8a64', N'aa20e53c-fc7b-4971-aae4-7f5202833ca4', N'0eae0acd-c4ff-408d-899e-157e5cdc0203')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'0204f906-4b5e-478c-878a-7449bc338baa', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'1883170a-8e08-486d-ad35-a9da87ae7862')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'02b0d450-0f4e-4687-9b5d-dd29fa0823e4', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656', N'5b7b301a-da46-42b5-a87a-59e10848f033')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'0650ea1c-9efa-482d-a174-2df6d4f5820c', N'421460af-5c41-47fa-90db-93b28106cb88', N'4cd441c1-eca3-43b6-b2b9-fe61d743d529')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'093b5016-196d-47e7-9a51-21499cf9f284', N'aa20e53c-fc7b-4971-aae4-7f5202833ca4', N'0eae0acd-c4ff-408d-899e-157e5cdc0203')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'0b9899fb-df1a-4413-ba49-e508b69abdc3', N'02a6f4d2-fb8c-42db-ade5-2a66fa992197', N'e667f77e-58ec-43b9-8ca8-7c9f1a006ec9')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'0d4eae56-c88d-433a-a255-38fb4d219272', N'af6c791b-4009-4321-80f6-b6eb5cdbd939', N'0a45db89-a24e-4754-8a29-86f0c46fe03d')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'0e0e6d7c-290f-47e7-942f-2bf1466cf087', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'17af024f-307d-4753-9a02-444eefc02966')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'12fee022-f8c9-40ec-9e07-8acfe3669a8c', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'3eeac8cc-d03b-44b5-a723-af0623ff949c')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'163fdd1a-e7de-4b70-8217-d69f1377edc6', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'17af024f-307d-4753-9a02-444eefc02966')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'19191083-1d09-4792-aea6-731c206aeaf7', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'413b09e8-562d-4cdf-8fe2-412912cb5641')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'1d6c042e-7075-4ba9-882e-02026ad8795f', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'17af024f-307d-4753-9a02-444eefc02966')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'20fb8428-1552-49c9-a4c4-a172f322b8d8', N'4765fdf0-3f70-41e4-a901-7d838c610614', N'c9ba26f5-3c6b-45dd-9879-67f3eac56e17')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'21a7da54-e7ae-4e0a-ba26-89a602fc2449', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'909cbda5-4a1b-4562-a26c-09605281de3a')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'23174820-74c3-44fd-9b42-6d154c1c0cb5', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff', N'dd33d098-5f48-4735-a178-7623d83c6ac8')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'27386b65-b33c-4fad-a3e2-e4d19a9c0ca5', N'02a6f4d2-fb8c-42db-ade5-2a66fa992197', N'e667f77e-58ec-43b9-8ca8-7c9f1a006ec9')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'28c141a9-bb70-4b2b-867e-da51c0ada8c5', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f', N'e1bb1be3-a158-4ecd-9187-7e194a0a8629')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'2ae59e77-3d83-4ba7-8d3b-faa7ac7559ee', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'1883170a-8e08-486d-ad35-a9da87ae7862')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'2ddb06d8-b120-4628-a641-b5c529a395c7', N'421460af-5c41-47fa-90db-93b28106cb88', N'4cd441c1-eca3-43b6-b2b9-fe61d743d529')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'2e9c963e-5932-4949-98cc-fe9da2590ee3', N'02a6f4d2-fb8c-42db-ade5-2a66fa992197', N'e667f77e-58ec-43b9-8ca8-7c9f1a006ec9')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'2fbdcdd8-ca53-4b7a-bbbd-cfef95cfb043', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'413b09e8-562d-4cdf-8fe2-412912cb5641')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'305b4bdb-a8b8-42da-bf69-48c17672aa74', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'df35f91e-b9d2-40f2-bdd8-5324a7aae195')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'316543db-ac64-4c5d-b87b-ad1bcd1310e6', N'782bd03e-c290-4891-a1e4-37c6c5159769', N'62887a59-491c-4736-86d3-ce0e604e4133')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'3a252d97-d001-48af-836b-b06a78879de8', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'413b09e8-562d-4cdf-8fe2-412912cb5641')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'3dd0e81a-36a0-4f0d-9377-9e8336e49143', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff', N'dd33d098-5f48-4735-a178-7623d83c6ac8')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'3ec285a5-cf19-4215-9ecc-1c27b1439729', N'2dbba86d-22ff-4700-bef5-db381e65ff26', N'8d71d13c-9699-4357-9dd1-54f58f08ed1b')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'4081b151-3d7a-457d-b446-3c473667af97', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'df35f91e-b9d2-40f2-bdd8-5324a7aae195')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'419a49c1-af63-4ca5-8b88-f1b13c7411ed', N'2dbba86d-22ff-4700-bef5-db381e65ff26', N'8d71d13c-9699-4357-9dd1-54f58f08ed1b')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'43a23cc7-f7ed-4b03-b1a3-d14f60ca58bd', N'c80dfb12-6162-4922-a21f-6db077223b68', N'7143dd4f-e627-4605-bf30-3838ba75a61b')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'44c35011-576a-44db-bb49-8d3b8def8811', N'aa20e53c-fc7b-4971-aae4-7f5202833ca4', N'0eae0acd-c4ff-408d-899e-157e5cdc0203')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'47d23a97-cd88-46d7-87ab-a915dccfd863', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff', N'dd33d098-5f48-4735-a178-7623d83c6ac8')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'4f54527f-b514-4273-81a1-6c180c8a3a0d', N'02a6f4d2-fb8c-42db-ade5-2a66fa992197', N'e667f77e-58ec-43b9-8ca8-7c9f1a006ec9')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'544d3dc2-fed5-42bd-9331-6a670c6a63cc', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'3eeac8cc-d03b-44b5-a723-af0623ff949c')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'54605746-8ebe-432c-a789-8c28508be299', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'df35f91e-b9d2-40f2-bdd8-5324a7aae195')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'5840041f-5086-4394-90e5-a587e177cd15', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'ffc9c34b-372c-4b1e-a536-61d6c26cd748')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'5a61f47e-971e-4c3e-bb3f-f1b34ab6b0ab', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'909cbda5-4a1b-4562-a26c-09605281de3a')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'674259dd-582e-41c2-9553-f373fd46eabf', N'aa20e53c-fc7b-4971-aae4-7f5202833ca4', N'0eae0acd-c4ff-408d-899e-157e5cdc0203')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'695b2244-236c-4821-8460-11faffd02357', N'421460af-5c41-47fa-90db-93b28106cb88', N'4cd441c1-eca3-43b6-b2b9-fe61d743d529')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'6ddf421d-65cb-45c9-a32d-89a3d0092930', N'd642b4fe-ac55-415d-a181-5ea066e35594', N'b510e8c5-3959-4d5e-a48b-d0b175f2b2d7')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'6ea81dcb-fcc6-4552-b083-b040dfea840b', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'1883170a-8e08-486d-ad35-a9da87ae7862')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'75225a4c-5337-4217-8f71-2a6e14d1cc7a', N'02a6f4d2-fb8c-42db-ade5-2a66fa992197', N'e667f77e-58ec-43b9-8ca8-7c9f1a006ec9')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'75853ab3-e66c-4dbb-96f3-4f4d22a7fd05', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'17af024f-307d-4753-9a02-444eefc02966')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'7646f553-f46d-45f6-9484-8069bc06e260', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'909cbda5-4a1b-4562-a26c-09605281de3a')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'7817b217-109d-4734-9dc8-d6b01d613f26', N'85f5685b-7dfd-45be-8857-6f10af79d4b4', N'17af024f-307d-4753-9a02-444eefc02966')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'7bd8fe80-6002-44c4-93ca-b7c80b8e8b94', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'ffc9c34b-372c-4b1e-a536-61d6c26cd748')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'7d8a9f73-fb37-448b-ad2f-b8b5f517d249', N'd642b4fe-ac55-415d-a181-5ea066e35594', N'b510e8c5-3959-4d5e-a48b-d0b175f2b2d7')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'7e60fad9-38ee-4ab5-bb95-21d64fcc469b', N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb', N'e69685ae-a689-44c3-9e5b-b6eb570f8748')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'816acd67-96cf-4c51-9d5c-0f844c71f382', N'02a6f4d2-fb8c-42db-ade5-2a66fa992197', N'e667f77e-58ec-43b9-8ca8-7c9f1a006ec9')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'83e242da-6a1a-42b1-942c-0df8996dbc78', N'd642b4fe-ac55-415d-a181-5ea066e35594', N'b510e8c5-3959-4d5e-a48b-d0b175f2b2d7')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'853b74fb-053d-4182-8ad3-4e38117314f1', N'cd7ad72d-bb52-405c-bb48-bf67bac438f0', N'038967ec-600a-4388-81d6-0ba076d23bb4')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'8781bff2-9ad9-4077-91ee-c3959a794227', N'2dbba86d-22ff-4700-bef5-db381e65ff26', N'8d71d13c-9699-4357-9dd1-54f58f08ed1b')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'897c5907-c1ca-491a-9d6c-f8fb818fdf6c', N'aa20e53c-fc7b-4971-aae4-7f5202833ca4', N'0eae0acd-c4ff-408d-899e-157e5cdc0203')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'8d6cfd57-7696-4c92-a2f1-f0e31b1d3837', N'2dbba86d-22ff-4700-bef5-db381e65ff26', N'8d71d13c-9699-4357-9dd1-54f58f08ed1b')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'907c3b65-5270-4f89-9931-501ad8bc2824', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'413b09e8-562d-4cdf-8fe2-412912cb5641')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'91433e68-c2c2-4741-9c3f-bb79a50d2fd5', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'df35f91e-b9d2-40f2-bdd8-5324a7aae195')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'91f5d223-380c-43db-be7a-04deed7c9319', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'ffc9c34b-372c-4b1e-a536-61d6c26cd748')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'950d45a6-47cd-4ac5-b19a-30f0d713e010', N'cd7ad72d-bb52-405c-bb48-bf67bac438f0', N'038967ec-600a-4388-81d6-0ba076d23bb4')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'96782e09-f475-41f0-a3cc-f74ad6609a3c', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'413b09e8-562d-4cdf-8fe2-412912cb5641')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'97f56ecd-7533-45b1-8f27-51222606ae92', N'af6c791b-4009-4321-80f6-b6eb5cdbd939', N'0a45db89-a24e-4754-8a29-86f0c46fe03d')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'98577609-2bff-483e-9f53-aa7ca175c3cb', N'2dbba86d-22ff-4700-bef5-db381e65ff26', N'8d71d13c-9699-4357-9dd1-54f58f08ed1b')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'9d832d0d-f113-4f8d-8782-930129e4edc2', N'aa20e53c-fc7b-4971-aae4-7f5202833ca4', N'0eae0acd-c4ff-408d-899e-157e5cdc0203')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'9d9bc064-35de-4769-a0f4-919841aad7c9', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'413b09e8-562d-4cdf-8fe2-412912cb5641')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'9e39ff60-19c9-4d0f-8121-14d36f9a8de4', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'ffc9c34b-372c-4b1e-a536-61d6c26cd748')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'a0673c75-3c83-476b-9743-35083442eb6a', N'1fadff7d-2c50-4b7d-85c4-3edb1e1a155e', N'3eeac8cc-d03b-44b5-a723-af0623ff949c')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'a09191de-2d66-4d02-a1dd-96a9d401f140', N'c0b6036c-3430-4deb-b221-5dcc2f2c88eb', N'e69685ae-a689-44c3-9e5b-b6eb570f8748')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'a21f72af-5570-4a97-98a7-01a338e48070', N'f59d2626-4e0c-4aa0-8671-0fa7d9d7f1ff', N'dd33d098-5f48-4735-a178-7623d83c6ac8')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'a5034d18-f9f1-4d6c-9c26-c737720e9490', N'c80dfb12-6162-4922-a21f-6db077223b68', N'7143dd4f-e627-4605-bf30-3838ba75a61b')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'a58f6b93-bea5-4115-991a-c7426284924b', N'02a6f4d2-fb8c-42db-ade5-2a66fa992197', N'e667f77e-58ec-43b9-8ca8-7c9f1a006ec9')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'ab77176f-9351-4138-91f7-7cf007e0bcca', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'413b09e8-562d-4cdf-8fe2-412912cb5641')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'ac604412-4d7a-4a3c-b719-8aa9ad6f2233', N'421460af-5c41-47fa-90db-93b28106cb88', N'4cd441c1-eca3-43b6-b2b9-fe61d743d529')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'ae9a370c-3edf-4cb9-8395-bd65bb9c1ead', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656', N'5b7b301a-da46-42b5-a87a-59e10848f033')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'b058110a-b779-4dc1-901e-68835768e51f', N'782bd03e-c290-4891-a1e4-37c6c5159769', N'62887a59-491c-4736-86d3-ce0e604e4133')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'b243a738-4f98-4e2c-a1c8-29cff5bd1b71', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'413b09e8-562d-4cdf-8fe2-412912cb5641')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'bf6e5027-79f0-4428-80f0-681294e4dead', N'cd7ad72d-bb52-405c-bb48-bf67bac438f0', N'038967ec-600a-4388-81d6-0ba076d23bb4')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'c3f90064-709b-4692-b3fc-b5f3bd332db2', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'df35f91e-b9d2-40f2-bdd8-5324a7aae195')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'c4862923-6336-41b3-a00d-1ab5a0a5b9a1', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'ffc9c34b-372c-4b1e-a536-61d6c26cd748')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'c93608f8-cbd5-49c9-86f4-4f47dc6e470e', N'cd7ad72d-bb52-405c-bb48-bf67bac438f0', N'038967ec-600a-4388-81d6-0ba076d23bb4')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'cb591215-9e93-416c-b7a0-ad27341b7641', N'af6c791b-4009-4321-80f6-b6eb5cdbd939', N'0a45db89-a24e-4754-8a29-86f0c46fe03d')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'ce8af29c-e2c1-4b34-bb11-738d367da0ab', N'f90d0e76-8851-4f68-97c3-30dbfa2ae5ef', N'df35f91e-b9d2-40f2-bdd8-5324a7aae195')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'd880ef9a-0a01-4962-a646-9b0fdfc4cde1', N'421460af-5c41-47fa-90db-93b28106cb88', N'4cd441c1-eca3-43b6-b2b9-fe61d743d529')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'dbeea102-195b-4d8d-8fac-ca9cfb1dcb2b', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'413b09e8-562d-4cdf-8fe2-412912cb5641')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'e3c888de-bde0-4d5e-8119-28f46458e3e4', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f', N'e1bb1be3-a158-4ecd-9187-7e194a0a8629')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'e557dc35-354c-4276-a8e7-66c3012ed6a6', N'0e496299-ba26-4270-8ba9-f642c6843a62', N'1883170a-8e08-486d-ad35-a9da87ae7862')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'ea4cf6af-0633-4088-859a-43f496079609', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'ffc9c34b-372c-4b1e-a536-61d6c26cd748')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'ea59ef49-6eeb-4c76-8ba2-248c7eebd078', N'782bd03e-c290-4891-a1e4-37c6c5159769', N'62887a59-491c-4736-86d3-ce0e604e4133')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'eb51dda7-43a5-4ab7-a97f-784668bf4ff2', N'c80dfb12-6162-4922-a21f-6db077223b68', N'7143dd4f-e627-4605-bf30-3838ba75a61b')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'eb968e6a-0701-49f1-acd3-c4e0916d3bb9', N'89de60c9-2a68-4ca6-b33d-5396ae58a656', N'909cbda5-4a1b-4562-a26c-09605281de3a')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'ecd236a8-df49-46ea-907e-165196fe96ca', N'2dbba86d-22ff-4700-bef5-db381e65ff26', N'8d71d13c-9699-4357-9dd1-54f58f08ed1b')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'eea6b849-b46f-417b-a3b0-3e64df3b6599', N'f3391c24-3dd6-441b-8d3b-564fdcd9f656', N'5b7b301a-da46-42b5-a87a-59e10848f033')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f01efbbe-727f-4e64-8c76-8b59b6da88f0', N'cd7ad72d-bb52-405c-bb48-bf67bac438f0', N'038967ec-600a-4388-81d6-0ba076d23bb4')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f218fe94-8bc8-44e9-94e7-40e385b6830d', N'421460af-5c41-47fa-90db-93b28106cb88', N'4cd441c1-eca3-43b6-b2b9-fe61d743d529')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f39978da-fb87-4558-9d93-58bc1d66d8e8', N'421460af-5c41-47fa-90db-93b28106cb88', N'4cd441c1-eca3-43b6-b2b9-fe61d743d529')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f41557e4-5d26-43f2-b55d-c8b6c553c883', N'2dbba86d-22ff-4700-bef5-db381e65ff26', N'8d71d13c-9699-4357-9dd1-54f58f08ed1b')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f4707cc5-d638-4d75-81d9-a06071a05715', N'd642b4fe-ac55-415d-a181-5ea066e35594', N'b510e8c5-3959-4d5e-a48b-d0b175f2b2d7')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f7069faa-1e49-47fb-bde9-6e1e7378aa12', N'4765fdf0-3f70-41e4-a901-7d838c610614', N'c9ba26f5-3c6b-45dd-9879-67f3eac56e17')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f725734a-82ac-4c29-9f6a-eaa8d24aa89e', N'cd7ad72d-bb52-405c-bb48-bf67bac438f0', N'038967ec-600a-4388-81d6-0ba076d23bb4')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f76c61b2-e61a-43f9-9380-166b37d2af1c', N'cd29fdde-13f5-4f1e-a47b-db313dbe504f', N'e1bb1be3-a158-4ecd-9187-7e194a0a8629')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f8588306-6bf6-4f3c-b874-eb8e29c78966', N'b809f6cb-b8e9-46bb-b673-38f7399a1fa6', N'ffc9c34b-372c-4b1e-a536-61d6c26cd748')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'f9576f32-1f2c-4e59-9ac1-040f9183bc69', N'c5a4cba3-870f-4770-98e2-ab998789e168', N'413b09e8-562d-4cdf-8fe2-412912cb5641')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'fb97617a-6ed0-4cfd-aae9-879af5d46fee', N'782bd03e-c290-4891-a1e4-37c6c5159769', N'62887a59-491c-4736-86d3-ce0e604e4133')
GO
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'fbd3ff6d-2ce5-4eb4-84e3-064d188e6b12', N'cd7ad72d-bb52-405c-bb48-bf67bac438f0', N'038967ec-600a-4388-81d6-0ba076d23bb4')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'fd6a6895-3016-4395-baca-02839dccb4de', N'aa20e53c-fc7b-4971-aae4-7f5202833ca4', N'0eae0acd-c4ff-408d-899e-157e5cdc0203')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id]) VALUES (N'ff3f3d49-d5b9-4fd0-a810-0eddd14dbe36', N'd642b4fe-ac55-415d-a181-5ea066e35594', N'b510e8c5-3959-4d5e-a48b-d0b175f2b2d7')
GO
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'038967ec-600a-4388-81d6-0ba076d23bb4', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'04e6d3e9-084f-4cc4-ac56-cf00370cd2e2', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'0a45db89-a24e-4754-8a29-86f0c46fe03d', 100, N'Normal bedroom', 3, N'Normal bathroom', 4, 1, N'Guest ID', 6, 4)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'0eae0acd-c4ff-408d-899e-157e5cdc0203', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'0ed93fba-7e9a-4340-a8f2-5c179038707f', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 5)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'17af024f-307d-4753-9a02-444eefc02966', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'1883170a-8e08-486d-ad35-a9da87ae7862', 100, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'3eeac8cc-d03b-44b5-a723-af0623ff949c', 100, N'Normal bedroom', 3, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'413b09e8-562d-4cdf-8fe2-412912cb5641', 150, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 10, 5)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'4cd441c1-eca3-43b6-b2b9-fe61d743d529', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'5b7b301a-da46-42b5-a87a-59e10848f033', 169, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'5dce17cd-631f-407d-949b-d067d1db09cc', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 0)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'5e332bf6-1f79-451f-90bb-465fedeccd01', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'5f3a37d4-30d8-4846-9b2b-aeb4483ee7b0', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'62887a59-491c-4736-86d3-ce0e604e4133', 100, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'693b45a8-3145-4115-95fb-018c37f1c04e', 110, N'Normal bedroom', 2, N'Normal bathroom', 3, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'6affcf39-5c5c-46dc-acb6-08ce9581ba5b', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'6c98a9a3-6c6e-4fd1-858d-79e950ce31f6', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'7143dd4f-e627-4605-bf30-3838ba75a61b', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'7eea8952-965f-4f60-9526-fe3950927b24', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'89e42a55-e313-4beb-9032-8ecae0c7b277', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'8d71d13c-9699-4357-9dd1-54f58f08ed1b', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'909cbda5-4a1b-4562-a26c-09605281de3a', 112, N'Normal bedroom', 2, N'Normal bathroom', 1, 1, N'Guest ID', 4, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'ae8ed5b3-ce86-4f4f-96ac-42fb86098e1f', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'b510e8c5-3959-4d5e-a48b-d0b175f2b2d7', 98, N'Normal bedroom', 3, N'Normal bathroom', 1, 1, N'Guest ID', 1, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'c2c658a3-d7b3-47b3-969e-3605440ab17e', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'c41ea8b1-3386-4e82-8280-08bd07bf17d4', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'c524413c-d9f2-4dbc-8c1a-c0796bbf49a3', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'c9ba26f5-3c6b-45dd-9879-67f3eac56e17', 100, N'Normal bedroom', 4, N'Normal bathroom', 1, 1, N'Guest ID', 2, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'da5ddda7-ca76-4fa3-98f2-e5d48674e2af', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'dd33d098-5f48-4735-a178-7623d83c6ac8', 100, N'Normal bedroom', 3, N'Normal bathroom', 2, 1, N'Guest ID', 3, 3)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'dda2c8cb-e7c6-4304-b255-89bf7b59881b', 100, N'Normal bedroom', 2, N'Normal bathroom', 2, 1, N'Guest ID', 11, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'df35f91e-b9d2-40f2-bdd8-5324a7aae195', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'e1bb1be3-a158-4ecd-9187-7e194a0a8629', 169, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'e667f77e-58ec-43b9-8ca8-7c9f1a006ec9', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'e69685ae-a689-44c3-9e5b-b6eb570f8748', 100, N'Normal bedroom', 6, N'Normal bathroom', 1, 0, N'Guest ID', 1, 2)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'ed77c49e-2b67-49b2-b48f-2490a30e6337', 100, N'Normal bedroom', 2, N'Normal bathroom', 1, 0, N'Guest ID', 2, 1)
INSERT [dbo].[RoomType] ([id], [price], [bed_type], [bed_number], [bathroom_type], [bathroom_number], [is_private_bathroom], [guests_id], [number_of_guests], [number_of_room]) VALUES (N'ffc9c34b-372c-4b1e-a536-61d6c26cd748', 90, N'Normal bedroom', 6, N'Normal bathroom', 1, 1, N'Guest ID', 3, 2)
GO
INSERT [dbo].[userDetail] ([user_id], [username], [user_password], [email], [phone], [name], [avatar], [role], [ggid], [whislist_id], [self_description], [salt], [account_number], [subname], [dob]) VALUES (N'123', N'sa', N'123', N'123', N'123', N'123', N'123', 123, N'123', N'123', N'123', N'123', NULL, NULL, NULL)
INSERT [dbo].[userDetail] ([user_id], [username], [user_password], [email], [phone], [name], [avatar], [role], [ggid], [whislist_id], [self_description], [salt], [account_number], [subname], [dob]) VALUES (N'9ad6286d-d08d-4397-8704-b8a1aff07309', N'duc', N'hck/iR1by2E1Tx3fjs/Jux05xR471uvfRDOiNV2tI/s=', N'duc@gmail.com', N'12312512556', N'Duc4', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/users/null', 1, NULL, NULL, N'asdasdasdasdasd', N'zL4M79NfLg0Yvi245WS9HRrdwvG7aT', N'7126381212836919283', N'Le Quy DD', CAST(N'2002-07-24' AS Date))
INSERT [dbo].[userDetail] ([user_id], [username], [user_password], [email], [phone], [name], [avatar], [role], [ggid], [whislist_id], [self_description], [salt], [account_number], [subname], [dob]) VALUES (N'b955c796-027c-4e11-92ff-1bb942a102c8', N'leduc123', N'OZPJVZpFYQaxVkd8frspwDibUzmbAW8iuZbKnnPeM0o=', N'duc@gmail.com', N'890896756756', N'Duc', N'D:/netbeanJavaWeb/testUpload/src/main/webapp/images/users/null', NULL, NULL, NULL, N'Day la le duc tesst', N'gKkg5S8AFzQ2SOm2s6m4EcllaQQgMJ', NULL, N'Le', CAST(N'2002-07-24' AS Date))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__userDeta__F3DBC5728063A8EA]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_getAllHotelBasicInfor]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_getAllHotelBasicInforByAmenityId]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_getAllHotelBasicInforByHotelType]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_getDefaultAmenities]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_getHotelAmenities]    Script Date: 11/2/2022 10:30:53 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_getRoomType]    Script Date: 11/2/2022 10:30:53 PM ******/
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
