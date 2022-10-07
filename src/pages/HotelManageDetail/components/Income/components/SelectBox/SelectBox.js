import { useState } from "react";
import SelectBoxStyle from "./SelectBox.module.scss";

const months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

const monthsKey = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
];

function SelectBox({ onChangeMonth }) {
  const [month, setMonth] = useState("");

  const monthSelect = (e) => {
    setMonth(e.target.value);
    onChangeMonth(e.target.value);
  };

  return (
    <div className={SelectBoxStyle["select-wrapper"]}>
      <label htmlFor="months" className={SelectBoxStyle["months-label"]}>
        Chọn một tháng để xem doanh thu
      </label>
      <div className={SelectBoxStyle["styled-select"]}>
        <select
          name="months"
          id="months"
          onChange={monthSelect}
          className={SelectBoxStyle["months"]}
        >
          <option value="">Chọn một tháng</option>
          {months.map((data, index) => {
            return (
              <option value={monthsKey[index]} key={index}>
                {data}
              </option>
            );
          })}
        </select>
      </div>
    </div>
  );
}

export default SelectBox;
