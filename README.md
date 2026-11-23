# Türkçe Derinlik · Turkish Camp

A single-page study site for heritage speakers of Turkish who want to move from everyday fluency to B2–C1, using the 80/20 (Pareto) principle: it drills only the small set of things that make Turkish sound advanced.

**Live site:** https://furkanork.github.io/Turkish-camp/

## What's inside

- **Çalış (Practise):** spaced-repetition flashcards (Leitner boxes: 1, 3, 7, 16, 35 days) across 463 items (296 at C1–C2), released in weighted order so the highest-payoff categories come first. Defaults to C1+ and to typing the Turkish from the English (EN → TR), so you produce the exact form instead of just recognising it.
  - Bağlaçlar: connectors
  - Eylem yapıları: clause structures
  - Eşdizimler: collocations
  - Hal & edatlar: verb cases and postpositions
  - Sosyal & resmî: set phrases and formal register
  - Soyut kelimeler: abstract vocabulary
  - Yüksek üslup: formal and Ottoman-origin vocabulary
  - Deyimler: idioms
  - Atasözleri: proverbs
- **Dilbilgisi (Grammar):** 22 B2–C2 topics, each with the rule, examples, a common-mistake note and a drill.
- **Telaffuz (Accent):** for an Istanbul accent, aimed at Dutch and English speakers: 10 sound guides with playable words and minimal pairs (stress, full vowels, tapped r, ı, ü/ö, pure vowels, ğ, light/dark l, â, intonation), a word-stress trainer, shadowing with microphone recording and a speech-recognition clarity check (Chrome/Edge), and everyday Istanbul spoken forms.
- **Test:** fill-in-the-gap quiz, typed or multiple choice; missed items go back into today's reviews.
- **Liste:** searchable library filtered by category and level.
- **Yazma:** a writing prompt using your current words.

Progress is stored in the browser's `localStorage`; nothing is sent anywhere.

## Run locally

It's a single static file with no build step: open `index.html` in a browser.

## Adding items

Items live in the `RAW` object in `index.html`, one per line:

```
term|English meaning|Example sentence with the {target form} in braces|B2
```

Grammar topics are in the `G` array.
