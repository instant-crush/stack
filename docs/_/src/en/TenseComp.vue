<script setup lang='ts'>
import { nanoid } from 'nanoid'
import { ref } from 'vue'

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
        {
          rule: ['S', 'was/were'],
          eg: 'It was an apple.',
        },
        {
          rule: ['S', 'V2'],
          eg: 'I ate apples.',
        },
      ],
      [
        { rule: ['S', 'was/were not'], eg: 'It was not an apple.' },
        { rule: ['S', 'didn\'t', 'V1'], eg: 'I didn\'t eat apples.' },
      ],
      [
        { rule: ['Was/were', 'S'], eg: 'did it an apple?' },
        { rule: ['Did', 'S', 'V1'], eg: 'Did I eat apples?' },
      ],
    ],
    [
      [
        { rule: ['S', 'am/is/are'], eg: 'It is an apple.' },
        { rule: ['S', 'V1'], eg: 'I eat apples.' },
      ],
      [
        { rule: ['S', 'am/is/are not'], eg: 'It is not an apple.' },
        { rule: ['S', 'don\'t/doesn\'t', 'V1'], eg: 'I don\'t eat apples.' },
      ],
      [
        { rule: ['Am/Is/Are', 'S'], eg: 'Is it an apple?' },
        { rule: ['Do/Does', 'S', 'V1'], eg: 'Do I eat apples?' },
      ],
    ],
    [
      [
        { rule: ['S', 'will be'], eg: 'It will be an apple.' },
        { rule: ['S', 'will', 'V1'], eg: 'I will eat apples.' },
      ],
      [
        { rule: ['S', 'will not be'], eg: 'not be an apple.' },
        { rule: ['S', 'will not', 'V1'], eg: 'I will not eat apples.' },
      ],
      [
        { rule: ['Will', 'S', 'be'], eg: 'Will it be an apple?' },
        { rule: ['Will', 'S', 'V1'], eg: 'Will I eat apples?' },
      ],
    ],
    [
      [
        { rule: ['S', 'would be'], eg: 'It would be an apple.' },
        { rule: ['S', 'would', 'V1'], eg: 'I would eat apples.' },
      ],
      [
        { rule: ['S', 'would not be'], eg: 'It would not be an apple.' },
        { rule: ['S', 'would not', 'V1'], eg: 'I would not eat apples.' },
      ],
      [
        { rule: ['Would', 'S', 'be'], eg: 'Would it be an apple?' },
        { rule: ['Would', 'S', 'V1'], eg: 'Would I eat apples?' },
      ],
    ],
  ],
  perfect: [
    [
      [
        { rule: ['S', 'had been'], eg: 'It had been an apple.' },
        { rule: ['S', 'had', 'V3'], eg: 'I had eaten apples.' },
      ],
      [
        { rule: ['S', 'had not been'], eg: 'It had not been an apple.' },
        { rule: ['S', 'had not', 'V3'], eg: 'I had not eaten apples.' },
      ],
      [
        { rule: ['Had', 'S', 'been'], eg: 'Had it been an apple?' },
        { rule: ['Had', 'S', 'V3'], eg: 'Had I eaten apples?' },
      ],
    ],
    [
      [
        { rule: ['S', 'have/has been'], eg: 'It has been an apple.' },
        { rule: ['S', 'have/has', 'V3'], eg: 'I have eaten apples.' },
      ],
      [
        { rule: ['S', 'have/has not been'], eg: 'It has not been an apple.' },
        { rule: ['S', 'have/has not', 'V3'], eg: 'I have not eaten apples.' },
      ],
      [
        { rule: ['Have/Has', 'S', 'been'], eg: 'Has it been an apple?' },
        { rule: ['Have/Has', 'S', 'V3'], eg: 'Have I eaten apples?' },
      ],
    ],
    [
      [
        { rule: ['S', 'will have been'], eg: 'It will have been an apple.' },
        { rule: ['S', 'will have', 'V3'], eg: 'I will have eaten apples.' },
      ],
      [
        {
          rule: ['S', 'will not have been'],
          eg: 'It will not have been an apple.',
        },
        { rule: ['S', 'will not have', 'V3'], eg: 'I will not have eaten apples.' },
      ],
      [
        { rule: ['Will', 'S', 'have been'], eg: 'Will it have been an apple?' },
        { rule: ['Will', 'S', 'have', 'V3'], eg: 'will I have eaten apples?' },
      ],
    ],
    [
      [
        { rule: ['S', 'would have been'], eg: 'It would have been an apple.' },
        { rule: ['S', 'would have', 'V3'], eg: 'I would have eaten apples.' },
      ],
      [
        {
          rule: ['S', 'would not have been'],
          eg: 'It would not have been an apple.',
        },
        {
          rule: ['S', 'would not have', 'V3'],
          eg: 'I would not have eaten apples.',
        },
      ],
      [
        { rule: ['Would', 'S', 'have been'], eg: 'Would it have been an apple?' },
        { rule: ['Would', 'S', 'have', 'V3'], eg: 'Would I have eaten apples?' },
      ],
    ],
  ],
  continuous: [
    [
      [
        { rule: ['S', 'was/were being'], eg: 'It was being an apple.' },
        { rule: ['S', 'was/were', 'V4'], eg: 'I was eating apples.' },
      ],
      [
        { rule: ['S', 'was/were not being'], eg: 'It was not being an apple.' },
        { rule: ['S', 'was/were not', 'V4'], eg: 'I was not eating apples.' },
      ],
      [
        { rule: ['Was/Were', 'S', 'being'], eg: 'Was it being an apple?' },
        { rule: ['Was/Were', 'S', 'V4'], eg: 'Was I eating apples?' },
      ],
    ],
    [
      [{ rule: ['S', 'am/is/are', 'V4'], eg: 'I am eating apples.' }],
      [{ rule: ['S', 'am/is/are not', 'V4'], eg: 'I am not eating apples.' }],
      [{ rule: ['Am/Is/Are', 'S', 'V4'], eg: 'Am I eating apples?' }],
    ],
    [
      [{ rule: ['S', 'will be', 'V4'], eg: 'I will be eating apples.' }],
      [{ rule: ['S', 'will not be', 'V4'], eg: 'I will not be eating apples.' }],
      [{ rule: ['Will', 'S', 'be', 'V4'], eg: 'Will I be eating apples?' }],
    ],
    [
      [{ rule: ['S', 'would be', 'V4'], eg: 'I would be eating apples.' }],
      [{ rule: ['S', 'would not be', 'V4'], eg: 'I would not be eating apples.' }],
      [{ rule: ['Would', 'S', 'be', 'V4'], eg: 'Would I be eating apples?' }],
    ],
  ],
  'perfect continuous': [
    [
      [{ rule: ['S', 'had been', 'V4'], eg: 'I had been eating apples.' }],
      [{ rule: ['S', 'had not been', 'V4'], eg: 'I had not been eating apples.' }],
      [{ rule: ['Had', 'S', 'been', 'V4'], eg: 'Had I been eating apples?' }],
    ],
    [
      [{ rule: ['S', 'have/has been', 'V4'], eg: 'I have been eating apples.' }],
      [
        {
          rule: ['S', 'have/has not been', 'V4'],
          eg: 'I have not been eating apples.',
        },
      ],
      [{ rule: ['Have/Has', 'S', 'been', 'V4'], eg: 'Have I been eating apples?' }],
    ],
    [
      [
        {
          rule: ['S', 'will have been', 'V4'],
          eg: 'I will have been eating apples.',
        },
      ],
      [
        {
          rule: ['S', 'will not have been', 'V4'],
          eg: 'I will not have been eating apples.',
        },
      ],
      [
        {
          rule: ['Will', 'S', 'have been', 'V4'],
          eg: 'Will I have been eating apples?',
        },
      ],
    ],
    [
      [
        {
          rule: ['S', 'would have been', 'V4'],
          eg: 'I would have been eating apples.',
        },
      ],
      [
        {
          rule: ['S', 'would not have been', 'V4'],
          eg: 'I would not been eating apples.',
        },
      ],
      [
        {
          rule: ['Would', 'S', 'have been', 'V4'],
          eg: 'Would I have been eating apples?',
        },
      ],
    ],
  ],
})
</script>
<template>
  <table class='whitespace-nowrap'>
    <thead>
      <tr>
        <th v-for='(head, headKey) in Object.values(heads)'>
          <li v-if="headKey === 0" @click="detailsOpend = !detailsOpend" class="cursor-pointer" :style="{
            listStyle: detailsOpend ? 'inside disclosure-open' : 'inside disclosure-closed',
            listStyleType: detailsOpend ? 'disclosure-open' : 'disclosure-closed'
          }">
            {{ head }}
          </li>
          <span v-else>{{ head }}</span>
        </th>
      </tr>
    </thead>
    <tbody>
      <tr v-for='(tr, th) in data' :key='nanoid()'>
        <th>
          {{ th }}
        </th>
        <td class='!p-0' v-for='tds in tr' :key='nanoid()'>
          <table class='!m-0'>
            <tbody class='inline-flex w-full flex-col'>
              <tr class='inline-flex justify-between !border-none' v-for='cell in tds' :key='nanoid()'>
                <td class='grow basis-1/2 !border-none' v-for='subCell in cell' :key='nanoid()'>
                  <details :open="detailsOpend">
                    <summary>
                      <span v-for="(rule, ruleKey) in subCell.rule" :key="nanoid()">
                        <b :class="[
                          rule.length === 2 && rule.startsWith('V') ? `verb-form-${rule[1]}` :
                            rule !== 'S' ? 'auxiliary' : ''
                        ]">{{ rule }}</b>
                        <i>{{ ruleKey !== subCell.rule.length - 1 ? ' + ' : '' }}</i>
                      </span>
                    </summary>
                    <i>{{ subCell.eg }}</i>
                  </details>
                </td>
              </tr>
            </tbody>
          </table>
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
