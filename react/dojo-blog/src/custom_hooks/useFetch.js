import { useState, useEffect } from "react";

const useFetch = (url) => {
  const [data, setData] = useState(null);
  const [pending, setPending] = useState(true);
  const [errText, setErrText] = useState(null);
  useEffect(() => {
    //dont change state here, will run infinite loop
    const abortCtrl = new AbortController();
    setTimeout(() => {
      fetch(url, { signal: abortCtrl.signal })
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
          if (err.name === "AbortError") {
            console.log("Fetching Aborted");
          } else {
            setErrText(err.message);
            setPending(false);
          }
        });
    }, 1000);
    return () => {
      abortCtrl.abort();
    };
    //run only when url change
  }, [url]);
  return { data, pending, errText };
};

export default useFetch;
