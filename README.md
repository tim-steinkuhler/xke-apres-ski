# xke-apres-ski
This repos was used to create and support a Xebia Knowledge Exchange session.

I've used the following to create an Apres Ski story around music data:
- Spotify & Lyrics Genius data
- seaborn & plotly visualization
- Spacy (Python) and R NLP tools to create comparison word clouds
- Custom code to make things nicer to present


## Possible Next Steps:

- Clean up this repository
  - Create separate python files for written functions
  - Add pre-commit stuff
  - Do some nice linting
  - Add tests
  - Add documentation

- Improve Word Cloud code
  - Replace R script with self-written Python
  - Decide what should be the metric determining the size of each word

- Improve Data Extraction
  - Turn into python scripts
  - Add retry functionality for lyrics
    1. As is
    2. Only the first artist
    3. Clean up song name
  - Write lyrics to separate files
