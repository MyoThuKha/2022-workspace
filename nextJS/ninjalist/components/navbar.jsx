import Link from "next/link";
const NavBar = () => {
  return (
    <nav>
      <div className="logo">Next js</div>
      <Link href="/">
        <a>Home</a>
      </Link>
      <Link href="/about">
        <a>About</a>
      </Link>
      <Link href="/ninjas/test">
        <a>Ninja List</a>
      </Link>
    </nav>
  );
};

export default NavBar;
