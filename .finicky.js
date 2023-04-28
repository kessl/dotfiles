module.exports = {
  // open links in Firefox by default
  defaultBrowser: "Firefox",

  // open dev links in Firefox Developer Edition
  handlers: [
    {
      match: ({ opener }) => opener.bundleId === "com.tinyspeck.slackmacgap",
      browser: "Firefox Developer Edition",
    },
    {
      match: ({ opener }) => opener.bundleId === "com.apple.Terminal",
      browser: "Firefox Developer Edition",
    },
    {
      match: ["http://127.0.0.1*"],
      browser: "Firefox Developer Edition"
    },
  ],
};
