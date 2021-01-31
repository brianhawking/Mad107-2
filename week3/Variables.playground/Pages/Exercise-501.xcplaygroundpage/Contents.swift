/*:
 ## Exercise: 501
 
 You may know the popular darts game called 501. Players start with a score of 501, and have to work down to zero. Here are the rules:
 
 - Each player plays a “round” where they throw three darts at a board.
 - Each throw can score between 1 and 20 points, which may be doubled or tripled depending where it hits on the board.
 - It is also possible to score 25 for the outer bulls-eye or 50 for the inner bulls-eye.
 
 House rule: At the end of three rounds, whoever is closest to zero without going below zero is the winner.
 
 - callout(Exercise): Imagine you’re a game shark. You want to fool people into thinking you’re terrible at this game, but then come back and beat them in one swoop at the end. Model your game progress using variables.\
 \
 Start with a variable set to `501` to hold your overall score.\
 Create another variable set to `0` to hold the score for each round.\
 For each throw, update the value of the round score by adding points from the throw.\
 At the end of each round, calculate your current overall score by subtracting the round score from it. Assign the new value to your overall score, and re-set the round score to zero.\
 \
 How slowly can you “improve” your performance without arousing suspicion? \
 \
 After each round, `print` some statements that your opponents might make. If you can, use the value of your current score in their statements.
 */
/* To guarentee we don't lose we need to score 501 by end of third round. But that would
   be two perfect rounds + 141 and that's incredibly rare for non-elites.  I looked up averages per round
   Beginner = 30 to 50
   Experienced = 60 to 80
   Elite = 100+ */

// my stategy - scoring more than 300 for all three rounds (overall score of less than 201). It's the lowest elite average
// Round 1: score slightly more than beginner average
// Round 2: a little higher than experienced average
// Round 3: Perfect score of 180

// set up constants
let dartsMultiplier = (single: 1, double: 2, triple: 3)
let totalRounds = 3

let bullsEye = 25
let innerBullsEye = 50

// set initial scores
var playerOverallScore = 501
var roundScore = 0
var currentRound = 1

// round 1
roundScore += 0
roundScore += innerBullsEye
roundScore += dartsMultiplier.single * 9
print("You got lucky with that bullsEye but \(roundScore) isn't enough to beat me. I got two inner BullsEyes and a 20.")

playerOverallScore -= roundScore
roundScore = 0

// round 2
currentRound += 1
roundScore += bullsEye
roundScore += bullsEye
roundScore += dartsMultiplier.double * 17
print("\(roundScore) isn't too bad. Not as good as my 100. You only have \(totalRounds - currentRound) round left and I'm still winning.")

playerOverallScore -= roundScore
roundScore = 0

// round 3
print("I got another 100 for a total an overall score of 181. You'd have to be a pro to beat me!")
currentRound += 1
roundScore = 3 * dartsMultiplier.triple * 20
print("You swindled me!  No one gets \(roundScore).")

playerOverallScore -= roundScore
roundScore = 0

print("Your overall score is \(playerOverallScore), which is lower than my 181.  You win.  Good game.")





















/*:
 
 _Copyright © 2017 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */
//: [Previous](@previous)  |  page 13 of 13
