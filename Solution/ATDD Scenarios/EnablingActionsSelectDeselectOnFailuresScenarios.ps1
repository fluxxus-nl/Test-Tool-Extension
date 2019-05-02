$Features = @()

$Features +=
Feature 'Enabling Actions on Failures Unfiltered' {
    Scenario 1 'Unfiltered disabled failed test functions' {
        Given	'One disabled test codeunit with five disabled failed test functions'
        Given	'One disabled test codeunit with three disabled failed test functions'
        When	'Do nothing'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
        Then	'Select on Failures is enabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 2 'Unfiltered enabled failed test functions' {
        Given	'One enabled test codeunit with five enabled failed test functions'
        Given	'One enabled test codeunit with three enabled failed test functions'
        When	'Do nothing'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 3 'Unfiltered enabled and disabled failed test functions' {
        Given	'One enabled test codeunit with five enabled failed test functions'
        Given	'One disabled test codeunit with three disabled failed test functions'
        When	'Do nothing'
        Then	'Select on All is enabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is enabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 4 'Select on All on unfiltered disabled failed test functions' {
        Given	'One disabled test codeunit with five disabled failed test functions'
        Given	'One disabled test codeunit with three disabled failed test functions'
        When	'Perform Select on All'
        Then	'Run is set on all test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 5 'Deselect on All on unfiltered enabled failed test functions' {
        Given	'One enabled test codeunit with five enabled failed test functions'
        Given	'One enabled test codeunit with three enabled failed test functions'
        When	'Perform Deselect on All'
        Then	'Run is not set on all test codeunits and functions'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
        Then	'Select on Failures is enabled'
        Then	'Select on Non Failures is disabled'
    }
    Scenario 6 'Select on Failures on unfiltered disabled failed test functions' {
        Given	'One disabled test codeunit with five disabled failed test functions'
        Given	'One disabled test codeunit with three disabled failed test functions'
        When	'Perform Select on Failures'
        Then	'Run is set on all test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 7 'Select on Failures on unfiltered enabled and disabled failed test functions' {
        Given	'One enabled test codeunit with five enabled failed test functions'
        Given	'One disabled test codeunit with three disabled failed test functions'
        When	'Perform Select on Failures'
        Then	'Run is set on all test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }
}

$Features +=
Feature 'Enabling Actions on Failures Filtered' {
    Scenario 8 'Filtered disabled failed test functions' {
        Given	'One disabled test codeunit with five disabled failed test functions'
        Given	'One disabled test codeunit with three disabled failed test functions'
        When	'Set filter on second test codeunit'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
        Then	'Select on Failures is enabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 9 'Filtered enabled failed test functions' {
        Given	'One enabled test codeunit with five enabled failed test functions'
        Given	'One enabled test codeunit with three enabled failed test functions'
        When	'Set filter on second test codeunit'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 10 'Filtered enabled and disabled failed test functions 1' {
        Given	'One enabled test codeunit with five enabled failed test functions'
        Given	'One disabled test codeunit with three disabled failed test functions'
        When	'Set filter on first test codeunit'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 11 'Filtered enabled and disabled failed test functions 2' {
        Given	'One enabled test codeunit with five enabled failed test functions'
        Given	'One disabled test codeunit with three disabled failed test functions'
        When	'Set filter on second test codeunit'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
        Then	'Select on Failures is enabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 12 'Select on All on filtered disabled failed test functions' {
        Given	'One disabled test codeunit with five disabled failed test functions'
        Given	'One disabled test codeunit with three disabled failed test functions'
        Given	'Filter on second test codeunit'
        When	'Perform Select on All'
        Then	'Run is set on all filtered test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 13 'Deselect on All on filtered enabled failed test functions' {
        Given	'One enabled test codeunit with five enabled failed test functions'
        Given	'One enabled test codeunit with three enabled failed test functions'
        Given	'Filter on second test codeunit'
        When	'Perform Deselect on All'
        Then	'Run is not set on all filtered test codeunits and functions'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
        Then	'Select on Failures is enabled'
        Then	'Select on Non Failures is disabled'
    }
    Scenario 14 'Select on Failures on filtered disabled failed test functions' {
        Given	'One disabled test codeunit with five disabled failed test functions'
        Given	'One disabled test codeunit with three disabled failed test functions'
        Given	'Filter on second test codeunit'
        When	'Perform Select on Failures'
        Then	'Run is set on all filtered test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }

    Scenario 15 'Select on Failures on filtered enabled and disabled failed test functions' {
        Given	'One enabled test codeunit with five enabled failed test functions'
        Given	'One disabled test codeunit with three disabled failed test functions'
        Given	'Filter on second test codeunit'
        When	'Perform Select on Failures'
        Then	'Run is set on all filtered test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
        Then	'Select on Failures is disabled'
        Then	'Select on Non Failures is disabled'
    }
}

$Features | `
    ConvertTo-ALTestCodeunit `
    -CodeunitID 92052 `
    -CodeunitName 'Enabl. Actions on Failures FLX' `
    -InitializeFunction `
    -GivenFunctionName "Create {0}" `
    -ThenFunctionName "Verify {0}" `
| Out-File '.\Test Codeunits\Cod92052.EnablingActionsSelectDeselectOnFailuresScenarios.al'