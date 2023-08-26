import markdownItImsize from 'markdown-it-imsize'
import markdownItTaskLists from 'markdown-it-task-lists'
import { defineConfig } from 'vitepress'

import postcss from '../postcss.config'
import nav from './nav'
import sidebar from './sidebar'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: 'Stack',
  description: 'Fucking Learning',
  lastUpdated: true,
  cleanUrls: true,
  srcDir: './src',
  base: '/stack/',
  markdown: {
    theme: {
      light: 'github-light',
      dark: 'github-dark',
    },
    lineNumbers: true,
    config: (md) => {
      md.use(markdownItImsize)
      md.use(markdownItTaskLists)
    },
  },
  vite: {
    css: {
      postcss,
    },
  },
  head: [['link', { rel: 'icon', href: '/stack/favicon.ico' }]],
  themeConfig: {
    outline: 'deep',
    externalLinkIcon: true,
    editLink: {
      pattern:
        'https://github.com/instant-crush/stack/blob/main/docs/_/src/:path',
    },
    search: {
      provider: 'local',
    },
    footer: {
      message:
        'Released under the MIT License.<br />Copyright © 2023-PRESENT  <a class="hover:text-transparent hover:bg-clip-text hover:bg-gradient-to-r hover:from-slate-500 hover:via-slate-400 hover:to-slate-500" target="_blank" href="https://github.com/howlwindy">howlwindy</a>',
      // message:
      //   'powered by <a target="_blank" href="https://vitepress.dev">VitePress</a>',
    },
    socialLinks: [
      {
        icon: 'github',
        link: 'https://github.com/instant-crush/stack',
      },
    ],
    nav,
    sidebar,
  },
})
