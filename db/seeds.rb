# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Job.create(title: 'Junior developer', descriptions: "
We are looking for a developer with experience in Ruby on Rails for project employment. The project will last 3-6 months. In the future, it is planned to refactor and transfer the backend to another technology. Long-term business relationships are possible in case of successful cooperation.")
Job.create(title: 'Junior/Middle developer', descriptions: "
We are looking for a developer with experience in Ruby on Rails for project employment. Long-term business relationships are possible in case of successful cooperation.
Qualifications
- 2-3 years of experience developing with Ruby on Rails
- Strong understanding of object-oriented programming principles (OOP)
- Familiarity with version control systems (e.g. Git
- Excellent communication and collaboration skills")
Job.create(title: 'Senior developer', descriptions: "
We are looking for a Senior Full Stack developer for the client's teams. We are open to an engineer with a solid professional background in PHP development and a high level of problem-solving.
Main requirements:
- 5+ years of work experience in PHP.
- Mastery of at least one major PHP framework (Phalcon, Laravel, Symfony, etc.)
- Strong experience with ReactJS ( be it vanilla React or with Next.js)
- In-depth understanding of MySQL and Redis
- Familiarity with Kafka (a huge plus)
- At least Upper - Intermediate level of English")
Job.create(title: 'Senior/Stuff tech lead', descriptions: "You have the opportunity to join us as a full-time `lead developer` and become a Co-founder or Founding member, depending on your level of commitment.
- Experience in leading software development teams
- Interest in participating in major product design decisions
- Scrum Muster experience is a bonus
- Mastery in crafting code from scratch, architecting complex systems, and tackling challenging technical problems.
- Passion for building, creating, and implementing groundbreaking solutions.
- 5+ years experience with `NodeJS`, `ReactJS`, and `Typescript` (Experience with `Electron` and `Next.js` is a bonus).
- You have a good level of verbal and written English")
Job.create(title: 'content developer', descriptions: "
Responsibilities:
- Designing and creating various types of educational materials
- Monitoring the latest technological developments to quickly create new and, most importantly, relevant materials
- Collecting and analyzing feedback on developed materials
- Proposing and managing innovative ideas to improve not only the content team's performance but also the entire project
- In addition to the mandatory duties, there is the opportunity to engage in additional areas to some extent—like analytics, delve into content for social networks, or work on animations for courses, etc.")
