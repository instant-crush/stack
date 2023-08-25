<script lang="ts" setup>
import mermaid from 'mermaid'
import { useData } from 'vitepress'
import { onMounted, onUpdated, ref, watch } from 'vue'

const { isDark } = useData()

const getThemeMode = () => localStorage.getItem('vitepress-theme-appearance')
const themeMode = ref<String | null>(getThemeMode())

watch(isDark, () => (themeMode.value = getThemeMode()), { immediate: true })
const _render = async () => {
  mermaid.initialize({
    startOnLoad: true,
    theme: themeMode.value === 'dark' ? 'dark' : 'neutral',
    securityLevel: 'loose',
  })
  await mermaid.run()
}
onMounted(async () => await _render())
onUpdated(async () => await _render())

const props = defineProps<{ code: String }>()
</script>
<template>
  <div class="overflow-auto">
    <pre v-if="themeMode === 'dark'" class="mermaid">{{ props.code }}</pre>
    <pre v-else class="mermaid">{{ props.code }}</pre>
  </div>
</template>
