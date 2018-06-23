from robot.api.deco import keyword


def concat_with_underscore(arg1, arg2='mydefaultworld'):
    """Accessible by RobotFramework"""
    return arg1 + '_' + arg2


def concat_all_with_underscore(*args):
    return '_'.join(args)


def return_two_values():
    return 'hello', 'world'


def concat_list_of_strings_with_underscore(string):
    return '_'.join(string)


def return_a_dictionary():
    return {'first_name': 'John', 'last_name': 'Liu'}


def concat_name_with_underscore(name_dict):
    return name_dict['first_name'] + '_' + name_dict['last_name']


def concat_first_and_last_name(first_name, last_name):
    return first_name + last_name


@keyword('Concat with hyphen')
def add_hyphen(arg1, arg2):
    """Accessible by RobotFramework with keyword 'Concat with hyphen', instead
    of add_hyphen.
    """
    return arg1 + '-' + arg2


def raise_assertion_error():
    raise AssertionError('This should fail')


def raise_customize_error():
    class MyCustomizeError(Exception):
        """Customized error"""

    raise MyCustomizeError('This is customize fail')


def raise_suppressed_customize_error():
    class MySuppressedCutomizeError(Exception):
        """Suppressed customize error"""
        ROBOT_SUPPRESS_NAME = True

    raise MySuppressedCutomizeError('Name of exception should be suppressed')
