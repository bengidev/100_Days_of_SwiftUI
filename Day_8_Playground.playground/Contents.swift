/// This is important to include required files
/// for application/program to be able to run.
///
import Cocoa

/// Adding parameters to functions lets us add customization points, so that functions
/// can operate on different data depending on our needs. Sometimes we want to make these
/// customization points available to keep our code flexible, but other times you don’t
/// want to think about it – you want the same thing nine times out of ten.
///
/// For example, previously we looked at this function.
///
/// That prints any times table, starting at 1 times the number up to any end point.
/// That number is always going to change based on what multiplication table we want,
/// but the end point seems like a great place to provide a sensible default –
/// we might want to count up to 10 or 12 most of the time, while still leaving
/// open the possibility of going to a different value some of the time.
///
func printTimesTables(for number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)

/// To solve this problem, Swift lets us specify default values for any or all of
/// our parameters. In this case, we could set end to have the default value of 12,
/// meaning that if we don’t specify it 12 will be used automatically.
///
/// Notice how we can now call printTimesTables() in two different ways: we can provide
/// both parameters for times when we want it, but if we don’t – if we just write
/// printTimesTables(for: 8) – then the default value of 12 will be used for end.
///
func printTimesTables1(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables1(for: 5, end: 20)
printTimesTables1(for: 8)

/// We’ve actually seen a default parameter in action, back in some code we used before.
///
/// That adds some strings to an array, prints its count, then removes them all and
/// prints the count again.
///
/// As a performance optimization, Swift gives arrays just enough memory to hold their items
/// plus a little extra so they can grow a little over time. If more items are added
/// to the array, Swift allocates more and more memory automatically, so that as little
/// as possible is wasted.
///
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()
print(characters.count)

/// When we call removeAll(), Swift will automatically remove all the items in the array,
/// then free up all the memory that was assigned to the array. That’s usually what
/// you’ll want, because after all you’re removing the objects for a reason. But sometimes –
/// just sometimes – you might be about to add lots of new items back into the array,
/// and so there’s a second form of this function that removes the items while also keeping
/// the previous capacity.
///
/// This is accomplished using a default parameter value: keepingCapacity is a Boolean
/// with the default value of false so that it does the sensible thing by default, while also
/// leaving open the option of us passing in true for times we want to keep the array’s
/// existing capacity.
///
characters.removeAll(keepingCapacity: true)

/// As you can see, default parameter values let us keep flexibility in our functions without
/// making them annoying to call most of the time – you only need to send in some parameters
/// when you need something unusual.
///

/// When to use default parameters for functions
///
/// Default parameters let us make functions easier to call by letting us provide common
/// defaults for parameters. So, when we want to call that function using those default
/// values we can just ignore the parameters entirely – as if they didn’t exist – and our
/// function will just do the right thing. Of course, when we want something custom
/// it’s there for us to change.
///
/// Swift developers use default parameters very commonly, because they let us focus on
/// the important parts that do need to change regularly. This can really help simplify
/// complex function, and make your code easier to write.
///
/// For example, imagine some route finding code such as this.
///
func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
    // Code here
}

/// That assumes that most of the time folks want to drive between two locations by
/// the fastest route, without avoiding highways – sensible defaults that are likely
/// to work most of the time, while giving us the scope to provide custom values when needed.
///
/// As a result, we can call that same function in any of three ways.
///
findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)

/// Shorter, simpler code most of the time, but flexibility when we need it – perfect.
///





/// How to handle errors in functions
///
/// Things go wrong all the time, such as when that file you wanted to read doesn’t exist,
/// or when that data you tried to download failed because the network was down. If we didn’t
/// handle errors gracefully then our code would crash, so Swift makes us handle errors –
/// or at least acknowledge when they might happen.
///
/// This takes three steps.
/// - Telling Swift about the possible errors that can happen.
/// - Writing a function that can flag up errors if they happen.
/// - Calling that function, and handling any errors that might happen.
///

/// Let’s work through a complete example: if the user asks us to check how strong their
/// password is, we’ll flag up a serious error if the password is too short or is obvious.
///
/// So, we need to start by defining the possible errors that might happen. This means
/// making a new enum that builds on Swift’s existing Error type, like this.
///
/// That says there are two possible errors with password: short and obvious. It doesn’t
/// define what those mean, only that they exist.
///
enum PasswordError: Error {
    case short, obvious
}

/// Step two is to write a function that will trigger one of those errors. When an error
/// is triggered – or thrown in Swift – we’re saying something fatal went wrong with
/// the function, and instead of continuing as normal it immediately terminates without
/// sending back any value.
///
/// In our case, we’re going to write a function that checks the strength of a password:
/// if it’s really bad – fewer than 5 characters or is extremely well known – then we’ll
/// throw an error immediately, but for all other strings we’ll return either “OK”, “Good”,
/// or “Excellent” ratings.
///
/// Here’s how that looks in Swift.
///
/// Let’s break that down.
/// - If a function is able to throw errors without handling them itself, you must mark
///     the function as throws before the return type.
/// - We don’t specify exactly what kind of error is thrown by the function, just that
///     it can throw errors.
/// - Being marked with throws does not mean the function must throw errors, only that it might.
/// - When it comes time to throw an error, we write throw followed by one of our
///     PasswordError cases. This immediately exits the function, meaning that it won’t
///     return a string.
/// - If no errors are thrown, the function must behave like normal – it needs to return a string.
///
/// That completes the second step of throwing errors: we defined the errors that might happen,
/// then wrote a function using those errors.
///
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

/// The final step is to run the function and handle any errors that might happen.
/// Swift Playgrounds are pretty lax about error handling because they are mostly
/// meant for learning, but when it comes to working with real Swift projects
/// you’ll find there are three steps.
///
/// - Starting a block of work that might throw errors, using do.
/// - Calling one or more throwing functions, using try.
/// - Handling any thrown errors using catch.
///
/// In pseudocode, it looks like this.
///
//do {
//    try someRiskyWork()
//} catch {
//    print("Handle errors here")
//}

/// If we wanted to write try that using our current checkPassword() function,
/// we could write this.
///
/// If the checkPassword() function works correctly, it will return a value into result,
/// which is then printed out. But if any errors are thrown (which in this case there will be),
/// the password rating message will never be printed – execution will immediately jump
/// to the catch block.
///
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error: \(error.localizedDescription).")
}

/// There are a few different parts of that code that deserve discussion, but Hacking With Swift
/// want to focus on the most important one: try. This must be written before calling all
/// functions that might throw errors, and is a visual signal to developers that regular code
/// execution will be interrupted if an error happens.
///
/// When you use try, you need to be inside a do block, and make sure you have one or more catch
/// blocks able to handle any errors. In some circumstances you can use an alternative written
/// as try! which does not require do and catch, but will crash your code if an error is
/// thrown – you should use this rarely, and only if you’re absolutely sure an error
/// cannot be thrown.
///

/// When it comes to catching errors, you must always have a catch block that is able to
/// handle every kind of error. However, you can also catch specific errors as well, if you want.
///
let string1 = "12345"

do {
    let result = try checkPassword(string1)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error: \(error.localizedDescription).")
}

/// As you progress you’ll see how throwing functions are baked into many of Apple’s
/// own frameworks, so even though you might not create them yourself much you will
/// at least need to know how to use them safely.
///
/// Most errors thrown by Apple provide a meaningful message that you can present to your user
/// if needed. Swift makes this available using an error value that’s automatically provided
/// inside your catch block, and it’s common to read error.localizedDescription to see
/// exactly what happened.
///

/// When should you write throwing functions?
///
/// Throwing functions in Swift are those that are able to encounter errors they are unable
/// or unwilling to handle. That doesn’t mean they will throw errors, just that it’s possible
/// they can. As a result, Swift will make sure we’re careful when we use them, so that
/// any errors that do occur are catered for.
///
/// But when you’re writing your code, chances are you’ll think to yourself “should this function
/// throw any errors it encounters, or should it maybe handle them itself?” This is really common,
/// and to be honest there is no single answer – you can handle the errors inside the function
/// (thus making it not a throwing function), you can send them all back to whatever called the
/// function (called “error propagation” or sometimes “bubbling up errors”), and you can even
/// handle some errors in the function and send some back. All of those are valid solutions,
/// and you will use all of them at some point.
///
/// When you’re just getting started, I would recommend you avoid throwing functions most
/// of the time. They can feel a bit clumsy at first because you need to make sure all
/// the errors are handled wherever you use the function, so it feels almost a bit
/// “infectious” – suddenly you have errors needing to be handled in several places
/// in your code, and if those errors bubble up further then the “infection” just spreads.
///
/// So, when you’re learning start small: keep the number of throwing functions low,
/// and work outwards from there. Over time you’ll get a get better grip on managing
/// errors to keep your program flow smooth, and you’ll feel more confident about
/// adding throwing functions.
///

/// Why does Swift make us use try before every throwing function?
///
/// Using Swift’s throwing functions relies on three unique keywords: do, try, and catch.
/// We need all three to be able to call a throwing function, which is unusual – most other
/// languages use only two, because they don’t need to write try before every throwing function.
///
/// The reason Swift is different is fairly simple: by forcing us to use try before every
/// throwing function, we’re explicitly acknowledging which parts of our code can cause errors.
/// This is particularly useful if you have several throwing functions in a single do block,
/// like this.
///
/// As you can see, using try makes it clear that the first, third, and fifth function calls
/// can throw errors, but the second and fourth cannot.
///
//do {
//    try throwingFunction1()
//    nonThrowingFunction1()
//    try throwingFunction2()
//    nonThrowingFunction1()
//    try throwingFunction3()
//} catch {
//    // Handle errors
//}

/// Summary: Functions
///
/// We’ve covered a lot about functions in the previous chapters, so let’s recap.
///
/// - Functions let us reuse code easily by carving off chunks of code and giving it a name.
/// - All functions start with the word func, followed by the function’s name. The function’s
///     body is contained inside opening and closing braces.
/// - We can add parameters to make our functions more flexible – list them out one by one
///     separated by commas: the name of the parameter, then a colon, then the type of
///     the parameter.
/// - You can control how those parameter names are used externally, either by using
///     a custom external parameter name or by using an underscore to disable
///     the external name for that parameter.
/// - If you think there are certain parameter values you’ll use repeatedly, you can make them
///     have a default value so your function takes less code to write and does
///     the smart thing by default.
/// - Functions can return a value if you want, but if you want to return multiple pieces
///     of data from a function you should use a tuple. These hold several named elements,
///     but it’s limited in a way a dictionary is not – you list each element specifically,
///     along with its type.
/// - Functions can throw errors: you create an enum defining the errors you want to happen,
///     throw those errors inside the function as needed, then use do, try, and catch
///     to handle them at the call site.
///

