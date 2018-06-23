*** Settings ***
Library    ModuleLibrary


*** Variables ***
@{strings}    hello    how    are    you
&{a_dict}    first_name=John    last_name=Liu


*** Test cases ***
Test keyword with positional arguments
    ${ret} =    concat with underscore    hello    world
    Should be equal    ${ret}    hello_world

*** Test cases ***
Test keyword with keyword arguments
    ${ret} =    concat with underscore    arg1=hello    arg2=world
    Should be equal    ${ret}    hello_world

*** Test cases ***
Test keyword with positional and keyword arguments
    ${ret} =    concat with underscore    hello    arg2=world
    Should be equal    ${ret}    hello_world

*** Test cases ***
Test keyword with positional and default arguments
    ${ret} =    concat with underscore    hello
    Should be equal    ${ret}    hello_mydefaultworld

*** Test cases ***
Test keyword with variable arguments
    ${ret} =    concat all with underscore    hello    there    how    are    you
    Should be equal    ${ret}    hello_there_how_are_you

*** Test cases ***
Test keyword with keyword decorator
    ${ret} =    concat with hyphen    hello    world
    Should be equal    ${ret}    hello-world

*** Test cases ***
Test keyword returns tuple
    [Tags]    list_variable
    @{ret_list} =    return two values
    Should be equal    @{ret_list}[0]    hello
    Should be equal    @{ret_list}[1]    world
    ${ret_1}    ${ret_2} =    return two values
    Should be equal    ${ret_1}    hello
    Should be equal    ${ret_2}    world

*** Test cases ***
Test keyword takes list of stuff
    [Tags]    list_variable
    ${ret} =    concat list of strings with underscore    ${strings}
    Should be equal    ${ret}    hello_how_are_you

*** Test cases ***
Test keyword with variable arguments using list variable
    [Tags]    list_variable
    ${ret} =    concat all with underscore    @{strings}
    Should be equal    ${ret}    hello_how_are_you

*** Test cases ***
Test keyword returns dictionary
    [Tags]    dictionary_variable
    &{ret_dict} =    return a dictionary
    Should be equal    &{ret_dict}[first_name]    John
    Should be equal    &{ret_dict}[last_name]    Liu
    # If key is string:
    Should be equal    ${ret_dict.first_name}    John
    Should be equal    ${ret_dict.last_name}    Liu

*** Test cases ***
Test keyword takes a dictionary
    [Tags]    dictionary_variable
    ${ret} =    concat name with underscore    ${a_dict}
    Should be equal    ${ret}    John_Liu

*** Test cases ***
Test keyword using dictionary variable
    [Tags]    dictionary_variable
    ${ret} =    concat first and last name    &{a_dict}
    Should be equal    ${ret}    JohnLiu

*** Test cases ***
Test keyword with assertion error
    [Tags]    error
    Run keyword and expect error    This should fail    Raise assertion error

*** Test cases ***
Test keyword with customize error
    [Tags]    error
    Run keyword and expect error    MyCustomizeError: This is customize fail    Raise customize error

*** Test cases ***
Test keyword with suppressed error
    [Tags]    error
    Run keyword and expect error    Name of exception should be suppressed    Raise suppressed customize error
