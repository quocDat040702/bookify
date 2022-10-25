import { faStar } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";
import PointStyle from "./Point.module.scss";
import { useMemo } from "react";

function Point() {
  const points = useMemo(
    () => [
      {
        point_name: "Mức độ chính xác",
        point: 3,
      },
      {
        point_name: "Giá trị",
        point: 4,
      },
      {
        point_name: "Mức độ sạch sẽ",
        point: 5,
      },
      {
        point_name: "Phục vụ",
        point: 5,
      },
    ],
    []
  );
  return (
    <div className={PointStyle["rating-container"]}>
      <Box sx={{ flexGrow: 1 }}>
        <Grid container spacing={1} columnSpacing={{ xs: 5, sm: 2, md: 10 }}>
          {points.map((item, index) => {
            return (
              <Grid item xs={12} md={6} key={index}>
                <div className={PointStyle["item"]}>
                  <p className={PointStyle["rating-title"]}>
                    {item.point_name}
                  </p>
                  <div className={PointStyle["progress-container"]}>
                    <div className={PointStyle["progress"]}>
                      <div
                        className={PointStyle["bar"]}
                        style={{ width: `${(item.point / 5) * 100}%` }}
                      ></div>
                    </div>
                  </div>
                  <p className={PointStyle["rating-point"]}>{item.point}</p>
                </div>
              </Grid>
            );
          })}
        </Grid>
      </Box>
    </div>
  );
}

export default Point;
