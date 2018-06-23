*** Settings ***
Library    ClassLibrary.Concat    -
Library    ClassLibrary.Concat    _    WITH NAME    UnderscoreConcat

*** Test cases ***
Test concat all strings
    ${ret} =    ClassLibrary.Concat.concat_all    hello    world
    Should be equal    ${ret}    hello-world

*** Test cases ***
Test using with name syntax
    ${ret} =    UnderscoreConcat.concat_all    hello    world
    Should be equal    ${ret}    hello_world
