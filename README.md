# Charioteer Bots

This script will output the movement options for bots when using them in the [GMT game Charioteer](https://boardgamegeek.com/boardgame/339289/charioteer)

This implements the dice rolls for the unofficial solo mode written by [Francis K. Lalumiere](https://boardgamegeek.com/user/weishaupt), full details of which can be viewed on the [BGG files page](https://boardgamegeek.com/filepage/252023/solo-module-for-gmts-charioteer)

This script requires ruby 3.2+ and the terminal-table gem to be installed

The output of this script looks as follows:

```sh
❯ ./bots.rb
+----------+----------+--------+--------+-------+
| Position | Movement | Corner | Attack | Boost |
+----------+----------+--------+--------+-------+
| 0        | 8        | Corner |        | -     |
| 1        | 8        | Corner |        | +3    |
| 2        | 8        |        |        | -     |
| 3        | 7        | Corner |        | -     |
| 4        | 8        | Corner | ATTACK | -     |
+----------+----------+--------+--------+-------+
```
