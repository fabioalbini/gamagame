# Gama Game

Have you ever played Gama Game? It's a game of general knowledge questions and
answers. It used to be played at #gamagame, an IRC (Internet Relay Chat) channel
in the Brasnet network, which no longer exists.

# Challenge

The game consists simply in displaying questions with options to be chosen by
the player. After 10 questions, a score must be displayed.

This app contains a `db/seeds.rb` file. It's a database of questions
(with their answers) that can be used for this exercise. The questions were
extracted from the [Qriusity](https://qriusity.com/) API and are merely used
as development seeds.

The general flow of the game is shown in the GIF at `docs/game-flow.gif`.

## User Stories

There are three user stories to be implemented. Each one has mockups and support
material in the `docs/` directory.

### US01 - Gama Game landing page

This page is the first page presented for players when they access our website.
It must explain a bit about the game and allow players to start playing by a button.

The template is at `docs/landing_page.png` and has the text and
disposition of elements in the page.

**Acceptance Criteria**

 * The page elements must be displayed as described in the template. Spacing (margins and paddings may be approximated, proportions must be kept)
 * Colors or fonts are provided above.
 * Clicking in the `Start` button is expected to do nothing by now.

### US02 - Implement game workflow

When the player clicks the `Start` button in the landing page, a question should be
presented with its options. The player then selects an option and clicks `Next`.

The workflow should present ten (10) questions for the player. All questions should
follow the design in the `docs/question.png` file.

It is required to keep the state of the game: at anytime the player may refresh
the page and get in the same question (consider to use a database for that). The
application must also to provide an unique URL with the game ID saved in
the stored state.

If the player press `Next` in the last question, nothing should happen by now.

**Acceptance Criteria**

 * The page elements must be displayed as described in the template. Spacing (margins and paddings may be approximated, proportions must be kept)
 * Colors or fonts are provided above.
 * Clicking in the `Start` button in the landing page will start the game workflow.
 * Clicking in the `Next` button shows the next question.
 * The `Next` button must be disabled until an option is selected.

### US003 - Display player score

After answering the last question, when the player clicks `Next`, a page with
the score and a button to restart the game must be presented.

The score is a sum of all the correct-answered questions. So, the maximum score
an user may get is 10.

The questions presented for the user when clicking in `Restart` may be the same ones
as answered in the first time.

The template for this page is located at `docs/score.png`.

**Acceptance Criteria**

 * The page elements must be displayed as described in the template. Spacing (margins and paddings may be approximated, proportions must be kept)
 * Colors or fonts are provided above.
 * Clicking in the `Next` button of the last question shows the score page.
 * The score must be between 0 and 10.
 * Clicking in the `Restart` button must start over the game.

# Some UI information

 * Colors used
   * #EFF3F6
   * #2EA1F8
   * #1990EA
   * #1166A5
   * #FFFFFF
   * #E6EAEE
   * #39B54A
   * #34AA44
   * #249533
   * #1E930B
   * #1E9D09
   * #009DDC
   * #EEEEEE
   * #B54C0D
 * Fonts used
   * 'Source Sans Pro' (weights: 300, 400 and 600)
   * sans-serif (fallback)
