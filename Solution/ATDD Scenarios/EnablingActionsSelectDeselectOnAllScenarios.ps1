$Features = @()

$Features +=
Feature 'Enabling Actions Select/Deselect on All Unfiltered' {
    Scenario 1 'Unfiltered disabled test functions' {
        Given	'One disabled test codeunit with five disabled test functions'
        Given	'One disabled test codeunit with three disabled test functions'
        When	'Do nothing'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
    }

    Scenario 2 'Unfiltered enabled test functions' {
        Given	'One enabled test codeunit with five enabled test functions'
        Given	'One enabled test codeunit with three enabled test functions'
        When	'Do nothing'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
    }

    Scenario 3 'Unfiltered enabled and disbled test functions' {
        Given	'One enabled test codeunit with five enabled test functions'
        Given	'One disabled test codeunit with three disabled test functions'
        When	'Do nothing'
        Then	'Select on All is enabled'
        Then	'Deselect on All is enabled'
    }

    Scenario 4 'Enable Run on unfiltered successful test functions' {
        Given	'One disabled test codeunit with five disabled successful test functions'
        Given	'One disabled test codeunit with three disabled successful test functions'
        When	'Perform Select on All'
        Then	'Run is set on all test codeunits and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
    }

    Scenario 5 'Disable Run on unfiltered successful test functions' {
        Given	'One enabled test codeunit with five enabled successful test functions'
        Given	'One enabled test codeunit with three enabled successful test functions'
        When	'Perform Deselect on All'
        Then	'Run is not set on all test codeunits and functions'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
    }
}

$Features +=
Feature 'Enabling Actions Select/Deselect on All Filtered' {
    Scenario 6 'Filtered disabled test functions' {
        Given	'One disabled test codeunit with five disabled test functions'
        Given	'One disabled test codeunit with three disabled test functions'
        When	'Set filter on second test codeunit'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
    }

    Scenario 7 'Filtered enabled test functions' {
        Given	'One enabled test codeunit with five enabled test functions'
        Given	'One enabled test codeunit with three enabled test functions'
        When	'Set filter on second test codeunit'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
    }

    Scenario 8 'Filtered enabled and disabled test functions' {
        Given	'One enabled test codeunit with five enabled test functions'
        Given	'One disabled test codeunit with three disabled test functions'
        When	'Set filter on second test codeunit'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
    }

    Scenario 9 'Enable Run on filtered successful test functions' {
        Given	'One disabled test codeunit with five disabled successful test functions'
        Given	'One disabled test codeunit with three disabled successful test functions'
        Given	'Filter on second test codeunit'
        When	'Perform Select on All'
        Then	'Run is set on second test codeunit and functions'
        Then	'Select on All is disabled'
        Then	'Deselect on All is enabled'
    }

    Scenario 10 'Disable Run on filtered successful test functions' {
        Given	'One enabled test codeunit with five enabled successful test functions'
        Given	'One enabled test codeunit with three enabled successful test functions'
        Given	'Filter on second test codeunit'
        When	'Perform Deselect on All'
        Then	'Run is not set on second test codeunit and functions'
        Then	'Select on All is enabled'
        Then	'Deselect on All is disabled'
    }
}

$Features | `
    ConvertTo-ALTestCodeunit `
        -CodeunitID 92051 `
        -CodeunitName 'Enabl. Actns Select On All FLX' `
        -InitializeFunction `
        -GivenFunctionName "Create {0}" `
        -ThenFunctionName "Verify {0}" `
        # | Out-File '.\Test Codeunits\Cod92051.EnablingActionsSelectDeselectOnAllScenarios.al'