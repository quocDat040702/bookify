import ProfileCard from "./components/card";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";
import {
  faIdCard,
  faShield,
  faMoneyBills,
  faSliders,
  faHistory,
} from "@fortawesome/free-solid-svg-icons";
import profileStyle from "./Profile.module.scss";
import { useMemo, useEffect } from "react";

const account = {
  name: "Le Duc",
  email: "duc@gmail.com",
};

function Profile() {
  useEffect(() => {
    document.title = "Profile";
  }, []);

  const options = useMemo(
    () => [
      {
        icon: faIdCard,
        title: "Thông tin cá nhân",
        description: "Cung cấp thông tin cá nhân cần thiết của bạn",
        path: "info",
      },
      {
        icon: faShield,
        title: "Đăng nhập và bảo mật",
        description: "Cập nhật mật khẩu và bảo mật tài khoản của bạn",
        path: "loginandsecurity",
      },
      {
        icon: faMoneyBills,
        title: "Thanh toán và chi trả",
        description:
          "Tìm hiểu lại các khoản thanh toán, chi trả, phiếu giảm giá, thẻ quà tặng",

        path: "/payment",
      },
      {
        icon: faSliders,
        title: "Lựa chọn chung",
        description: "Cài đặt ngôn ngữ, loại tiền tệ mặc định của bạn",
      },
      {
        icon: faHistory,
        title: "Lịch sử đặt phòng",
        description: "Xem lịch sử các phòng bạn đã đặt hay hủy bỏ",
        path: "history",
      },
    ],
    []
  );

  return (
    <div className={profileStyle["container"]}>
      <h1 className={profileStyle["account"]}>Tài Khoản</h1>
      <h4 className={profileStyle["commonInfo"]}>
        {account.name}, {account.email}{" "}
        <a href="https://www.nettruyenme.com/truyen-tranh/tro-choi-cua-chua-thuong/chap-1/902267">
          Thay đổi hồ sơ
        </a>
      </h4>
      <Box sx={{ flexGrow: 1 }}>
        <Grid container spacing={4}>
          {options.map((option, index) => {
            return (
              <Grid item xs={12} md={4} key={index}>
                <ProfileCard
                  title={option.title}
                  icon={option.icon}
                  description={option.description}
                  path={option.path}
                />
              </Grid>
            );
          })}
        </Grid>
      </Box>
    </div>
  );
}

export default Profile;
