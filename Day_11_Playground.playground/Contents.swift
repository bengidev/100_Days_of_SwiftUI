/// This is important to include required files
/// for application/program to be able to run.
///
import Cocoa

/// How to limit access to internal data using access control
///
/// By default, Swift’s structs let us access their properties and methods freely, but often that
/// isn’t what you want – sometimes you want to hide some data from external access. For example,
/// maybe you have some logic you need to apply before touching your properties, or maybe you know
/// that some methods need to be called in a certain way or order, and so shouldn’t be touched
/// externally.
///
/// We can demonstrate the problem with an example struct.
///
struct BankAccount {
    var funds = 0
    
    mutating func deposit(amount: Int) -> Void {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

/// That has methods to deposit and withdraw money from a bank account,
/// and should be used like this.
///
var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

/// But the funds property is just exposed to us externally, so what’s stopping us from touching
/// it directly? The answer is nothing at all – this kind of code is allowed.
///
/// That completely bypasses the logic we put in place to stop people taking out more money
/// than they have, and now our program could behave in weird ways.
///
account.funds -= 1000

/// To solve this, we can tell Swift that funds should be accessible only inside the struct –
/// by methods that belong to the struct, as well as any computed properties, property observers,
/// and so on.
///
/// This takes only one extra word.
///
/// And now accessing funds from outside the struct isn’t possible, but it is possible inside both
/// deposit() and withdraw(). If you try to read or write funds from outside the struct Swift
/// will refuse to build your code.
///
// private var funds = 0

struct BankAccount1 {
    private var funds = 0
    
    mutating func deposit(amount: Int) -> Void {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

/// 'funds' is inaccessible due to 'private' protection level
///
//var account1 = BankAccount1()
//account1.funds -= 1000

/// This is called access control, because it controls how a struct’s properties and
/// methods can be accessed from outside the struct.
///
/// Swift provides us with several options, but when you’re learning you’ll only need a handful.
/// - Use private for “don’t let anything outside the struct use this.”
/// - Use fileprivate for “don’t let anything outside the current file use this.”
/// - Use public for “let anyone, anywhere use this.”
/// - Use private(set) for “let anyone read this property, but only let my methods write it.”
///
/// There’s one extra option that is sometimes useful for learners, which is this: private(set).
/// This means “let anyone read this property, but only let my methods write it.” If we had used
/// that with BankAccount, it would mean we could print account.funds outside of the struct,
/// but only deposit() and withdraw() could actually change the value.
///
/// In this case, Hacking With Swift think private(set) is the best choice for funds: you can read
/// the current bank account balance at any time, but you can’t change it without running
/// through my logic.
///
/// If you think about it, access control is really about limiting what you and other developers
/// on your team are able to do – and that’s sensible! If we can make Swift itself stop us
/// from making mistakes, that’s always a smart move.
///
/// If you use private access control for one or more properties, chances are you’ll need
/// to create your own initializer.
///

/// What’s the point of access control?
///
/// Swift’s access control keywords let us restrict how different parts of our code
/// can be accessed, but a lot of the time it’s just obeying the rules we put into place –
/// we could remove them if we wanted and bypass the restrictions, so what’s the point?
///
/// There are a few answers to that, but one is particularly easy so I’ll start there:
/// sometimes access control is used in code you don’t own, so you can’t remove the restriction.
/// This is common when you’re building apps with Apple’s APIs, for example: they place
/// restrictions about what you can and cannot do, and you need to abide by those restrictions.
///
/// In your own code, yes of course you can remove any access control restrictions you put in
/// place, but that doesn’t make it pointless. Access control lets us determine how a value
/// should be used, so that if something needs to accessed very carefully then you must follow
/// the rules.
///
/// Previously Hacking With Swift have mentioned Unwrap, my Swift learning app, and
/// Hacking With Swift want to use another example from there. When users learn different parts
/// of Swift, Hacking With Swift store the name of the thing they learned in a private Set inside
/// a User struct, declared like this.
///
/// It’s private, which means no one can read or write to it directly. Instead, Hacking With Swift
/// provide public methods for reading or writing values that should be used instead. That’s
/// intentional, because learning a section needs to do more than just insert a string into
/// that set – it needs to update the user interface to reflect the change, and needs to save
/// the new information so the app remembers it was learned.
///
/// If Hacking With Swift hadn’t made the learnedSections property private, it’s possible
/// Hacking With Swift might forget and write things to it directly. That would result
/// in Hacking With Swift UI being inconsistent with its data, and also not saving the change –
/// bad all around!
///
/// So, by using private here Hacking With Swift asking Swift to enforce the rules for
/// Hacking With Swift: don’t let Hacking With Swift read or write this property from anywhere
/// outside the User struct.
///
//private var learnedSections = Set<String>()

/// One other advantage to access control is that it lets us control how other people
/// see our code – known as its “surface area”. Think about it: if I gave you a struct to use
/// and it had 30 public properties and methods, you might not be sure which ones are there
/// for you to use and which ones are really just for internal use. On the other hand,
/// if Hacking With Swift mark 25 of those as private then it’s immediately clear that
/// you shouldn’t be using them externally.
///
/// Access control can be quite a thorny issue, particularly when you take into account
/// external code.
///





/// Static properties and methods
///
/// You’ve seen how we can attach properties and methods to structs, and how each struct has
/// its own unique copy of those properties so that calling a method on the struct won’t read
/// the properties of a different struct from the same type.
///
/// Well, sometimes – only sometimes – you want to add a property or method to the struct itself,
/// rather than to one particular instance of the struct, which allows you to use them directly.
/// Hacking With Swift use this technique a lot with SwiftUI for two things: creating example
/// data, and storing fixed data that needs to be accessed in various places.
///
/// First, let’s look at a simplified example of how to create and use static properties
/// and methods.
///
/// Notice the keyword static in there, which means both the studentCount property and
/// add() method belong to the School struct itself, rather than to individual instances of
/// the struct.
///
struct School {
    static var studentCount = 0
    
    static func add(student: String) -> Void {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

/// To use that code, we’d write the following.
///
/// Hacking With Swift haven’t created an instance of School – we can literally use add() and
/// studentCount directly on the struct. This is because those are both static, which means
/// they don’t exist uniquely on instances of the struct.
///
/// This should also explain why we’re able to modify the studentCount property without marking
/// the method as mutating – that’s only needed with regular struct functions for times when
/// an instance of struct was created as a constant, and there is no instance when calling add().
///
School.add(student: "Taylor Swift")
print(School.studentCount)

/// If you want to mix and match static and non-static properties and methods, there are two rules.
/// - To access non-static code from static code… you’re out of luck: static properties and
///     methods can’t refer to non-static properties and methods because it just
///     doesn’t make sense – which instance of School would you be referring to?
/// - To access static code from non-static code, always use your type’s name such as
///     School.studentCount. You can also use Self to refer to the current type.
///

/// Now we have self and Self, and they mean different things: self refers to the current value
/// of the struct, and Self refers to the current type.
///
/// It’s easy to forget the difference between self and Self, but if you think about it it’s just
/// like the rest of Swift’s naming – we start all our data types with a capital letter
/// (Int, Double, Bool, etc), so it makes sense for Self to start with a capital letter too.
///

/// Now, that sound you can hear is a thousand other learners saying “why the heck is this
/// needed?” And Hacking With Swift get it – this can seem like a rather redundant feature
/// at first. So, I want to show you the two main ways I use static data.
///
/// First, Hacking With Swift use static properties to organize common data in my apps.
/// For example, I might have a struct like AppData to store lots of shared values
/// Hacking With Swift use in many places.
///
/// Using this approach, everywhere Hacking With Swift need to check or display something like
/// Hacking With Swift app’s version number – an about screen, debug output, logging information,
/// support emails, etc – Hacking With Swift can read AppData.version.
///
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

/// The second reason Hacking With Swift commonly use static data is to create examples of
/// Hacking With Swift structs. As you’ll see later on, SwiftUI works best when it can show
/// previews of your app as you develop, and those previews often require sample data.
/// For example, if you’re showing a screen that displays data on one employee, you’ll want to be
/// able to show an example employee in the preview screen so you can check it all looks correct
/// as you work.
///
/// This is best done using a static example property on the struct, like this.
///
/// And now whenever you need an Employee instance to work with in your design previews,
/// you can use Employee.example and you’re done.
///
/// Like Hacking With Swift said at the beginning, there are only a handful of occasions
/// when a static property or method makes sense, but they are still a useful tool to have around.
///
struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

/// What’s the point of static properties and methods in Swift?
///
/// Most people learning Swift immediately see the value of regular properties and methods,
/// but struggle to understand why static properties and methods would be useful. It’s certainly
/// true that they are less useful than regular properties and methods, but they are still fairly
/// common in Swift code.
///
/// One common use for static properties and methods is to store common functionality you use
/// across an entire app. For example, Hacking With Swift make an app called Unwrap, which is a
/// free iOS app for folks learning Swift. In the app Hacking With Swift want to store some common
/// information, such as the URL to the app on the App Store, so Hacking With Swift can reference
/// that anywhere the app needs it. So, Hacking With Swift have code like this storing
/// Hacking With Swift data.
///
/// That way Hacking With Swift can write Unwrap.appURL when someone shares something from
/// the app, which helps other folks discover the app. Without the static keyword
/// Hacking With Swift’d need to make a new instance of the Unwrap struct just to read the fixed
/// app URL, which isn’t really necessary.
///
struct Unwrap {
    static let appURL = "https://itunes.apple.com/app/id1440611372"
}

/// Hacking With Swift also use both a static property and a static method to store
/// some random entropy in the same struct, like this.
///
/// Random entropy is some randomness collected by software to make random number generation more
/// effective, but Hacking With Swift cheat a little in my app because Hacking With Swift don’t
/// want truly random data. The app is designed to give you various Swift tests in a random order,
/// but if it were truly random then it’s likely you’d see the same question back to back
/// sometimes. Hacking With Swift don’t want that, so my entropy actually makes randomness less
/// random so we get a fairer spread of questions. So, what my code does is store an entropy
/// integer that starts off random, but increments by 1 every time getEntropy() is called.
///
/// This “fair random” entropy is used throughout the app so that duplicates won’t appear, so
/// again they are shared statically by the Unwrap struct so everywhere can access them.
///
//static var entropy = Int.random(in: 1...1000)
//
//func getEntropy() -> Int {
//    entropy += 1
//    return entropy
//}

/// Before Hacking With Swift move on, there are two more things Hacking With Swift
/// want to mention that might interest you.
///
/// First, Hacking With Swift's Unwrap struct isn’t really a struct at all – Hacking With Swift
/// actually declare it as an enum rather than a struct. The enum doesn’t have any cases, but it’s
/// a better choice than a struct here because Hacking With Swift don’t ever want to create an
/// instance of this type – there’s no reason to. Making an enum stops this from happening, which
/// helps clarify Hacking With Swift's intent.
///
/// Second, because Hacking With Swift have a dedicated getEntropy() method, Hacking With Swift
/// actually ask Swift to restrict access to the entropy so that Hacking With Swift can’t access
/// it from anywhere. This is called access control, and look like this in Swift.
///
//private static entropy = Int.random(in: 1...1000)
///





/// Summary: Structs
///
/// Structs are used almost everywhere in Swift: String, Int, Double, Array and even Bool are all
/// implemented as structs, and now you can recognize that a function such as isMultiple(of:)
/// is really a method belonging to Int.
///
/// Let’s recap what else we learned.
/// - You can create your own structs by writing struct, giving it a name, then placing
///     the struct’s code inside braces.
/// - Structs can have variable and constants (known as properties) and functions
///     (known as methods)
/// - If a method tries to modify properties of its struct, you must mark it as mutating.
/// - You can store properties in memory, or create computed properties that calculate
///     a value every time they are accessed.
/// - We can attach didSet and willSet property observers to properties inside a struct,
///     which is helpful when we need to be sure that some code is always executed
///     when the property changes.
/// - Initializers are a bit like specialized functions, and Swift generates one for all
///     structs using their property names.
/// - You can create your own custom initializers if you want, but you must always make sure
///     all properties in your struct have a value by the time the initializer finishes,
///     and before you call any other methods.
/// - We can use access to mark any properties and methods as being available or
///     unavailable externally, as needed.
/// - It’s possible to attach a property or methods directly to a struct, so you can use them
///     without creating an instance of the struct.
///




