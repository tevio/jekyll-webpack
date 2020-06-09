---
---

{% assign inset = site.data.tailwind['inset'] %}

module.exports = {
  theme: {
    extend: {
      inset: {
        '75per': '{{ inset.seventy_five }}',
        '50per': '50%',
        '25per': '25%'
      }
    }
  },
  variants: {},
  plugins: []
}
