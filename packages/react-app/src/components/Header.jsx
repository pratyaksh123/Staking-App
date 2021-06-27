import React from "react";
import { PageHeader } from "antd";

export default function Header() {
  return (
    <a href="/" /*target="_blank" rel="noopener noreferrer"*/>
      <PageHeader
        title="Staking App"
        subTitle="Decentralised staker"
        style={{ cursor: "pointer" }}
      />
    </a>
  );
}
