/// This is important to include required files
/// for application/program to be able to run.
///
import Cocoa

/// When you’ve written some code you really like, and want to use again and again,
/// you should consider putting it into a function. Functions are just chunks of code
/// you’ve split off from the rest of your program, and given a name so you can refer
/// to them easily.
///

/// For example, let’s say we had this nice and simple code.
///
/// That’s a welcome message for an app, and you might want it to be printed when
/// the app launches, or perhaps when the user asks for help.
///
/// But what if you wanted it to be in both places? Yes, you could just copy those four
/// print() lines and put them in both places, but what if you wanted that text in ten places?
/// Or what if you wanted to change the wording later on – would you really remember to change
/// it everywhere it appeared in your code?
///
print("Welcome to my app!")
print("By default This prints out a conversion")
print("chart from centimeters to inches, but you")
print("can also set a custom range if you want.")

/// This is where functions come in: we can pull out that code, give it a name, and run it
/// whenever and wherever we need. This means all the print() lines stay in one place,
/// and get reused elsewhere.
///
/// Here’s how that looks.
///
/// Let’s break that down.
/// - It starts with the func keyword, which marks the start of a function.
/// - We’re naming the function showWelcome. This can be any name you want, but try to
///     make it memorable – printInstructions(), displayHelp(), etc are all good choices.
/// - The body of the function is contained within the open and close braces, just like
///     the body of loops and the body of conditions.
///
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

/// Well, now you’re learning why: those () are used with functions. They are used when
/// you create the function, as you can see above, but also when you call the function –
/// when you ask Swift to run its code. In our case, we can call our function like this.
///
/// That’s known as the function’s call site, which is a fancy name meaning “a place where
/// a function is called.”
///
/// So what do the parentheses actually do? Well, that’s where we add configuration options
/// for our functions – we get to pass in data that customizes the way the function works,
/// so the function becomes more flexible.
///
showWelcome()

/// We can make our own functions that are open to configuration, all by putting extra code
/// in between the parentheses when we create our function. This should be given a single
/// integer, such as 5, and calculate the multiplication tables for that from 1 through 12.
///
/// Notice how I’ve placed number: Int inside the parentheses? That’s called a parameter,
/// and it’s our customization point. We’re saying whoever calls this function must pass in
/// an integer here, and Swift will enforce it. Inside the function, number is available
/// to use like any other constant, so it appears inside the print() call.
///
/// As you can see, when printTimesTables() is called, we need to explicitly write number: 5 –
/// we need to write the parameter name as part of the function call. This isn’t common in
/// other languages, but I think it’s really helpful in Swift as a reminder of what each
/// parameter does.
///
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

/// This naming of parameters becomes even more important when you have multiple parameters.
/// For example, if we wanted to customize how high our multiplication tables went we might
/// make the end of our range be set using a second parameter, like this.
///
/// Now, technically we give slightly different names to sending data and receiving data,
/// and although many people (myself included) ignore this distinction, I’m going to at least
/// make you aware of it so you aren’t caught off guard later.
///
/// There both number and end are parameters: they are placeholder names that will get filled
/// in with values when the function is called, so that we have a name for those values inside
/// the function.
///
/// There the 5 and 20 are arguments: they are the actual values that get sent into the
/// function to work with, used to fill number and end.
///
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

/// So, we have both parameters and arguments: one is a placeholder the other is an
/// actual value, so if you ever forget which is which just remember
/// Parameter/Placeholder, Argument/Actual Value.
///
/// Regardless of whether you’re calling them “arguments” or “parameters”, when you ask Swift
/// to call the function you must always pass the parameters in the order they were listed
/// when you created the function.
///
/// Any data you create inside a function is automatically destroyed when
/// the function is finished.
///

/// What code should be put in a function?
///
/// Functions are designed to let us re-use code easily, which means we don’t have to copy
/// and paste code to get common behaviors. You could use them very rarely if you wanted,
/// but honestly there’s no point – they are wonderful tools for helping us write clearer,
/// more flexible code.
///
/// There are three times you’ll want to create your own functions.
///
/// - The most common time is when you want the same functionality in many places.
///     Using a function here means you can change one piece of code and
///     have everywhere that uses your function get updated.
/// - Functions are also useful for breaking up code. If you have one long function
///     it can be hard to follow everything that’s going on, but if you break it up
///     into three or four smaller functions then it becomes easier to follow.
/// - The last reason is more advanced: Swift lets us build new functions out of
///     existing functions, which is a technique called function composition.
///     By splitting your work into multiple small functions, function composition
///     lets us build big functions by combining those small functions in various ways,
///     a bit like Lego bricks.
///

/// How many parameters should a function accept?
///
/// At first glance, this question seems like “how long is a piece of a string?” That is,
/// it’s something where there is no real, hard answer – a function could take no parameters
/// or take 20 of them.
///
/// That’s certainly true, but when a function takes many parameters – perhaps six or more,
/// but this is extremely subjective – you need to start asking whether that function is
/// perhaps doing a bit too much work.
///
/// - Does it need all six of those parameters?
/// - Could that function be split up into smaller functions that take fewer parameters?
/// - Should those parameters be grouped somehow?
///
/// We’ll look at some techniques for solving this later on, but there’s an important lesson
/// to be learned here: this is called a “code smell” – something about our code that suggests
/// an underlying problem in the way we’ve structured our program.
///





/// How to return values from functions
///
/// You’ve seen how to create functions and how to add parameters to them, but functions
/// often also send data back – they perform some computation, then return the result
/// of that work back to the call site.
///

/// Swift has lots of these functions built in, and there are tens of thousands more in
/// Apple’s frameworks. For example, our playground has always had import Cocoa at the
/// very top, and that includes a variety of mathematical functions such as sqrt()
/// for calculating the square root of a number.
///
/// The sqrt() function accepts one parameter, which is the number we want to calculate
/// the square root of, and it will go ahead and do the work then send back the square root.
///
/// For example, we could write this.
///
let root = sqrt(169)
print(root)

/// If you want to return your own value from a function, you need to do two things.
/// - Write an arrow then a data type before your function’s opening brace, which tells
///     Swift what kind of data will get sent back.
/// - Use the return keyword to send back your data.
///

/// For example, perhaps you want to roll a dice in various parts of your program,
/// but rather than always forcing the dice roll to use a 6-sided dice you could
/// instead make it a function.
///
/// So, that says the function must return an integer, and the actual value is sent
/// back with the return keyword.
///
/// Using this approach you can call rollDice() in lots of places across your program,
/// and they will all use a 6-sided dice. But if in the future you decide you want to
/// use a 20-sided dice, you just need to change that one function to have the rest
/// of your program updated.
///
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

/// When you say your function will return an Int, Swift will make sure it always returns
/// an Int – you can’t forget to send back a value, because your code won’t build.
///

/// Do two strings contain the same letters, regardless of their order? This function
/// should accept two string parameters, and return true if their letters are the same – so,
/// “abc” and “cab” should return true because they both contain one “a”, one “b”, and one “c”.
///
/// If you call sorted() on any string, you get a new string back with all the letters in
/// alphabetical order. So, if you do that for both strings, you can use == to compare them
/// to see if their letters are the same.
///
/// Let’s break that down.
/// - It creates a new function called areLettersIdentical().
/// - The function accepts two string parameters, string1 and string2.
/// - The function says it returns a Bool, so at some point we must always return either
///     true or false.
/// - Inside the function body, we sort both strings then use == to compare the strings –
///     if they are the same it will return true, otherwise it will return false.
///
func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}

/// That code sorts both string1 and string2, assigning their sorted values to new constants,
/// first and second. However, that isn’t needed – we can skip those temporary constants
/// and just compare the results of sorted() directly, like this.
///
func areLettersIdentical1(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

/// That’s less code, but we can do even better. You see, we’ve told Swift that this function
/// must return a Boolean, and because there’s only one line of code in the function Swift
/// knows that’s the one that must return data. Because of this, when a function has only
/// one line of code, we can remove the return keyword entirely, like this.
///
/// Remember, this only works when your function contains a single line of code,
/// and in particular that line of code must actually return the data you promised to return.
///
func areLettersIdentical2(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

/// We can go back and do the same for the rollDice() function too.
///
/// Remember, this only works when your function contains a single line of code,
/// and in particular that line of code must actually return the data you promised to return.
///
func rollDice1() -> Int {
    Int.random(in: 1...6)
}

/// Do you remember the Pythagorean theorem from school? It states that if you have a triangle
/// with one right angle inside, you can calculate the length of the hypotenuse by squaring
/// both its other sides, adding them together, then calculating the square root of the result.
///
func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

/// So, that’s a function called pythagoras(), that accepts two Double parameters and returns
/// another Double. Inside it squares a and b, adds them together, then passes that into sqrt()
/// and sends back the result.
///
let c = pythagoras(a: 3, b: 4)
print(c)

/// That function can also be boiled down to a single line, and have its return keyword removed.
///
func pythagoras1(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

/// There’s one last thing I want to mention before we move on: if your function doesn’t return
/// a value, you can still use return by itself to force the function to exit early.
/// For example, perhaps you have a check that the input matches what you expected,
/// and if it doesn’t you want to exit the function immediately before continuing.
///
func nothingToDo() {
    return
}

/// When is the return keyword not needed in a Swift function?
///
/// We use the return keyword to send back values from functions in Swift, but there is
/// one specific case where it isn’t needed: when our function contains only
/// a single expression.
///
/// So, lots of code we write can be resolved to a single value. But there’s also a lot
/// of code that can’t be resolved to a single value. For example, what’s the value here.
///
/// Yes, that creates a constant, but it doesn’t become a value in its own right –
/// we couldn’t write return let name = "Otis".
///
let name = "Otis"

/// Similarly, we write conditions like this.
///
/// That also can’t become a single value, because it has a condition in there.
///
if name == "Maeve" {
    print("Hello, Maeve!")
}

/// Now, all this matters because these divisions have names: when our code can be boiled down
/// to a single value, such as true, false, “Hello”, or 19, we call that an expression.
/// Expressions are things that can be assigned to a variable, or printed using print().
/// On the other hand, when we’re performing actions such as creating variables,
/// starting a loop, or checking a condition, then we call that a statement.
///
/// All this matters because Swift lets us skip using the return keyword when we have only
/// one expression in our function. So, these two functions do the same thing.
///
/// Remember, the expression inside there can be as long as you want, but it can’t
/// contain any statements – no loops, no conditions, no new variables, and so on.
///
/// Now, you might think this is pointless, and you would always use the return keyword.
/// However, this functionality is used very commonly with SwiftUI,
/// so it’s worth keeping in mind.
///
func doMath() -> Int {
    return 5 + 5
}

func doMoreMath() -> Int {
    5 + 5
}

/// You’ve seen how we can use operators such as +, &&, and || in our expressions, because
/// they still resolve to a single value. Well, the ternary operator works here too, and
/// in fact this is the primary use case for it: when you want to have a single expression,
/// but don’t want to have a full if.
///
/// To demonstrate this, consider the following function.
///
func greet(name: String) -> String {
    if name == "Taylor Swift" {
        return "Oh wow!"
    } else {
        return "Hello, \(name)"
    }
}

/// If we wanted to remove the return statements in there, we could not write this.
///
/// That isn’t allowed, because we have actual statements in there – if and else.
///
//func greet(name: String) -> String {
//    if name == "Taylor Swift" {
//        "Oh wow!"
//    } else {
//        "Hello, \(name)"
//    }
//}

/// However, we could use the ternary operator like this.
///
/// That is a single expression. If name is equal to “Taylor Swift” then it will resolve
/// something like this.
///
/// - Swift will check whether name is Taylor Swift or not.
/// - It is, so name == "Taylor Swift" is true.
/// - The ternary operator will realize its condition is now true, so it will pick
///     “Oh wow” rather than “Hello, (name)”.
///
func greet1(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}

/// So, when that function runs it effectively boils down to this.
///
func greet2(name: String) -> String {
    "Oh wow!"
}

/// Letting us put conditional functionality into a single line of code is where the
/// ternary operator really shines. And, because SwiftUI uses single expression
/// functions quite a lot, this means ternary operators get used in SwiftUI
/// quite a lot too.
///





/// How to return multiple values from functions
///
/// When you want to return a single value from a function, you write an arrow and a data
/// type before your function’s opening brace, like this.
///
/// That compares a string against the uppercased version of itself. If the string was
/// already fully uppercased then nothing will have changed and the two strings will be
/// identical, otherwise they will be different and == will send back false.
///
func isUpperCase(string: String) -> Bool {
    string == string.uppercased()
}

/// If you want to return two or more values from a function, you could use an array.
/// For example, here’s one that sends back a user’s details.
///
/// That’s problematic, because it’s hard to remember what user[0] and user[1] are,
/// and if we ever adjust the data in that array then user[0] and user[1] could end up
/// being something else or perhaps not existing at all.
///
func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")

/// We could use a dictionary instead, but that has its own problems.
///
/// Yes, we’ve now given meaningful names to the various parts of our user data, but look at
/// that call to print() – even though we know both firstName and lastName will exist,
/// we still need to provide default values just in case things aren’t what we expect.
///
func getUser1() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift",
    ]
}

let user1 = getUser1()
print("Name: \(user1["firstName", default: "Anonymous"]) \(user1["lastName", default: "Anonymous"])")

/// Both of these solutions are pretty bad, but Swift has a solution in the form of tuples.
/// Like arrays, dictionaries, and sets, tuples let us put multiple pieces of data into
/// a single variable, but unlike those other options tuples have a fixed size and
/// can have a variety of data types.
///
/// Here’s how our function looks when it returns a tuple.
///
/// Let’s break that down
/// - Our return type is now (firstName: String, lastName: String), which is a tuple
///     containing two strings.
/// - Each string in our tuple has a name. These aren’t in quotes: they are specific names
///     for each item in our tuple, as opposed to the kinds of arbitrary keys we had
///     in dictionaries.
/// - Inside the function we send back a tuple containing all the elements we promised,
///     attached to the names: firstName is being set to “Taylor”, etc.
/// - When we call getUser(), we can read the tuple’s values using the key names: firstName,
///     lastName, etc.
///
/// Hacking With Swift know tuples seem awfully similar to dictionaries, but they are different.
/// - When you access values in a dictionary, Swift can’t know ahead of time whether
///     they are present or not. Yes, we knew that user["firstName"] was going to be there,
///     but Swift can’t be sure and so we need to provide a default value.
/// - When you access values in a tuple, Swift does know ahead of time that it is
///     available because the tuple says it will be available.
/// - We access values using user.firstName: it’s not a string, so there’s also
///     no chance of typos.
/// - Our dictionary might contain hundreds of other values alongside "firstName",
///     but our tuple can’t – we must list all the values it will contain,
///     and as a result it’s guaranteed to contain them all and nothing else.
///
/// So, tuples have a key advantage over dictionaries: we specify exactly which values
/// will exist and what types they have, whereas dictionaries may or may not contain
/// the values we’re asking for.
///
func getUser2() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user2 = getUser2()
print("Name: \(user2.firstName) \(user2.lastName)")

/// There are three other things it’s important to know when using tuples.
///
/// First, if you’re returning a tuple from a function, Swift already knows the names you’re
/// giving each item in the tuple, so you don’t need to repeat them when using return.
/// So, this code does the same thing as our previous tuple.
///
func getUser3() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

/// Second, sometimes you’ll find you’re given tuples where the elements don’t have names.
/// When this happens you can access the tuple’s elements using numerical indices
/// starting from 0, like this.
///
/// These numerical indices are also available with tuples that have named elements,
/// but I’ve always found using names preferable.
///
func getUser4() -> (String, String) {
    ("Taylor", "Swift")
}

let user4 = getUser4()
print("Name: \(user4.0) \(user4.1)")

/// Finally, if a function returns a tuple you can actually pull the tuple apart into
/// individual values if you want to.
///
/// To understand what I mean by that, first take a look at this code.
///
/// That goes back to the named version of getUser(), and when the tuple comes out we’re
/// copying the elements from there into individual contents before using them.
/// There’s nothing new here; we’re just moving data around a bit.
///
func getUser5() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user5 = getUser5()
let firstName = user5.firstName
let lastName = user5.lastName

print("Name: \(firstName) \(lastName)")


/// However, rather than assigning the tuple to user, then copying individual values
/// out of there, we can skip the first step – we can pull apart the return value
/// from getUser() into two separate constants, like this.
///
/// That syntax might hurt your head at first, but it’s really just shorthand for
/// what we had before: convert the tuple of two elements that we get back from
/// getUser() into two separate constants.
///
func getUser6() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let (firstName1, lastName1) = getUser6()
print("Name: \(firstName1) \(lastName1)")

/// In fact, if you don’t need all the values from the tuple you can go a step further
/// by using _ to tell Swift to ignore that part of the tuple.
///
func getUser7() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let (firstName2, _) = getUser7()
print("Name: \(firstName2)")

/// When should you use an array, a set, or a tuple in Swift?
///
/// Because arrays, sets, and tuples work in slightly different ways, it’s important to make
/// sure you choose the right one so your data is stored correctly and efficiently.
///
/// Remember: arrays keep the order and can have duplicates, sets are unordered and
/// can’t have duplicates, and tuples have a fixed number of values of fixed types inside them.
///
/// So.
/// - If you want to store a list of all words in a dictionary for a game, that has
///     no duplicates and the order doesn’t matter so you would go for a set.
/// - If you want to store all the articles read by a user, you would use a set
///     if the order didn’t matter (if all you cared about was whether they had
///     read it or not), or use an array if the order did matter.
/// - If you want to store a list of high scores for a video game, that has an order
///     that matters and might contain duplicates (if two players get the same score),
///     so you’d use an array.
/// - If you want to store items for a todo list, that works best when the order
///     is predictable so you should use an array.
/// - If you want to hold precisely two strings, or precisely two strings and an integer,
///     or precisely three Booleans, or similar, you should use a tuple.
///






/// How to customize parameter labels
///
/// You’ve seen how Swift developers like to name their function parameters, because it makes
/// it easier to remember what they do when the function is called. For example, we could write
/// a function to roll a dice a certain number of times, using parameters to control the number
/// of sides on the dice and the number of rolls.
///
/// Even if you came back to this code six months later,
/// rollDice(sides: 6, count: 4) is pretty self-explanatory.
///
func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()
    
    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to out array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    
    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

/// This method of naming parameters for external use is so important to Swift that it
/// actually uses the names when it comes to figuring out which method to call.
/// This is quite unlike many other languages, but this is perfect valid in Swift.
///
/// Those are all functions called hireEmployee(), but when you call them Swift knows
/// which one you mean based on the parameter names you provide. To distinguish between
/// the various options, it’s very common to see documentation refer to each function
/// including its parameters, like this: hireEmployee(name:) or hireEmployee(title:).
///
func hireEmployee(name: String)  {}
func hireEmployee(title: String)  {}
func hireEmployee(location: String)  {}

/// Sometimes, though, these parameter names are less helpful, and there are two ways
/// that are to look at.
///
/// First, think about the hasPrefix() function you learned earlier.
///
/// When we call hasPrefix() we pass in the prefix to check for directly – we don’t say
/// hasPrefix(string:) or, worse, hasPrefix(prefix:). How come?
///
let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))

/// Well, when we’re defining the parameters for a function we can actually add two names:
/// one for use where the function is called, and one for use inside the function itself.
/// hasPrefix() uses this to specify _ as the external name for its parameter, which is
/// Swift’s way of saying “ignore this” and causes there to be no external label for
/// that parameter.
///
/// We can use the same technique in our own functions, if you think it reads better.
/// For example, previously we had this function.
///
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

let string1 = "HELLO, WORLD"
let result1 = isUppercase(string: string1)

/// You might look at that and think it’s exactly right, but you might also look at
/// string: string and see annoying duplication. After all, what else are we going
/// to pass in there other than a string?
///
/// If we add an underscore before the parameter name, we can remove the external parameter
/// label like so.
///
/// This is used a lot in Swift, such as with append() to add items to an array, or contains()
/// to check whether an item is inside an array – in both places it’s pretty evident what
/// the parameter is without having a label too.
///
func isUppercase1(_ string: String) -> Bool {
    string == string.uppercased()
}

let string2 = "HELLO, WORLD"
let result2 = isUppercase1(string2)

/// The second problem with external parameter names is when they aren’t quite right –
/// you want to have them, so _ isn’t a good idea, but they just don’t read naturally
/// at the function’s call site.
///
/// As an example, here’s another function we looked at earlier.
///
func printTimesTables1(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables1(number: 5)

/// That code is valid Swift, and we could leave it alone as it is. But the call site doesn’t
/// read well: printTimesTables(number: 5). It would be much better like this.
///
/// That reads much better at the call site – you can literally say “print times table for 5”
/// aloud, and it makes sense. But now we have invalid Swift: although for is allowed and
/// reads great at the call site, it’s not allowed inside the function.
///
//func printTimesTables2(for: Int) {
//    for i in 1...12 {
//        print("\(i) x \(for) is \(i * for)")
//    }
//}
//
//printTimesTables2(for: 5)

/// You already saw how we can put _ before the parameter name so that we don’t need to write
/// an external parameter name. Well, the other option is to write a second name there:
/// one to use externally, and one to use internally.
///
/// Here’s how that looks.
///
/// There are three things in there you need to look at closely.
/// - We write for number: Int: the external name is for, the internal name is number,
///     and it’s of type Int.
/// - When we call the function we use the external name for the parameter:
///     printTimesTables(for: 5).
/// - Inside the function we use the internal name for the parameter:
///     print("\(i) x \(number) is \(i * number)").
///
func printTimesTables3(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables3(for: 5)

/// So, Swift gives us two important ways to control parameter names: we can use _ for the
/// external parameter name so that it doesn’t get used, or add a second name there
/// so that we have both external and internal parameter names.
///
/// Earlier Hacking With Swift mentioned that technically values you pass in to a function
/// are called “arguments”, and values you receive inside the function are called parameters.
/// This is where things get a bit muddled, because now we have argument labels and parameter
/// names side by side, both in the function definition. Hacking With Swift be using the term
/// “parameter” for both, and when the distinction matters you’ll see I distinguish between
/// them using “external parameter name” and “internal parameter name”.
///

/// When should you omit a parameter label?
///
/// If we use an underscore for a function parameter’s external label, Swift lets us
/// use no name for that parameter at all. This is very common practice in some parts
/// of Swift development, particularly when building apps that don’t use SwiftUI,
/// but there are many other times when you’ll also want to use this.
///
/// The main reason for skipping a parameter name is when your function name is a verb
/// and the first parameter is a noun the verb is acting on. For example.
/// - Greeting a person would be greet(taylor) rather than greet(person: taylor)
/// - Buying a product would be buy(toothbrush) rather than buy(item: toothbrush)
/// - Finding a customer would be find(customer) rather than find(user: customer)
///
/// This is particularly important when the parameter label is likely to be the same as
/// the name of whatever you’re passing in.
/// - Singing a song would be sing(song) rather than sing(song: song)
/// - Enabling an alarm would be enable(alarm) rather than enable(alarm: alarm)
/// - Reading a book would be read(book) rather than read(book: book)
///
/// Before SwiftUI came along, apps were built using Apple’s UIKit, AppKit, and WatchKit
/// frameworks, which were designed using an older language called Objective-C.
/// In that language, the first parameter to a function was always left unnamed,
/// and so when you use those frameworks in Swift you’ll see lots of functions
/// that have underscores for their first parameter label to preserve interoperability
///  with Objective-C.
///  
