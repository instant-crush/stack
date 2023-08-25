import { addDynamicIconSelectors } from '@iconify/tailwind'
import type { Config } from 'tailwindcss'

export default {
  content: ['./.vitepress/theme/**/*', './.vitepress/config.mts', 'src/**/*'],
  darkMode: 'class',
  theme: {
    extend: {
      zIndex: {
        60: '60',
      },
    },
  },
  plugins: [addDynamicIconSelectors()],
} satisfies Config
