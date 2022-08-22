import Link from "next/link";
import Image from "next/image";

const NavBar = () => {
  return (
    <nav>
      <div className="logo">
        <Image src="/logo.png" alt="logo" width={60} height={40} />
      </div>
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
