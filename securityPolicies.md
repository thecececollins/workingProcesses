# All Security Policies are Defined and in Place


---
### Priority of work

| Priority     | Task        | Ticket |Est Time of Completion| 
|--------------|:-----------:|--------:|-------|
|1| FileVault encryption for all Macs | | |
|2| Firewall enabled - implemented but not enforced (engineering may need to disable?) | | |
|3| Crowdstrike installed and functional | | |
|4| Password policy | | |
|5| Adding antivirus to all computers | | |
|6| Removing admin rights | | |
|7| Mobile Device Management | | |

### Security's Roadmap

| Priority     | Task        | Ticket |
| ------------- |:-------------:| -----:|
| 1  | Configure MDM solution | |
| 2a | Google Vault / records retention implementation | |
| 2b | Directory services (something like JumpCloud) | |
| 2c | SSO (SAML etc) integrations for key applications | LDAPintegration |
| 3  | Antivirus on workstations | |
| 4  | Admin permissions removal | |
| 5  | Data loss prevention (something like BetterCloud)| |
| 6  | Mobile device management | |



## Other Security enhancements we are looking to implement
- FileVault encryption for all external drives - *Storage/backup solution should replace external drives.*
- Destroy FileVault keys when computers sleep - 
- Disable USB mass storage - 


### Assigning Priorities

We are going to implement security polices in order of the roadmap that dave has set out. These will be high priority items in the MDM project. Security policies will as a general rule take precedent over enhancements. 

#### How do we handle new requests?
New requests will require a ticket. If the ticket is something we need to fix immediately we will mark it with the priority label. We need to specify this information in the ticket:

* What needs to be fixed?
* What is the fix?
* Who is the fix for?
* What is the timeframe for deployment?
* Will this negatively impact the workflow of teams at Simple?
* Do we need to monitor for this in the future?

*I have created a template for creating new security tickets.



