import { Grid, Box } from '@mui/material';
import hotelStyles from './Hotel.module.scss';
import { Album } from './components';
import { images, room } from './datas';
import Booking from './components/Booking';
import HotelInfo from "./components/HotelInfo";

function Hotel() {
  const backgroundImage =
    "photo/so-dien-thoai-le-tan-dat-phong-vinpearl-nam-hoi-an-1.jpg";

    return (  
        <div id={hotelStyles['hotel']}>
            <Grid container justifyContent={'center'}>
                <Grid item xs={10} >
                    <Album backgroundImage={backgroundImage} images={images}/>
                    <Box sx={{
                        marginTop: '2em',
                        position: 'relative',
                        display: 'flex',
                        gap: '0.6em'
                    }}>
                        <div className={hotelStyles['left']}>
                        <HotelInfo />
                            {/* Hotel Information */}
                        </div>
                        <div className={hotelStyles['right']}>
                            {/* Booking Form */}
                            <Booking room={room}/>
                        </div>
                    </Box>
                </Grid>
            </Grid>
        </div>
    );
}

export default Hotel;
