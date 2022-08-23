export const getStaticPaths = async () => {
  const res = await fetch("https://jsonplaceholder.typicode.com/users");
  const data = await res.json();

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

export const getStaticProps = async (context) => {
  const id = context.params.id;
  console.log(id);
  const res = await fetch("https://jsonplaceholder.typicode.com/users/" + id);
  const data = await res.json();
  return {
    props: { data },
  };
};

const Detail = ({ data }) => {
  return (
    <div>
      <h1>{data.name}</h1>
      <div>{data.email}</div>
      <div>
        {data.address.street} St, {data.address.city}
      </div>
    </div>
  );
};

export default Detail;
