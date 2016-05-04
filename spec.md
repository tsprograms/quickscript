<!-- Created by TSPrograms on 5/3/16. Copyright © 2016 TSPrograms. -->

# The QuickScript Spec
QuickScript is a specific language. Any valid implementation of QuickScript should behave in *the exact same way* as any other implementation, excluding platform-specific data.

#### Operators
In QuickScript syntax, an operator is one or more consecutive non-alphanumeric characters. Operators, as the name suggests, perform various operations or functions. One example of an operator would be the `+` operator, which adds values together. Operators work by modifiying a value or multiple values. They take the input provided by the values they modify, and produce an output based on what they are designed to do.

In QuickScript, there are three main types of operators: outfix operators, prefix operators, and infix operators. An outfix operator is actually a set of paired operators. Outfix operators modify the value enclosed within the operators. A prefix operator is an operator which comes directly before the value it modifies, with nothing (whitespace included) in between the operator and the value. An infix operator comes between the two values it modifies, and can have whitespace in between it and its values.

##### Outfix Operators
There are only three outfix operators in QuickScript, but they all have special rules.
The following operators are required in a valid implementation of QuickScript:
  * The `(` and `)` operators
  * The `[` and `]` operators
  * The `{` and `}` operators
Note that the data within the two latter operator pairs is not parsed in the same manner as with most values (see the `[`/`]` spec and the `{`/`}` spec).

##### Prefix Operators
There are only two prefix operators in QuickScript. The first one is the `!` operator. The `!` operator negates a value (i.e., it determines whether a value is truthy and returns the boolean inverse of that truth value). The `@` operator, on the other hand, performs various operations. **Note that no operator can begin with `@` other than `@` itself, as `@` is the operator operator (i.e., it operates on the operator after it). See the `@` spec.**
