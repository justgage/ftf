# First Thing First

A Simple command line todo list built around the following values:

__Values__: (in order of importance)

- **process:** provide enough structure to force you to plan the way you should
- **speed**: provide tooling to spend as little time planning as possible
- **ubiquity**: provide an easy way to access it from all places (terminal and phone, maybe even paper)
- **simplicity:** as few moving pieces as possible

# Concepts

## Let's talk To-Do list...

To-Do list, you have problems. While you are easy and simple you struggle for multiple reasions. Let's talk about them.

### 1. Prioritization
It's easy to tack on schemes like A is top priority, B is lower, C is lowest. These don't really cut it. Prioritization should be based around somthing more real. For this reason I'm choosing to fucus on two easy to understand things.

**1) Define if it's important / urgant**
if it's not important, then it shouldn't be done, or it should be done only once everything important is done.

Here's an Example:

```
$ ftf add "make ftf not a lie"
Is this Important (y/N)? y
Reason: Because I need an easy way to prioritise
Is it urgent (Y/n)? y
Due (TODAY, tommorow, mon, 22nd)? today
How long will it take (hours)? 3

_______Task added______
Task: make ftf not a lie
Due: tomorow
Hours: 0/3
```

Or to be faster:
``
$ ftf add "make ftf not a lie" 1 "Because I need an easy way to prioritise" today 3

_______Task added______
Task: make ftf not a lie
Due: tomorow
Hours: 0/3
```

The first number refurs to 7 Habits quadrants.

**2) Use Hours not 'A' or 'B'**
Hours are tangible, it's easier to estimate that any task should be 1 hour or 2 hours or even 10. This is later used to break up a task in into days based on your speed. This is similar like how story points resemble developer-days.

**3) Figure out when to start**

Due dates are great but they don't help you as your schedule fills up. What happens if your teacher (or boss) decides everything should all be due the same day? It sure would be nice to spread that out a little bit! Well using the affore mentioned hours and the amount of time that it usually takes you to got these "story-hours" done then you can determine when things should be done. 

first you must set up your hours
```
$ ftf help hours

The hours that you can or wish to complete in a day. These can be set different for
different days like so:

$ ftf set hours 5

setting all days to 5 hours of work

$ ftf set monday 2

setting monday to 5 hours of work

sun: 0 hours
mon: 2 hours
tue: 5 hours
wed: 5 hours
thu: 5 hours
fri: 5 hours
sat: 0 hours
```

These will set the `~/.ftf.toml` file.


Example:
```
$ ftf check

1. (0/12) Work on paper (for: 2 hours) (due: 3d)
2. (0/100) Project (for: 2 hours) (due: 3d)
```

### 2. Big tasks

Another major issue with todos is that it's all to easy to just dump some big project into a single task. This is really bad. `ftf` tries to solve this by asking to break up tasks if you try to estimate one that is too big

### 3. Burried Tasks

Many times To-Do lists grow so big it's hard to find all the tasks that you are neglecting. `ftf` tries to solve this by providing a very focused view of tasks and what days to work on them. As well as atomaticly spreading work over several days.

# Inspiration
I've drawn Inspiration from multiple places:
- 7 Habbits of Highly effective people

# WARNING: Below here, bellow here it's all a lie
This is being developed using a sort of "Readme driven development", meaning everything below this line is currently a lie, but won't be in the future.

# TOML configuration

Example config
```
[config]

name = "Gage"

[config.hours]
max-per-day = 10
min-per-day = 5

# max,min
sun = 5
mon = 2
tue = 5
wed = 5
thu = 5
fri = 5
sat = 0
```

#TOML Tasks:

Taks are saved like so:
```toml

[[Task]]
description = "Flesh out the README.md"
 = "2015-90-28"
due-date   = "2015-90-28"
start-date = "2015-90-28"
hours_till = 3
hours_done = 1

[[Task]]
# ...moar...

```

#TOML History


# Similar Products

- Tasker
- Org Mode
