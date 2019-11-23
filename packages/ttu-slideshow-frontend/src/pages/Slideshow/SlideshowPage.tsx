import * as React from "react";
import PageContainer from "@/components/PageContainer";
import Settings from "@/components/Settings";
import Slideshow from "@/components/Slideshow";

const SlideshowPage: React.FC = () => (
  <PageContainer>
    <Settings />

    <Slideshow />
  </PageContainer>
);

export default SlideshowPage;
