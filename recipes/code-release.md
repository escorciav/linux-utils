# Workflow to release code

Suggested steps to release academic research code, biased towards computer vision.

By my own experience and as time permits, aim for reaching step 4.
Code is just a mean as people express [here](https://academia.stackexchange.com/questions/21276/best-practice-models-for-research-code).
We should aim for more in the area of computer vision and machine learning, but hey! let it become a norm before investing your time.

1. Reproduce your results.

    It's simple. Take your best model snapshot(s), identify all the data sources and run the experiment again.

   <details>
   <summary>Notes for outsiders/newcomers</summary>
   <p>

   _Isn't this done before submitting a paper?_

   (Culturally) It's OK to do as many last-minute hacks to improve results before a deadline.

   _What about afterwards?_

   There are little or no incentives to reproduce results. We prefer to start working on the next cool idea. I know it's againts the scientific method but that's boring and we want novelty.

   </p>
   </details>

2. Upload it to GitHub.

   Git is about tracking changes. Let's start by tracking the code cleaning as it's hard for many of us to track changes while developing our cool research.

   <details><summary>Notes for outsiders/newcomers</summary>
   <p>

   _Do people develop a bunch of code without git?_

   Sadly, yes. I have seen few people using git in a regular basis. It's "too much overhead", and there are no incentives to do it.

   The most common practice is to make single commit when the code is released.
   
   For some reason, we are comfortable keeping for ourselves all the steps of the journey and only depicts the beautiful outcome (the publication).
   Perhaps as academic researchers, we are afraid to track and share our [principles](https://www.youtube.com/watch?v=Y1OpbDWp8KY).

   _corollary_

   You don't have to learn git.

   </p>
   </details>

3. Write a README.

   Follow this [guidelines](https://www.udacity.com/course/writing-readmes--ud777) from Udacity. You can easily go over it in 1-2 hours without doing the exercise.

   In a nutshell:

   - Introduction, describe what you are releasing in layman terms.

   - Installation or setup.

   - Usage section i.e. how to run a particular experiment.

4. Publish data and models.

   Most of the people want to compare against your work under the same common ground. Make it easy for them.

   <details>
   <summary>Notes for outsiders/newcomers</summary>
   <p>

   _Isn't this a mandatory?_

   Sadly no. I have read papers claiming to be the state-of-the-art without publishing results, models or code. We are improving, but we are far from reaching a 100% work fully reproducible in top-tier conferences&journals.

   </p>
   </details>

5. Document your code.

   Follow this guidelines [wanted-pull-request-welcome]().

   - *Explain your classes or abstractions.* Let's make it easy and explain the purpose and scope of functions, abstractions and modules.

   - *The whole is more that the sum of its parts.* Explain how all the functions, classes and modules interact with each other.

5. Start to make it pythonic (optional).

   Revelant guidelide can be found [here](https://docs.python-guide.org/writing/style/#code-style).

   We should aim for pythonic research. However, it's an enormous effort.

   _Then, it's fine to keep all my spaghetti code?_

   Not really. Aim for a nice middle point such that your future you won't have a hard time to ramp up.

   <details>
   <summary>Notes for everyone</summary>
   <p>

   _Why not to go the whole way?_

   A great refactoring (using design patterns and beautiful code), it's too much overhead.
   At the end of the day, the only granted user is ourselves. The rest of the research community want to build their own thing.

   That said, there may be an eureka moment in our career where our idea have huge potential. In that case, beautiful code will increase our impact.

   </p>
   </details>

## How to incentivize great code?

- Perhaps using Github's ⭐ and other emojis to promote this practice. We can also trade emojies to encourage this. Open an issue, and request a refactoring in exchange of emojis.

- Citing both those who develop the ideas, and those who make it accessible through their own research.