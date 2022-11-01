import SingleLineChart from "@/components/Chart/SingleLineChart";
import {
  TransactionDataYear,
  TransactionDataYears,
  getYearExchange,
  getYearsExchange,
} from "../AllService";
import YearPicker from "./YearPicker";
import { useState, useMemo } from "react";
import ChartStyle from "../Exchange.module.scss";
function Chart() {
  const [year, setYear] = useState(2022);
  const [select, setSelect] = useState("months");
  let transYearNumber = useMemo(() => TransactionDataYear(year), [year]);
  let transYearsNumber = useMemo(() => TransactionDataYears(), []);
  let transYear = useMemo(() => getYearExchange(year), [year]);
  let transYears = useMemo(() => getYearsExchange(), []);

  const handleChange = (e) => {
    setSelect(e.target.value);
    console.log(select);
  };
  const yearChanging = (data) => {
    setYear(data);
  };

  return (
    <div className={ChartStyle["chart"]}>
      <div className={ChartStyle["chart-header"]}>
        <input
          type="radio"
          id="year"
          name="chart"
          onChange={handleChange}
          value="months"
          checked={select === "months"}
        />
        <label htmlFor="year">Theo tháng</label>
        <input
          type="radio"
          id="years"
          name="chart"
          onChange={handleChange}
          value="years"
        />
        <label htmlFor="years">Theo năm</label>

        {select === "months" ? (
          <h2>${transYear}.00</h2>
        ) : (
          <h2>${transYears}.00</h2>
        )}
        {select === "months" ? (
          <b>Thu được trong năm {year}</b>
        ) : (
          <b>Tổng thu nhập</b>
        )}
      </div>
      <div className={ChartStyle["chart-body"]}>
        {select === "months" ? (
          <>
            <SingleLineChart
              label={"Tổng tiền giao dịch"}
              labels={transYearNumber.month}
              data={transYearNumber.transNumber}
              isY={false}
              color={"#f72585"}
            />
            <div className={ChartStyle["month-picker"]}>
              <YearPicker yearChanging={yearChanging} />
            </div>
          </>
        ) : (
          <>
            <SingleLineChart
              label={"Tổng tiền giao dịch"}
              labels={transYearsNumber.year}
              data={transYearsNumber.transNumber}
              isY={false}
              color={"#f72585"}
            />
          </>
        )}
      </div>
    </div>
  );
}
export default Chart;
