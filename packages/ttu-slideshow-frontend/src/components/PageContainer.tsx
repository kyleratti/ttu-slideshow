import * as React from "react";

const PageContainer: React.FC = ({ children }) => (
  <div className="wrapper">
    <div className="page-container">{children}</div>
  </div>
);

export default PageContainer;
