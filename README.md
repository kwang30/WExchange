# WExchange

### What is it?
WExchange is a platform where users can hire content creators to complete work for them. With WExchange, users can find and request work from content creators in a secure environment, and content creators can be sure they will get proper compensation. 
This app will live [here.](https://wexchange166.herokuapp.com/)

### Who is it for?
WExchange is for everyone. Whether you are a content-creator looking for clients, a marketing agency looking for a free-lance graphic designer or a just someone searching for custom content, our service allows you to connect with other users and securely exchange completed works for financial compensation.

### Key Features
* Find the perfect content creator for your project with our discover page (Powered by Elasticsearch)
* Secure request flow ensures that content creators receive compensation while clients receive the work they paid for
* Clean and simple user interface using Materialize
* Realtime messaging and notifications with Pusher
* In app notifications with Pusher
* Background processing with redis server
* AWS Storage of multimedia 
* Recommednation system of similar users based on collaborative filtering 

### Creators
Abu Batjargal (@abubatjargal), Alec Rodgers (@AlecR), Kevin Wang (@kwang30) & Paul Cabrera (@paulcabrera93).

### Running The Application Locally
Becasue this application uses elasticsearch, redis, and delayed jobs, you will need to configure your machine before running the application. To run the application:
1. build elasticsearch as mentioned in Build Elasticsearch.
2. type redis-server in terminal.
3. open another terminal window and type: rake jobs:work.
4. Open a third terminal window and type: rails s
