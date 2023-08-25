export default [
  { text: 'Home', link: '/' },
  { text: 'Guide', link: '/guide' },
  {
    text: 'Computer',
    items: [
      {
        text: 'langs',
        items: [
          {
            text: '.dart',
            link: '/dart/',
          },
          {
            text: '.rs',
            link: '/rs/',
          },
          {
            text: '.sh',
            link: '/sh/',
          },
          {
            text: '.ts',
            link: '/ts/',
          },
        ],
      },
    ],
  },
  {
    text: 'Languages',
    items: [
      {
        text: 'en',
        link: '/en/',
      },
      {
        text: 'es',
        link: '/es/',
      },
    ],
  },
]
