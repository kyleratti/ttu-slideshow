import * as React from "react";

const Settings: React.FC = () => {
  return (
    <div id="settings" className="no-fullscreen">
      <h1>Settings</h1>

      <div>Coming soon{<>&trade;</>} - intervals and more</div>

      <div>
        Tip: Press <code>F11</code> to toggle fullscreen mode
      </div>
    </div>
  );
};

export default Settings;
