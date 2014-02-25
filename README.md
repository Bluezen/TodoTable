PFQueryTableViewController paging problem example:
===================================================

This is an Xcode project that illustrates a `PFQueryTableViewController` problem I encounter.

The issue
----------

In my PFQueryTableViewController with paging enabled, I use a query with the following constraint:
orderByDescending:@"createdAt"

The issue occurs when loadNextPage is called while new items have been added to the db without having previously refreshed the table; the loaded objects are duplicates.


How to Reproduce
------------------

1. Clone the repository and open the Xcode project.
2. Add your Parse application id and client key in `ParseStarterProjectAppDelegate.m`
3. Run in simulator
4. Create 4 todo objects by touching 4 times the '+' button  
5. Refresh the table by pulling down it's header. Two objects should be showing (Object per page is set to 2) plus the "Load More..." cell.
6. Create 2 more objects by touching 2 times the '+' button
7. Clic on the "Load More..." cell
8. Duplicates of already displayed objects should show up, instead of the two next objects initaly created, as I would have expected.


Questions
----------

I would have expected loadNextPage to return the two following objects instead of duplicates, even if new there has been new entries in database between two fetches. Is that a bug?

How can I use loadNextPage with this kind of query, without having to previously refresh the table?


