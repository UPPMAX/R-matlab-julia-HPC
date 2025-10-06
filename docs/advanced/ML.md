# Machine Learning (ML)

!!! note "Questions"

    - What is it?
    - When/why to use it?
    - How to use it at HPC centres (R. MATLAB, Julia)

Most likely everyone has heard about machine learning, but what exactly is it, and when and why is it suitable for your research?

- Machine learning (ML) is a subtopic of artificial intelligence (AI).
- Generally, you make predictive or decision models from data, instead of programming them explicitly.
- ML and data mining have a large overlap and both often use the same methods. HOWEVER
  
    - ML focuses on prediction, based on known properties learned from the training data. It uses data mining methods ("unsupervised learning") or during pre-processing steps.
    - Data mining focuses on the discovery of (previously) unknown properties in the data. It uses many ML methods, but with different goals.

- Large Language Models (LLMs) are a special subset of ML, using learning patterns from data and built on neural networks, thus belonging more under Deep Learning (DL)

<figure markdown="span">
  ![AI-ML-DL comparison](../img/compare.png){ width="400" }
  <figcaption>Deep Learning (DL) is a subset of Machine Learning (ML), <br>which is a subset of Artificial Intelligence (AI).</figcaption>
</figure>

!!! note "ML approaches"

    (This text is partially taken from [the Wikipedia page on Machine Learning](https://en.wikipedia.org/wiki/Machine_learning#Approaches)) 

    - Supervised learning
    
        - A mathematical model of a set of training data that contains training examples (inputs and the desired outputs).
        
            - Classification (images, diagnostics, etc.). Target is categorical.
            - Regression (predictions, forecasts, etc.). Target is numerical.
            
    - Unsupervised learning
    
        - Find structures in data that has not been labelled, classified or categorised.
        - Identify commonalities in the data and react based on the presence or absence of such commonalities in each new piece of data.
        
            - Clustering (Recommendations, targeted marketing, etc.)
            - Dimensionality Reduction (discovering structures, big data visualization, compression, etc.)
            
    - Reinforcement Learning
    
        - Looks at how software agents should take actions in an environment in order to maximise some notion of cumulative reward.
        
            - real-time decisions
            - Game AIs
            - Robot navigation 
            - etc. 

!!! note "When to use ML"

    Generally: 

    - When tasks are too complex or dynamic for a traditional algorithm
    - When you cannot define a set of rules to solve a problem
    
        - image recognition
        - spam detection
        - etc.
        
    - When you have tasks involving large amounts of unstructured data (images, audio, etc.)
    - When you need to be able to easily adapt to new information over time 

## ML at Swedish HPC centres 

Python, R, and MATLAB have several installed packages that will help you do machine learning, but you can do ML with any language.

In this course, we will give you some information about how to find R packages for ML, as well as give an example on using MATLAB with ML, and some examples for Julia. We will only cover most of these briefly.

If you are interested in how to use Python for ML at the Swedish HPC centres, then there will be some material about that in the course "Introduction to Python and using Python in an HPC environment" which will be given later this year (27 Nov, 28 Nov, Dec 1, Dec 2).
 

