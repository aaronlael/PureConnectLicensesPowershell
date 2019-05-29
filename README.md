# PureConnectLicensesPowershell
Retrieve PureConnect user licensing details from powershell

This script is to be run from the primary server in your Genesys PureConnect environment to collect user licensing data from the registry.  Without modification it produces as CSV file in the directory you execute the script from.

I do not provide any warranty for this script.  You should review its contents and ensure you understand what it will be doing before executing it in your environment.  You also should be testing this in a development or non-production environment before running it in your production instance.

This script pulls a list of all of your users (active and inactive) in the system, then iterates through that list to pull back their username, workgroup memberships, licensing acquisition type (A for assignable, C for concurrent) and their licenses.  These licenses are how they are named in the system, which will vary from how they appear in the user's licensing tab in Interaction Administrator, but they are similar enough that you should be able to match them up.

I am providing this in my personal capacity as a PureConnect "enthusiast" and I also no longer use this method to retrieve licensing.  If this gets your the information you need now, but you see yourself needing this regularly in the future, you should take a look at the ICWS API on the Genesys Developer site as this allows you to have intentional access to the licensing details for your user and access to additional relevant data.

Regards,

Aaron Lael
