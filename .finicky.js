module.exports = {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: ({ opener }) => opener.bundleId === "com.tinyspeck.slackmacgap",
      browser: "Firefox Developer Edition",
    },
  ],
};
