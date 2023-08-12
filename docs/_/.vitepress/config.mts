import { defineConfig } from "vitepress";
import nav from "./nav";
import sidebar from "./sidebar";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Stack",
  description: "Fucking Learning",
  lastUpdated: true,
  cleanUrls: true,
  srcDir: "./src",
  base: "/stack/",
  themeConfig: {
    outline: "deep",
    externalLinkIcon: true,
    editLink: {
      pattern: "https://github.com/instant-crush/stack/main/docs/_/:path",
    },
    search: {
      provider: "local",
    },
    footer: {
      message:
        'powered by <a target="_blank" href="https://vitepress.dev">VitePress</a>',
    },
    socialLinks: [
      {
        icon: "github",
        link: "https://github.com/instant-crush/stack",
      },
    ],
    nav,
    sidebar,
  },
});
