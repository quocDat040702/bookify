import ReportStyle from "./Report.module.scss";
import Box from "@mui/material/Box";
import Grid from "@mui/material/Grid";
import { useNavigate } from "react-router-dom";

function Report({ reportData = [] }) {
  const navigate = useNavigate();
  return (
    <div className={ReportStyle["wrap-report"]}>
      <h3 className={ReportStyle["header-title"]}>Báo cáo gần đây</h3>
      <Box sx={{ flexGrow: 1 }}>
        <Grid container spacing={1}>
          {reportData?.map((data, index) => {
            return (
              <Grid item xs={12} md={6} key={index}>
                <div className={ReportStyle["card"]}>
                  <div className={ReportStyle["card-avatar"]}>
                    <div className={ReportStyle["avatar-wrapper"]}>
                      <img
                        src={data.avatar}
                        alt="avatar"
                        height={30}
                        width={30}
                      />
                    </div>
                  </div>
                  <div className={ReportStyle["card-body"]}>
                    <div className={ReportStyle["card-title"]}>
                      <h4>{data.reportOwner}</h4>
                      <h6>{data.hotel}</h6>

                      {/* Onclick navigate in later --------------------------------------------------------- */}
                      {/* <h6 onClick={() => navigate(data.hotelId)}>
                        Khách sạn Vinpearl Nam Hội An
                      </h6> */}
                    </div>
                    <div className={ReportStyle["card-content"]}>
                      <p>{data.content}</p>
                    </div>
                    <div className={ReportStyle["card-time"]}>
                      <p>{data.reportTime}</p>
                    </div>
                  </div>
                </div>
              </Grid>
            );
          })}
        </Grid>
      </Box>
    </div>
  );
}

export default Report;
