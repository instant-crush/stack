<script setup lang="ts">
import { nanoid } from 'nanoid'
import { ref } from 'vue'

const data = ref([
  { id: nanoid(), _: ['uni-', 'mono-'], meaning: '1' },
  { id: nanoid(), _: ['prim-', 'primo-'], meaning: '1th' },
  { id: nanoid(), _: ['du-'], meaning: '2' },
  { id: nanoid(), _: ['bi-', 'bin-'], meaning: '2, twice' },
  { id: nanoid(), _: ['second-'], meaning: '2th' },
  { id: nanoid(), _: ['tri-'], meaning: '3' },
  { id: nanoid(), _: ['terti-'], meaning: '3th' },
  { id: nanoid(), _: ['quadr-', 'quadru-', 'thera-'], meaning: '4' },
  { id: nanoid(), _: ['quart-'], meaning: '4th' },
  { id: nanoid(), _: ['quint-', 'quinque-', 'penta-'], meaning: '5, 5th' },
  { id: nanoid(), _: ['sex-', 'sext-', 'hexa-'], meaning: '6, 6th' },
  { id: nanoid(), _: ['sept-', 'septem-', 'hepta-'], meaning: '7' },
  { id: nanoid(), _: ['oct-', 'octo-', 'octav-'], meaning: '8' },
  { id: nanoid(), _: ['novem-', 'ennea-'], meaning: '9' },
  { id: nanoid(), _: ['non-'], meaning: '9th' },
  { id: nanoid(), _: ['deca-', 'decem-'], meaning: '10' },
  { id: nanoid(), _: ['decim-'], meaning: '10th' },
  { id: nanoid(), _: ['cent-', 'hecato-'], meaning: '100' },
  { id: nanoid(), _: ['mill-', 'kilo-'], meaning: '1000' },
  { id: nanoid(), _: ['sesqui-'], meaning: '1/2' },
  { id: nanoid(), _: ['myriad-'], meaning: '1,000' },
  { id: nanoid(), _: ['demi-', 'hemi-', 'semi-'], meaning: '1/2' },
  { id: nanoid(), _: ['mega-'], meaning: '1,000,000' },
])
const curr = ref<number>(Number.MIN_SAFE_INTEGER)
const tmp = new Array(100)
  .fill(null)
  .map(() => Math.random().toFixed(Math.round(Math.random() * 10)))
const tmp2 = new Array(100)
  .fill(null)
  .map(() => Math.round(Math.random() * 100))
const click = (k: number) => {
  curr.value === k ? (curr.value = Number.MIN_SAFE_INTEGER) : (curr.value = k)
}
</script>
<template>
  <div
    class="gap-1 sm:columns-1 md:columns-2 lg:columns-3 xl:columns-4 2xl:columns-5"
  >
    <div
      v-for="(v, k) of data"
      :key="v.id"
      :class="[
        'mb-1 max-h-96 w-full cursor-pointer break-inside-avoid-column overflow-auto rounded-lg border-2 border-slate-200 p-2 text-center dark:border-slate-700',
        curr === k ? 'shadow-inner shadow-blue-200 dark:shadow-blue-700' : '',
      ]"
      @click="click(k)"
    >
      <span
        v-show="curr === k"
        class="text-violet-500 transition-all duration-300 ease-in-out dark:text-violet-400"
        >{{ v.meaning }}</span
      >
      <div
        v-show="curr !== k"
        class="flex flex-col transition-all duration-300 ease-in-out"
      >
        <span v-for="(vv, kk) of v._" :key="`${v.id}${kk}`">{{ vv }}</span>
      </div>
    </div>
  </div>
</template>
