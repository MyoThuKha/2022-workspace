export const getStaticPaths = async () => {
  const res = await fetch("https://jsonplaceholder.typicode.com/users");
  const data = res.json();

  const paths = data.map((each) => {
    return {
      params: {
        id: each.id.toString(),
      },
    };
  });
  return {
    paths,
    fallback: false,
  };
};
const Detail = () => {
  return (
    <div>
      <h1>Detail</h1>
    </div>
  );
};

export default Detail;
