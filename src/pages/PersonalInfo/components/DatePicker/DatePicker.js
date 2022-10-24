import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import DatePickerStyle from "./DatePicker.module.scss";

function PersonalInput({ name, value, onChange, labelContent, readOnly }) {
  const newValue = value ? value.split("/").reverse().join("-") : "";

  return (
    <span
      className={
        !readOnly
          ? DatePickerStyle["input-field"]
          : DatePickerStyle["input-field-readOnly"]
      }
    >
      {/* Subname ------------------------------- */}
      <input
        spellCheck="false"
        type="date"
        placeholder="dd/mm/yyyy"
        name={name}
        value={newValue}
        className={
          !readOnly
            ? DatePickerStyle["input-update"]
            : DatePickerStyle["input-update-readOnly"]
        }
        onChange={onChange}
        readOnly={readOnly}
      />

      <label className={DatePickerStyle["input-label"]} htmlFor={name}>
        {labelContent}
      </label>
    </span>
  );
}

export default PersonalInput;
