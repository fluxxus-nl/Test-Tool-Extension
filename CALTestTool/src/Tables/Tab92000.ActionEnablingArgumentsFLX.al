table 92000 "Action Enabling Arguments FLX"
{
    // (c) fluxxus.nl - https://github.com/fluxxus-nl/Test-Tool-Extension

    fields
    {
        field(1; SelectAllEnabled; Boolean) { }
        field(2; DeselectAllEnabled; Boolean) { }
        field(3; SelectFailuresEnabled; Boolean) { }
        field(4; SelectNonFailuresEnabled; Boolean) { }
    }

    keys
    {
        key(PK; SelectAllEnabled)
        {
            Clustered = true;
        }
    }

}