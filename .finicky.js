module.exports = {
  defaultBrowser: "Firefox",
  handlers: [
    {
      // open links from Slack in Firefox Developer Edition
      match: ({ opener }) => opener.bundleId === "com.tinyspeck.slackmacgap",
      browser: "Firefox Developer Edition",
    },
    {
      // open links from iTerm in Firefox Developer Edition
      match: ({ opener }) => opener.bundleId === "com.googlecode.iterm2",
      browser: "Firefox Developer Edition",
    },
    {
      // open localhost links in Firefox Developer Edition
      match: ["http://127.0.0.1*"],
      browser: "Firefox Developer Edition"
    },
  ],
};
