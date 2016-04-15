# Project Title: Racket Blogging Platform for GUI II Project - [Prism](http://www.prsmphoto.com/)
**remember to add http://localhost:8000/servlets/test.rkt to release and remove this line later**

### Statement
We want to create a blogging platform for our GUI II Project, Prism. We've been developing this website over the semester and we have a few actual users. Unfortunately, we currently have no way to communicate the new features we've added to the website to our users, which is an issue as we've been adding heaps of functionality to our website which would greatly enhance the user's experience.

Blog posts that we add with our GUI client to the mongoDb will then be displayed on an html page created with Racket web server.

### Analysis

Recursion will definitely be a main component of our project. We hope to create a main procedure which will recursively call itself which will be in charge of creating the blog posts. Blog posts will be stored as a data structure local in our project after creation in the GUI client, this data will then be added into the database as a new "document".


### Data set or other source materials

We will be creating our data through our two clients - the GUI platform, which Alex is building, and the web client, which is what James is building. These two clients will communicate to our mongoDB - the gui client will write to the database, and the web client will read from it.

### Deliverable and Demonstration
Explain exactly what you'll have at the end. What will it be able to do at the live demo?

What exactly will you produce at the end of the project? A piece of software, yes, but what will it do? Here are some questions to think about (and answer depending on your application).

Will it run on some data, like batch mode? Will you present some analytical results of the processing? How can it be re-run on different source data?

Will it be interactive? Can you show it working? This project involves a live demo, so interactivity is good.

You'll be able to create a blog post using the GUI client. The web client will read from the mongoDB and display the blog post onto the webpage.

### Evaluation of Results

We will know if we're successful if the three pieces we're attemtping to create can successfully communicate with our database.

## Architecture Diagram
Upload the architecture diagram you made for your slide presentation to your repository, and include it in-line here.

Create several paragraphs of narrative to explain the pieces and how they interoperate.

![Architecture Diagram](https://raw.githubusercontent.com/oplS16projects/Erardi-Cushing-Bainbridge-PrismBlogging/master/Screenshot%20from%202016-04-05%2020-21-30.png)

## Schedule
Explain how you will go from proposal to finished product.

There are three deliverable milestones to explicitly define, below.

The nature of deliverables depend on your project, but may include things like processed data ready for import, core algorithms implemented, interface design prototyped, etc.

You will be expected to turn in code, documentation, and data (as appropriate) at each of these stages.

Write concrete steps for your schedule to move from concept to working system.

### First Milestone (Fri Apr 15)
Recieving data from the GUI client on the backend.
Connect to MongoLab database.
Begin web-site development.

### Second Milestone (Fri Apr 22)
Write data from GUI client to the MongoDB
Begin front-end website development to display blog posts.
Placeholders locations for "title" and "body" of the blog post.

### Final Presentation (last week of semester)
Handle an HTTP "get" request from the web server
Parse and display collection of blog post documents to the web page.

## Group Responsibilities
Here each group member gets a section where they, as an individual, detail what they are responsible for in this project. Each group member writes their own Responsibility section. Include the milestones and final deliverable.

**Additional instructions for teams of three:**

In the headings below, replace the silly names and GitHub handles with your actual ones.

### James Erardi @jwerardi (leader)
is the team leader. Additionally, James will work on the web client.

### Alex Cushing @alexcushing
will work on the GUI client.

### Tyler Bainbridge @tylerjbainbridge
MongoDB
Connect to existing Prism mongoDB on MongoDB (fallback plan is a local MongoDb).
Write blog posts from the GUI client to the database.
Recieve a HTTP request fromm the web client and server the collection of blog documents.
