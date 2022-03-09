### BattleX

My daughter designed a game in Google docs. 
She would use a die-rolling web site and manually move a damage meter to play it.

I decided to turn it into an actual playable iOS game while learning SwiftUI. 
The inital commit for this project is the result of that few hours of effort.

<img width="779" alt="Screen Shot 2022-03-06 at 11 44 31 AM" src="https://user-images.githubusercontent.com/4369/156939525-7c37ae19-bbbb-478d-b9eb-172f50a53edb.png">

### Game Play
- Each player rolls (die simulation) a 1-6 random value during their turn.
- A 6 means no damage is inflicted on the opponent
- Any other number inflicts that amount of damage
- A 4 not only inflicts that damage, but will double the value of the next die roll.
- First player to suffer 20 points of damage loses  

### TODO

There are quite a few patterns in this implementation I don't like, 
but this was a rapid proto-typing effort, so if I continue with this, I will attempt to refactor away the
ugliness later.

- App icon
- Animated die
- The original game had a block of cheese, which would move to the most recent winner's side
- Extract the die rolling to a component that handles the display and then calls back with the result
- Ability to play a friend over the Internet
- Ability to set the player images
  - Select a photo
  - Use whatever iOS GameKit icon is available for the user?
- Sounds
- Maybe re-implement using GameKit?
- Settings to change max damage
- Setting to change die roll effects/rules?
