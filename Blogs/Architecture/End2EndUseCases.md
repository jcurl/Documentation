# Architecture: Why End-to-End Use Cases Matter

(C) Jason Curl, 2021-2022.

As someone who manages teams in a technical capacity, it is important for me to
understand how solutions are provided to the customer. For that, I've found
understanding the use case and as much information as possible about the entire
chain helps to provide:

* A high quality solution that is likely to work when completed
* Faster identification of next steps when a problem should occur
* A methodical way to software construction

For me, understanding the relationship in the software architecture of where my
team, or myself participate helps me to own the component that I am responsible
for.

## Importance of Architecture

Current solutions for complex systems often involve three or more teams,
sometimes more. Large projects have restrictions that individuals aren't given
the opportunity to fully understand a use case, either through code
compartmentalization (availability of sources might be a problem). This blog
talks about my personal experiences in what's required to provide solutions that
will work.

I use the term "partner" here to indicate those who my team work with. They
might be an architect in the customers organization. I use the term "customer"
here as the ultimate person which the solution is being delivered to, which is
generally outside of the department of the partner (it might be production, or
in Automotive, the person buying the car, depending on the limitations our
partner places on us).

1. Understand who you're really delivering to. This is not the same as
   responsibilities. Our goal is customer satisfaction and pleasing the
   customer. If they're pleased, they'll want more from us.

   Understand the roles and limitations of all those in the team. In this case,
   the role is architecture, and each has a perspective which they can solve.
   Understand the limitations of everyone's knowledge. Knowing what you don't
   know is the first step in identifying where difficulties in technical
   solutions can arise, and so can help predict and remove the failures before
   they occur.

2. Work to understand the use cases, not just from your component, but the use
   cases your partner is trying to solve.

   Our partner has a strong knowledge of their domain, but usually little
   knowledge of our domain. It's invariant that they will make assumptions about
   our domain, which may, or may not be true. By going through the use cases
   with our partners, and then the sequences that satisfy the use cases, we can
   identify any assumptions and missing requirements on our component.

3. Document the use cases, then the sequences, inputs and outputs for the
   sequences and the use cases. Each architect should concentrate on their own
   component.

   Documentation is often overlooked, but critical for after the creative
   architecture phase. It supports:

   * Validating and verifying use cases as sequences change.
   * Supporting engineering who actually needs to implement the code.
   * Supporting test phases (e.g. ASPICE 3.1, SWE.4 and SWE.5) to show a
      particular component works as expected
   * Future changes if use cases change

## Understanding Who We Deliver To

This might sound obvious, but the answer received depends on who you ask. Ask a
manager, and they might say their customer is their manager. Ask a software
engineer, and they say to their architect. Ask someone in sales, they'll say the
customer. Ask a System Architect, they might say a System Architect for another
component in the System.

The important part about this is to understand the problems that the person
you're delivering to need to solve, and then ask again what problems they need
solved. It's not about just trying to fulfil a requirement and to say we're
down.

The better that a problem can be understood, the more of the bigger picture that
we have, the more likely it is that a decision will be made that is correct when
given multiple options.

## Construction and Validation

When software designers construct their software, having references to larger
part of software architecture and design helps construct test scenarios that are
relevant for the problems that are being solved.

Even though it's possible to reach 100% unit test case coverage for a component
during construction, and even branch coverage, these tests are dependent on the
understanding that the developer of the component and unit test developer have.
Having that larger picture allows to focus on test scenarios that are most
relevant at the start.
