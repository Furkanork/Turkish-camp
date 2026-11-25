# To-do list

Claude's cloud routine works through this list top to bottom, ticks off what it finishes and adds a short note.
Add tasks anywhere: `- [ ] what you want done`. Put the most important ones at the top.
Its work goes to the `claude/auto-work` branch. Nothing changes on the live site until you merge it.

## Tasks

- [x] Check all 463 items for mistakes: wrong translations, typos, wrong level labels
  - Read all 463 items + ran a script (field count, level labels, braces, duplicates: all clean). Fixed one non-standard item ("-ceği tutmak" → "canı çekmek"). Everything else looked correct; level labels judged reasonable.
- [x] Add about 150 more C1/C2 items, focusing on collocations and connectors
  - Added 189 items (55 connectors, 47 clause structures, 87 collocations; mostly C1/C2, a few B2 for balance). Total now 652 (458 at C1–C2). Checked: no duplicates, all fields/braces valid, page script parses.
- [x] Add 10 more grammar topics with drills
  - Added 10 topics (purpose, concession, "instead of", intensive adjectives, derivation suffixes, etmek/olmak/yapmak, aspect verbs, noun compounds, similes, word order), each with rules, 3 examples, a trap note and a 3-question drill. Now 32 topics; appended at the end so saved drill scores stay valid.
- [x] Add a "weak spots" view showing which categories you miss most
  - New #zayif page (nav: "Zayıf · Weak spots"): miss rate by category and level, 15 hardest items with a "Practise these" button, grammar drills below full marks. Answers are recorded per item from now on (st.ws in localStorage; cleared by Reset). Tested in headless Chromium at phone width; only answers given after this update are counted.
- [x] Add a progress page: streak, items learned per week, level breakdown
  - New Gelişim tab: streak/best streak, 28-day strip, learned per week (8 weeks), level breakdown, grammar count. Uses a new per-day log (st.act) that starts from now, so older history is empty. Tested in headless Chromium at phone width, no console errors.
- [x] Add backup/restore of progress to a file, so you can move between phone and PC
  - Backup section at the bottom of the Gelişim tab: download JSON, restore with confirmation, invalid files rejected. Tested export → wipe → restore in headless Chromium.
- [x] Add a listening mode: hear a sentence and type what you heard
  - New Dinle tab: speaks an example sentence (play / slow), type it, word-diff feedback, show-answer option; misses feed Weak spots and the activity log. Tested in headless Chromium (speech mocked); needs a Turkish voice on the real device.
- [ ] Add a reading section: short C1 texts with tap-to-translate words
- [ ] Make the big index.html easier to maintain by moving items and grammar into separate files
- [ ] Test on a phone-sized screen and fix layout problems

## Questions for you

(Claude writes here when a task needs your decision. Answer under the question.)
