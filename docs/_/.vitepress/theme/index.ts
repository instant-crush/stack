import DefaultTheme from 'vitepress/theme'

import MermaidComp from './components/MermaidComp.vue'
import './index.css'

export default {
  extends: DefaultTheme,
  enhanceApp(ctx) {
    ctx.app.component('MermaidComp', MermaidComp)
  },
}
