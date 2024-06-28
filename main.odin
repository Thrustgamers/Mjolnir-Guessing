package main

import "core:fmt"
import "core:math/rand"
import "core:os"
import "core:strconv"

//Set the max attempts possible in a game
maxAttempts: int = 10

main :: proc() {
	//Generate a random number between 0 and 100
	randomNumber := rand.int_max(100)
	attempts: int = 0

	//for loop to keep going until you run out of tries
	for attempts < maxAttempts {
		buf: [256]byte

		fmt.println("Guess a number")
		os.read(os.stdin, buf[:])

		//converts the byte string to integers
		guessedNumber := strconv.atoi(string(buf[:]))

		//switch case for all outcomes of the output
		switch true {
		case attempts == maxAttempts:
			fmt.println("You have ran out of attempts")
			break
		case guessedNumber == randomNumber:
			fmt.println("Congrats you guessed the number in", attempts, "attempts")
			attempts = maxAttempts
			break
		case guessedNumber > randomNumber:
			fmt.println("You guessed too high")
		case guessedNumber < randomNumber:
			fmt.println("You guessed too low")
		}

		attempts = attempts + 1

	}
}
