# seblog

The backend for my website

## User Stories

**Blog API**
As an admin I can :

- Log in to an admin dashboard `[MVP][UI]` ✓
- Perform CRUD operations on articles `[MVP]` ✓
- Draft/publish articles `[MVP]` ✓
- Categorize articles
- See article stats: views, comments, reading time
- Search for articles `[MVP]` ✓
- Filter articles by category
- Approve/reject article comments
- Link articles to learning projects `[MVP]` ✓
- Tick a checkbox to share to [linkedin](https://docs.microsoft.com/en-us/linkedin/consumer/integrations/self-serve/share-on-linkedin)

As an anonymous user I can:

- See a list of articles `[MVP][UI]`
- View a single article `[MVP][UI]`
- Like articles
- Write comments/respond to comments
- Search for articles
- Filter articles by category
- Sort articles by date

**Learning API**
As an admin I can:

- Perform CRUD operations on learning logs `[MVP]` ✓
- Draft/publish logs `[MVP]` ✓
- Post updates for a learning log `[MVP]` ✓
- Search for learning logs `[MVP]` ✓
- Flag updates as blockers or milestones
- Get suggestions to link articles based on title keywords
- Tick a checkbox to share to [linkedin](https://docs.microsoft.com/en-us/linkedin/consumer/integrations/self-serve/share-on-linkedin)

As a user I can:

- See a list of learning logs `[MVP][UI]`
- View a single learning log `[MVP][UI]`
- See articles associated to learning logs `[MVP][UI]`
- Kudos learning logs

**Projects**
As an admin user I can:

- Perform CRUD operations on projects `[MVP]` ✓
- Draft/Publish projects `[MVP]` ✓
- Link learning logs to projects `[MVP]` ✓
- Add project updates `[MVP]` ✓
- Search for Projects `[MVP]` ✓
- Tick a checkbox to share to [linkedin](https://docs.microsoft.com/en-us/linkedin/consumer/integrations/self-serve/share-on-linkedin)

As a user I can:

- See a list of projects `[MVP][UI]`
- View a single project `[MVP][UI]`
- See learning logs associated to projects `[MVP][UI]`
- See project updates `[MVP][UI]`

**General Features**

- Pagination
- Serialization `[MVP]` ✓

### Might use these

- <https://www.npmjs.com/package/react-aws-s3>
- [Searchkick](https://github.com/ankane/searchkick) - [Demo](https://www.youtube.com/watch?v=BDSa_tCfjNg&ab_channel=amplemarket)

### May do

- Turn it into an API any developer can use for building their portfolio with blogging, project management(ish) and learning log capabilities...
  They get to only worry about the frontend, which could be easily be hosted on free sites. (Works great for pure frontend devs as well).
