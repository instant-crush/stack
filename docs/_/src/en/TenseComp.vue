<script setup lang="ts">
import { nanoid } from 'nanoid'
import { computed, ref, watch } from 'vue'

const detailsOpend = ref(false)
const heads = ref([
  'times/states',
  'past',
  'present',
  'future',
  'future in past',
])
const data = ref({
  simple: [
    [
      [
        { rule: 'S + was/were + N', eg: 'I was a developer.' },
        { rule: 'S + V2', eg: 'I developed apps.' },
      ],
      [
        { rule: 'S + was/were not + N', eg: 'I was not a developer.' },
        { rule: 'S + did not + V1', eg: 'I did not develop apps.' },
      ],
      [
        { rule: 'Was/Were + S + N + ?', eg: 'Were you a developer?' },
        { rule: 'Did + S + V1 + ?', eg: 'Did you develop apps?' },
      ],
    ],
    [
      [
        { rule: 'S + am/is/are + N', eg: 'I am a developer.' },
        { rule: 'S + V1', eg: 'I develop apps.' },
      ],
      [
        { rule: 'S + am/is/are not + N', eg: 'I am not a developer.' },
        { rule: 'S + do/does not + V1', eg: 'I do not develop apps.' },
      ],
      [
        { rule: 'Am/Is/Are + S + N + ?', eg: 'Am I a developer?' },
        { rule: 'Do/Does + S + V1 + ?', eg: 'Do I develop apps?' },
      ],
    ],
    [
      [
        { rule: 'S + will + be + N', eg: 'I will be a developer.' },
        { rule: 'S + will + V1', eg: 'I will develop apps.' },
      ],
      [
        { rule: 'S + will not + be + N', eg: 'I will not be a developer.' },
        { rule: 'S + will not + V1', eg: 'I will not develop apps.' },
      ],
      [
        { rule: 'Will + S + be + N + ?', eg: 'Will I be a developer?' },
        { rule: 'Will + S + V1 + ?', eg: 'Will I develop apps?' },
      ],
    ],
    [
      [
        { rule: 'S + would + be + N', eg: 'I thought he would be a developer.' },
        { rule: 'S + would + V1', eg: 'I thought he would develop apps.' },
      ],
      [
        {
          rule: 'S + would not + be + N',
          eg: 'I thought he would not be a developer.',
        },
        {
          rule: 'S + would not + V1',
          eg: 'I thought he would not develop apps.',
        },
      ],
      [
        { rule: 'Would + S + be + N + ?', eg: 'Would he be a developer?' },
        { rule: 'Would + S + V1 + ?', eg: 'Would he develop apps?' },
      ],
    ],
  ],
  perfect: [
    [
      [
        { rule: 'S + had been + N', eg: 'I had been a developer.' },
        { rule: 'S + had + V3', eg: 'I had developed apps.' },
      ],
      [
        { rule: 'S + had not been + N', eg: 'I had not been a developer.' },
        { rule: 'S + had not + V3', eg: 'I had not developed apps.' },
      ],
      [
        { rule: 'Had + S + been + N +?', eg: 'Had I been a developer?' },
        { rule: 'Had + S + V3 + ?', eg: 'Had I developed apps?' },
      ],
    ],
    [
      [
        { rule: 'S + have/has been + N', eg: 'I have been a developer.' },
        { rule: 'S + have/has + V3', eg: 'I have developed apps.' },
      ],
      [
        { rule: 'S + have/has not been + N', eg: 'I have not been a developer.' },
        { rule: 'S + have/has not + V3', eg: 'I have not developed apps.' },
      ],
      [
        { rule: 'Have/Has + S + been + N + ?', eg: 'Have I been a developer?' },
        { rule: 'Have/Has + S + V3 + ?', eg: 'Have I developed apps?' },
      ],
    ],
    [
      [
        { rule: 'S + will have been + N', eg: 'I will have been a developer.' },
        { rule: 'S + will have + V3', eg: 'I will have developed apps.' },
      ],
      [
        {
          rule: 'S + will not have been + N',
          eg: 'I will not have been a developer.',
        },
        {
          rule: 'S + will not have + V3',
          eg: 'I will not have developed apps.',
        },
      ],
      [
        { rule: 'Will + S + have been + N + ?', eg: 'Will I have been a developer?' },
        { rule: 'Will + S + have + V3 + ?', eg: 'Will I have developed apps?' },
      ],
    ],
    [
      [
        {
          rule: 'S + would have been + N',
          eg: 'I thought he would have been a developer.',
        },
        {
          rule: 'S + would have + V3',
          eg: 'I thought he would have developed apps.',
        },
      ],
      [
        {
          rule: 'S + would not have been + N',
          eg: 'I thought he would not have been a developer.',
        },
        {
          rule: 'S + would not have + V3',
          eg: 'I thought he would not have developed apps.',
        },
      ],
      [
        {
          rule: 'Would + S + have been + N +?',
          eg: 'Would he have been a developer?',
        },
        { rule: 'Would + S + have + V3 + ?', eg: 'Would he have developed apps?' },
      ],
    ],
  ],
  continuous: [
    [
      [
        { rule: 'S + was/were + being + N', eg: 'I was being a developer.' },
        { rule: 'S + was/were + Ving', eg: 'I was developing apps.' },
      ],
      [
        {
          rule: 'S + was/were not + being + N',
          eg: 'I was not being a developer.',
        },
        { rule: 'S + was/were not + Ving', eg: 'I was not developing apps.' },
      ],
      [
        {
          rule: 'Was/Were + S + being + N + ?',
          eg: 'Were you being a developer?',
        },
        { rule: 'Was/Were + S + Ving + ?', eg: 'Were you developing apps?' },
      ],
    ],
    [
      [
        { rule: 'S + am/is/are + being + N', eg: 'I am being a developer.' },
        { rule: 'S + am/is/are + Ving', eg: 'I am developing apps.' },
      ],
      [
        {
          rule: 'S + am/is/are not + being + N',
          eg: 'I am not being a developer.',
        },
        { rule: 'S + am/is/are not + Ving', eg: 'I am not developing apps.' },
      ],
      [
        {
          rule: 'Am/Is/Are + S + being + N + ?',
          eg: 'Am I being a developer?',
        },
        { rule: 'Am/Is/Are + S + Ving + ?', eg: 'Am I developing apps?' },
      ],
    ],
    [
      [
        {
          rule: 'S + will be + being + N',
          eg: 'I will be being a developer.',
        },
        { rule: 'S + will be + Ving', eg: 'I will be developing apps.' },
      ],
      [
        {
          rule: 'S + will not be + being + N',
          eg: 'I will not be being a developer.',
        },
        {
          rule: 'S + will not be + Ving',
          eg: 'I will not be developing apps.',
        },
      ],
      [
        {
          rule: 'Will + S + be + being + N + ?',
          eg: 'Will I be being a developer?',
        },
        { rule: 'Will + S + be + Ving + ?', eg: 'Will I be developing apps?' },
      ],
    ],
    [
      [
        {
          rule: 'S + would be + being + N',
          eg: 'I thought he would be being a developer.',
        },
        {
          rule: 'S + would be + Ving',
          eg: 'I thought he would be developing apps.',
        },
      ],
      [
        {
          rule: 'S + would not be + being + N',
          eg: 'I thought he would not be being a developer.',
        },
        {
          rule: 'S + would not be + Ving',
          eg: 'I thought he would not be developing apps.',
        },
      ],
      [
        {
          rule: 'Would + S + be + being + N + ?',
          eg: 'Would he be being a developer?',
        },
        { rule: 'Would + S + be + Ving + ?', eg: 'Would he be developing apps?' },
      ],
    ],
  ],
  'perfect continuous': [
    [
      [
        {
          rule: 'S + had been + being + N',
          eg: 'I had been being a developer.',
        },
        { rule: 'S + had been + Ving', eg: 'I had been developing apps.' },
      ],
      [
        {
          rule: 'S + had not been + being + N',
          eg: 'I had not been being a developer.',
        },
        {
          rule: 'S + had not been + Ving',
          eg: 'I had not been developing apps.',
        },
      ],
      [
        {
          rule: 'Had + S + been + being + N + ?',
          eg: 'Had I been being a developer?',
        },
        { rule: 'Had + S + been + Ving + ?', eg: 'Had I been developing apps?' },
      ],
    ],
    [
      [
        {
          rule: 'S + have/has been + being + N',
          eg: 'I have been being a developer.',
        },
        {
          rule: 'S + have/has been + Ving',
          eg: 'I have been developing apps.',
        },
      ],
      [
        {
          rule: 'S + have/has not been + being + N',
          eg: 'I have not been being a developer.',
        },
        {
          rule: 'S + have/has not been + Ving',
          eg: 'I have not been developing apps.',
        },
      ],
      [
        {
          rule: 'Have/Has + S + been + being + N + ?',
          eg: 'Have I been being a developer?',
        },
        {
          rule: 'Have/Has + S + been + Ving + ?',
          eg: 'Have I been developing apps?',
        },
      ],
    ],
    [
      [
        {
          rule: 'S + will have been + being + N',
          eg: 'I will have been being a developer.',
        },
        {
          rule: 'S + will have been + Ving',
          eg: 'I will have been developing apps.',
        },
      ],
      [
        {
          rule: 'S + will not have been + being + N',
          eg: 'I will not have been being a developer.',
        },
        {
          rule: 'S + will not have been + Ving',
          eg: 'I will not have been developing apps.',
        },
      ],
      [
        {
          rule: 'Will + S + have been + being + N + ?',
          eg: 'Will I have been being a developer?',
        },
        {
          rule: 'Will + S + have been + Ving + ?',
          eg: 'Will I have been developing apps?',
        },
      ],
    ],
    [
      [
        {
          rule: 'S + would have been + being + N',
          eg: 'I thought he would have been being a developer.',
        },
        {
          rule: 'S + would have been + Ving',
          eg: 'I thought he would have been developing apps.',
        },
      ],
      [
        {
          rule: 'S + would not have been + being + N',
          eg: 'I thought he would not have been being a developer.',
        },
        {
          rule: 'S + would not have been + Ving',
          eg: 'I thought he would not have been developing apps.',
        },
      ],
      [
        {
          rule: 'Would + S + have been + being + N + ?',
          eg: 'Would he have been being a developer?',
        },
        {
          rule: 'Would + S + have been + Ving + ?',
          eg: 'Would he have been developing apps?',
        },
      ],
    ],
  ],
})
const colors = ref<{ r: number; g: number; b: number; a: number }[]>([
  { r: 255, g: 255, b: 255, a: 1 },
  { r: 255, g: 0, b: 0, a: 1 },
  { r: 0, g: 255, b: 0, a: 1 },
  { r: 0, g: 0, b: 255, a: 1 },
  { r: 255, g: 255, b: 0, a: 1 },
  { r: 0, g: 255, b: 255, a: 1 },
  { r: 255, g: 0, b: 255, a: 1 },
  { r: 0, g: 0, b: 0, a: 1 },
])
const colorsSelected = ref<{ r: number; g: number; b: number; a: number }[]>([])
const colorsAdd = () =>
  colors.value.push({
    r: Math.floor(Math.random() * 256),
    g: Math.floor(Math.random() * 256),
    b: Math.floor(Math.random() * 256),
    a: +Math.random().toFixed(2),
  })
const proportions = ref<number[]>([])
watch(colorsSelected, (v) => {
  proportions.value.length = v.length
  proportions.value.fill(1 / v.length)
})
const colorGen = computed(() => {
  const colorNew = {
    r: 0,
    g: 0,
    b: 0,
    a: 0,
  }
  for (let i = 0; i < colorsSelected.value.length; i++) {
    colorNew.r += colorsSelected.value[i].r * proportions.value[i]
    colorNew.g += colorsSelected.value[i].g * proportions.value[i]
    colorNew.b += colorsSelected.value[i].b * proportions.value[i]
    colorNew.a += colorsSelected.value[i].a * proportions.value[i]
  }
  return `rgba(${colorNew.r.toFixed(0)}, ${colorNew.g.toFixed(
    0,
  )}, ${colorNew.b.toFixed(0)}, ${colorNew.a})`
})
const proportionChange = (v: number, index: number) => {
  proportions.value.forEach((_, k, a) => {
    if (index !== k) {
      a[k] = (1 - v) / (a.length - 1)
    }
  })
}
</script>
<template>
  <details open>
    <summary>operations & result</summary>
    <button @click="colorsAdd">colors add</button>
    <div>
      <div class="h-8 w-20 rounded" :style="{ backgroundColor: colorGen }" />
      <span>{{ colorGen }}</span>
    </div>
  </details>
  <details open>
    <summary>colors selected</summary>
    <div class="flex flex-col">
      <div class="flex items-center" v-for="(v, k) of colorsSelected" :key="nanoid()">
        <div
          class="mx-2 h-4 w-8 rounded"
          :style="{ backgroundColor: `rgba(${v.r}, ${v.g}, ${v.b}, ${v.a})` }"
        />
        <span>{{ `rgba(${v.r},${v.g},${v.b},${v.a})` }}</span>
        <label
          ><input
            min="0"
            max="1"
            type="range"
            step="0.005"
            v-model="proportions[k]"
            @input="
              proportionChange(+($event.target as HTMLInputElement).value, k)
            "
          />{{ proportions[k] }}</label
        >
      </div>
    </div>
  </details>
  <details open>
    <summary>colors</summary>
    <div class="flex flex-wrap font-mono">
      <label class="flex items-center" v-for="v of colors" :key="nanoid()">
        <input type="checkbox" :value="v" v-model="colorsSelected" />
        <div
          class="mx-2 h-4 w-8 rounded"
          :style="{ backgroundColor: `rgba(${v.r}, ${v.g}, ${v.b}, ${v.a})` }"
        />
        <span>{{ `rgba(${v.r},${v.g},${v.b},${v.a})` }}</span>
      </label>
    </div>
  </details>
  <table class="whitespace-nowrap">
    <thead>
      <tr>
        <th v-for="(head, headKey) in Object.values(heads)" :key="nanoid()">
          <li
            v-if="headKey === 0"
            @click="detailsOpend = !detailsOpend"
            class="cursor-pointer"
            :style="{
              listStyle: detailsOpend
                ? 'inside disclosure-open'
                : 'inside disclosure-closed',
              listStyleType: detailsOpend
                ? 'disclosure-open'
                : 'disclosure-closed',
            }"
          >
            {{ head }}
          </li>
          <span v-else>{{ head }}</span>
        </th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="(tr, th) in data" :key="nanoid()">
        <th>
          {{ th }}
        </th>
        <td class="!p-0" v-for="tds in tr" :key="nanoid()">
          <div :class="['border-dotted border-slate-200 dark:border-slate-700', sentenceTypeK !== 0 ? 'border-t-2' : '']" v-for="(sentenceType, sentenceTypeK) of tds" :key="nanoid()">
            <div class="flex flex-nowrap items-baseline" v-for="dynamicOrStatic of sentenceType" :key="nanoid()">
              <div class="mr-2 flex flex-nowrap" v-for="(item, itemK) of dynamicOrStatic.rule.split(' + ')" :key="nanoid()">
                <div class="font-mono">
                  <i v-if="itemK !== 0" class="text-xs text-slate-600 dark:text-slate-300">+</i>
                  <span :class="[
                    item === 'V1' ? 'verb-form-1' : '',
                    item === 'V2' ? 'verb-form-2' : '',
                    item === 'V3' ? 'verb-form-3' : '',
                    item === 'Ving' ? 'verb-form-4' : ''
                  ]">{{ item }}</span>
                </div>
              </div>
              <div v-show="detailsOpend" class="text-xs text-slate-500 dark:text-slate-400">{{ dynamicOrStatic.eg }}</div>
            </div>
          </div>
        </td>
      </tr>
    </tbody>
  </table>
</template>
<style scoped>
.auxiliary {
  @apply underline decoration-double;
}

.verb-form-1 {
  @apply text-sky-400 dark:text-sky-500;
}

.verb-form-2 {
  @apply text-amber-400 dark:text-amber-500;
}

.verb-form-3 {
  @apply text-rose-400 dark:text-rose-500;
}

.verb-form-4 {
  @apply text-emerald-400 dark:text-emerald-500;
}

.verb-form-5 {
  @apply text-violet-400 dark:text-violet-500;
}
</style>
