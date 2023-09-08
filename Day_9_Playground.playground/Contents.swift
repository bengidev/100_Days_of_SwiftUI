/// This is important to include required files
/// for application/program to be able to run.
///
import Cocoa

/// How to create and use closures
///
/// Functions are powerful things in Swift. Yes, you’ve seen how you can call them,
/// pass in values, and return data, but you can also assign them to variables,
/// pass functions into functions, and even return functions from functions.
///
/// For example.
///
/// That creates a trivial function and calls it, but then creates a copy of that function
/// and calls the copy. As a result, it will print the same message twice.
///
/// When you’re copying a function, you don’t write the parentheses after it – it’s
/// var greetCopy = greetUser and not var greetCopy = greetUser(). If you put
/// the parentheses there you are calling the function and assigning its return value
/// back to something else.
///
func greetUser() -> Void {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

/// But what if you wanted to skip creating a separate function, and just assign the
/// functionality directly to a constant or variable? Well, it turns out you can do that too.
///
let sayHello = {
    print("Hi there!")
}

sayHello()

/// Swift gives this the grandiose name closure expression, which is a fancy way of saying
/// we just created a closure – a chunk of code we can pass around and call whenever we want.
/// This one doesn’t have a name, but otherwise it’s effectively a function that takes
/// no parameters and doesn’t return a value.
///

/// If you want the closure to accept parameters, they need to be written in a special way.
/// You see, the closure starts and ends with the braces, which means we can’t put code
/// outside those braces to control parameters or return value. So, Swift has a
/// neat workaround: we can put that same information inside the braces, like this.
///
/// Hacking With Swift added an extra keyword there – did you spot it? It’s the in keyword,
/// and it comes directly after the parameters and return type of the closure. Again, with a
/// regular function the parameters and return type would come outside the braces, but we can’t
/// do that with closures. So, in is used to mark the end of the parameters and return type –
/// everything after that is the body of the closure itself. There’s a reason for this,
/// and you’ll see it for yourself soon enough.
///
let sayHello1 = { (name: String) -> String in
    return "Hi \(name)!"
}

/// In the meantime, you might have a more fundamental question: “why would I ever need these
/// things?” Hacking With Swift know, closures do seem awfully obscure. Worse, they seem obscure
/// and complicated – many, many people really struggle with closures when they first meet them,
/// because they are complex beasts and seem like they are never going to be useful.
///
/// However, as you’ll see this gets used extensively in Swift, and almost everywhere in SwiftUI.
/// Seriously, you’ll use them in every SwiftUI app you write, sometimes hundreds of times –
/// maybe not necessarily in the form you see above, but you’re going to be using it a lot.
///
/// To get an idea of why closures are so useful, Hacking With Swift first want to introduce
/// you to function types. You’ve seen how integers have the type Int, and decimals have
/// the type Double, etc, and now Hacking With Swift want you to think about how
/// functions have types too.
///

/// Let’s take the greetUser() function we wrote earlier: it accepts no parameters, returns
/// no value, and does not throw errors. If we were to write that as a type annotation for
/// greetCopy, we’d write this.
///
/// Let’s break that down.
/// - The empty parentheses marks a function that takes no parameters.
/// - The arrow means just what it means when creating a function: we’re about to
///     declare the return type for the function.
/// - Void means “nothing” – this function returns nothing. Sometimes you might see this
///     written as (), but we usually avoid that because it can be confused with
///     the empty parameter list.
///
var greetCopy1: () -> Void = greetUser

/// Every function’s type depends on the data it receives and sends back. That might sound simple,
/// but it hides an important catch: the names of the data it receives are not part
/// of the function’s type.
///
/// We can demonstrate this with some more code.
///
/// That starts off easily enough: it’s a function that accepts an integer and returns a string.
/// But when we take a copy of the function the type of function doesn’t include
/// the for external parameter name, so when the copy is called we use data(1989)
/// rather than data(for: 1989).
///
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

/// Cunningly this same rule applies to all closures – you might have noticed that
/// Hacking With Swift didn’t actually use the sayHello closure we wrote earlier,
/// and that’s because I didn’t want to leave you questioning the lack of
/// a parameter name at the call site. Let’s call it now.
///
/// That uses no parameter name, just like when we copy functions. So, again:
/// external parameter names only matter when we’re calling a function directly,
/// not when we create a closure or when we take a copy of the function first.
///
let sayHello2 = { (name: String) -> String in
    return "Hi \(name)!"
}

sayHello2("Taylor")

/// You’re probably still wondering why all this matters, and it’s all about to become clear.
/// Do you remember I said we can use sorted() with an array to have it sort its elements?
///
/// It means we can write code like this.
///
let team = ["Gloria", "Suzzane", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

/// That’s really neat, but what if we wanted to control that sort – what if we always wanted
/// one person to come first because they were the team captain, with the rest
/// being sorted alphabetically?
///
/// Well, sorted() actually allows us to pass in a custom sorting function to control
/// exactly that. This function must accept two strings, and return true if the first string
/// should be sorted before the second, or false if the first string should be sorted after
/// the second.
///
/// If Suzanne were the captain, the function would look like this.
///
/// So, if the first name is Suzanne, return true so that name1 is sorted before name2.
/// On the other hand, if name2 is Suzanne, return false so that name1 is sorted after name2.
/// If neither name is Suzanne, just use < to do a normal alphabetical sort.
///
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzzane" {
        return true
    } else if name2 == "Suzzane" {
        return false
    }
    
    return name1 < name2
}

/// Like Hacking With Swift said, sorted() can be passed a function to create a custom sort order,
/// and as long as that function a) accepts two strings, and b) returns a Boolean,
/// sorted() can use it.
///
/// That’s exactly what our new captainFirstSorted() function does, so we can use it straight away.
///
/// When that runs it will print ["Suzanne", "Gloria", "Piper", "Tasha", "Tiffany"],
/// exactly as we wanted.
///
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

/// We’ve now covered two seemingly very different things. First, we can create closures as
/// anonymous functions, storing them inside constants and variables.
///
let sayHello3 = {
    print("Hi there!")
}

sayHello3()

/// And we’re also able to pass functions into other functions, just like we passed
/// captainFirstSorted() into sorted().
///
let captainFirstTeam1 = team.sorted(by: captainFirstSorted)

/// The power of closures is that we can put these two together: sorted() wants a function
/// that will accept two strings and return a Boolean, and it doesn’t care if that function
/// was created formally using func or whether it’s provided using a closure.
///
/// So, we could call sorted() again, but rather than passing in the captainFirstTeam() function,
/// instead start a new closure: write an open brace, list its parameters and return type,
/// write in, then put our standard function code.
///
/// This is going to hurt your brain at first. It’s not because you’re not smart enough
/// to understand closures or not cut out for Swift programming, only that closures
/// are really hard. Don’t worry – we’re going to look at ways to make this easier!
///
/// Okay, let’s write some new code that calls sorted() using a closure.
///
/// That’s a big chunk of syntax all at once, and again I want to say it’s going to get easier –
/// in the very next chapter we’re going to look at ways to reduce the amount of code so
/// it’s easier to see what’s going on.
///
/// But first I want to break down what’s happening there.
/// - We’re calling the sorted() function as before.
/// - Rather than passing in a function, we’re passing a closure – everything from
///     the opening brace after by: down to the closing brace on the last line is part
///     of the closure.
/// - Directly inside the closure we list the two parameters sorted() will pass us,
///     which are two strings. We also say that our closure will return a Boolean,
///     then mark the start of the closure’s code by using in.
/// - Everything else is just normal function code.
///
let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzzane" {
        return true
    } else if name2 == "Suzzane" {
        return false
    }
    
    return name1 < name2
})

/// Again, there’s a lot of syntax in there and Hacking With Swift wouldn’t blame you if you
/// felt a headache coming on, but I hope you can see the benefit of closures at least a little:
/// functions like sorted() let us pass in custom code to adjust how they work,
/// and do so directly – we don’t need to write out a new function just for that one usage.
///

/// What the heck are closures and why does Swift love them so much?
///
/// Go on, admit it: you asked yourself exactly this question. If you didn’t Hacking With Swift
/// be surprised, because closures are one of the most powerful features of Swift but also
/// easily the feature that confuses people.
///
/// So, if you’re sitting here thinking “wow, closures are really hard”, don’t be dismayed –
/// they are hard, and you finding them hard just means your brain is operating correctly.
///
/// One of the most common reasons for closures in Swift is to store functionality – to be able
/// to say “here’s some work I want you to do at some point, but not necessarily now.”
/// Some examples.
/// - Running some code after a delay.
/// - Running some code after an animation has finished.
/// - Running some code when a download has finished.
/// - Running some code when a user has selected an option from your menu.
///
/// Closures let us wrap up some functionality in a single variable, then store that somewhere.
/// We can also return it from a function, and store the closure somewhere else.
///
/// When you’re learning, closures are a little hard to read – particularly when they
/// accept and/or return their own parameters. But that’s OK: take small steps,
/// and backtrack if you get stuck, and you’ll be fine.
///

/// Why are Swift’s closure parameters inside the braces?
///
/// Both closures and functions can take parameters, but the way they take parameters
/// is very different. Here’s a function that accepts a string and an integer.
///
func pay(user: String, amount: Int) -> Void {
    // Code
}

/// And here’s exactly the same thing written as a closure.
///
/// As you can see, the parameters have moved inside the braces, and the in keyword
/// is there to mark the end of the parameter list and the start of the closure’s body itself.
///
let payment = { (user: String, amount: Int) -> Void in
    // Code
}

/// Closures take their parameters inside the brace to avoid confusing Swift: if we had written
/// let payment = (user: String, amount: Int) then it would look like we were trying to create
/// a tuple, not a closure, which would be strange.
///
/// If you think about it, having the parameters inside the braces also neatly captures
/// the way that whole thing is one block of data stored inside the variable –
/// the parameter list and the closure body are all part of the same lump of code,
/// and stored in our variable.
///
/// Having the parameter list inside the braces shows why the in keyword is so important –
/// without that it’s hard for Swift to know where your closure body actually starts,
/// because there’s no second set of braces.
///

/// How do you return a value from a closure that takes no parameters?
///
/// Closures in Swift have a distinct syntax that really separates them from simple functions,
/// and one place that can cause confusion is how we accept and return parameters.
///
/// First, here’s a closure that accepts one parameter and returns nothing.
///
let payment1 = { (user: String) -> Void in
    print("Paying \(user)...")
}

payment1("User1")

/// Now here’s a closure that accepts one parameter and returns a Boolean.
///
let payment2 = { (user: String) -> Bool in
    print("Paying \(user)...")
    return true
}

let userPay2 = payment2("User2")
print(userPay2)

/// If you want to return a value without accepting any parameters, you can’t just write
/// -> Bool in – Swift won’t understand what you mean. Instead, you should use
/// empty parentheses for your parameter list, like this.
///
/// If you think about it, that works just the same as a standard function where’d write
/// func payment() -> Bool.
///
let payment3 = { () -> Bool in
    print("Paying an anonymous person...")
    return true
}

payment1("User3")





/// How to use trailing closures and shorthand syntax
///
/// Swift has a few tricks up its sleeve to reduce the amount of syntax that comes with closures,
/// but first let’s remind ourselves of the problem. Here’s the code we ended up with at
/// the end of the previous chapter.
///
/// If you remember, sorted() can accept any kind of function to do custom sorting, with one rule:
/// that function must accept two items from the array in question (that’s two strings here),
/// and return a Boolean set to true if the first string should be sorted before the second.
///
/// To be clear, the function must behave like that – if it returned nothing, or if it only
/// accepted one string, then Swift would refuse to build our code.
///
let team1 = ["Gloria", "Suzzane", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam3 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzzane" {
        return true
    } else if name2 == "Suzzane" {
        return false
    }
    
    return name1 < name2
})

print(captainFirstTeam3)

/// Think it through: in this code, the function we provide to sorted() must provide two strings
/// and return a Boolean, so why do we need to repeat ourselves in our closure?
///
/// The answer is: we don’t. We don’t need to specify the types of our two parameters because
/// they must be strings, and we don’t need to specify a return type because it must be a Boolean.
/// So, we can rewrite the code to this.
///
//let captainFirstTeam3 = team.sorted(by: { name1, name2 in })

/// That’s already reduced the amount of clutter in the code, but we can go a step further:
/// when one function accepts another as its parameter, like sorted() does, Swift allows
/// special syntax called trailing closure syntax. It looks like this.
///
/// Rather than passing the closure in as a parameter, we just go ahead and start the closure
/// directly – and in doing so remove (by: from the start, and a closing parenthesis at the end.
/// Hopefully you can now see why the parameter list and in come inside the closure,
/// because if they were outside it would look even weirder!
///
let captainFirstTeam4 = team.sorted { name1, name2 in
    if name1 == "Suzzane" {
        return true
    } else if name2 == "Suzzane" {
        return false
    }
    
    return name1 < name2
}

/// There’s one last way Swift can make closures less cluttered: Swift can automatically provide
/// parameter names for us, using shorthand syntax. With this syntax we don’t even write name1,
/// name2 in any more, and instead rely on specially named values that Swift provides for us:
/// $0 and $1, for the first and second strings respectively.
///
/// Using this syntax our code becomes even shorter.
///
/// Hacking With Swift left this one to last because it’s not as clear cut as the others –
/// some people see that syntax and hate it because it’s less clear, and that’s okay.
///
let captainFirstTeam5 = team.sorted {
    if $0 == "Suzzane" {
        return true
    } else if $1 == "Suzzane" {
        return false
    }
    
    return $0 < $1
}

/// Personally Hacking With Swift wouldn’t use it here because we’re using each value
/// more than once, but if our sorted() call was simpler – e.g., if we just wanted to do
/// a reverse sort – then Hacking With Swift would.
///
/// So, in is used to mark the end of the parameters and return type – everything after that
/// is the body of the closure itself. There’s a reason for this, and you’ll see it
/// for yourself soon enough.
///
/// There Hacking With Swift have flipped the comparison from < to > so we get a reverse sort,
/// but now that we’re down to a single line of code we can remove the return and
/// get it down to almost nothing.
///
let reverseTeam = team.sorted { return $0 > $1 }

/// There are no fixed rules about when to use shorthand syntax and when not to, but in case
/// it’s helpful Hacking With Swift use shorthand syntax unless any of the following are true.
/// - The closure’s code is long.
/// - $0 and friends are used more than once each.
/// - You get three or more parameters (e.g. $2, $3, etc).
///

/// If you’re still unconvinced about the power of closures, let’s take a look at
/// two more examples.
///
/// First up, the filter() function lets us run some code on every item in the array,
/// and will send back a new array containing every item that returns true for the function.
/// So, we could find all team players whose name begins with T like this.
///
/// That will print ["Tiffany", "Tasha"], because those are the only two team members
/// whose name begins with T.
///
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

/// And second, the map() function lets us transform every item in the array using some code
/// of our choosing, and sends back a new array of all the transformed items.
///
/// That will print ["GLORIA", "SUZANNE", "PIPER", "TIFFANY", "TASHA"], because
/// it has uppercased every name and produced a new array from the result.
///
/// When working with map(), the type you return doesn’t have to be the same as the type
/// you started with – you could convert an array of integers to an array of strings,
/// for example.
///
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

/// Like Hacking With Swift said, you’re going to be using closures a lot with SwiftUI.
/// - When you create a list of data on the screen, SwiftUI will ask you to provide
///     a function that accepts one item from the list and converts it something
///     it can display on-screen.
/// - When you create a button, SwiftUI will ask you to provide one function to execute
///     when the button is pressed, and another to generate the contents of the button –
///     a picture, or some text, and so on.
/// - Even just putting stacking pieces of text vertically is done using a closure.
///
/// Yes, you can create individual functions every time SwiftUI does this,
/// but trust Hacking With Swift: you won’t. Closures make this kind of code completely natural,
/// and Hacking With Swift think you’ll be amazed at how SwiftUI uses them to produce
/// remarkably simple, clean code.
///

/// Why does Swift have trailing closure syntax?
///
/// Trailing closure syntax is designed to make Swift code easier to read, although
/// some prefer to avoid it.
///
/// Let’s start with a simple example first. Here’s a function that accepts a Double
/// then a closure full of changes to make.
///
/// (In case you were wondering, that’s a simplified version of a real and
/// very common UIKit function!)
///
func animate(duration: Double, animations: () -> Void) -> Void {
    print("Starting a \(duration) second animation...")
    animations()
}

/// We can call that function without a trailing closure like this.
///
/// That’s very common. Many people don’t use trailing closures, and that’s OK.
/// But many more Swift developers look at the }) at the end and wince a little –
/// it isn’t pleasant.
///
animate(duration: 3, animations: {
    print("Fade out the image")
})

/// Trailing closures allow us to clean that up, while also removing the animations
/// parameter label. That same function call becomes this.
///
animate(duration: 3) {
    print("Fade out the image")
}

/// Trailing closures work best when their meaning is directly attached to the name
/// of the function – you can see what the closure is doing because the function is
/// called animate().
///
/// If you’re not sure whether to use trailing closures or not, Hacking With Swift advice is
/// to start using them everywhere. Once you’ve given them a month or two you’ll have
/// enough usage to look back and decide more clearly, but hopefully you get used
/// to them because they are really common in Swift!
///

/// When should you use shorthand parameter names?
///
/// When working with closures, Swift gives us a special shorthand parameter syntax that
/// makes it extremely concise to write closures. This syntax automatically numbers parameter
/// names as $0, $1, $2, and so on – we can’t use names such as these in our own code,
/// so when you see them it’s immediately clear these are shorthand syntax for closures.
///
/// As for when you should use them it’s really a big “it depends”.
/// - Are there many parameters? If so, shorthand syntax stops being useful and in fact
///     starts being counterproductive – was it $3 or $4 that you need to compare
///     against $0 Give them actual names and their meaning becomes clearer.
/// - Is the function commonly used? As your Swift skills progress, you’ll start to realize
///     that there are a handful – maybe 10 or so – extremely common functions
///     that use closures, so others reading your code will easily understand what $0 means.
/// - Are the shorthand names used several times in your method? If you need to refer
///     to $0 more than maybe two or three times, you should probably just give it a real name.
///
/// What matters is that your code is easy to read and easy to understand. Sometimes that means
/// making it short and simple, but not always – choose shorthand syntax on a case by case basis.
///





/// How to accept functions as parameters
///
/// There’s one last closure-related topic I want to look at, which is how to write functions
/// that accept other functions as parameters. This is particularly important for closures
/// because of trailing closure syntax, but it’s a useful skill to have regardless.
///
/// Previously we looked at this code.
///
/// I’ve added the type annotation in there intentionally, because that’s exactly what we use
/// when specifying functions as parameters: we tell Swift what parameters the function accepts,
/// as well its return type.
///
func greetUser2() -> Void {
    print("Hi there!")
}

greetUser2()

var greetCopy2: () -> Void = greetUser2
greetCopy2()

/// Once again, brace yourself: the syntax for this is a little hard on the eyes at first!
/// Here’s a function that generates an array of integers by repeating a function
/// a certain number of times.
///
/// Let’s break that down.
/// - The function is called makeArray(). It takes two parameters, one of which is the number
///     of integers we want, and also returns an array of integers.
/// - The second parameter is a function. This accepts no parameters itself, but will return
///     one integer every time it’s called.
/// - Inside makeArray() we create a new empty array of integers, then loop as many times
///     as requested.
/// - Each time the loop goes around we call the generator function that was passed in
///     as a parameter. This will return one new integer, so we put that into the numbers array.
/// - Finally the finished array is returned.
///
/// The body of the makeArray() is mostly straightforward: repeatedly call a function to
/// generate an integer, adding each value to an array, then send it all back.
///
/// The complex part is the very first line. There we have two sets of parentheses and two sets
/// of return types, so it can be a bit of a jumble at first. If you split it up you should
/// be able to read it linearly.
/// - We’re creating a new function.
/// - The function is called makeArray().
/// - The first parameter is an integer called size.
/// - The second parameter is a function called generator, which itself accepts no parameters
///     and returns an integer.
/// - The whole thing – makeArray() – returns an array of integers.
///
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

/// The result is that we can now make arbitrary-sized integer arrays, passing in a function
/// that should be used to generate each number.
///
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

/// And remember, this same functionality works with dedicated functions too, so we could write
/// something like this.
///
/// That will call generateNumber() 50 times to fill the array.
///
func generateNumber() -> Int {
    return Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

/// While you’re learning Swift and SwiftUI, there will only be a handful of times when you need
/// to know how to accept functions as parameters, but at least now you have an inkling of
/// how it works and why it matters.
///

/// There’s one last thing before we move on: you can make your function accept multiple
/// function parameters if you want, in which case you can specify multiple trailing closures.
/// The syntax here is very common in SwiftUI, so it’s important to at least show you a taste
/// of it here.
///
/// To demonstrate this here’s a function that accepts three function parameters, each of which
/// accept no parameters and return nothing.
///
/// Hacking With Swift added extra print() calls in there to simulate specific work being done
/// in between first, second, and third being called.
///
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) -> Void {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

/// Here’s how that looks.
///
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

/// Having three trailing closures is not as uncommon as you might expect. For example,
/// making a section of content in SwiftUI is done with three trailing closures:
/// one for the content itself, one for a head to be put above,
/// and one for a footer to be put below.
///

/// Why would you want to use closures as parameters?
///
/// Swift’s closures can be used just like any other type of data, which means you can pass them
/// into functions, take copies of them, and so on. But when you’re just learning,
/// this can feel very much like “just because you can, doesn’t mean you should” –
/// it’s hard to see the benefit.
///
/// One of the best examples Hacking With Swift can give is the way Siri integrates with apps.
/// Siri is a system service that runs from anywhere on your iOS device, but it’s able to
/// communicate with apps – you can book a ride with Lyft, you can check the weather with Carrot
/// Weather, and so on. Behind the scenes, Siri launches a small part of the app in the background
/// to pass on our voice request, then shows the app’s response as part of the Siri user interface.
///
/// Now think about this: what if my app behaves badly, and takes 10 seconds to respond to Siri?
/// Remember, the user doesn’t actually see my app, just Siri, so from their perspective it
/// looks like Siri has completely frozen.
///
/// This would be a terrible user experience, so Apple uses closures instead: it launches our app
/// in the background and passes in a closure that we can call when we’re done. Our app then can
/// take as long as it wants to figure out what work needs to be done, and when we’re finished we
/// call the closure to send back data to Siri. Using a closure to send back data rather than
/// returning a value from the function means Siri doesn’t need to wait for the function to
/// complete, so it can keep its user interface interactive – it won’t freeze up.
///
/// Another common example is making network requests. Your average iPhone can do several billion
/// things a second, but connecting to a server in Japan takes half a second or more – it’s almost
/// glacial compared to the speed things happen on your device. So, when we request data from the
/// internet we do so with closures: “please fetch this data, and when you’re done run this
/// closure.” Again, it means we don’t force our user interface to freeze while some slow work
/// is happening.
///

/// Summary: Closures
///
/// We’ve covered a lot about closures in the previous chapters, so let’s recap.
/// - You can copy functions in Swift, and they work the same as the original except they
///     lose their external parameter names.
/// - All functions have types, just like other data types. This includes the parameters
///     they receive along with their return type, which might be Void – also known as “nothing”.
/// - You can create closures directly by assigning to a constant or variable.
/// - Closures that accept parameters or return a value must declare this inside their braces,
///     followed by the keyword in.
/// - Functions are able to accept other functions as parameters. They must declare up front
///     exactly what data those functions must use, and Swift will ensure the rules are followed.
/// - In this situation, instead of passing a dedicated function you can also pass a closure –
///     you can make one directly. Swift allows both approaches to work.
/// - When passing a closure as a function parameter, you don’t need to explicitly write out
///     the types inside your closure if Swift can figure it out automatically. The same is true
///     for the return value – if Swift can figure it out, you don’t need to specify it.
/// - If one or more of a function’s final parameters are functions, you can use
///     trailing closure syntax.
/// - You can also use shorthand parameter names such as $0 and $1, but Hacking With Swift
///     would recommend doing that only under some conditions.
/// - You can make your own functions that accept functions as parameters, although in practice
///     it’s much more important to know how to use them than how to create them.
///
/// Of all the various parts of the Swift language, Hacking With Swift say closures are
/// the single toughest thing to learn. Not only is the syntax a little hard on your eyes
/// at first, but the very concept of passing a function into a function takes a little time
/// to sink in.
///
/// So, if you’ve read through these chapters and feel like your head is about to explode,
/// that’s great – it means you’re half way to understanding closures!
///
