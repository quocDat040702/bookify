import "./_global.scss";
import { useEffect, useMemo, useReducer, useState } from "react";
import {
  ModalContext,
  UserContext,
  CoordinatesContext,
} from "@/utils/contexts";
import { reducer } from "./utils/reducers/modalReducer";
import { Modal } from "./components";

const initState = {
  isOpen: false,
  isOverlay: false,
};

const user = {
  id: "",
  username: "",
  wallet_amount: 0,
  avatar: "",
};

function App({ children }) {
  const [modalState, dispatch] = useReducer(reducer, initState);
  const [isLogin, setLogin] = useState(true);
  const [currentCoordinates, setCurrentCoordinates] = useState();

  const modal = useMemo(() => {
    return {
      modalState,
      dispatch,
    };
  }, [modalState]);

  const userModifier = useMemo(() => {
    return {
      user,
      isLogin,
      setLogin,
    };
  }, [isLogin]);

  useEffect(() => {
    const nav = navigator.geolocation;
    nav.getCurrentPosition((pos) => {
      if (pos) {
        const { latitude, longitude } = pos?.coords;

        setCurrentCoordinates({
          latitude,
          longitude,
        });
      }
    });
  }, []);

  return (
    <CoordinatesContext.Provider value={currentCoordinates}>
      <UserContext.Provider value={userModifier}>
        <ModalContext.Provider value={modal}>
          <div className="App">
            {children}
            {modalState.isOpen && (
              <div className="overlay">
                <Modal>{modalState.renderModal()}</Modal>
              </div>
            )}
          </div>
        </ModalContext.Provider>
      </UserContext.Provider>
    </CoordinatesContext.Provider>
  );
}

export default App;
