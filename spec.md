<!-- Created by TSPrograms on 5/3/16. Copyright © 2016 TSPrograms. -->

# The QuickScript Spec
QuickScript is a specific language. Any valid implementation of QuickScript should behave in *the exact same way* as any other implementation, excluding platform-specific data.

#### Literals
<!-- TODO -->

#### Comments
In QuickScript syntax, comments are blocks of code used to explain or comment on functional code. Comments don't actually *do* anything; they just make your code more readable and better. Comments should be ignored entirely in parsing.

Comments begin with any number of `#` signs and end with the same number. All code in between the `#` signs is ignored.
For example, *all* of the following code would be ignored:
```
####
This will be ignored. Even # signs will be ignored,
unless the number of # signs matches the number that
the comment started with (in this case, 4).
For example, this ### will be ignored, and so will
this ## ## # ###.
But this ends the comment. --> ####
```

#### Operators
In QuickScript syntax, an operator is one or more consecutive non-alphanumeric characters. Operators, as the name suggests, perform various operations or functions. One example of an operator would be the `+` operator, which adds values together. Operators work by modifiying a value or multiple values. They take the input provided by the values they modify, and produce an output based on what they are designed to do.

In QuickScript, there are three main types of operators: outfix operators, prefix operators, and infix operators. An outfix operator is actually a set of paired operators. Outfix operators modify the value enclosed within the operators. A prefix operator is an operator which comes directly before the value it modifies, with nothing (whitespace included) in between the operator and the value. An infix operator comes between the two values it modifies, and can have whitespace in between it and its values.

##### Outfix Operators
There are only three outfix operators in QuickScript, but they all have special syntactic rules for parsing.
The following operators are required in a valid base implementation of QuickScript:
  * The `(` and `)` operators
  * The `[` and `]` operators
  * The `{` and `}` operators
Note that the data within the two latter operator pairs is not parsed in the same manner as with most values (see the `[`/`]` spec and the `{`/`}` spec).

##### Prefix Operators
There are only three prefix operators in QuickScript. The first one is the `!` operator. The `!` operator negates a value (i.e., it determines whether a value is truthy and returns the boolean inverse of that truth value). The `@` operator, on the other hand, performs various operations. **Note that no operator can begin with `@` other than `@` itself, as `@` is the operator operator (i.e., it operates on the operator after it). See the `@` spec.** The final prefix operator is the `-` operator, which negates a number.
Therefore, only the following are required in a valid base implementation of QuickScript:
  * The `!` operator
  * The `@` operator (which is special, as it can perform operations on operators)
  * The `-` operator

##### Infix Operators
Infix operators are the most commonly used and the most abundant operators in QuickScript. Infix operators can be added in the code during runtime. Note that certain infix operators are treated differently (i.e., the values they modify are not parsed normally).
The following operators are required in a valid base implementation of QuickScript (in order or highest precedence first):
  * 10: The `.` operator (special parsing for numbers; see its spec)
  * 20: The `^` and `->` operators
  * 30: The `*`, `/`, and `%` operators
  * 40: The `+` and `-` operators
  * 60: The default operator precedence
  * 80: The `==`, `!=`, `===`, `!==`, `>`, `<`, `>=`, and `<=` operators
  * 90: The `|` and `&` operators
  * 100: The `=` operator (special left-side parsing; see its spec)
  * 100: The `+=`, `-=`, `*=`, `/=`, `%=`, `->=`, `^=`, `|=`, and `&=` (see above)
 Note that operators with lower precedence numbers are parsed first. Also, infix operators are parsed after prefix operators, which in turn are parsed after outfix operators.
