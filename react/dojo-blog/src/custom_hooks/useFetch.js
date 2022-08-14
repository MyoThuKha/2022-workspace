import { useState, useEffect } from "react";

const useFetch = (url) => {
  const [data, setData] = useState(null);
  const [pending, setPending] = useState(true);
  const [errText, setErrText] = useState(null);
  useEffect(() => {
    //dont change state here, will run infinite loop
    fetch(url)
      .then((res) => {
        //if data not exist
        if (res.status !== 200) {
          throw Error("wrong fetch");
        }
        return res.json();
      })
      .then((data) => {
        setData(data);
        setPending(false);
      })
      .catch((err) => {
        setErrText(err.message);
      });
    //run only when url change
  }, [url]);
  return { data, pending, errText };
};

export default useFetch;
