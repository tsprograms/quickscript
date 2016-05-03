<!-- Created by TSPrograms on 5/3/16. Copyright © 2016 TSPrograms. -->

# The QuickScript Spec
QuickScript is a specific language. Any valid implementation of QuickScript should behave in *the exact same way* as any other implementation, excluding platform-specific data.

##### Operators
In QuickScript syntax, an operator is one or more consecutive non-alphanumeric characters. Operators, as the name suggests, perform various operations or functions. One example of an operator would be the `+` operator, which adds values together. Operators work by modifiying a value or multiple values. They take the input provided by the values they modify, and produce an output based on what they are designed to do.

In QuickScript, there are two main types of operators: prefix operators and infix operators. A prefix operator is an operator which comes directly before the value it modifies, with nothing (whitespace included) in between the operator and the value. An infix operator comes between the two values it modifies, and can have whitespace in between it and its values.
