/// This is important to include required files
/// for application/program to be able to run.
///
import Cocoa

/// How to create variables
///
/// The var keyword means "Create a new variable".
/// That creates a new variable called greeting,
/// and because it's variable value can vary -
/// it can change as our program runs.
///
/// The greeting keyword means variable name.
/// You can call your variable anything you want.
/// You'll want to make it descriptive.
///
/// The equal sign means you assigns a value
/// to your variable name.
/// Those spaces on either side of the equals sign
/// are not required, but it's the most common style.
///
/// The initial value we're assigning
/// is the text "Hello, playground".
/// Notice that text is written inside double quotes,
/// so that Swift can see where the text starts and where
/// it ends.
///
var greeting = "Hello, playground"

/// Swift does allow semicolons, but they are very rare -
/// you'll only ever need them if you want to write
/// two pieces of code on the same line for some reason.
///

/// That creates a new variable called name, and
/// gives it initial value of text "Ted".
/// It then gets changed twice, first to "Rebecca" and
/// then to "Keely".
/// We don't use var again because we are modifying
/// an existing variable than creating a new one.
/// The old value is discarded each time you change
/// the variable value.
///
var name = "Ted"
name = "Rebecca"
name = "Keely"

/// Why does Swift have variables?
///
/// Variables allow us to store temporary information in our program,
/// and form a key part of almost every Swift program. Ultimately,
/// your program is going to transform data somehow:
/// Maybe you let the user enter in todo list tasks then check them off,
/// maybe you let them roam around a deserted island working for
///  a capitalist raccoon, or maybe you read the device time and
///  display it in a clock. Regardless, you’re taking some sort of data,
///  transforming it somehow, and showing it to the user.
///

/// Of course, the “transforming it somehow” is where the real magic comes in,
/// because that’s the part where your brilliant app idea happens.
/// But the process of storing data in memory – holding on to something the user typed,
/// or something you downloaded from the internet – is where variables come in.
///

/// Once you create a variable using var, you can change it as often as you want
/// without using var again.
///
/// If it helps, try reading var as “create a new variable”. So, the first line above
/// might be read out loud as “create a new variable called favoriteShow and give it
/// the value Orange is the New Black.” Lines 2 and 3 don’t have var in there,
/// so they modify the existing value rather than creating a new variable.
///
/// Now imagine you had var on all three lines – you used var favoriteShow each time.
/// That wouldn’t make much sense, because you’d be saying “create a new variable
/// called favoriteShow” three times over, and the variable is clearly not new
/// after your first attempt. Swift will flag this as an error, which means
/// it won’t let you run your code until you pick a different name for your variables.
///
var favoriteShow = "Orange is the New Black"
favoriteShow = "The Good Place"
favoriteShow = "Doctor Who"

/// That might seem like annoying behavior, but it’s helpful! Swift wants you to be clear:
/// Are you trying to modify an existing variable (if so, remove the var the second and
/// subsequent times), or are you trying to create a new variable (in which case,
/// name it something else.)
///





/// How to create constants
///
/// If you don't ever want to change a value,
/// you need to use a constant instead.
/// Creating a constant works almost identically
/// to creating a variable, except we use
/// let keyword rather than var keyword.
///
let character = "Daphne"

/// Now, when we use let keyword, we make a constant,
/// which is a value that can't change.
/// Swift literally won't let us, and will show
/// a big error if we try.
///
//character = "Eloise"
//character = "Francesca"

/// if you were curious, let keyword comes from the
/// mathemathics world, where they say things like
/// "let x be equal to 5".
///

/// When you're learning Swift, you can ask XCode
/// to print out the value of any variable or constant.
/// You won't see what's printed in real apps.
/// It's really helpful as a simple way of seeing
/// what's inside your data.
///
var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

/// Swift doesn't really care what you name your
/// constants and variables as long as you refer
/// to them the same way everywhere.
///
/// Although Swift doesn’t care how we name our data,
/// the naming style I’m using is the standard among
/// Swift developers – what we call a convention.
///
/// If you’re curious, the style is called “camel case”,
/// because the second and subsequent words in
/// a name start with a little bump for the capital letter.
///
let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

/// If you can, prefer to use constants rather than variables –
/// not only does it give Swift the chance to optimize your code
/// a little better, but it also allows Swift to make sure
/// you never change a constant’s value by accident.
///

/// Why does Swift have constants as well as variables?
///
/// Variables are a great way to store temporary data in your programs,
/// but Swift gives us a second option that’s even better: constants.
/// They are identical to variables in every way, with one important difference:
/// We can’t change their values once they are set.
///
/// Swift really loves constants, and in fact will recommend you use one
/// if you created a variable then never changed its value. The reason for this
/// is about avoiding problems: any variable you create can be changed by you
/// whenever you want and as often as you want, so you lose some control –
/// That important piece of user data you stashed away might be removed or
/// replaced at any point in the future.
///
/// Constants don’t let us change values once they are set, so it’s a bit like
/// a contract with Swift: you’re saying “this value matters, don’t let me change it
/// no matter what I do.” Sure, you could try to make the same contract with a variable,
/// but one slip of your keyboard could screw things up and Swift wouldn’t be able to help.
/// By using a constant instead – just by changing var to let – you’re asking Swift to
/// make sure the value never changes, which is another thing you no longer need to worry about.
///





/// How to create strings
///
/// When you assign text to a constant or variable,
/// we call that a string – think of a bunch of Scrabble tiles
/// threaded onto a string to make a word.
///
/// Swift’s strings start and end with double quotes,
/// but what you put inside those quotes is down to you.
///
let actor = "Denzel Washington"

/// You can use punctuation, emoji and other characters.
///
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

/// And you can even use other double quotes inside your string,
/// as long as you’re careful to put a backslash before them
/// so that Swift understands they are inside the string rather
/// than ending the string.
///
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

/// There is no realistic limit to the length of your strings,
/// meaning that you could use a string to store something very long
/// such as the complete works of Shakespeare.
///

/// However, what you’ll find is that Swift doesn’t like
/// line breaks in its strings.
///
//let movie = "A day in
//the life of an
//Apple engineer"

/// That doesn’t mean you can’t create strings across multiple lines,
/// just that Swift needs you to treat them specially:
/// Rather than one set of quotes on either side of your string, you use three.
///
/// The triple quotes at the start and end are on their own line,
/// with your string in between.
///
let movie  = """
A day in
the life of an
Apple engineer
"""

/// Once you’ve created your string, you’ll find that Swift gives us
/// some useful functionality to work with its contents.
///
/// First, you can read the length of a string by writing .count
/// after the name of the variable or constant.
///
/// Because actor has the text “Denzel Washington”, that will print 17 –
/// one for each letter in the name, plus the space in the middle.
///
print(actor.count)

/// You don’t need to print the length of a string directly
/// if you don’t want to – you can assign it to another constant.
///
let nameLength = actor.count
print(nameLength)

/// The second useful piece of functionality is uppercased(),
/// which sends back the same string except every one of its letter is uppercased.
///
print(result.uppercased())

/// Yes, the open and close parentheses are needed here but aren’t needed with count.
/// At this early stage, the distinction is best explained like this:
/// If you’re asking Swift to read some data you don’t need the parentheses,
/// but if you’re asking Swift to do some work you do.
///

/// The last piece of helpful string functionality is called hasPrefix(),
/// and lets us know whether a string starts with some letters of our choosing.
///
print(movie.hasPrefix("A day"))

/// There’s also a hasSuffix() counterpart, which checks whether
/// a string ends with some text.
///
print(filename.hasSuffix(".jpg"))

/// Why does Swift need multi-line strings?
///
/// Swift’s standard strings start and end with quotes, but must never contain
/// any line breaks. For example, this is a standard string.
///
var quote1 = "Change the world by being yourself"

/// That works fine for small pieces of text, but becomes ugly in source code
/// if you have lots of text you want to store. That’s where multi-line strings
/// come in: If you use triple quotes you can write your strings across
/// as many lines as you need, which means the text remains easy to read in your code.
///
/// Swift sees those line breaks in your string as being part of the text itself,
/// so that string actually contains three lines.
///
var burns = """
The best laid schemes
O' mice and men
gang aft agley
"""





/// How to store whole numbers
///
/// When you’re working with whole numbers such as 3, 5, 50, or 5 million,
/// you’re working with what Swift calls integers, or Int for short –
/// “integer” is originally a Latin word meaning “whole”, if you were curious.
///

/// Making a new integer works just like making a String: Use let or var
/// depending on whether you want a constant or variable, provide a name,
/// then give it an initial value.
///
/// For example, we could create a score constant.
///
let score = 10

/// Integers can be really big – past billions, past trillions, past quadrillions,
/// and well into quintillions, but they they can be really small too –
/// they can hold negative numbers up to quintillions.
///

/// When you’re writing out numbers by hand, it can be hard to see quite what’s going on.
///
//let reallyBig = 100000000

/// If we were writing that out by hand we’d probably write “100,000,000”
/// at which point it’s clear that the number is 100 million.
/// Swift has something similar: You can use underscores, _,
/// to break up numbers however you want.
///
//let reallyBig = 100_000_000

/// Swift doesn’t actually care about the underscores,
/// so if you wanted you could write this.
/// The end result is the same: reallyBig gets set to an integer
/// with the value of 100,000,000.
///
let reallyBig = 1_00__00___00____00

/// You can also create integers from other integers,
/// using the kinds of arithmetic operators that you learned at school:
/// + for addition, - for subtraction, * for multiplication, and / for division.
///
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

/// Rather than making new constants each time, Swift has some special operations
/// that adjust an integer somehow and assigns the result back to the original number.
/// This creates a counter variable equal to 10, then adds 5 more to it.
///
var counter = 10
//counter = counter + 5

/// Rather than writing counter = counter + 5, you can use the shorthand operator +=,
/// which adds a number directly to the integer in question.
///
counter += 5
print(counter)

/// That does exactly the same thing, just with less typing.
/// We call these Compound Assignment Operators.
///
counter *= 2
print(counter)

counter -= 10
print(counter)

counter /= 2
print(counter)

/// Like Strings, Integers have some useful functionality attached.
/// For example, you can call isMultiple(of:) on an Integer
/// to find out whether it’s a multiple of another integer.
///
let number = 120
print(number.isMultiple(of: 3))

/// I’m calling isMultiple(of:) on a constant there,
/// but you can just use the number directly.
///
print(120.isMultiple(of: 3))





/// How to store decimal numbers
///
/// When you’re working with decimal numbers such as 3.1, 5.56, or 3.141592654,
/// you’re working with what Swift calls Floating-Point numbers.
/// The name comes from the surprisingly complex way the numbers are stored by your computer:
/// It tries to store very large numbers such as 123,456,789 in the same amount of space
/// as very small numbers such as 0.0000000001, and the only way it can do that is
/// by moving the decimal point around based on the size of the number.
///

/// This storage method causes decimal numbers to be notoriously problematic for programmers,
/// and you can get a taste of this with just two lines of Swift code.
/// When that runs it won’t print 0.3. Instead, it will print 0.30000000000000004 –
/// that 0.3, then 15 zeroes, then a 4 because it’s complex.
///
let doubleNumber = 0.1 + 0.2
print(doubleNumber)

/// First, when you create a Floating-Point number, Swift considers it to be a Double.
/// That’s short for “double-precision floating-point number”. In this case,
/// it means Swift allocates twice the amount of storage as some older languages would do,
/// meaning a Double can store absolutely massive numbers.
///

/// Second, Swift considers decimals to be a wholly different type of data to integers,
/// which means you can’t mix them together. After all, integers are always 100% accurate,
/// whereas decimals are not, so Swift won’t let you put the two of them together unless
/// you specifically ask for it to happen.
///

/// In practice, this means you can’t do things like adding an integer to a decimal,
/// so this kind of code will produce an error.
///
let a = 1
let b = 2.0
//let c = a + b

/// We can see that b is really just the integer 2 masquerading as a decimal,
/// but Swift still won’t allow that code to run. This is called type safety:
/// Swift won’t let us mix different types of data by accident.
///

/// If you want that to happen you need to tell Swift explicitly that it should
/// either treat the Double inside b as an Int.
///
//let c = a + Int(b)

/// Or treat the Int inside a as a Double.
///
//let c  = Double(a) + b


/// Third, Swift decides whether you wanted to create a Double or an Int
/// based on the number you provide – If there’s a dot in there,
/// you have a Double, otherwise it’s an Int.
/// Yes, even if the numbers after the dot are 0.
///
let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

/// Combined with type safety, this means that once Swift has decided
/// what data type a constant or variable holds, it must always hold
/// that same data type. That means this code is fine.
///
var name1 = "Nicolas Cage"
name1 = "John Travolta"

/// But this kind of code is not.
/// That tells Swift name will store a String, but then it tries to put
/// an Integer in there instead.
///
//var name2 = "Nicolas Cage"
//name2 = 57

/// Finally, decimal numbers have the same range of operators and
/// compound assignment operators as integers.
///
var rating = 5.0

rating += 5
print(rating)

rating *= 2
print(rating)

rating -= 10
print(rating)

rating /= 2
print(rating)

/// Many older APIs use a slightly different way of storing decimal numbers, called CGFloat.
/// Fortunately, Swift lets us use regular Double numbers everywhere a CGFloat is expected,
/// so although you will see CGFloat appear from time to time you can just ignore it.
///
/// In case you were curious, the reason floating-point numbers are complex is because
/// computers are trying to use binary to store complicated numbers. For example,
/// if you divide 1 by 3 we know you get 1/3, but that can’t be stored in binary,
/// so the system is designed to create very close approximations. It’s extremely efficient,
/// and the error is so small it’s usually irrelevant, but at least you know why Swift
/// doesn’t let us mix Int and Double by accident!
///

/// Why does Swift need both Doubles and Integers?
///
/// Swift gives us several different ways of storing numbers in our code, and they are
/// designed to solve different problems. Swift doesn’t let us mix them together because
/// doing so will (as in, 100% guaranteed) lead to problems.
///
/// The two main types of numbers you’ll use are called integers and doubles. Integers hold
/// whole numbers, such as 0, 1, -100, and 65 million, whereas doubles hold decimal numbers,
/// such as 0.1, -1.001, and 3.141592654.
///
/// When creating a numeric variable, Swift decides whether to consider it an integer or
/// a double based on whether you include a decimal point.
///
var myInt = 1
var myDouble = 1.0

/// As you can see, they both contain the number 1, but the former is an integer and
/// the latter a double.
///
/// Now, if they both contain the number 1, you might wonder why we can’t add them together –
/// Why can’t we write var total = myInt + myDouble? The answer is that Swift is playing it safe:
/// We can both see that 1 plus 1.0 will be 2, but your double is a variable so it could be
/// modified to be 1.1 or 3.5 or something else.
///
/// How can Swift be sure it’s safe to add an integer to a double – How can it be sure you won’t
/// lose the 0.1 or 0.5? The answer is that it can’t be safe, which is why it isn’t allowed.
///





/// Why is Swift a type-safe language?
///
/// Swift lets us create variables as strings and integers, but also many other types of data too.
/// When you create a variable Swift can figure out what type the variable is based on what kind
/// of data you assign to it, and from then on that variable will always have
/// that one specific type.
///

/// This creates a new variable called meaningOfLife equal to 42.
/// Because we assigned 42 as the initial value of meaningOfLife, Swift will assign
/// it the type integer – a whole number. It’s a variable, which means we can change
/// its value as often as we need to, but we can’t change its type:
/// It will always be an integer.
var meaningOfLife1 = 42

/// This is extremely helpful when building apps, because it means Swift will make sure
/// we don’t make mistakes with our data.
///
/// That tries to assign a String to a variable that is an Integer, which isn’t allowed.
/// Although we rarely make such an obvious mistake, you will find that this type safety
/// helps out every single day you’re writing code with Swift.
///
/// Think about it: we just created one variable then tried to change its type,
/// which will obviously fail. But as your programs grow in size and complexity,
/// it becomes impossible to keep the types of your variables in your head at all times,
/// so we’re effectively shifting that work on to Swift instead.
///
//meaningOfLife1 = "Forty Two"


