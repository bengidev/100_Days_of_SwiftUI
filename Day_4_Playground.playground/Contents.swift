/// This is important to include required files
/// for application/program to be able to run.
///
import Cocoa

/// How to use type annotations
///
/// Swift is able to figure out what type of data a constant or variable holds
/// based on what we assign to it. However, sometimes we don’t want to assign
/// a value immediately, or sometimes we want to override Swift’s choice of type,
/// and that’s where type annotations come in.
///
/// This uses type inference: Swift infers that surname is a string because
/// we’re assigning text to it, and then infers that score is an integer because
/// we’re assigning a whole number to it.
///
let surname = "Lasso"
var score = 0

/// Type annotations let us be explicit about what data types we want.
///
/// Now we’re being explicit: surname must be a string, and score must be
/// an integer. That’s exactly what Swift’s type inference would have done
/// anyway, but sometimes it isn’t – Sometimes you will want to choose
/// a different type.
///
let surname1: String = "Lasso"
var score1: Int = 0

/// For example, maybe score is a decimal because the user can get half points.
///
/// Without the : Double part Swift would infer that to be an integer,
/// but we’re overriding that and saying it’s definitely a decimal number.
///
var score2: Double = 0

/// We’ve looked at a few types of data so far, and it’s important you know
/// their names so you can use the right type annotation when needed.
///
/// String holds text.
///
let playerName: String = "Roy"

/// Int holds whole numbers.
///
var luckyNumber: Int = 13

/// Double holds decimal numbers.
///
let pi: Double = 3.141

/// Bool holds either true or false.
///
var isAuthenticated: Bool = true

/// Array holds lots of different values, all in the order you add them.
/// This must be specialized.
///
var albums: [String] = ["Red", "Fearless"]

/// Dictionary holds lots of different values, where you get to decide
/// how data should be accessed. This must be specialized.
///
var user: [String: String] = ["id": "@twostraws"]
var locker: [String: Int] = ["first": 123456]

/// Set holds lots of different values, but stores them in an order
/// that’s optimized for checking what it contains.
/// This must be specialized.
///
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Woman, Other",
])

/// Knowing all these types is important for times when you
/// don’t want to provide initial values.
///
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]

/// Type annotation isn’t needed there, because Swift can see
/// you’re assigning an array of Strings. However, if you wanted
/// to create an empty array of strings, you’d need to know the type.
///
/// Again, the type annotation isn’t required, but you still need
/// to know that an array of Strings is written as [String] so that
/// you can make the thing.
///
/// Remember, you need to add the open and close parentheses when
/// making empty arrays, dictionaries, and sets, because it’s where
/// Swift allows us to customize the way they are created.
///
var teams: [String] = [String]()

/// Some people prefer to use type annotation.
///
var cities: [String] = []

/// Hacking With Swift prefer to use type inference as much as possible.
///
var clues = [String]()

/// As well as all those, there are enums. Enums are a little different
/// from the others because they let us create new types of our own,
/// such as an enum containing days of the week, an enum containing
/// which UI theme the user wants, or even an enum containing which
/// screen is currently showing in our app.
///
/// Values of an enum have the same type as the enum itself.
///
/// This is what allows Swift to remove the enum name for future assignments,
/// so we can write style = .dark – It knows any new value for style
/// must be some kind UIStyle.
///
enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

/// The most common exception to this is with constants that don’t have
/// a value for yet. Swift is really clever: You can create a constant
/// that doesn’t have a value just yet, later on provide that value,
/// and Swift will ensure we don’t accidentally use it until a value is present.
/// It will also ensure that you only ever set the value once,
/// so that it remains constant.
///
/// That code is legal: We’re saying username will contain a string at some point,
/// and we provide a value before using it. If the assignment line –
/// userName = "@twostraws" – was missing, then Swift would refuse to build our code
/// because userName wouldn’t have a value, and similarly if we tried to set a value
/// to userName a second time Swift would also complain.
///
/// This kind of code requires a type annotation, because without an initial value
/// being assigned Swift doesn’t know what kind of data userName will contain.
///
let userName: String
// Lots of complex logic
userName = "@twostraws"
// Lots of complex logic
print(userName)

/// Regardless of whether you use type inference or type annotation,
/// there is one golden rule: Swift must at all times know what
/// data types your constants and variables contain.
/// This is at the core of being a type-safe language.
///
/// Although type annotation can let us override Swift’s type inference
/// to a degree, our finished code must still be possible.
///
/// For example, this is not allowed.
///
/// Swift just can’t convert “Zero” to an integer for us, even with
/// a type annotation requesting it, so the code just won’t build.
///
//let score3: Int = "Zero"

/// Why does Swift have type annotations?
///
/// A common question folks ask when learning Swift is “why does Swift
/// have type annotations?”, which is usually followed by “when should I
/// use type annotations in Swift?”
///
/// The answer to the first question is primarily one of three reasons:
///
/// - Swift can’t figure out what type should be used.
/// - You want Swift to use a different type from its default.
/// - You don’t want to assign a value just yet.
///
/// In Hacking With Swift code, I prefer to use type inference as much as possible.
/// That means Hacking With Swift leave off the type annotations, and let Swift
/// figure out the type of things based on what data Hacking With Swift store in them.
/// Hacking With Swift reasons for this are:
///
/// - It makes my code shorter and easier to read.
/// - It allows me to change the type of something just by changing whatever
///     is its initial value.
///
/// Some other folks prefer to always use explicit type annotation,
/// and that works fine too – It really is a question of style.
///

/// Why would you want to create an empty collection?
///
/// When you’re just learning Swift, it’s common to see examples such as this one.
///
/// That’s a constant array of six strings, and because it’s constant it means
/// we can’t add more things to the array – We know all our items when the array
/// is created, so the rest of our program is just using that fixed data.
///
let names = ["Eleanor", "Chidi", "Tahani", "Jianyu", "Michael", "Janet"]

/// But sometimes you don’t know all your data up front, and in those cases
/// it’s more common to create an empty collection then add things as you
/// calculate your data.
///
/// For example, we have our fixed names array above, and if we wanted to
/// figure out which names started with J then we would.
///
/// - Creating an empty string array called something like jNames.
/// - Go over every name in the original names array and check whether it starts with “J”.
/// - If it does, add it to the jNames array.
///
/// When we’ve gone over all the names, we’ll end up with two strings in jNames:
/// Jianyu and Janet. Of course, if our check was which names started with “X”
/// then we’d end up with no names in the array – and that’s OK.
/// It started as empty and ended as empty.
///

/// Summary: Complex data
///
/// We’ve gone beyond simple data types now, and started looking at ways to group
/// them together and even create our own using enums. So, let’s recap.
///
/// - Arrays let us store lots of values in one place, then read them out using
///     integer indices. Arrays must always be specialized so they contain
///     one specific type, and they have helpful functionality such as count,
///     append(), and contains().
/// - Dictionaries also let us store lots of values in one place, but let us
///     read them out using keys we specify. They must be specialized to have
///     one specific type for key and another for the value, and have similar
///     functionality to arrays, such as contains() and count.
/// - Sets are a third way of storing lots of values in one place, but we don’t
///     get to choose the order in which they store those items. Sets are really
///     efficient at finding whether they contain a specific item.
/// - Enums let us create our own simple types in Swift so that we can specify
///     a range of acceptable values such as a list of actions the user can perform,
///     the types of files we are able to write, or the types of notification to
///     send to the user.
/// - Swift must always know the type of data inside a constant or variable,
///     and mostly uses type inference to figure that out based on the data we assign.
///     However, it’s also possible to use type annotation to force a particular type.
///













