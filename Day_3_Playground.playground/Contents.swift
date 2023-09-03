/// This is important to include required files
/// for application/program to be able to run.
///
import Cocoa

/// How to store ordered data in arrays
///
/// In Swift, we do this grouping using an array. Arrays are their own data type
/// just like String, Int, and Double, but rather than hold just one string
/// they can hold zero strings, one string, two strings, three, fifty,
/// fifty million, or even more strings – They can automatically adapt to hold
/// as many as you need, and always hold data in the order you add it.
///
/// That creates three different arrays: one holding strings of people’s names,
/// one holding integers of important numbers, and one holding decimals of
/// temperatures in Celsius.
///
/// Notice how we start and end arrays using square brackets,
/// with commas between every item.
///
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

/// When it comes to reading values out from an array, we ask for values by
/// the position they appear in the array. The position of an item in an array
/// is commonly called its index.
///
/// Make sure an item exists at the index you’re asking for, otherwise
/// your code will crash – your app will just stop working.
///
/// This confuses beginners a bit, but Swift actually counts an item’s index
/// from zero rather than one – beatles[0] is the first element,
/// and beatles[1] is the second, for example.
///
print(beatles[0])
print(numbers[1])
print(temperatures[2])

/// If your array is variable, you can modify it after creating it.
/// For example, you can use append() to add new items.
///
beatles.append("Adrian")

/// And there’s nothing stopping you from adding items more than once.
///
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

/// However, Swift does watch the kind of data you’re trying to add,
/// and will make sure your array only ever contains one type of data
/// at a time. So, this kind of code isn’t allowed.
///
//temperatures.append("Chris")

/// This also applies to reading data out of the array – Swift knows
/// that the beatles array contains strings, so when you read one value out
/// you’ll always get a string. If you try to do the same with numbers,
/// you’ll always get an integer. Swift won’t let you mix these two different
/// types together, so this kind of code isn’t allowed.
///
/// This is type safety, just like how Swift won’t let us mix integers and
/// decimals, except it’s taken to a deeper level. Yes, all beatles and
/// numbers are both arrays, but they are specialized types of arrays:
/// One is an array of strings, and one is an array of integers.
///
//let firstBeatle = beatles[0]
//let firstNumber = numbers[0]
//let notAllowed = firstBeatle + firstNumber

/// You can see this more clearly when you want to start with an empty array
/// and add items to it one by one. This is done with very precise syntax.
///
/// The first line shows how we have a specialized array type – This isn’t
/// just any array, it’s an array that holds integers. This is what allows
/// Swift to know for sure that beatles[0] must always be a string, and
/// also what stops us from adding integers to a string array.
///
/// The open and closing parentheses after Array<Int> are there because
/// it’s possible to customize the way the array is created if you need to.
///
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

/// You can make other kinds of array by specializing it in different ways.
/// That must always contain strings, so we can’t try to put an integer in there.
///
var albums = Array<String>()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

/// Arrays are so common in Swift that there’s a special way to create them:
/// Rather than writing Array<String>, you can instead write [String].
/// So, this kind of code is exactly the same as before.
///
var albums1 = [String]()
albums1.append("Folklore")
albums1.append("Fearless")
albums1.append("Red")

/// Swift’s type safety means that it must always know what type of data
/// an array is storing. That might mean being explicit by saying albums
/// is an Array<String>, but if you provide some initial values Swift
/// can figure it out for itself.
///
var albums2 = ["Folklore"]
albums2.append("Fearless")
albums2.append("Red")

/// There are some useful functionality that comes with arrays.
/// First, you can use .count to read how many items are in an array,
/// just like you did with strings.
///
print(albums.count)

/// Second, you can remove items from an array by using either remove(at:)
/// to remove one item at a specific index, or removeAll() to remove everything.
///
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

/// Third, you can check whether an array contains a particular item
/// by using contains().
///
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

/// Fourth, you can sort an array using sorted().
/// That returns a new array with its items sorted in ascending order,
/// which means alphabetically for strings but numerically for numbers –
/// The original array remains unchanged.
///
let cities = ["London", "Tokyo", "Rome", "Budapest"]
cities.sorted()

/// Finally, you can reverse an array by calling reversed() on it.
///
/// When you reverse an array, Swift is very clever – It doesn’t
/// actually do the work of rearranging all the items, but instead
/// just remembers to itself that you want the items to be reversed.
/// So, when you print out reversedPresidents, don’t be surprised
/// to see it’s not just a simple array any more!
///
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

/// Arrays are extremely common in Swift, and you’ll have lots of
/// opportunity to learn more about them as you progress.
/// Even better sorted(), reversed(), and lots of other array
/// functionality also exists for strings – Using sorted()
/// there puts the string’s letters in alphabetical order,
/// making something like “swift” into “fistw”.
///

/// Why does Swift have arrays?
///
/// Swift’s strings, integers, Booleans, and Doubles allow us to
/// temporarily store single values, but if you want to store
/// many values you will often use arrays instead.
///
/// We can create constants and variables of arrays just like
/// other types of data, but the difference is that arrays
/// hold many values inside them.
///
/// Arrays in Swift can be as large or as small as you want.
/// If they are variable, you can add to them freely to
/// build up your data over time, or you can remove or
/// even rearrange items if you want.
///
/// We read values out of arrays using their numerical position,
/// counting from 0. This Swift’s arrays are zero-based.
/// Swift will automatically crash your program if you attempt
/// to read an array using an invalid index.
///
/// If Swift didn’t crash then it’s very likely you would
/// get back bad data, because you tried to read a value
/// outside what your array holds.
///





/// How to store and find data in dictionaries
///
/// You’ve seen how arrays are a great way to store data that has
/// a particular order, such as days of the week or temperatures
/// for a city.
///
/// Arrays are a great choice when items should be stored
/// in the order you add them, or when you might have
/// duplicate items in there, but very often accessing
/// data by its position in the array can be annoying or even dangerous.
///
/// For example, here’s an array containing an employee’s details.
///
var employee = ["Taylor Swift", "Singer", "Nashville"]
print("Name: \(employee[0])")
print("Job title: \(employee[0])")
print("Location: \(employee[0])")

/// But that has a couple of problems. First, you can’t really be sure
/// that employee[2] is their location – Maybe that’s their password.
/// Second, there’s no guarantee that item 2 is even there,
/// particularly because we made the array a variable.
/// This kind of code would cause serious problems.
///
/// That now prints Nashville as the job title, which is wrong,
/// and will cause our code to crash when it reads employee[2],
/// which is just bad.
///
//print("Name: \(employee[0])")
//employee.remove(at: 1)
//print("Job title: \(employee[1])")
//print("Location: \(employee[2])")

/// Swift has a solution for both these problems, called dictionaries.
/// Dictionaries don’t store items according to their position
/// like arrays do, but instead let us decide where items should be stored.
///
/// For example, we could rewrite our previous example to be more
/// explicit about what each item is.
///
/// Swift calls the Strings on the left – name, job, and location –
/// the Keys to the dictionary, and the Strings on the right are the Values.
///
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville",
]

/// When it comes to reading data out from the dictionary,
/// you use the same keys you used when creating it.
///
/// All of that is valid Swift code, but we’re trying to read dictionary keys
/// that don’t have a value attached to them.
///
//print(employee2["name"])
//print(employee2["job"])
//print(employee2["location"])

/// Swift provides an alternative: When you access data inside a dictionary,
/// it will tell us “you might get a value back, but you might get back nothing at all.”
/// Swift calls these optionals because the existence of data is optional -
/// It might be there or it might not.
///
/// Swift will even warn you when you write the code, albeit in a rather obscure way –
/// It will say “Expression implicitly coerced from 'String?' to 'Any’”,
/// but it will really mean “this data might not actually be there –
/// Are you sure you want to print it?”
///
/// When reading from a dictionary, you can provide a default value to use
/// if the key doesn’t exist.
///
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

/// All the examples have used strings for both the keys and values,
/// but you can use other data types for either of them.
/// For example, we could track which students have graduated
/// from school using strings for names and Booleans for their graduation status.
///
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]

/// Or we could track years when Olympics took place along with their locations.
///
let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo",
]
print(olympics[2012, default: "Unknown"])

/// You can also create an empty dictionary using whatever explicit types
/// you want to store, then set keys one by one.
///
/// Notice how we need to write [String: Int] now, to mean a dictionary
/// with strings for its keys and integers for its values.
///
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O' Neal"] = 216
heights["LeBron James"] = 206

/// Because each dictionary item must exist at one specific key, dictionaries
/// don’t allow duplicate keys to exist. Instead, if you set a value for a key
/// that already exists, Swift will overwrite whatever was the previous value.
///
/// For example, if you were chatting with a friend about superheroes and
/// supervillains, you might store them in a dictionary like this.
///
var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"

/// If your friend disagrees that The Joker is Batman’s arch-enemy,
/// you can just rewrite that value by using the same key.
///
archEnemies["Batman"] = "Penguin"

/// Finally, just like arrays and the other data types we’ve seen so far,
/// dictionaries come with some useful functionality that you’ll want to use
///  in the future – count and removeAll() both exists for dictionaries,
///  and work just like they do for arrays.
///

/// Why does Swift have dictionaries as well as arrays?
///
/// Dictionaries and arrays are both ways of storing lots of data in one variable,
/// but they store them in different ways: Dictionaries let us choose a “key”
/// that identifies the item we want to add,
/// whereas arrays just add each item sequentially.
///
/// Dictionaries don’t store our items using an index,
/// but instead they optimize the way they store items for fast retrieval.
///
/// Remember, you can’t be guaranteed that a key in a dictionary exists.
/// This is why reading a value from a dictionary might send back nothing –
/// You might have requested a key that doesn’t exist!
///

/// Why does Swift have default values for dictionaries?
///
/// Whenever you read a value from a dictionary, you might get a value back
/// or you might get back nil – There might be no value for that key.
/// Having no value can cause problems in your code, not least because
/// you need to add extra functionality to handle missing values safely,
/// and that’s where dictionary default values come in:
/// They let you provide a backup value to use for
/// when the key you ask for doesn’t exist.
///





/// How to use sets for fast data lookup
///
/// There is a third very common way to group data, called a set –
/// They are similar to arrays, except you can’t add duplicate items,
/// and they don’t store their items in a particular order.
///
/// Creating a set works much like creating an array: Tell Swift what kind
/// of data it will store, then go ahead and add things.
///
/// Notice how that actually creates an array first, then puts that array
/// into the set? That’s intentional, and it’s the standard way of
/// creating a set from fixed data. Remember, the set will automatically
/// remove any duplicate values, and it won’t remember the exact order
/// that was used in the array.
///
let people = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson",
])
print(people)

/// You might see the names in the original order, but you might also
/// get a completely different order – The set just doesn’t care
/// what order its items come in.
///
/// The second important difference when adding items to a set
/// is visible when you add items individually.
///
var people1 = Set<String>()
people1.insert("Denzel Washington")
people1.insert("Tom Cruise")
people1.insert("Nicolas Cage")
people1.insert("Samuel L Jackson")

/// Notice how we’re using insert()? When we had an array of strings,
/// we added items by calling append(), but that name doesn’t
/// make sense here – We aren’t adding an item to the end of the set,
/// because the set will store the items in whatever order it wants.
///
/// You might think sets just sound like simplified arrays – After all,
/// if you can’t have duplicates and you lose the order of your items,
/// why not just use arrays?
/// Well, both of those restrictions actually get turned into an advantage.
///
/// First, not storing duplicates is sometimes exactly what you want.
///
/// Second, instead of storing your items in the exact order you specify,
/// sets instead store them in a highly optimized order that makes it
/// very fast to locate items.
///
/// In comparison, calling contains() on a set runs so fast you’d struggle
/// to measure it meaningfully. Heck, even if you had a million items
///  in the set, or even 10 million items, it would still run instantly,
///  whereas an array might take minutes or longer to do the same work.
///

/// Why are sets different from arrays in Swift?
///

/// Both sets and arrays are important in Swift, and understanding
/// what their differences are will help you understand which one
/// to choose for any given circumstance.
///
/// Both sets and arrays are collections of data, meaning that
/// they hold multiple values inside a single variable.
/// However, how they hold their values is what matters:
/// Sets are unordered and cannot contain duplicates,
/// whereas arrays retain their order and can contain duplicates.
///
/// Those two differences might seem small, but they have an
/// interesting side effect: Because sets don’t need to store
/// your objects in the order you add them, they can instead
/// store them in a seemingly random order that optimizes
/// them for fast retrieval.
///
/// This difference means that sets are more useful for times
/// when you want to say “does this item exist?”
/// For example, if you want to check whether a word appears
/// in a dictionary, you should use a set:
/// You don’t have duplicates, and you want to do a fast look up.
///





/// How to create and use enums
///
/// An enum – short for enumeration – Is a set of named values
/// we can create and use in our code. They don’t have any
/// special meaning to Swift, but they are more efficient
/// and safer, so you’ll use them a lot in your code.
///
var selected = "Monday"
selected = "Tuesday"

/// You accidentally typed in a month rather than a day.
///
selected = "January"

/// That has a space at the end of Friday, and “Friday ”
/// with a space is different from “Friday” without a space
/// in Swift’s eyes.
///
/// Using strings for this kind of thing takes some very
/// careful programming, but it’s also pretty inefficient –
/// Do we really need to store all the letters of “Friday”
/// to track one single day?
///
selected = "Friday "

/// This is where enums come in: They let us define a new data
/// type with a handful of specific values that it can have.
/// Think of a Boolean, that can only have true or false –
/// You can’t set it to “maybe” or “probably”, because that
/// isn’t in the range of values it understands.
/// Enums are the same: We get to list up front the range of
/// values it can have, and Swift will make sure you never
/// make a mistake using them.
///
/// That calls the new enum Weekday, and provides five cases
/// to handle the five weekdays.
///
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

/// Now rather than using strings, we would use the enum.
///
/// With that change you can’t accidentally use “Friday ”
/// with an extra space in there, or put a month name
/// instead – You must always choose one of the possible days
/// listed in the enum.
/// You’ll even see Swift offer up all possible options when
/// you’ve typed Weekday., because it knows you’re going
/// to select one of the cases.
///
var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday


/// Swift does two things that make enums a little easier to use.
/// First, when you have many cases in an enum you can just
/// write case once, then separate each case with a comma.
///
///
enum WeekdayOne {
    case monday, tuesday, wednesday, thursday, friday
}

/// Second, remember that once you assign a value to a variable or constant,
/// its data type becomes fixed – You can’t set a variable to a string at first,
/// then an integer later on. Well, for enums this means you can skip the enum name
/// after the first assignment.
///
/// Swift knows that .tuesday must refer to Weekday.tuesday because day must always
/// be some kind of Weekday.
///
/// Although it isn’t visible here, one major benefit of enums is that Swift
/// stores them in an optimized form – When we say Weekday.monday Swift is likely
/// to store that using a single integer such as 0, which is much more efficient
/// to store and check than the letters M, o, n, d, a, y.
///
var dayOne = Weekday.monday
day = .tuesday
day = .friday

/// Why does Swift need enums?
///
/// At their simplest an enum is simply a nice name for a value. We can make an enum
/// called Direction with cases for north, south, east, and west, and refer to those
/// in our code. Sure, we could have used an integer instead, in which case we’d refer
///  to 1, 2, 3, and 4, but could you really remember what 3 meant? And what if you
///  typed 5 by mistake?
///
///  So, enums are a way of us saying Direction.north to mean something specific and safe.
///  If we had written Direction.thatWay and no such case existed, Swift would simply
///  refuse to build our code – It doesn’t understand the enum case. Behind the scenes,
///  Swift can store its enum values very simply, so they are much faster to create and
///  store than something like a String.
///








