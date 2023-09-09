/// This is important to include required files
/// for application/program to be able to run.
///
import Cocoa

/// How to create your own structs
///
/// Swift’s structs let us create our own custom, complex data types, complete with their own
/// variables and their own functions.
///
/// A simple struct looks like this.
///
/// That creates a new type called Album, with two string constants called title and artist,
/// plus an integer constant called year. I also added a simple function that summarizes
/// the values of our three constants.
///
/// Notice how Album starts with a capital A? That’s the standard in Swift, and we’ve been using
/// it all along – think of String, Int, Bool, Set, and so on. When you’re referring to a data
/// type, we use camel case where the first letter is uppercased, but when you’re referring to
/// something inside the type, such as a variable or function, we use camel case where the first
/// letter is lowercased. Remember, for the most part this is only a convention rather than
/// a rule, but it’s a helpful one to stick with.
///
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() -> Void {
        print("\(title) (\(year) by \(artist)")
    }
}

/// At this point, Album is just like String or Int – we can make them, assign values, copy them,
/// and so on. For example, we could make a couple of albums, then print some of their values
/// and call their functions.
///
/// Notice how we can create a new Album as if we were calling a function – we just need
/// to provide values for each of the constants in the order they were defined.
///
/// As you can see, both red and wings come from the same Album struct, but once we create them
/// they are separate just like creating two strings.
///
/// You can see this in action when we call printSummary() on each struct, because that function
/// refers to title, artist, and year. In both instances the correct values are printed out
/// for each struct: red prints “Red (2012) by Taylor Swift” and wings prints out “Wings (2016)
/// by BTS” – Swift understands that when printSummary() is called on red, it should use
/// the title, artist, and year constants that also belong to red.
///
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

/// Where things get more interesting is when you want to have values that can change.
/// For example, we could create an Employee struct that can take vacation as needed.
///
/// However, that won’t actually work – Swift will refuse to build the code.
///
/// You see, if we create an employee as a constant using let, Swift makes the employee and
/// all its data constant – we can call functions just fine, but those functions shouldn’t
/// be allowed to change the struct’s data because we made it constant.
///
//struct Employee {
//    let name: String
//    var vacationRemaining: Int
//
//    func takeVacation(days: Int) -> Void {
//        if vacationRemaining > days {
//            vacationRemaining -= days
//            print("I'm going on vacation")
//            print("Days remaining: \(vacationRemaining)")
//        } else {
//            print("Oops! There aren't enough days remaining.")
//        }
//    }
//}

/// As a result, Swift makes us take an extra step: any functions that only read data are fine
/// as they are, but any that change data belonging to the struct must be marked with a
/// special mutating keyword, like this.
///
/// Now our code will build just fine, but Swift will stop us from calling takeVacation()
/// from constant structs.
///
struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) -> Void {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

/// In code, this is allowed.
///
/// But if you change var archer to let archer you’ll find Swift refuses to build
/// your code again – we’re trying to call a mutating function on a constant struct,
/// which isn’t allowed.
///
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

/// We’re going to explore structs in detail over the next few chapters, but first
/// Hacking With Swift want to give some names to things.
/// - Variables and constants that belong to structs are called properties.
/// - Functions that belong to structs are called methods.
/// - When we create a constant or variable out of a struct, we call that an instance –
///     you might create a dozen unique instances of the Album struct, for example.
/// - When we create instances of structs we do so using an initializer like this:
///     Album(title: "Wings", artist: "BTS", year: 2016).
///

/// That last one might seem a bit odd at first, because we’re treating our struct like a function
/// and passing in parameters. This is a little bit of what’s called syntactic sugar – Swift
/// silently creates a special function inside the struct called init(), using all the properties
/// of the struct as its parameters. It then automatically treats these two pieces of code
/// as being the same.
///
var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)

/// We actually relied on this behavior previously. Way back when I introduced Double for
/// the first time, I explained that you can’t add an Int and a Double and instead need
/// to write code like this.
///
/// Now you can see what’s really happening here: Swift’s own Double type is implemented
/// as a struct, and has an initializer function that accepts an integer.
///
let a = 1
let b = 2.0
let c = Double(a) + b

/// Swift is intelligent in the way it generates its initializer, even inserting default values
/// if we assign them to our properties.
///
/// For example, if our struct had these two properties.
///
//let name: String
//var vacationRemaining = 14

struct Employee1 {
    let name: String
    var vacationRemaining: Int = 14
    
    mutating func takeVacation(days: Int) -> Void {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

/// Then Swift will silently generate an initializer with a default value of 14 for
/// vacationRemaining, making both of these valid.
///
/// If you assign a default value to a constant property, that will be removed from
/// the initializer entirely. To assign a default but leave open the possibility
/// of overriding it when needed, use a variable property.
///
let kane = Employee1(name: "Lana Kane")
let poovey = Employee1(name: "Pam Poovey", vacationRemaining: 35)

/// What’s the difference between a struct and a tuple?
///
/// Swift’s tuples let us store several different named values inside a single variable, and
/// a struct does much the same – so what’s the difference, and when should you choose one
/// over the other?
///
/// When you’re just learning, the difference is simple: a tuple is effectively just a struct
/// without a name, like an anonymous struct. This means you can define it as
/// (name: String, age: Int, city: String) and it will do the same thing as the following struct.
///
struct User {
    var name: String
    var age: Int
    var city: String
}

/// However, tuples have a problem: while they are great for one-off use, particularly when you
/// want to return several pieces of data from a single function, they can be annoying
/// to use again and again.
///
/// Think about it: if you have several functions that work with user information,
/// would you rather write this.
///
func authenticate(_ user: User) -> Void {}
func showProfile(for user: User) -> Void {}
func signOut(_ user: User) -> Void {}

/// Or this.
///
func authenticate1(_ user: (name: String, age: Int, city: String)) -> Void {}
func showProfile1(for user: (name: String, age: Int, city: String)) -> Void {}
func signOut1(_ user: (name: String, age: Int, city: String)) -> Void {}

/// Think about how hard it would be to add a new property to your User struct (very easy indeed),
/// compared to how hard it would be to add another value to your tuple everywhere it was used?
/// (Very hard, and error-prone!)
///
/// So, use tuples when you want to return two or more arbitrary pieces of values from a function,
/// but prefer structs when you have some fixed data you want to send or receive multiple times.
///

/// What’s the difference between a function and a method?
///
/// Swift’s functions let us name a piece of functionality and run it repeatedly,
/// and Swift’s methods do much the same thing, so what’s the difference?
///
/// Honestly, the only real difference is that methods belong to a type, such as structs, enums,
/// and classes, whereas functions do not. That’s it – that’s the only difference. Both can accept
/// any number of parameters, including variadic parameters, and both can return values.
/// Heck, they are so similar that Swift still uses the func keyword to define a method.
///
/// Of course, being associated with a specific type such as a struct means that methods gain one
/// important super power: they can refer to the other properties and methods inside that type,
/// meaning that you can write a describe() method for a User type that prints
/// the user’s name, age, and city.
///
/// There is one more advantage to methods, but it’s quite subtle: methods avoid namespace
/// pollution. Whenever we create a function, the name of that function starts to have meaning
/// in our code – we can write wakeUp() and have it do something. So, if you write 100 functions
/// you end up with 100 reserved names, and if you write 1000 functions you have 1000
/// reserved names.
///
/// That can get messy quickly, but by putting functionality into methods we restrict where
/// those names are available – wakeUp() isn’t a reserved name any more unless we specifically
/// write someUser.wakeUp(). This reduces the so-called pollution, because if most of our code
/// is in methods then we won’t get name clashes by accident.
///

/// Why do we need to mark some methods as mutating?
///
/// It’s possible to modify the properties of a struct, but only if that struct is created as
/// a variable. Of course, inside your struct there’s no way of telling whether you’ll be working
/// with a variable struct or a constant struct, so Swift has a simple solution: any time
/// a struct’s method tries to change any properties, you must mark it as mutating.
///
/// You don’t need to do anything else other than mark the method as mutating, but doing that
/// gives Swift enough information to stop that method from being used with constant struct
/// instances.
///
/// There are two important details you’ll find useful.
/// - Marking methods as mutating will stop the method from being called on constant structs,
///     even if the method itself doesn’t actually change any properties. If you say
///     it changes stuff, Swift believes you!
/// - A method that is not marked as mutating cannot call a mutating function – you must mark
///     them both as mutating.
///





/// How to compute property values dynamically
///
/// Structs can have two kinds of property: a stored property is a variable or constant that holds
/// a piece of data inside an instance of the struct, and a computed property calculates the value
/// of the property dynamically every time it’s accessed. This means computed properties are
/// a blend of both stored properties and functions: they are accessed like stored properties,
/// but work like functions.
///
/// As an example, previously we had an Employee struct that could track how many days of vacation
/// remained for that employee. Here’s a simplified version.
///
/// That works as a trivial struct, but we’re losing valuable information – we’re assigning
/// this employee 14 days of vacation then subtracting them as days are taken, but in doing so
/// we’ve lost how many days they were originally granted.
///
struct Employee2 {
    let name: String
    var vacationRemaining: Int
}

var archer3 = Employee2(name: "Sterling Archer", vacationRemaining: 14)
archer3.vacationRemaining -= 5
print(archer.vacationRemaining)
archer3.vacationRemaining -= 3
print(archer3.vacationRemaining)

/// We could adjust this to use computed property, like so.
///
/// Now rather than making vacationRemaining something we can assign to directly, it is instead
/// calculated by subtracting how much vacation they have taken from how much vacation
/// they were allotted.
///
/// When we’re reading from vacationRemaining, it looks like a regular stored property.
///
/// This is really powerful stuff: we’re reading what looks like a property, but behind the scenes
/// Swift is running some code to calculate its value every time.
///
struct Employee3 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}

var archer4 = Employee3(name: "Sterling Archer", vacationAllocated: 14)
archer4.vacationTaken += 4
print(archer.vacationRemaining)
archer4.vacationTaken += 4
print(archer4.vacationRemaining)

/// We can’t write to it, though, because we haven’t told Swift how that should be handled.
/// To fix that, we need to provide both a getter and a setter – fancy names for “code that reads”
/// and “code that writes” respectively.
///
/// In this case the getter is simple enough, because it’s just our existing code. But the setter
/// is more interesting – if you set vacationRemaining for an employee, do you mean that you want
/// their vacationAllocated value to be increased or decreased, or should vacationAllocated stay
/// the same and instead we change vacationTaken?
///
/// I’m going to assume the first of those two is correct, in which case here’s how
/// the property would look.
///
/// Notice how get and set mark individual pieces of code to run when reading or writing a value.
/// More importantly, notice newValue – that’s automatically provided to us by Swift,
/// and stores whatever value the user was trying to assign to the property.
///
struct Employee4 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

/// With both a getter and setter in place, we can now modify vacationRemaining.
///
/// SwiftUI uses computed properties extensively – you’ll see them in the very first project
/// you create!
///
var archer5 = Employee4(name: "Sterling Archer", vacationAllocated: 14)
archer5.vacationTaken += 4
print(archer5.vacationRemaining)
archer5.vacationRemaining = 5
print(archer5.vacationRemaining)
print(archer5.vacationAllocated)

/// When should you use a computed property or a stored property?
///
/// Properties let us attach information to structs, and Swift gives us two variations:
/// stored properties, where a value is stashed away in some memory to be used later,
/// and computed properties, where a value is recomputed every time it’s called.
/// Behind the scenes, a computed property is effectively just a function call
/// that happens to belong to your struct.
///
/// Deciding which to use depends partly on whether your property’s value depends on other data,
/// and partly also on performance. The performance part is easy: if you regularly read
/// the property when its value hasn’t changed, then using a stored property will be much faster
/// than using a computed property. On the other hand, if your property is read very rarely and
/// perhaps not at all, then using a computed property saves you from having to calculate
/// its value and store it somewhere.
///
/// When it comes to dependencies – whether your property’s value relies on the values of your
/// other properties – then the tables are turned: this is a place where computed properties
/// are useful, because you can be sure the value they return always takes into account
/// the latest program state.
///
/// Lazy properties help mitigate the performance issues of rarely read stored properties,
/// and property observers mitigate the dependency problems of stored properties – we’ll be
/// looking at them soon.
///





/// How to take action when a property changes
///
/// Swift lets us create property observers, which are special pieces of code that run
/// when properties change. These take two forms: a didSet observer to run when the property
/// just changed, and a willSet observer to run before the property changed.
///
/// To see why property observers might be needed, think about code like this.
///
/// That creates a Game struct, and modifies its score a few times. Each time the score changes,
/// a print() line follows it so we can keep track of the changes. Except there’s a bug:
/// at the end the score changed without being printed, which is a mistake.
///
struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1

/// With property observers we can solve this problem by attaching the print() call directly to
/// the property using didSet, so that whenever it changes – wherever it changes – we will
/// always run some code.
///
/// Here’s that same example, now with a property observer in place.
///
struct Game1 {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game1 = Game1()
game.score += 10
game.score -= 3
game.score += 1

/// If you want it, Swift automatically provides the constant oldValue inside didSet, in case you
/// need to have custom functionality based on what you were changing from. There’s also a willSet
/// variant that runs some code before the property changes, which in turn provides the new value
/// that will be assigned in case you want to take different action based on that.
///
/// We can demonstrate all this functionality in action using one code sample, which will print
/// messages as the values change so you can see the flow when the code is run.
///
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
            print()
        }
        
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
            print()
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

/// Yes, appending to an array will trigger both willSet and didSet, so that code will print
/// lots of text when run.
///
/// In practice, willSet is used much less than didSet, but you might still see it from time
/// to time so it’s important you know it exists. Regardless of which you choose, please try
/// to avoid putting too much work into property observers – if something that looks trivial
/// such as game.score += 1 triggers intensive work, it will catch you out on a regular basis
/// and cause all sorts of performance problems.
///

/// When should you use property observers?
///
/// Swift’s property observers let us attach functionality to be run before or after a property
/// is changed, using willSet and didSet respectively. Most of the time property observers aren’t
/// required, just nice to have – we could just update a property normally then call a function
/// ourselves in code. So why bother? When would you actually use property observers?
///
/// The most important reason is convenience: using a property observer means your functionality
/// will be executed whenever the property changes. Sure, you could use a function to do that,
/// but would you remember? Always? In every place you change the property?
///
/// This is where the function approach goes sour: it’s on you to remember to call that function
/// whenever the property changes, and if you forget then you’ll have mysterious bugs
/// in your code. On the other hand, if you attach your functionality directly to the property
/// using didSet, it will always happen, and you’re transferring the work of ensuring that
/// to Swift so your brain can focus on more interesting problems.
///
/// There is one place where using a property observer is a bad idea, and that’s if you put
/// slow work in there. If you had a User struct with an age integer, you would expect that
/// changing age would take place virtually instantly – it’s just a number, after all.
/// If you attach a didSet property observer that does all sorts of slow work, then suddenly
/// changing a single integer could take way longer than you expected, and it could cause
/// all sorts of problems for you.
///

/// When should you use willSet rather than didSet?
///
/// Both willSet and didSet let us attach observers to properties, meaning that Swift will run
/// some code when they change so that we have a chance to respond to the change.
/// The question is: do you want to know before the property changes, or after?
///
/// The simple answer is this: most of the time you will be using didSet, because we want to take
/// action after the change has happened so we can update our user interface, save changes,
/// or whatever. That doesn’t mean willSet isn’t useful, it’s just that in practice it is
/// significantly less popular than its counterpart.
///
/// The most common time willSet is used is when you need to know the state of your program
/// before a change is made. For example, SwiftUI uses willSet in some places to handle animations
/// so that it can take a snapshot of the user interface before a change. When it has both
/// the “before” and “after” snapshot, it can compare the two to see all the parts
/// of the user interface that need to be updated.
///





/// How to create custom initializers
///
/// Initializers are specialized methods that are designed to prepare a new struct instance
/// to be used. You’ve already seen how Swift silently generates one for us based on
/// the properties we place inside a struct, but you can also create your own as long as
/// you follow one golden rule: all properties must have a value by the time the initializer ends.
///
/// Let’s start by looking again at Swift’s default initializer for structs.
///
/// That creates a new Player instance by providing values for its two properties. Swift calls
/// this the memberwise initializer, which is a fancy way of saying an initializer that accepts
/// each property in the order it was defined.
///
struct Player {
    let name: String
    let number: Int
}

let player = Player(name: "Megan R", number: 15)

/// Like Hacking With Swift said, this kind of code is possible because Swift silently generates
/// an initializer accepting those two values, but we could write our own to do the same thing.
/// The only catch here is that you must be careful to distinguish between the names of parameters
/// coming in and the names of properties being assigned.
///
/// Here’s how that would look.
///
/// That works the same as our previous code, except now the initializer is owned by us
/// so we can add extra functionality there if needed.
///
/// However, there are a couple of things I want you to notice.
/// - There is no func keyword. Yes, this looks like a function in terms of its syntax,
///     but Swift treats initializers specially.
/// - Even though this creates a new Player instance, initializers never explicitly
///     have a return type – they always return the type of data they belong to.
/// - I’ve used self to assign parameters to properties to clarify we mean
///     “assign the name parameter to my name property”.
///
/// That last point is particularly important, because without self we’d have name = name and
/// that doesn’t make sense – are we assigning the property to the parameter, assigning
/// the parameter to itself, or something else? By writing self.name we’re clarifying we mean
/// “the name property that belongs to my current instance,” as opposed to anything else.
///
struct Player1 {
    let name: String
    let number: Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

/// Of course, our custom initializers don’t need to work like the default memberwise initializer
/// Swift provides us with. For example, we could say that you must provide a player name,
/// but the shirt number is randomized.
///
/// Just remember the golden rule: all properties must have a value by the time
/// the initializer ends. If we had not provided a value for number inside the initializer,
/// Swift would refuse to build our code.
///
struct Player2 {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player1 = Player2(name: "Megan R")
print(player1.number)

/// Although you can call other methods of your struct inside your initializer, you can’t do so
/// before assigning values to all your properties – Swift needs to be sure everything is safe
/// before doing anything else.
///
/// You can add multiple initializers to your structs if you want, as well as leveraging features
/// such as external parameter names and default values. However, as soon as you implement your
/// own custom initializers you’ll lose access to Swift’s generated memberwise initializer unless
/// you take extra steps to retain it. This isn’t an accident: if you have a custom initializer,
/// Swift effectively assumes that’s because you have some special way to initialize
/// your properties, which means the default one should no longer be available.
///

/// How do Swift’s memberwise initializers work?
///
/// By default, all Swift structs get a synthesized memberwise initializer by default,
/// which means that we automatically get an initializer that accepts values
/// for each of the struct’s properties. This initializer makes structs easy to work with,
/// but Swift does two further things that make it especially clever.
///
/// First, if any of your properties have default values, then they’ll be incorporated
/// into the initializer as default parameter values. So, if I make a struct like this.
///
struct User1 {
    var name: String
    var yearsActive = 0
}

/// Then I can create it in either of these two ways.
///
/// This makes them even easier to create, because you can fill in only the parts you need to.
///
struct Employee5 {
    var name: String
    var yearsActive = 0
}

let roslin = Employee5(name: "Laura Roslin")
let adama = Employee5(name: "William Adama", yearsActive: 45)

/// The second clever thing Swift does is remove the memberwise initializer if you create
/// an initializer of your own.
///
/// For example, if I had a custom initializer that created anonymous employees,
/// it would look like this.
///
struct Employee6 {
    var name: String
    var yearsActive = 0
    
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee...")
    }
}

/// With that in place, I could no longer rely on the memberwise initializer,
/// so this would no longer be allowed.
///
/// This isn’t an accident, but it’s a deliberate feature: we created our own initializer,
/// and if Swift left its memberwise initializer in place then it might be missing important work
/// we put into our own initializer.
///
//let roslin1 = Employee6(name: "Laura Roslin")

/// So, as soon as you add a custom initializer for your struct, the default memberwise
/// initializer goes away. If you want it to stay, move your custom initializer to an extension,
/// like this.
///
struct Employee7 {
    var name: String
    var yearsActive = 0
}

extension Employee7 {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee...")
    }
}

// Creating a named employee now works
let roslin2 = Employee7(name: "Laura Roslin")

// As does creating an anonymous employee
let anon = Employee7()

/// When would you use self in a method?
///
/// Inside a method, Swift lets us refer to the current instance of a struct using self,
/// but broadly speaking you don’t want to unless you specifically need to distinguish
/// what you mean.
///
/// By far the most common reason for using self is inside an initializer, where you’re likely
/// to want parameter names that match the property names of your type, like this.
///
struct Student {
    var name: String
    var bestFriend: String
    
    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class...")
        self.name = name
        self.bestFriend = bestFriend
    }
}

/// You don’t have to use that, of course, but it gets a little clumsy adding some sort
/// of prefix to the parameter names.
///
struct Studen1 {
    var name: String
    var bestFriend: String
    
    init(name studentName: String, bestFriend studentBestFriend: String) {
        print("Enrolling \(studentName) in class...")
        name = studentName
        bestFriend = studentBestFriend
    }
}

/// Outside of initializers, the main reason for using self is because we’re in a closure
/// and Swift requires it so we’re clear we understand what’s happening. This is only needed
/// when accessing self from inside a closure that belongs to a class, and Swift will refuse
/// to build your code unless you add it.
///


