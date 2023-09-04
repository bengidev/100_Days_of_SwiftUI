/// This is important to include required files
/// for application/program to be able to run.
///
import Cocoa

/// How to use a for loop to repeat work
///
/// Computers are really great at doing repetitive work, and Swift makes it easy to
/// repeat some code a fixed number of times, or once for every item in an array,
/// dictionary, or set.
///
/// Let’s start with something simple: If we have an array of strings, we can print
/// each string out like this.
///
/// That loops over all the items in platforms, putting them one by one into os.
/// We haven’t created os elsewhere; it’s created for us as part of the loop and
/// made available only inside the opening and closing braces.
///
/// Inside the braces is the code we want to run for each item in the array, so the code
/// above will print four lines – one for each loop item. First it puts “iOS” in there
/// then calls print(), then it puts “macOS” in there and calls print(), then “tvOS”,
/// then “watchOS”.
///
/// To make things easier to understand, we give these things common names.
/// - We call the code inside the braces the loop body.
/// - We call one cycle through the loop body a loop iteration.
/// - We call os the loop variable. This exists only inside the loop body, and will change
///     to a new value in the next loop iteration.
///
///
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os)")
}

/// That name os isn’t special – we could have written this instead.
///
for name in platforms {
    print("Swift works great on \(name)")
}

/// Or even this
///
/// The code will still work exactly the same.
///
for rubberChicken in platforms {
    print("Swift works great on \(rubberChicken)")
}

/// In fact, Xcode is really smart here: if you write for plat it will recognize that there’s
/// an array called platforms, and offer to autocomplete all of for platform in platforms –
/// it recognizes that platforms is plural and suggests the singular name for the loop variable.
/// When you see Xcode’s suggestion appear, press Return to select it.
///

/// Rather than looping over an array (or set, or dictionary – the syntax is the same!),
/// you can also loop over a fixed range of numbers. For example, we could print out
/// the 5 times table from 1 through 12 like this.
///
/// A couple of things are new there, so let’s pause and examine them.
/// - The loop variable i, which is a common coding convention for “number you’re counting with”.
///     If you’re counting a second number you would use j, and if you’re counting a third
///     you would use k, but if you’re counting a fourth maybe you should pick better
///     variable names.
/// - The 1...12 part is a range, and means “all integer numbers between 1 and 12,
///     as well as 1 and 12 themselves.” Ranges are their own unique data type in Swift.
///
/// So, when that loop first runs i will be 1, then it will be 2, then 3, etc,
/// all the way up to 12, after which the loop finishes.
///
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

/// You can also put loops inside loops, called nested loops, like this.
///
/// That shows off a couple of other new things, so again let’s pause and look closer.
/// - There’s now a nested loop: we count from 1 through 12, and for each number inside
///     there we count 1 through 12 again.
/// - Using print() by itself, with no text or value being passed in, will just start
///     a new line. This helps break up our output so it looks nicer on the screen.
///
/// So, when you see x...y you know it creates a range that starts at whatever number x is,
/// and counts up to and including whatever number y is.
///
for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print(" \(j) x \(i) is \(j * i)")
    }
    
    print()
}

/// Swift has a similar-but-different type of range that counts up to but excluding the
/// final number: ..<. This is best seen in code.
///
/// When that runs, it will print for numbers 1, 2, 3, 4, 5 in the first loop,
/// but only numbers 1, 2, 3, and 4 in the second. The pronounce 1...5 as
/// “one through five”, and 1..<5 as “one up to five,” and you’ll see similar
/// wording elsewhere in Swift.
///
/// ..< is really helpful for working with arrays, where we count from 0 and often want to
/// count up to but excluding the number of items in the array.
///
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

/// Sometimes you want to run some code a certain number of times using a range, but you
/// don’t actually want the loop variable – you don’t want the i or j,
/// because you don’t use it.
///
/// In this situation, you can replace the loop variable with an underscore.
///
var lyric = "Haters gonna"

for _ in 1 ... 5 {
    lyric += " hate"
}

print(lyric)

/// Why does Swift use underscores with loops?
///
/// If you want to loop over items in an array, you might write code such as this.
///
/// Every time the loop goes around, Swift will take one item from the names array,
/// put it into the name constant, then execute the body of our loop –
/// that’s the print() method.
///
let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for name in names {
    print("\(name) is a secret agent")
}

/// However, sometimes you don’t actually need the value that is currently being read,
/// which is where the underscore comes in: Swift will recognize you don’t actually need
/// the variable, and won’t make the temporary constant for you.
///
/// Of course, Swift can really see that anyway – it can see whether or not you’re using
/// name inside the loop, so it can do the same job without the underscore. However, using
/// an underscore does something very similar for our brain: we can look at the code and
/// immediately see the loop variable isn’t being used, no matter how many lines of code
/// are inside the loop body.
///
/// So, if you don’t use a loop variable inside the body, Swift will warn you to rewrite it
/// like this.
///
for _ in names {
    print("[CENSORED] is a secret agent!")
}

/// Why does Swift have two range operators?
///
/// When we think about ranges of values, English is quite confusing. If someone say
/// “give me the sales figures up to yesterday” does that mean including yesterday or
/// excluding yesterday? Both are useful in their own right, so Swift gives us a way
/// of representing them both: ..< is the half-open range that specifies
/// “up to but excluding” and ... is the closed range operator that specifies
/// “up to and including”.
///
/// To make the distinction easier when talking, Swift regularly uses very specific
/// language: “1 to 5” means 1, 2, 3, and 4, but “1 through 5” means 1, 2, 3, 4, and 5.
/// If you remember, Swift’s arrays start at index 0, which means an array containing
/// three items have items at indexes 0, 1, and 2 – a perfect use case for
/// the half-open range operator.
///
/// Things get more interesting when you want only part of a range, such as
/// “anything from 0 upwards” or “index 5 to the end of the array.” You see,
/// these are fairly useful in programming, so Swift make them easier to
/// create by letting us specify only part of a range.
///
/// For example, if we had an array of names like this one.
///
let names1 = ["Piper", "Alex", "Suzanne", "Gloria"]

/// We could read out an individual name like this.
///
print(names1[0])

/// With ranges, we can also print a range of values like this.
///
/// That carries a small risk, though: if our array didn’t contain at least four items
/// then 1...3 would fail.
///
print(names1[1...3])

/// Fortunately, we can use a one-sided range to say “give me 1 to the end of the array”,
/// like this.
///
/// So, ranges are great for counting through specific values, but they are also helpful
/// for reading groups of items from arrays.
///
print(names1[1...])





/// How to use a while loop to repeat work
///
/// Swift has a second kind of loop called while: provide it with a condition,
/// and a while loop will continually execute the loop body until the condition is false.
///
/// Although you’ll still see while loops from time to time, they aren’t as common as for loops.
///
/// Here’s a basic while loop to get us started.
///
/// That creates an integer counter starting at 10, then starts a while loop with the
/// condition countdown > 0. So, the loop body – printing the number and subtracting 1 –
/// will run continually until countdown is equal to or below 0, at which point the loop
/// will finish and the final message will be printed.
/// 
var countdown = 10

while countdown > 10 {
    print("\(countdown)...")
    countdown -= 1
}

print("Blast off!")

/// while loops are really useful when you just don’t know how many times the loop
/// will go around. To demonstrate this, I want to introduce you to a really useful
/// piece of functionality that Int and Double both have: random(in:). Give that
/// a range of numbers to work with, and it will send back a random Int or Double
/// somewhere inside that range.
///
/// For example, this creates a new integer between 1 and 1000.
///
let id = Int.random(in: 1...1000)

/// And this creates a random decimal between 0 and 1.
///
let amount = Double.random(in: 0...1)

/// We can use this functionality with a while loop to roll some virtual 20-sided dice
/// again and again, ending the loop only when a 20 is rolled – a critical hit for all
/// you Dungeons & Dragons players out there.
///
// Create an integer to store our roll
var roll = 0

// Carry on looping until we reach 20
while roll != 20 {
    // Roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// If we're here it means the loop ended - we got a 20!
print("Critical hit!")

/// You’ll find yourself using both for and while loops in your own code: for loops
/// are more common when you have a finite amount of data to go through, such as
/// a range or an array, but while loops are really helpful when you need
/// a custom condition.
///

/// When should you use a while loop?
///
/// Swift gives us for and while loops, and both are commonly used. However, when you’re
/// just learning it can seem odd to have two commonly used ways to make loops –
/// which should you use and why?
///
/// The main difference is that for loops are generally used with finite sequences:
/// we loop through the numbers 1 through 10, or through the items in an array,
/// for example. On the other hand, while loops can loop until any arbitrary condition
/// becomes false, which allows them until we tell them to stop.
///
/// This means we can repeat the same code until…
/// - …the user asks us to stop
/// - …a server tell us to stop
/// - …we’ve found the answer we’re looking for
/// - …we’ve generated enough data
///
/// And those are just a handful of examples. Think about it: if someone asked you to roll
/// 10 dice and print their results, you could do that with a simple for loop by counting
/// from 1 through 10. But if I asked you to roll 10 dice and print the results, while
/// also automatically rolling another dice if the previous dice had the same result,
/// then you don’t know ahead of time how many dice you’ll need to roll. Maybe you’ll get
/// lucky and need only 10 rolls, but maybe you’ll get a few duplicate rolls and
/// need 15 rolls. Or perhaps you’ll get lots of duplicate rolls and need 30 – who knows?
///
/// That’s where a while loop comes in handy: we can keep the loop going around until
/// we’re ready to exit.
///





/// How to skip loop items with break and continue
///
/// Swift gives us two ways to skip one or more items in a loop: continue skips the current
/// loop iteration, and break skips all remaining iterations. Like while loops these are
/// sometimes used, but in practice much less than you might think.
///
/// When you’re looping over an array of data, Swift will take out one item from the array
/// and execute the loop body using it. If you call continue inside that loop body, Swift
/// will immediately stop executing the current loop iteration and jump to the next item
/// in the loop, where it will carry on as normal. This is commonly used near the start
/// of loops, where you eliminate loop variables that don’t pass a test of your choosing.
///
/// That creates an array of filename strings, then loops over each one and checks to
/// make sure it has the suffix “.jpg” – that it’s a picture. continue is used with
/// all the filenames failing that test, so that the rest of the loop body is skipped.
///
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture: \(filename)")
}

/// As for break, that exits a loop immediately and skips all remaining iterations.
/// To demonstrate this, we could write some code to calculate 10 common multiples
/// for two numbers.
///
/// That does quite a lot.
/// - Create two constants to hold two numbers.
/// - Create an integer array variable that will store common multiples of our two numbers.
/// - Count from 1 through 100,000, assigning each loop variable to i.
/// - If i is a multiple of both the first and second numbers, append it to the integer array.
/// - Once we hit 10 multiples, call break to exit the loop.
/// - Print out the resulting array.
///
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

/// So, use continue when you want to skip the rest of the current loop iteration,
/// and use break when you want to skip all remaining loop iterations.
///

/// Why would you want to exit a loop?
///
/// Swift’s break keyword lets us exit a loop immediately, regardless of what kind of loop
/// we’re talking about. A lot of the time you won’t need this, because you’re looping
/// over items in an array and want to process them all, or because you’re counting
/// from 1 through 10 and want to handle all those values.
///
/// However, sometimes you do want to end your loop prematurely. For example, if you had
/// an array of scores and you want to figure out how many of them the player achieved
/// without getting a 0, you might write this.
///
/// Without break we’d need to continue looping through scores even after we found
/// the first 0, which is wasteful.
///
let scores = [1, 8, 4, 3, 0, 5, 2]
var count = 0

for score in scores {
    if score == 0 {
        break
    }
    
    count += 1
}

print("You had \(count) scores before you got 0.")

/// Why does Swift have labeled statements?
///
/// Swift’s labeled statements allow us to name certain parts of our code, and it’s most
/// commonly used for breaking out of nested loops.
///
/// To demonstrate them, let’s look at an example where we’re trying to figure out
/// the correct combination of movements to unlock a safe. We might start by defining
/// an array of all possible movements.
///
let options = ["up", "down", "left", "right"]

/// For testing purposes, here’s the secret combination we’re trying to guess.
///
let secretCombination = ["up", "up", "right"]

/// To find that combination, we need to make arrays containing all possible
/// three-color variables.
/// - up, up, up
/// - up, up, down
/// - up, up, left
/// - up, up, right
/// - up, down, left
/// - up, down, right
/// - and so on.
///
/// To make that happen, we can write three loops, one nested inside the other, like this.
///
/// That goes over the same items multiple times to create an attempt array,
/// and prints out a message if its attempt matches the secret combination.
///
/// But that code has a problem: as soon as we find the combination we’re done with the loops,
/// so why do they carry on running?
///
for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]
            
            if attempt == secretCombination {
                print("The combination is \(attempt)")
            }
        }
    }
}

/// What we really want to say is “as soon as the combination is found, exit all the loops
/// at once” – and that’s where labeled statements come in. They let us write this.
///
/// With that small change, those three loops stop running as soon as the combination is found.
/// In this trivial case it’s unlikely to make a performance difference, but what if
/// your items had hundreds or even thousands of items? Saving work like this is a good idea,
/// and worth remembering for your own code.
///
outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]
            
            if attempt == secretCombination {
                print("The combination is \(attempt)")
                break outerLoop
            }
        }
    }
}

/// When to use break and when to use continue
///
/// Sometimes Swift learners find it hard to understand when the break keyword is correct
/// and when the continue keyword is correct, because they both alter the flow of our loops.
///
/// When we use continue we’re saying “I’m done with the current run of this loop” – Swift
/// will skip the rest of the loop body, and go to the next item in the loop. But when
/// we say break we’re saying “I’m done with this loop altogether, so get out completely.”
/// That means Swift will skip the remainder of the body loop, but also skip any other loop
/// items that were still to come.
///
/// Just like break, you can use continue with labeled statements if you want, but honestly
/// I can’t remember ever seeing it done!
///

/// Summary: Conditions and loops
///
/// We’ve covered a lot about conditions and loops in the previous chapters, so let’s recap.
///
/// - We use if statements to check a condition is true. You can pass in any condition
///     you want, but ultimately it must boil down to a Boolean.
/// - If you want, you can add an else block, and/or multiple else if blocks to check
///     other conditions. Swift executes these in order.
/// - You can combine conditions using ||, which means that the whole condition is true if
///     either subcondition is true, or &&, which means the whole condition is true if both
///     subconditions are true.
/// - If you’re repeating the same kinds of check a lot, you can use a switch
///     statement instead. These must always be exhaustive, which might mean
///     adding a default case.
/// - If one of your switch cases uses fallthrough, it means Swift will execute
///     the following case afterwards. This is not used commonly.
/// - The ternary conditional operator lets us check WTF: What, True, False. Although
///     it’s a little hard to read at first, you’ll see this used a lot in SwiftUI.
/// - for loops let us loop over arrays, sets, dictionaries, and ranges. You can assign items
///     to a loop variable and use it inside the loop, or you can use underscore, _, to ignore
///     the loop variable.
/// - while loops let us craft custom loops that will continue running until a condition
///     becomes false.
/// - We can skip some or all loop items using continue or break respectively.
///

/// That’s another huge chunk of new material, but with conditions and loops you now know
/// enough to build some really useful software – give it a try!
///


