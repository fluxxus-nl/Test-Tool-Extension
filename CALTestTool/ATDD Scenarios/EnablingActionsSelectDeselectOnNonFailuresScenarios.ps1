$Features = @()

$Features +=
Feature 'Enabling Actions on Non Failures Unfiltered' {
    Scenario 1 'Unfiltered disabled succesfull test functions' {
        Given	'One disabled test codeunit with five disabled succesfull test functions'
        Given	'One disabled test codeunit with three disabled succesfull test functions'
        When	'Do nothing'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is enabled'
    }

    Scenario 2 'Unfiltered enabled succesfull test functions' {
        Given	'One enabled test codeunit with five enabled succesfull test functions'
        Given	'One enabled test codeunit with three enabled succesfull test functions'
        When	'Do nothing'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 3 'Unfiltered enabled and disabled succesfull test functions' {
        Given	'One enabled test codeunit with five enabled succesfull test functions'
        Given	'One disabled test codeunit with three disabled succesfull test functions'
        When	'Do nothing'
        Then	'Select on All is enabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is enabled'
    }

    Scenario 4 'Select on All on unfiltered disabled succesfull test functions' {
        Given	'One disabled test codeunit with five disabled succesfull test functions'
        Given	'One disabled test codeunit with three disabled succesfull test functions'
        When	'Perform Select on All'
        Then	'Run is set on all test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 5 'Deselect on All on unfiltered enabled succesfull test functions' {
        Given	'One enabled test codeunit with five enabled succesfull test functions'
        Given	'One enabled test codeunit with three enabled succesfull test functions'
        When	'Perform Deselect on All'
        Then	'Run is not set on all test codeunits and functions'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is enabled'
    }
    Scenario 6 'Select on Failures on unfiltered disabled succesfull test functions' {
        Given	'One disabled test codeunit with five disabled succesfull test functions'
        Given	'One disabled test codeunit with three disabled succesfull test functions'
        When	'Perform Select on Non Failures'
        Then	'Run is set on all test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 7 'Select on Failures on unfiltered enabled and disabled succesfull test functions' {
        Given	'One enabled test codeunit with five enabled succesfull test functions'
        Given	'One disabled test codeunit with three disabled succesfull test functions'
        When	'Perform Select on Non Failures'
        Then	'Run is set on all test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }
}

$Features +=
Feature 'Enabling Actions on Non Failures Filtered' {
    Scenario 8 'Filtered disabled succesfull test functions' {
        Given	'One disabled test codeunit with five disabled succesfull test functions'
        Given	'One disabled test codeunit with three disabled succesfull test functions'
        When	'Set filter on second test codeunit'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is enabled'
    }

    Scenario 9 'Filtered enabled succesfull test functions' {
        Given	'One enabled test codeunit with five enabled succesfull test functions'
        Given	'One enabled test codeunit with three enabled succesfull test functions'
        When	'Set filter on second test codeunit'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 10 'Filtered enabled and disabled succesfull test functions 1' {
        Given	'One enabled test codeunit with five enabled succesfull test functions'
        Given	'One disabled test codeunit with three disabled succesfull test functions'
        When	'Set filter on first test codeunit'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 11 'Filtered enabled and disabled succesfull test functions 2' {
        Given	'One enabled test codeunit with five enabled succesfull test functions'
        Given	'One disabled test codeunit with three disabled succesfull test functions'
        When	'Set filter on second test codeunit'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is enabled'
    }

    Scenario 12 'Select on All on filtered disabled succesfull test functions' {
        Given	'One disabled test codeunit with five disabled succesfull test functions'
        Given	'One disabled test codeunit with three disabled succesfull test functions'
        Given	'Filter on second test codeunit'
        When	'Perform Select on All'
        Then	'Run is set on all filtered test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 13 'Deselect on All on filtered enabled succesfull test functions' {
        Given	'One enabled test codeunit with five enabled succesfull test functions'
        Given	'One enabled test codeunit with three enabled succesfull test functions'
        Given	'Filter on second test codeunit'
        When	'Perform Deselect on All'
        Then	'Run is not set on all filtered test codeunits and functions'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is enabled'
    }
    Scenario 14 'Select on Failures on filtered disabled succesfull test functions' {
        Given	'One disabled test codeunit with five disabled succesfull test functions'
        Given	'One disabled test codeunit with three disabled succesfull test functions'
        Given	'Filter on second test codeunit'
        When	'Perform Select on Non Failures'
        Then	'Run is set on all filtered test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 15 'Select on Failures on filtered enabled and disabled succesfull test functions' {
        Given	'One enabled test codeunit with five enabled succesfull test functions'
        Given	'One disabled test codeunit with three disabled succesfull test functions'
        Given	'Filter on second test codeunit'
        When	'Perform Select on Non Failures'
        Then	'Run is set on all filtered test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }
}

$Features | `
    ConvertTo-ALTestCodeunit `
    -CodeunitID 92053 `
    -CodeunitName 'Enabling Actions on Non Failures' `
    -InitializeFunction `
    -GivenFunctionName "Create {0}" `
    -ThenFunctionName "Verify {0}" `
| Out-File '.\Test Codeunits\Cod92053.EnablingActionsSelectDeselectOnNonFailuresScenarios.al'