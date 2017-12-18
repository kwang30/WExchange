# WExchange

### What is it?
WExchange is a platform where users can hire content creators to complete work for them. With WExchange, users can find and request work from content creators in a secure environment, and content creators can be sure they will get proper compensation.

### Who is it for?
WExchange is for everyone. Whether you are a content-creator looking for clients, a marketing agency looking for a free-lance graphic designer or a just someone searching for custom content, our service allows you to connect with other users and securely exchange completed works for financial compensation.

### Key Features
* Find the perfect content creator for your project with our discover page (Powered by Elasticsearch)
* Secure request flow ensures that content creators receive compensation while clients receive the work they paid for
* Clean and simple user interface using Materialize
* Realtime messaging and notifications with Pusher

### Creators
Abu Batjargal (@abubatjargal), Alec Rodgers (@AlecR), Kevin Wang (@kwang30) & Paul Cabrera (@paulcabrera93).

### Running The Application Locally
Since this app uses an elasticsearch server for searching, you will need to first install elasticsearch on your machine. Then, you will need run redis-server in your terminal. In addition, since our app does background processing of certain jobs with dealyed jobs, you will need to run  rake jobs:work.
