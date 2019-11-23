import * as React from "react";
import { useEffect } from "react";

type Props = {
  imageName: string;
  index: number;
  active?: boolean;
};

const Slide: React.FC<Props> = ({ imageName, index, active = false }) => {
  useEffect(() => {}, [active]);

  return (
    <div className={"slide " + (active ? "active" : "inactive")}>
      <label>{index + 1}</label>
      <img
        src={`http://${process.env.API_SERVER}/img/${imageName}`}
        alt="Automatically loaded image"
        decoding="async"
      />
    </div>
  );
};

export default Slide;
