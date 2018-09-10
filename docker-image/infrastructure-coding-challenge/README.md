# blogfoster's Infrastructure Coding Challange

## The challenge

blogfoster operates a couple of node.js API microservices. The goal of the coding challenge is to deploy a Docker image on AWS and have the API accessible via an ELB.

You can find the implementation of the node.js API in the subfolder [api](./api/).
- You can install the npm packages via `npm install`.
- Use `npm start` to start the API.
- Please check the README of the repository for more details.

Following steps should be part of the challenge:

1. Build a Docker image of the node.js API.
2. Push the image to a registry. It is your choice where to push it.
3. Deploy the new image on AWS.
  - Docker should run on an EC2 instance.

  - You can define the rules of the security groups.

  - The EC2 instance should run behind an ELB.

  - Preferably in an auto-scaling group.

All steps should be automated. Ideally, through a Infrastructure as code solution (i.e. Terraform/CloudFormation/Heat).

Please create a free AWS account for testing your implementation.

## Acceptance Criteria

- API endpoint `/` is accessible via ELB and returns `Coding challenge accomplished 🎉.`.
- The code you've written is accessible, for example in a GitHub repo.

## How we're evaluating the result

Prioritised from most important to least important, here are our evaluation criteria:

- Getting the job done: Does your implementation deploy and run a node.js API on AWS?
- Code Quality: Is the code clean, well-structured and easy to understand?
- Documentation: How good is the documentation?
- Going the extra mile: Did you mention or even implemented some additional points that make the result more robust, secure, etc?

You do not need to hit all points, but obviously, the more the better :)
