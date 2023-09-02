/// This is important to include required files
/// for application/program to be able to run.
///
import Cocoa

/// How to store truth with Booleans
///
/// The fourth type of data that snuck in at the same time:
/// A very simple type called a Boolean, which stores
/// either true or false.
///
/// If you were curious, Booleans were named after George Boole,
/// an English mathematician who spent a great deal of time
/// researching and writing about logic.
///
/// Both hasSuffix() and isMultiple(of:) return a new value
/// based on their check: Either the string has the suffix or
/// it doesn’t, and either 120 is a multiple of 3 or it isn’t.
///
/// In both places there’s always a simple true or false answer,
/// which is where Booleans come in –
/// They store just that, and nothing else.
///
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

/// Making a Boolean is just like making the other data types,
/// except you should assign an initial value of either true or false.
///
let goodDogs = true
let gameOver = false

/// You can also assign a Boolean’s initial value from some other code,
/// as long as ultimately it’s either true or false.
///
let isMultiple = 120.isMultiple(of: 3)

/// Booleans do have one special operator, !, which means “not”.
/// This flips a Boolean’s value from true to false, or false to true.
///
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

/// Booleans do have a little extra functionality that can be useful.
/// In particular, if you call toggle() on a Boolean it will flip
/// a true value to false, and a false value to true.
///
var gameOver1 = false
print(gameOver1)

gameOver1.toggle()
print(gameOver1)





/// How to join strings together
///
/// Swift gives us two ways to combine Strings together: Joining them
/// using +, and a special technique called string interpolation
/// that can place variables of any type directly inside Strings.
///
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart
print(greeting)

/// You can do this many times if you need to.
///
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

/// Notice how we’re using + to join two strings, but when we used
/// Int and Double it added numbers together? This is called
/// operator overloading – The ability for one operator such as +
/// to mean different things depending on how it’s used.
/// For strings, it also applies to +=, which adds
/// one string directly to another.
///
/// This technique works great for small things, but you wouldn’t
/// want to do it too much. You see, each time Swift sees
/// two strings being joined together using + it has to make
/// a new string out of them before continuing, and if you have
/// lots of things being joined it’s quite wasteful.
///
/// Swift can’t join all those strings in one go. Instead, it will
/// join the first two to make “12”, then join “12” and “3”
/// to make “123”, then join “123” and “4” to make “1234”,
/// and finally join “1234” and “5” to make “12345” –
/// It makes temporary strings to hold “12”, “123”, and “1234”
/// even though they aren’t ultimately used when the code finishes.
///
let luggageCode = "1" + "2" + "3" + "4" + "5"

/// Swift has a better solution called string interpolation,
/// and it lets us efficiently create strings from other strings,
/// but also from integers, decimal numbers, and more.
///

/// If you remember, earlier I said that you can include double quotes
/// inside strings as long as they have a backslash before them
/// so Swift knows to treat them specially.
///
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

/// Something very similar is used with string interpolation:
/// You write a backslash inside your string, then place the name
/// of a variable or constant inside parentheses.
///
/// For example, we could create one string constant and one integer constant,
/// then combine them into a new string.
///
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

/// String interpolation is much more efficient than using + to join Strings
/// one by one, but there’s another important benefit too: You can pull in
/// integers, decimals, and more with no extra work.
///

/// You see, using + lets us add strings to strings, integers to integers,
/// and decimals to decimals, but doesn’t let us add integers to strings.
/// So, this kind of code is not allowed.
///
let number1 = 11
//let missionMessage = "Apollo " + number1 + " landed on the moon."

/// You could ask Swift to treat the number like a string if you wanted.
///
//let missionMessage = "Apollo " + String(number1) + " landed on the moon."

/// It is still both faster and easier to read to use string interpolation.
///
let missionMessage = "Apollo \(number1) landed on the moon."

/// You can put calculations inside string interpolation if you want to.
///
print("5 x 5 is \(5 * 5)")

/// Why does Swift have string interpolation?
///
/// When it comes time to showing information to your user –
/// Whether that’s messages being printed out, text on buttons,
/// or whatever fits your app idea – You will usually rely heavily on Strings.
///
/// Of course, we don’t just want static Strings, because we want to show
/// the user some sort of relevant data they can use. So, Swift gives us
/// string interpolation as a way of injecting custom data into Strings at runtime:
/// It replaces one or more parts of a string with data provided by us.
///
var city = "Cardiff"
var message1 = "Welcome to \(city)!"

/// Of course, in that trivial example we could have just written our city name
/// directly into the string – “Welcome to Cardiff!” – but in real apps having this
/// inserted dynamically is important because it lets us show real-world user data
/// rather than things we typed ourselves.
///
/// Swift is capable of placing any kind of data inside string interpolation.
/// The result might not always be useful, but for all of Swift’s basic types –
/// Strings, Integers, Booleans, etc – The results are great.





/// Summary: Simple data
///
/// - Swift lets us create constants using let, and variables using var.
/// - If you don’t intend to change a value, make sure you use let so that Swift
///     can help you avoid mistakes.
/// - Swift’s strings contain text, from short strings up to whole novels.
///     They work great with emoji and any world language, and have helpful
///     functionality such as count and uppercased().
/// - You create strings by using double quotes at the start and end,
///     but if you want your string to go over several lines you need to use
///     three double quotes at the start and end.
/// - Swift calls its whole numbers integers, and they can be positive or negative.
///     They also have helpful functionality, such as isMultiple(of:).
/// - In Swift decimal numbers are called Double, short for
///     double-length floating-point number. That means they can hold
///     very large numbers if needed, but they also aren’t 100% accurate –
///     You shouldn’t use them when 100% precision is required,
///     such as when dealing with money.
/// - There are lots of built-in arithmetic operators, such as +, -, *, and /,
///     along with the special compound assignment operators such as
///     +=, -=, *=, /=, that modify variables directly.
/// - You can represent a simple true or false state using a Boolean,
///     which can be flipped using the ! operator or by calling toggle().
/// - String interpolation lets us place constants and variables into our
///     Strings in a streamlined, efficient way.
///


