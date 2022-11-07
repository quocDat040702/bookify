import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import CheckOutInfoStyle from "./CheckOutInfo.module.scss";
import { BookingContext, ToastMessageContext, UserContext } from "@/utils/contexts";
import { useContext, useMemo, useState } from "react";
import { useClsx, useFormatDate } from "@/utils/hooks";
import { differenceInDays } from "date-fns";
import { useOutletContext, useNavigate } from "react-router-dom";
import { DatePicker } from "@/components";
import { getAmount } from "@/services/user";
import bookingRoom from "@/services/hotel/bookingRoom";
import { getSuccessToastMessage } from "@/utils/reducers/toastMessageReducer";

function CheckOutInfo() {
    const { selectDays, setSelectedDays, guests, setGuests } =
        useContext(BookingContext);
    const { user } = useContext(UserContext);
    const { setToastMessages } = useContext(ToastMessageContext);
    const { user_id } = user;
    const [error, setError] = useState();
    const hotelInfo = useOutletContext();
    const navigate = useNavigate();
    const { roomType } = hotelInfo;
    const price = useMemo(
        () =>
            differenceInDays(selectDays.to, selectDays.from) * roomType?.price,
        [selectDays, roomType]
    );
    const guestNumber = useMemo(
        () =>
            Object.keys(guests).reduce((prev, key) =>
                key !== "pet" ? prev + guests[key] : prev
            , 0),
        [guests]
    );

    const handleBookingPayment = async (e) => {
        if (!user?.bankingAccountNumber) {
            setError("Bạn chưa liên kết tài khoản thanh toán nào");
            return;
        }
        const userAmount = await getAmount(user_id).then((data) => data);
        if (isNaN(userAmount?.amount) || userAmount.amount < price) {
            setError("Số dư của bạn không đủ để thực hiện giao dịch này");
            return;
        } else {
            setError('');
            const data = await bookingRoom(selectDays, guests, user_id, hotelInfo.hotelId).then(data => data);
            if (data?.status === 'ok') {
                navigate(-1);
                setToastMessages(
                    getSuccessToastMessage({
                        message: "Đặt phòng thành công",
                    })
                );
            }
        }
    };
    return (
        <div>
            <h1 className={CheckOutInfoStyle["Check-out-title"]}>
                <button
                    className={CheckOutInfoStyle["back-button"]}
                    onClick={() => navigate(-1)}
                >
                    <FontAwesomeIcon icon={faChevronLeft} />
                </button>{" "}
                Thanh toán đặt phòng
            </h1>
            <div>
                <h3 className={CheckOutInfoStyle["form-title"]}>
                    Chuyến đi của bạn
                </h3>
                <div>
                    <div className={CheckOutInfoStyle["basic-info"]}>
                        <div>
                            <div className={CheckOutInfoStyle["info-header"]}>
                                <h4>Thời điểm</h4>
                                <button
                                    className={CheckOutInfoStyle["info-alter"]}
                                >
                                    Chỉnh sửa
                                </button>
                            </div>
                            <div className={CheckOutInfoStyle["info-detail"]}>
                                <p>
                                    {useFormatDate(selectDays.from)} -{" "}
                                    {useFormatDate(selectDays.to)}
                                </p>
                            </div>
                        </div>
                        <div>
                            <div className={CheckOutInfoStyle["info-header"]}>
                                <h4>Số người</h4>
                                <button
                                    className={CheckOutInfoStyle["info-alter"]}
                                >
                                    Chỉnh sửa
                                </button>
                            </div>
                            <div className={CheckOutInfoStyle["info-detail"]}>
                                <p>{guestNumber} người</p>
                            </div>
                        </div>
                    </div>
                    <div>
                        <h4 className={CheckOutInfoStyle["pay-title"]}>
                            Trả với
                        </h4>
                        <div className={CheckOutInfoStyle["select-wrapper"]}>
                            <select
                                name=""
                                id=""
                                className={CheckOutInfoStyle["select-box"]}
                            >
                                <option value="">****-9123</option>
                                <option value="">****-9123</option>
                                <option value="">****-9123</option>
                            </select>
                        </div>
                        <h4 className={CheckOutInfoStyle['error-label']}>
                          {error}
                        </h4>
                    </div>
                </div>
            </div>
            <div className={CheckOutInfoStyle["res-payment"]}>
                <div className={CheckOutInfoStyle["money-amount"]}>
                    <h4>Tổng tiền phải trả</h4>
                    <h4>${price}</h4>
                </div>
                <button
                    className={useClsx(
                      CheckOutInfoStyle["sub-payment-btn"],
                      error && CheckOutInfoStyle['inactive']
                    )}
                    onClick={handleBookingPayment}
                >
                    Thanh Toán
                </button>
            </div>
        </div>
    );
}

export default CheckOutInfo;
