use bookify 

select * from Hotel
select * from Image where hotel_id = 'fe1f3fd7-6b6f-4450-b8c5-9f1ccee123a9'
select * from Amenity

-- proc get amenities
create or alter procedure proc_getHotelAmenities
@hotelId varchar(50)
as
begin
	select * 
	from 
		HotelAmenities join Amenity 
		on HotelAmenities.amenity_id = Amenity.amenity_id
		join Amenity_type 
		on Amenity.type_id = Amenity_type.amenity_type_id
end

proc_getHotelAmenities @hotelId = 'fe1f3fd7-6b6f-4450-b8c5-9f1ccee123a9'
