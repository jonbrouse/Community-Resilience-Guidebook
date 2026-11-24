# The Community Resilience Guidebook

*A field manual for keeping change-making groups on mission under adversarial pressure.*

**Version {{VERSION}} | Open Source | Adapt Freely**


## About This Guidebook

This guidebook is an open-source reference for anyone trying to make change through a group of people: political organizations, candidate-recruitment efforts, advocacy groups, civic forums, volunteer coalitions, or any space where people gather to change something that people with power would rather leave alone.

It began as an after-action review. Its author watched a self-organizing community dedicated to getting ordinary citizens to run for office come apart. The people in it looked like they meant well. They were manipulated, distracted, and buried in side quests until the work stopped and the committed core walked away. This document is what that collapse taught, checked against the documented history of how movements get disrupted.

It exists because most groups are built by people who care about a mission, not by people trained in operational security. When disruption arrives (whether from genuine bad actors, well-meaning chaos agents, or simply group dynamics gone sideways), those groups often have no framework for what to do.

And the cost of that gap is real. A lot of people want to get organized. The problem isn't that they aren't trying. It's that they don't know how, and when they try, they get decimated by bad actors and quit. Communities collapse. Founders burn out. People who would have spent years building something valuable walk away from organizing entirely because they got hurt the first time. The knowledge to defend a group exists, but it lives scattered across worlds that newcomers don't know to look in: activist security zines, trust & safety curricula, security engineering, organizing research, platform docs. By the time they figure out something is wrong, they've already lost the people who would have made the group thrive.

This guidebook is an attempt to put that knowledge somewhere the next person can actually find it.

### The Posture: Assume Adversaries

A group that wants to change the status quo will be opposed. That's what changing the status quo means. Some opposition will be organized and patient. Some will be opportunistic. Some will come from inside, from honest members who drift. And some of the most damaging pressure needs no adversary at all: the slow suffocation of the mission by side quests and exhaustion.

So this guidebook takes a blue-team stance borrowed from security engineering:

- **Zero trust.** Nobody gets access because of who they are, how long they've been around, or what role they hold. Access is earned in stages, verified continuously, and revocable. That applies to moderators, admins, and founders too.
- **Assume breach.** Design as if some account, some moderator, or some trusted member is already compromised. Ask what they could destroy, then make that smaller.
- **Incident handling.** When something goes wrong, run a process, not a feeling: prepare, identify, contain, eradicate, recover, learn.

Trust is earned over time, and even then it is never total. Prove-me-wrong-over-time is the default.

### What Zero Trust Does Not Mean

It doesn't mean treating members with hostility. **Trust is a property of access, not of how you treat people.** A well-run group denies access by default and extends courtesy by default. Those are separate controls, and they don't conflict.

Hostility is a vulnerability. It repels the recruits you need, it reveals what you're watching for, and it hands opponents a "they're paranoid and cultish" story for free. A group whose front door scares off ordinary citizens has been defeated without anyone needing to infiltrate it.

### Sources and Limits

Everything here is drawn from documented patterns (declassified counterintelligence records, published research on movement disruption, community management and trust & safety literature, security engineering practice) and from the collapse described above. Where a claim is the author's observation rather than documented research, it says so. Use what fits. Adapt what doesn't. Share it freely. See [Appendix B](#appendix-b-prior-art-and-further-reading) for the sources this builds on and where to read deeper.

### What's Inside

- **Part I: Threat Model and Posture.** Who is coming, what they want, what you're protecting, and the zero-trust principles the rest of the guidebook applies.
- **Part II: Focus Discipline.** Defending the asset every attack spends: the core team's attention. Current objectives, intake gates, decision records, and real versus manufactured urgency.
- **Part III: Access Architecture.** Tiered access with expiry, verification without building a honeypot, platform hardening, asset ownership, blast radius, and logging.
- **Part IV: The Moderation Charter.** Act fast on content, deliberately on people. Two response tracks, evidence standards, rules of engagement, and an appeals path that a captured mod team can't use to protect itself.
- **Part V: Detection.** The named disruption patterns, each with what to observe and what else it might be. Includes attention attacks, weaponized controls, and the insider threat.
- **Part VI: Incident Handling.** A six-phase incident cycle, severity levels, a preparation checklist, and eight worst-case playbooks.
- **Part VII: Quick Reference.** The parts moderators keep open while doing the work: detections with known false positives, a response card, a mod log template, an incident card, and message templates.
- **Appendices** cover adapting the guidebook (including tabletop exercises) and prior art.

### How to Use This Document

- Read it once cover-to-cover to understand the landscape.
- Fill in the threat model and decision rights for your group (Appendix A) before you need them.
- Pull the sections relevant to your group and adapt them to your platform.
- Use Part VII as the working reference for moderators.
- Run one playbook as a tabletop exercise every quarter.
- Revisit it after every incident. Patterns become clearer in hindsight, and so do false patterns, so check both.

### A Note on Tone

This guidebook is direct because the work is serious. Moderating an active group is hard, often thankless, and occasionally adversarial.

The framing is **decisive about content and deliberate about people.** Remove harmful content fast. Restrict access quietly when something looks wrong. Remove people on evidence. Groups die slowly from accumulated tolerated behavior. They also die from purges. A blue team that can't tell an attacker from a user with an odd login pattern isn't secure. It's just noisy, and noise is something an adversary can aim.

Most strange behavior isn't malicious. The frameworks here act on behavior rather than intent, so they work for sabotage and honest mistakes alike, and they're built so that being wrong about a person costs as little as possible.

---

## Part I: Threat Model and Posture

> *"You don't need attribution to contain."*

### 1. Assume Adversaries

Start with who shows up. The actors below aren't mutually exclusive, and you'll rarely know which one you're dealing with. You don't need to (Section 5). You do need to know what each one wants, because that tells you what to protect.

| Actor | What they want | How it usually looks | Worst case |
|---|---|---|---|
| **Opposition researcher** | Material on members who will become candidates | A quiet, long-tenured lurker; interest in members' backgrounds and plans; screenshots | A prospective candidate's old venting post surfaces the week before filing, and they withdraw |
| **Organized disruptor** | To stall, split, or discredit the group | Wedge issues, jacketing, process inflation, side quests | The group splits over a manufactured controversy, and the half that knew how to get things done quits |
| **Provocateur** | To get the group to do something embarrassing or illegal | Pushes escalation; calls caution cowardice | The group publicly accuses an opponent based on a rumor, inviting defamation claims and a news cycle that sticks to every candidate |
| **Resource capturer / grifter** | Money, the member list, the platform, status | Volunteers for treasurer, admin, list-keeper; the favor ladder | One person holds the bank login and the server owner account, then goes dark |
| **Would-be leader** | Control of the group, often sincerely believing they'd do better | Charisma, availability, "purity," clique accusations | Founders displaced; the mission redirected toward the newcomer's priorities |
| **Troll / raider** | Attention, chaos, entertainment | Raids, slurs, memes, brigading | Hundreds of accounts flood the space with a candidate's home address |
| **Account-takeover attacker** | Any privileged account | Phishing DMs, fake "verification" links, malicious downloads | A compromised admin bans everyone, deletes channels, and DMs phishing links to the whole membership from a trusted name |
| **Insider drift** | Nothing. It's your own honest moderators going sideways | Suspicion hardening into certainty; bans accelerating | The mod team purges the members who questioned it, and the group shrinks into a hostile clique |
| **Entropy** | Nothing. No adversary required | Too many initiatives, no owners, no deadlines | Ten weeks before filing, fourteen active projects and zero completed petitions |

The last two rows matter most. Many groups that fail aren't defeated. They dissolve. Adversaries speed up the collapse by exploiting conditions the group creates for itself: unclear priorities, concentrated access, informal power, and an exhausted core.

### 2. Crown Jewels: What You're Protecting

Security teams start with an asset inventory, because you can't defend what you haven't named. For a change-making group, the crown jewels are:

- **The core team's attention and energy.** The most-attacked asset and the hardest to replace. Every disruption pattern in this guidebook ultimately spends it. Part II is devoted to defending it.
- **People's identities and safety,** especially prospective candidates: real names, addresses, employers, families, history.
- **The member and contact list.** It's the group's capacity to act. Whoever holds it holds the movement.
- **Money and financial accounts:** bank, payment processor, fundraising platform.
- **Platform ownership:** the server or workspace owner account, the domain and registrar, email sending, social accounts.
- **Strategy and decision records:** what you're doing, who you're recruiting, and when.
- **Reputation:** the group's name and, by extension, every candidate associated with it.

For each one, ask the zero-trust questions: Who can access it today? Who actually needs to? What happens if that person is compromised, coerced, burned out, or simply gone? Section 16 turns those answers into controls.

### 3. Zero-Trust Principles for Groups

These nine principles are the spine of the guidebook. Every later section applies one or more of them.

1. **Trust attaches to access, not to people.** Deny access by default. Extend courtesy by default.
2. **No implicit trust from position.** Tenure, title, and friendship grant nothing on their own. Moderators, admins, and founders are inside the threat model, not outside it.
3. **Verify explicitly.** Every consequential action rests on evidence someone else can check.
4. **Least privilege, time-bound.** Grant the minimum access a job needs, for a defined period, then re-verify.
5. **Assume breach; limit blast radius.** Design so that no single account, person, or moderator can destroy the group.
6. **Contain before you eradicate.** When something looks wrong, restrict access quietly and reversibly. Remove people on evidence.
7. **Don't leak detection logic.** Public treatment is uniform. What you're watching for stays in the mod channel.
8. **Your controls are attack surface.** Adversaries will try to trigger your defenses against your own people. Threat-model every rule.
9. **Tune your detections.** A rule that mostly flags honest people isn't vigilance. It's noise, and an adversary can aim it.

### 4. The Mission Test and the Current Objective

Every change-making group needs a single sentence its members and moderators can return to when things get hard. Without that anchor, every decision becomes a debate, every removal becomes a controversy, and every disagreement becomes existential.

> **We exist to [your mission]. Everything else is noise.**

This is not a free-speech playground. It's a curated space with a specific purpose.

But a mission sentence tells you what you're for, not what to do this month, and that gap is where side quests live. "Get ordinary citizens to run for office" can justify a website rebuild, a podcast, a policy platform, a custom candidate-matching app, and a fifty-state expansion plan. So pair the mission with a **current objective** (Section 8): concrete, countable, dated.

The test, before taking any moderation action or letting one slide:

> **"Does this move us toward our current objective, or does it spend attention without moving it?"**

- **If it's a clear rule violation:** act on the content immediately.
- **If it spends attention but breaks no rule:** redirect it, park it, or route it through the intake gate (Section 9). Don't punish people for having ideas.
- **If you're unsure:** protect the group with the reversible action (Section 19).

The mission test isn't gameproof. Someone reframing disruption as "concern for the mission" is itself a pattern (Section 24, concern trolling). So is a moderator reframing legitimate dissent as "distraction" (Section 29). The test is only as good as the log and the review behind it.

### 5. Act on Observables, Not Attribution

You'll never reliably know whether a disruptive person is a paid operative, an unaffiliated troll, an awkward but well-meaning member, or simply having a bad week. **You don't need to know.** Incident responders learn this early: you don't need attribution to contain. You respond to what an account did and what it can reach, not to who you think is behind it.

This framing has three advantages:

- **It removes paralysis.** Moderators don't have to prove malice to act.
- **It's fair.** The same behavior gets the same response, whether from a friend or a stranger.
- **It's hard to weaponize.** Accusations of motive ("she's a plant") can't be verified, and unverifiable accusations are the raw material of bad-jacketing (Section 25). Observables ("posted the candidate's street address at 21:14, link here") can be checked by anyone with access.

Patterns matter more than individual posts. A single bad message from a long-time member is different from the same message from someone whose entire history is bad messages. Track patterns; act on patterns; write down what you observed.

### 6. Default Deny, Default Courtesy

A common worry about guidebooks like this one is that teaching moderators to recognize disruption patterns will make them suspicious of everyone, hostile to newcomers, and prone to seeing coordinated hostility in ordinary friction.

That worry is correct when vigilance is aimed at people. It goes away when vigilance is aimed at access.

**Honest people trip the patterns.** Privacy-conscious people ask a lot and share little. Your most enthusiastic recruits volunteer for everything. Shift workers and parents post at odd hours. People who get persuaded change position at decision points. People with ADHD are often first and loudest. People with a strong fairness instinct say "hear them out." And sometimes leadership really is a clique. Every detection in Section 36 lists its known false positives, and that column isn't optional.

**Do the math.** Suppose 1 member in 100 is a bad actor. You have a red flag that 95% of bad actors trip and only 10% of honest members trip, which is a good detection by most standards. In a group of 100, it flags about 10 honest people for every bad actor. When the flag fires, the person in front of you is a bad actor about 9% of the time. In small groups, base rates beat pattern-matching every time.

**So detection triggers containment, not accusation.** A flag means watch, or quietly limit access to what matters. It never means name them, confront them, or remove them. Containment costs an honest member almost nothing; they may not notice they're staying at Tier 1 a little longer. Accusation costs them their standing, and costs you a member plus the trust of everyone watching.

**Count both errors.** Every control has two failure modes: letting an adversary in (a false negative) and pushing an honest member out (a false positive). For a group whose mission is recruiting ordinary people, a false positive is a lost volunteer or a lost candidate. An opponent who wants you to fail is happy with either outcome. A group that counts only false negatives will eventually purge itself.

**Courtesy is operational security.** Uniform, polite treatment reveals nothing about what you've noticed. Visible suspicion teaches adversaries which behaviors to avoid and teaches honest members that the group is paranoid.

The discipline is consistency. Deny access the same way for everyone. Extend courtesy the same way for everyone. Move people up the tiers on evidence of contribution, and down on evidence of harm.

If you find yourself worrying that the mod team has drifted into reflexive hostility, that worry is useful information. See Section 29, and apply the discipline to yourselves.

---

## Part II: Focus Discipline

> *"Attention is the asset every attack spends."*

### 7. Attention Is the Most-Attacked Asset

The committed core of any volunteer group is small, and its hours are finite. Every pattern in Part V (sealioning, schism cultivation, manufactured urgency, process inflation, side quests) costs those hours. Most groups think of disruption as bad content. It's better understood as a **denial-of-service attack on the core team's attention.**

The uncomfortable part is that groups run this attack on themselves. Enthusiastic volunteers with no clear next task generate side quests. That's not sabotage. It's what energy does without direction. But it creates exactly the condition adversaries exploit: a group so busy that nobody notices who's steering.

**Example.** A candidate-recruitment group starts with a clear purpose and forty energetic members. Within six months it has a website redesign, a podcast, a policy-platform working group, a custom candidate-matching app, a regional expansion committee, and a standing debate thread about ideology. Each started as a reasonable idea from a well-meaning member. None had a deadline. The filing deadline passes with two candidates, both recruited personally by the founder. The founder, exhausted, steps back. The person who ran the most active side project inherits the group and points it somewhere else.

Nobody in that story had to be an adversary. If one was, nobody would have noticed.

### 8. The Current Objective

One objective at a time: concrete, countable, dated, and tied to an external calendar.

- *"Recruit, train, and file 8 candidates for the [year] municipal cycle by [filing deadline]."*
- *"Collect the required valid petition signatures for each of 3 candidates by [date]."*
- *"Get 25 members through candidate-readiness training before [date]."*

Then:

- **Publish it and pin it.** Every member should be able to state it.
- **Review progress at every regular check-in.** One number, out loud.
- **Measure outputs, not activity.** Candidates recruited, trained, filed. Signatures collected. Newcomers who completed a first task. Message counts, channel activity, and meeting attendance are activity metrics, and they reward talking. The monitoring tools in Section 17 measure activity; don't mistake them for progress.
- **When the objective is met or missed, set the next one deliberately,** at a scheduled meeting, through the decision process (Section 10).

### 9. Initiative Intake and WIP Limits

Every new project, working group, channel, or tool passes the same gate. It needs:

1. **An owner.** A named person who is personally doing it. "Someone should" is not an owner.
2. **A definition of done.** What finished looks like.
3. **An objective link.** Which part of the current objective it serves.
4. **A displacement.** What stops or slows so this can happen.
5. **A review date.** When the group checks whether it's working.

Ideas that fail the gate go to a public **parking lot**, not the trash. Parking says "not now" without saying "not you." Review the parking lot whenever the objective changes.

**Set a WIP limit.** Cap the number of active initiatives beyond the objective itself. Three is a reasonable start for a small group. A new initiative starts only when an existing one finishes or is killed.

**Set kill criteria.** An initiative that loses its owner, or misses its review date twice, is parked automatically. No debate, no blame.

The gate is also a security control. An adversary can generate proposals faster than a volunteer group can evaluate them (proposal flooding, Section 27). The gate moves the cost back onto the proposer: if you want it, you own it.

### 10. Decisions: Records, Cadence, Rights, and Reopening

#### Written records of decisions
Every significant decision gets written down: what was decided, by whom, when, and why. Without written records, disruptors can gaslight the group about "what was actually agreed."

#### Decision-making cadence
Have predictable, scheduled times when decisions get made. Disruptors thrive on emergencies and off-hours pressure. "We'll decide it at the next weekly check-in" defuses most manufactured urgency. Real deadlines get planned backward from, well in advance (Section 11).

#### Decision rights
Write down who decides what, and how many people must sign off. Vague structures get exploited; clear ones get respected. A starting matrix:

| Decision | Who decides | Minimum sign-off | Where recorded |
|---|---|---|---|
| Mission or charter change | Founders and mod team | Amendment process (below) | Decision log |
| Current objective | Core team | Majority at a scheduled check-in | Decision log, pinned |
| Spending over $[X] | Treasurer | Two people | Finance log |
| Role grants at Tier 3 or above | Moderators | Two mods, at least one not the voucher | Mod log |
| Removal of an established member | Moderators | Two mods (rule-track exceptions in Section 18) | Mod log |
| Public statement or action in the group's name | Designated spokesperson | Two people | Decision log |

No solo decisions on sensitive matters. That's not because individuals can't be trusted. It's because two people are much harder to manipulate, coerce, or compromise than one.

#### Reopening and amendment
A recorded decision stands for [a set period, such as three months] unless it's reopened with **new information** or by a **proposal with [N] sponsors at Tier 2 or above,** heard at a scheduled meeting. Charter and mission changes follow the same path with a higher sponsor threshold and a longer notice period.

This replaces vague "founder protection." It defends against one of the oldest sabotage techniques there is (reopening settled questions, Section 27) while giving honest dissent a real path to change things. A group with no legitimate way to change its mind will eventually split instead.

"Why did we decide X?" gets one good-faith answer and a link to the record. "Why is X still the rule?" gets a pointer to the reopening process.

### 11. Real vs. Manufactured Urgency (and Manufactured Caution)

Electoral work has real deadlines: candidate filing, petition submission, ballot certification, voter registration. They don't move. "Healthy organizations can always slow down" is wrong for this work.

**The urgency test:** Is the deadline external and verifiable? Can you link to it? If yes, it's real; plan backward from it. If it's "we're losing momentum," "the window is closing," or "we need to decide NOW" with no link, it's manufactured until shown otherwise.

**Manufactured caution** is the mirror image: endless "let's be careful," "let's form a committee," "let's get more input" on decisions that have a real deadline. The OSS *Simple Sabotage Field Manual* (1944) instructed saboteurs inside organizations to do exactly this: refer everything to committees, urge caution, demand more discussion. Manufactured urgency and manufactured caution both run out the clock. One does it by skipping deliberation, the other by never finishing it.

**The defense is a calendar.** At the start of each cycle, put every external deadline on a shared calendar with internal milestones planned backward from it. A decision that blocks a milestone gets decided at the next check-in, not deferred again.

### 12. The Ladder of Engagement

Every newcomer gets a concrete first task within their first week: small, real, finishable, and connected to the objective. Make five calls from a list. Proofread a candidate one-pager. Look up one district's filing requirements and post the link. Each completed task opens the next rung, and the access tiers in Part III follow it: responsibility earns access.

This is a recruitment practice and a security control at the same time:

- **Tasks generate observable behavior.** Someone who refuses small tasks while pushing for big roles (Section 36, #08) stands out immediately when every newcomer gets a small task.
- **People with real work don't invent side quests.** A clear next action is the cheapest attention defense there is.
- **It keeps the people you need.** Research on civic associations (Hahrie Han, Appendix B) finds that organizations that develop people give them meaningful work with support, rather than just asking them to show up.

---

## Part III: Access Architecture

> *"Assume breach. Then make it small."*

### 13. Tiered Access with Expiry

The single most important structural defense is making access earned in stages rather than granted on arrival, and making elevated access expire. Standing access is how long-game personas and drifted insiders keep power long after anyone remembers why they have it.

| Tier | How you get there | What you can do | What you can't | Expiry |
|---|---|---|---|---|
| **0: Arrived** | Join | Read public channels; post in the welcome channel | Post elsewhere, send links or files, DM members through the platform | Promotes on verification; unverified accounts pruned after [30] days |
| **1: Verified** | Complete verification; accept the guidelines | Post in general channels; pick up a first task | Links, uploads, working groups, sensitive spaces | None |
| **2: Established** | [30+] days, at least one completed task, no open suspicion-track flags | Links, proposals, working groups | Candidate-prep spaces, member data | Drops to Tier 1 after [90] days inactive |
| **3: Trusted** | Two logged vouches, at least one from a moderator | Candidate-prep spaces, working-group leads, support roles | Moderation tools, finances, member data | Re-vouched every [6] months |
| **4: Operational** | Appointed through the decision process with two sign-offs | Moderation, finances, or member data, **scoped to the role** | Anything outside the role | Re-confirmed at the quarterly access review; 2FA mandatory |

Rules that make the tiers mean something:

- **Tiers must differ in actual capability.** If they're just labels, they don't help.
- **Re-verification is routine, never an accusation.** It's quick for honest members. Make it boring and universal so that nobody reads anything into it.
- **Separate duties within Tier 4.** The person who moderates isn't the person who holds the money, who isn't the person who owns the platform account. No one person holds more than one crown jewel (Section 2).
- **Log vouches.** Record who vouched for whom. If a member is later removed for cause, review everyone their vouchers also vouched for. Sockpuppet rings and captured mods both show up as vouch chains.
- **Newcomers can post somewhere.** A welcome channel where Tier 0 can introduce themselves costs nothing in security and matters a lot for recruitment. Read-only silence tells ordinary citizens they aren't wanted.

**Worst case without expiry.** A member reaches Tier 3 in year one, goes quiet, and reactivates eighteen months later inside the candidate-prep channel during the week candidates are finalizing their filings. Nobody remembers who vouched for them. The one person who did left the group a year ago.

### 14. Verification and Data Minimization

Verification is a risk score, not a yes/no gate. Combine signals; no single one is reliable. Weigh each by what it catches against what it costs to collect and hold.

| Signal | Catches | Cost and risk | Recommendation |
|---|---|---|---|
| **Written application** | Low-effort disruptors, bots | Holds only what you ask for | Use it. Ask only what a decision needs |
| **Account age** | Throwaway accounts | Little | Use as a flag, not a block |
| **Short call or video intro** (Tier 3+) | Sockpuppets, impersonation | Time; no data retained if you don't record | Strongest signal available; use for sensitive tiers |
| **Vouching** | Strangers reaching sensitive tiers | Vouch chains can be captured | Use with logged vouches (Section 13) |
| **IP address, device fingerprint, VPN/proxy detection** | Multi-accounting, ban evasion | Creates a sensitive data store; penalizes privacy-conscious members | Optional. If used, see below |
| **Activity in other communities** | Known bad actors | Off-platform profiling; the surveillance your opponents would run on you | Don't |

If you use technical signals:

- Use a service or bot that returns a **risk score** without you storing raw IPs or fingerprints.
- **Never auto-reject on VPN use.** Appendix B points members to EFF's Surveillance Self-Defense, which recommends privacy tools. Don't punish people for following it.
- **Disclose it** in your guidelines.
- **Set a short retention period** for raw signals (for example, 30 days). Keep only the score and the outcome.
- On most platforms this requires a third-party verification bot, which becomes your **most privileged data processor.** Vet it as Tier 4 (Section 15).

Risk scoring:

- **Low risk:** automatic approval.
- **Medium risk:** manual review by moderators.
- **High risk:** additional verification (such as a short call), or hold at Tier 0.

#### Data minimization rules

- Collect only what a specific decision needs.
- Set a retention period for every type of data, and delete on schedule.
- Assume every data store will eventually be breached, subpoenaed, or exported by a compromised admin. Ask what that would expose.
- Keep prospective candidates' personal details (addresses, employers, family information) off the community platform entirely.

**Worst case.** An admin account is compromised. The attacker exports the verification bot's database: 1,200 member handles matched to IP addresses and approximate locations. It's posted publicly with the group's name attached. Every member who planned to run for office now has a public link to a group they never chose to disclose, and the group's opponents have a map of its membership.

### 15. Platform Hardening

The principle is simple: **reduce attack surface.** Every feature your platform offers is a potential vector for abuse, accidental harm, or operational risk. Platform defaults are tuned for engagement, not safety, so a hardened group runs with several defaults changed.

Think of it like locking your front door. Most people who walk past won't try the handle, but the lock isn't there for them. Every setting below is a lock.

#### Privileged account security (start here)
Compromised moderator and admin accounts are among the most common catastrophic failures in online communities, and they're largely preventable.

- **Require two-factor authentication for moderation.** Discord has a server-level setting that requires 2FA for anyone with moderation permissions; check your platform for an equivalent. Turn it on.
- **Use hardware security keys or passkeys** for the owner account and every admin.
- **Limit full Administrator permission to two accounts.** Moderators get the specific permissions their job needs, never Administrator.
- **No shared accounts.** Every action should trace to one person.
- **Train mods on phishing.** Platform staff don't DM people about "verifying" their moderator status. Unsolicited links, "your server will be deleted" warnings, and "test my game" downloads sent to mods are attacks until proven otherwise.

#### Disable file uploads by default
File uploads are a primary vector for malware, disguised executables, and exploit-laden documents. Even well-meaning members can share infected files.

- Disable uploads for Tier 0 and Tier 1.
- Allow uploads only for roles that need them, if at all.
- Direct members to share through reputable link-based services instead.

#### Restrict links and embeds for new members
On major platforms like Discord and Slack, link previews are fetched by the platform's servers, so leaking members' IP addresses through previews is not the main risk. The risk is that a polished preview makes a phishing link or fake login page look legitimate.

- Restrict link posting and embeds to Tier 2 and above.
- Document this in your guidelines so members understand why.

#### Restrict channel and topic creation
Letting anyone create channels invites confusion and deliberate fragmentation, and it expands the area your mod team has to watch. Restrict channel creation to moderators. If a member has a genuine need, the request goes through the intake gate (Section 9), and the request itself is useful data about what the group wants.

#### Bots
- Audit every bot. Most need far less permission than they request.
- Remove unused bots immediately. Each one is attack surface.
- Document what each bot does, who added it, and why.
- **A bot with moderation or member-data access is Tier 4.** A leaked bot token is a compromised admin. Never give a bot Administrator.

#### Invites, DMs, and raid controls
- Use expiring invite links where possible.
- Know how to **pause invites and member-to-member DMs** during an incident before you need to. Discord's Security Actions, for example, can pause both temporarily.
- Enable the platform's raid alerts and spam filters.
- Block member-to-member DMs for Tier 0, and consider it for Tier 1. A large share of harassment and phishing arrives by DM.

### 16. Asset Ownership and Blast Radius

Whoever controls the money, the platform, or the contact list ends up controlling the movement (Horseman 3, Section 30). The controls are boring, and they work.

- **The organization owns everything.** Platform owner account, domain and registrar, email service, social accounts, payment processor, bank account: all registered to an organizational identity, not a person's personal account.
- **Two-person rule.** At least two people can access each crown jewel, and no one person holds two.
- **Break-glass recovery.** Recovery codes for owner accounts are stored offline and split between two people in different households, or kept in a shared password-manager vault with access logging. Test recovery once a year.
- **Export cadence.** Every month, export the opted-in member contact list, the decision log, and the mod log to storage controlled by two people. If you lose the platform, you don't lose the group.
- **Out-of-band channel.** A small, separate channel for the core team (an encrypted group chat or a private email list), set up before any incident. It's what you use when the main platform is compromised or when a moderator is implicated.
- **Offboarding.** When anyone leaves Tier 4, rotate shared credentials and recovery codes the same day. It's routine, not an accusation.

#### Blast radius

Ask of every account and role: if this were compromised tomorrow, what's the worst outcome, and what limits it?

| If this is compromised… | Worst case | Control |
|---|---|---|
| **Server owner account** | Server deleted or held hostage; all members lost | Org-owned account, hardware key, split recovery codes, monthly member export |
| **Admin account** | Mass bans, channel deletion, phishing DMs to everyone from a trusted name | Mandatory 2FA, at most two admins, mods without Administrator, mirrored audit log |
| **Moderator account** | Targeted bans; leaks from the mod channel | Scoped permissions, two-mod rule for suspicion actions, mod-log review |
| **Verification bot** | Member identity and IP data exported | Data minimization, vetted bot, short retention |
| **Treasurer** | Funds drained or frozen | Two signers, read-only access for a second person, monthly reconciliation |
| **Founder** | Mission redirected, or a single point of burnout | Decision rights, amendment process, succession plan, no founder-only assets |
| **Domain registrar** | Website and email hijacked | Registrar lock, org account, 2FA, two people with access |
| **A candidate-prep member** | Opposition material leaked | Small logged membership at Tier 3; "write as if it will be read aloud" norm |

#### Succession planning
Document how leadership transitions happen. The absence of a plan is itself a vulnerability. It invites "someone needs to step up" arguments at the moment the group is weakest.

### 17. Logging and Monitoring

Keep two kinds of records, and treat them differently.

**The mod-action log** records who did what to whom, why, and on what evidence. Log every action. Mirror it somewhere moderators can't edit. Keep it for the life of the group. This log protects members from moderators and moderators from false accusations, and it's what makes reviewing a captured or drifting mod team possible (Section 29). Template in Section 38.

**Member activity data** (messages, timing, reply graphs, verification signals) is a liability as much as an asset. Collect the minimum, aggregate where you can, set retention limits, and disclose that you collect it. Perceived surveillance without disclosure destroys trust faster than any disruptor could.

**Platform audit logs:** turn on every one available. Platform retention is limited, so mirror the entries that matter for moderation (bans, kicks, role changes, permission changes, channel deletions, bot and webhook additions) to your mod-log store.

#### Behavioral monitoring at scale

Once a group grows past a few hundred members, moderators can't read everything. Tooling helps, but it's augmentation, not replacement, and it measures activity, not intent. Useful per-user signals:

- Total messages and rate of posting
- Join date and first-message date
- Day-by-day activity pattern
- Channels most active in
- Who they reply to and who replies to them
- Edit and deletion frequency

These are **triage signals** for raids and Tier 0–1 review, never evidence against an individual on their own. Every combination has an innocent explanation:

| Signal combination | Might indicate | Also looks like | Default action |
|---|---|---|---|
| New account, extreme first-day volume | Coordination | A very engaged newcomer | Watch; rate limits handle the rest |
| High volume, few distinct recipients | Targeting a member | A long conversation with a friend | Check that the recipient is OK |
| Dormant account suddenly active | Long-game persona | Someone who cares about this decision | Judge current behavior on its merits; check tier expiry |
| Several new accounts with similar signals | Sockpuppets | A household, office, or campus | Hold at Tier 0 pending review |
| Coordinated timing across accounts | Brigade | Friends who saw the same post | Contain if the behavior is disruptive; otherwise watch |

#### Sentiment analysis limits
Raw sentiment analysis isn't enough for moderation. It misses sarcasm and context, fails on cultural variation, and treats heated but good-faith disagreement as toxic. Use it as one lightly weighted signal among many. Toxicity-specific models work better than general sentiment.

---

## Part IV: The Moderation Charter

> *"Act fast on content. Act deliberately on people."*

Read this charter as if a hostile operator held a moderator role, because Section 29 explains why one eventually might. Every rule here should still be safe in their hands.

### 18. Content Fast, People Deliberately

Removing content is reversible and needs no proof of intent. Removing a person usually isn't reversible: someone publicly banned rarely comes back, and their friends notice. So the charter moves fast on content and deliberately on people.

#### Rule track: remove immediately, any moderator, solo
These are the floor. They get no warning, and the content comes down as soon as a moderator sees it:

- **Threats and doxxing:** implied or explicit threats; sharing anyone's personal information without consent. Capture evidence first (Section 20), then remove immediately. This is also a SEV1 incident (Section 32). **Ban on first offense.**
- **Bigotry:** racism, sexism, homophobia, transphobia, religious hatred, ableism, and the like. **Ban on first offense** for clear cases.
- **Raids and coordinated flooding.** **Ban the accounts.**
- **Fabricated or doctored evidence about a member.** **Ban on confirmation** (Section 20).
- **Personal attacks:** ad hominem, name-calling, attacking someone's character rather than their ideas. Remove and warn; a repeat is a timeout; continued attacks are a ban.
- **Spam and commercial self-promotion.** Remove; repeat offenders are banned. Members announcing their own candidacy, campaign events, or volunteer asks in the designated channels are the mission, not spam.

#### Warning tier: one warning with a clear explanation
The warning is the mulligan. Use it to recalibrate or use it up.

- **Sealioning and "just asking questions":** the same question re-asked after a direct answer, or questions whose premise is an inflammatory claim. After one direct answer and a redirect, further repetition is moderated. (These sit here rather than on the immediate list because telling them apart from honest questions takes judgment, and judgment calls get a warning first.)
- **Derailing:** constant topic-switching, whataboutism, refusing to engage with the point being made.
- **Excessive partisanship:** treating the space as a venue for scoring points rather than doing the work.
- **Poisoning the well:** "everyone on X side believes Y" generalizations.
- **Sourceless bomb-throwing:** inflammatory claims with no backing.
- **Dominance behavior:** monopolizing conversations, consistently talking over others.
- **Public pattern-name accusations:** calling another member a "concern troll," "plant," or "sealion" in public instead of using the mod process (Section 21).
- **Public relitigation of moderation decisions** instead of using the appeals path (Section 22).

### 19. The Response Ladder

There are two tracks. Keep them separate.

**The rule track** is visible and fast. It's for clear violations of written rules. Any moderator can act alone.

> Remove content → Warning → Timeout → Ban
> *(Severe violations skip straight to ban.)*

**The suspicion track** is quiet and reversible. It's for patterns, red flags, and "something's off." It never punishes on its own.

| Level | Trigger | Actions | Who | Visible to the member? | Expiry |
|---|---|---|---|---|---|
| **Observe** | A single flag; no harm yet | Note in the mod log | Any mod | No | None |
| **Watch** | Several flags or an emerging pattern | Tag in the mod log; review at the weekly mod check-in | Any mod | No | Drops after 30 days with no new observables |
| **Contain** | Credible indicators plus access to something that matters, or active disruption | Hold or lower tier; freeze elevated permissions; remove from sensitive spaces; slowmode | **Two mods, logged** | Usually no, or framed as routine review | **Expires after 14 days** unless renewed with new evidence |
| **Eradicate** | Strong evidence (Section 20) of a rule-track violation or deception (sockpuppets, fabricated evidence, documented coordination) | Ban; remove linked accounts; revoke vouches; review who they vouched for | **Two mods, logged** | Yes | Appealable once |

Three rules hold the ladder together:

1. **Suspicion alone never reaches Eradicate.** It needs evidence of a behavior that would justify action on the rule track, or of deception.
2. **Containment expires.** A hold that isn't renewed with new evidence lapses. This is the control that stops "temporary" suspicion from quietly becoming permanent punishment.
3. **Containment applies to insiders.** A moderator under review gets their elevated permissions frozen the same way a member would. That's not an accusation. It's the same rule for everyone.

**Worst case for skipping the ladder.** A moderator bans a well-liked member on a gut feeling that they're an infiltrator. Eleven of the member's friends leave in solidarity. Two weeks later it turns out the "evidence" was a screenshot fabricated by the actual infiltrator, who is still in the group. The mod team just did the adversary's work, publicly, with its own credibility.

### 20. Evidence Standards

Grade every piece of evidence before acting on it.

| Grade | What counts | What it can justify |
|---|---|---|
| **A: Strong** | Platform-native evidence: message links or IDs, audit-log entries, a moderator's own direct observation logged at the time with links | Any level, including Eradicate |
| **B: Corroborated** | Several independent reports with specifics (who, when, where) from people who didn't coordinate their reports | Up to Eradicate, with two mods |
| **C: Weak** | Screenshots, single reports, secondhand accounts, "a lot of people are saying" | Observe or Watch only; never Contain an established member; never Eradicate |

Rules:

- **Screenshots are leads, not proof.** They're easy to fabricate. Ask for the message link, or have a moderator with access check the original.
- **DMs can't be verified by moderators.** An uncorroborated DM screenshot is grade C, however damning it looks.
- **Coordinated reports count as one.** Reports from accounts linked by timing, vouch chains, or known association are graded together, not independently.
- **Preserve before acting.** Capture message links, IDs, timestamps, and audit entries before removing content. For doxxing and threats, capture fast and remove immediately.
- **Record chain of custody.** Note who collected each item, when, and where it's stored. Store evidence in a mod-only location.
- **Fabrication is a rule-track offense.** Doctoring or inventing evidence about a member gets a ban on confirmation.

### 21. Moderator Rules of Engagement

#### Act fast on content, deliberately on people
Remove harmful content first and discuss it later if needed. You can always restore a message. You usually can't restore a person.

#### Plain language, not hostile language
Clear and direct closes the loop. Contempt opens a new one, and it screenshots badly.

- *Not:* "Hey, I'm not sure this is quite in line with…"
- *Not:* "Don't test us. Next one's a ban."
- *Yes:* "This violates our rule on [X], so it's been removed. Repeating it leads to a timeout."

#### Your gut opens a ticket; evidence closes it
Your gut is pattern recognition running faster than your conscious mind, and it's worth listening to. It's also where bias lives. When something feels off: if a rule is broken, act on the content; if not, log an observation and start the suspicion track. Never remove a person on gut alone.

#### Document everything
Every action goes in the mod log (Section 38): the rule or pattern, the observable behavior with links, the evidence grade, the action, and the second moderator where required. An undocumented action didn't happen. A pattern of undocumented actions is a capture tell (Section 29).

#### Don't debate in public; review in private
State the reason once, then disengage. Disagreements among mods go to review, where actions can be reversed. Reversals are normal, not betrayal. You can present a united front in public precisely because real review exists in private.

#### Name rules in public, patterns in private
Saying "you're sealioning" or "that's concern trolling" in public is an accusation of motive. It teaches adversaries what you watch for, and it hands every member a vocabulary for attacking each other. In public, cite the rule and the behavior. Pattern names belong in the mod channel.

#### Consistency over leniency
It's better to be consistently firm than inconsistently lenient. Members respect clear boundaries more than they appreciate selective mercy. Consistency also applies upward: the same rule for a new member, a friend, a moderator, and a founder.

#### Graduated, not endless
Warnings and timeouts give people a real chance to adjust, and most honest members do. But don't run rehabilitation projects on chronic cases. Two warnings and a timeout is enough data. Mod energy is a crown jewel too.

#### Recuse when involved
If you're the target of the behavior, or close friends with the person, hand it to another moderator.

### 22. Appeals and Pushback

When someone disagrees with a moderation decision, separate **where** they say it from **what** they say.

- **In public channels,** arguing about moderation is redirected to the appeals path. Repeated public relitigation is moderated as derailing.
- **Through the appeals path,** a concern is never grounds for action, no matter what it says or who it criticizes.

The appeals path:

- A form or a dedicated mod-mail address.
- Reviewed by a moderator **not involved** in the original action, within [7] days.
- One appeal per action. The reviewer can uphold, reduce, or reverse.
- **Concerns about a moderator** go to the founder plus one non-implicated moderator, not to the mod team as a whole.
- **Concerns about the founder** go to two moderators, or to a trusted member outside the mod team named in advance for this purpose. A group where nobody can raise a concern about the founder has a single point of failure at the top.

Standard response:

> *"If you want this decision reviewed, use [appeals path]. A moderator who wasn't involved will look at it within a week. We don't relitigate decisions in public channels."*

Then stop engaging publicly. The longer a public back-and-forth runs, the more the disruptor wins, regardless of who's right.

### 23. Moderator Self-Check

When you're hesitating to act:

1. Am I hesitating because this is genuinely borderline, or because I'm afraid of conflict?
2. If I let this slide, what behavior am I normalizing?
3. Is this person making the space better or worse for everyone else?
4. Am I protecting the mission, or protecting someone's feelings?

When you're about to act:

5. Would I take this action if a friend of mine did the same thing?
6. Am I acting on what they did, or on what I think they are?
7. What evidence grade am I relying on?
8. Would I be comfortable explaining this to the whole mod team, and would the log back me up?
9. Am I tired? If this isn't a clear rule-track violation, it can wait for a second moderator.
10. **If an adversary wanted me to take this action, would it look exactly like this?**

Your job is to protect the 99 good members from the one bad actor, including when the bad actor holds a moderator role, and including when the "bad actor" is your own exhaustion.

---

## Part V: Detection: Recognizing Disruption Patterns

> *"Naming a pattern is half of defeating it."*

Read every pattern in this part as a **detection, not a verdict.** Each one comes with what to observe, what else it might be, and a first response. A detection opens the suspicion track (Section 19). It never closes it. And pattern names stay in the mod channel (Section 21).

### 24. Bad-Faith Conversation Tactics

#### Sealioning
Endless requests for evidence, definitions, or restatement, presented as polite curiosity but working to exhaust the other person. The sealion never accepts any answer as sufficient.
- **Observe:** the same question re-asked after a direct answer; every answer produces three more questions, none engaging with the substance.
- **Also looks like:** a newcomer who genuinely doesn't understand; someone working in a second language.
- **Respond:** one direct answer and a link, then redirect. Further repetition is warning tier.

#### "Just Asking Questions" (JAQ)
Asserting provocative claims by framing them as questions. "I'm just asking, is it really true that [inflammatory claim]?" Plausible deniability for inflammatory content.
- **Observe:** questions whose premise is the inflammatory claim.
- **Also looks like:** someone who heard a rumor and wants to know whether it's true.
- **Respond:** answer the factual question once. If the premise keeps coming back, warning tier.

#### Whataboutism
Deflecting any criticism by pointing to a real or imagined parallel on the other side, so that no specific issue ever gets traction.
- **Observe:** every critique met with a parallel; the topic never stays put.
- **Also looks like:** someone who genuinely sees a double standard.
- **Respond:** acknowledge it once, then redirect to the original topic.

#### Strawmanning
Restating someone's position in a weakened, distorted form, then attacking the distortion. The original speaker spends their time correcting the misrepresentation instead of advancing their point.
- **Observe:** restatements the original speaker repeatedly rejects.
- **Also looks like:** honest misunderstanding.
- **Respond:** ask them to restate the position in terms the original speaker accepts.

#### Poisoning the well
Generalizations about an entire group based on its worst representatives. "Everyone on X side believes Y." Good-faith engagement becomes impossible because every member of the maligned group has to start by defending themselves.

#### Sourceless bomb-throwing
Dramatic claims with no evidence, made in a way that puts the burden of disproof on everyone else. Brandolini's law applies: the energy needed to refute nonsense is an order of magnitude larger than the energy needed to produce it.
- **Respond:** the claim stands only with a source.

#### Concern trolling
Disguising attacks as concern. "I'm worried about the direction this group is heading," followed by undermining whatever direction the group is actually heading.
- **Observe:** concerns that never come with a proposal, an owner, or an offer to help.
- **Also looks like:** a real concern, awkwardly raised.
- **Respond:** "What would you propose, and would you own it?" Real concern usually answers. Concern trolling usually deflects.

#### Conversation dominance
Always being first, loudest, and most frequent. The group's worldview gradually gets shaped by whoever talks most, regardless of merit.
- **Observe:** one person's share of messages in decision threads.
- **Also looks like:** enthusiasm; ADHD; the one person who actually did the research.
- **Respond:** structurally. Written proposals, turn-taking in decisions, time-boxed threads.

#### Memes and trivialization
Memes are images, formats, and references that compress an idea into a shareable joke. In healthy groups they're harmless and often bonding. As a disruption tactic, they exploit the same plausible deniability as "just asking questions." A meme that wouldn't survive being stated plainly gets posted with the implicit defense "it's just a joke," and calling it out makes the moderator look uptight.

The pattern shows up in three forms:

- **Trivializing reframes** recast serious topics as bits, gradually shifting the group's default register from substantive to ironic. Over time, mission-focused work starts to feel cringe, and earnest contributors get socially punished.
- **Deniable provocation** smuggles in framings, slurs, or attacks under cover of irony. The content is the content. The joke wrapper doesn't change what was said, only what the poster can claim if challenged.
- **Pattern ridicule** mocks moderators or serious members for naming disruption patterns, recasting pattern recognition as humorless paranoia.

The test is the same as for every other pattern: behavior against mission. A meme that wouldn't survive being stated plainly gets the same response as if it had been stated plainly. The job of moderation isn't to adjudicate whether something was technically a joke. It's to notice when the joke wrapper is doing work the underlying content couldn't do on its own. Honest jokes don't need the cover. Bad-faith content needs it badly.

Some groups disallow memes entirely as a structural defense, for the same reason they restrict channel creation (Section 15): it removes a whole category of deliberately ambiguous content that a tired moderator would otherwise have to evaluate in real time. Others keep memes and apply the mission test to them like anything else, accepting the extra load as part of the culture they want. Both are defensible. Decide when you define your norms.

### 25. Movement Disruption Patterns

These patterns come from declassified counterintelligence records (notably the FBI's COINTELPRO program, 1956–1971) and research on Soviet-era "active measures." The techniques predate the internet, but they translate directly to online organizing.

#### Bad-jacketing and snitch-jacketing
Planting doubt about a genuine member's bona fides: portraying them, through rumor or manufactured evidence, as an informant, a plant, a thief, or guilty of misconduct. Snitch-jacketing is the variant that specifically paints the target as an informer. The goal is to make the group eject or isolate its own key people. In the COINTELPRO era, bad-jacketing contributed to the deaths of activists who had been falsely labeled informants. Take it seriously.
- **Observe:** suspicion about a trusted member spreading through DMs and side conversations rather than through the mod process; evidence that's screenshots, secondhand, or "people are saying."
- **Also looks like:** a member with a genuine, poorly expressed worry.
- **Respond:** route accusations to the mod process. The accused keeps their access unless grade A or B evidence says otherwise. Watch the person spreading unverified accusations, not just the target. See Playbook 34.2.

#### Purity testing
Framing a member as ideologically suspect, "not really one of us," politically unreliable. It peels off committed members and narrows the coalition until it can't win anything. It often travels with provocateuring.
- **Observe:** membership questioned on the basis of belief rather than behavior.
- **Respond:** the test is behavior against mission, not belief against someone's preferences.

#### Provocateuring
Pushing the group toward more extreme positions or actions, often by accusing others of being weak, sellouts, or cowards. In a political context: confrontational tactics, public attacks on rival groups or individuals, unverified public claims, or purity tests that exclude moderates.
- **Observe:** calls for escalation paired with attacks on whoever counsels caution; pressure for public actions that name individuals.
- **Also looks like:** genuine frustration with a slow group. Real deadlines make some urgency legitimate (Section 11). Escalation toward confrontation, illegality, or unverified accusations is the tell.
- **Respond:** public statements and actions in the group's name go through decision rights (Section 10). See Playbook 34.7.

#### Schism cultivation
Always finding the wedge issue. Turning minor disagreements into existential ones. Relentlessly surfacing the most divisive sub-issues and then fueling the resulting fight.

#### Manufactured factionalism
Creating or amplifying subgroups that compete rather than collaborate. Channel and topic fragmentation is one online form. Cliques and rival camps are another.

#### Astroturfing
Fake grassroots support: multiple accounts that seem to independently agree but are coordinated. Watch for similar phrasing, identical timing, and accounts that only appear together.

#### Sockpuppeting
One person, multiple accounts. Used to manufacture consensus, harass while seeming to come from many directions, or evade bans. Vouch chains (Section 13) and tier holds for similar new accounts (Section 17) are the structural defenses.

#### The long-game persona
An account that posts normally for months, builds genuine relationships, then activates when something important is being decided. It's the hardest pattern to detect because the account is "established" by the time it matters. The structural defense is that establishment doesn't last forever: elevated access expires and gets re-verified (Section 13). Judge current behavior on its own merits, and don't let history excuse it.

### 26. Social Engineering and Infiltration

#### The credential flex
Heavily emphasizing an impressive background early to fast-track trust. "I was on the call with [founder] before I even joined." Proximity to power as a substitute for time in the group.
- **Also looks like:** a person with real, relevant experience, who is exactly who you want.
- **Respond:** welcome the experience; apply the same pathway. Real experience shows quickly on the ladder (Section 12).

#### Urgency manufacture
"We need to decide NOW," "we're losing momentum," "the window is closing." Pressure to bypass deliberation. Ask for the link to the deadline (Section 11).

#### The favor ladder
A small ask, then a bigger one, then a bigger one. Each accepted favor creates implicit obligation, used to escalate access gradually. The tier pathway is the defense: access comes from the process, not from favors.

#### Grievance cultivation
Identifying members who feel slighted and amplifying their grievances. Lonely, ambitious, or recently rejected members are the usual targets. The disruptor offers validation in exchange for loyalty. A working appeals path (Section 22) gives grievances somewhere legitimate to go, which takes away the disruptor's opening.

#### False intimacy
Excessive personal disclosure early to manufacture closeness, which then gets cashed in for trust and access.

#### Asymmetric information-gathering
Asks lots of questions and shares little. Wants to know everything about how the organization works but reveals almost nothing about themselves.
- **Also looks like:** a privacy-conscious member, an introvert, a journalist.
- **Respond:** compartmentalization makes curiosity harmless. If Tier 1 can't see anything sensitive, questions cost you nothing.

#### Triangulation
Speaking for absent people. "A lot of people are saying…" "Members are concerned that…" It manufactures consensus that may not exist.
- **Also looks like:** relaying real concerns from members too shy to speak.
- **Respond:** ask for specifics and invite those members to raise it directly.

#### The two-faced post
Supportive in main channels, critical in DMs or subgroups. It builds a hidden faction while keeping public legitimacy.
- **Evidence note:** this usually surfaces through DM screenshots, which are grade C until corroborated (Section 20). It's also exactly what a bad-jacketer would fabricate.

#### Opposition research
Quiet collection of material on members likely to run: real names, employers, old posts, private frustrations, family details.
- **Observe:** sustained interest in who's planning to run and their backgrounds; long-tenured, low-participation accounts with access to candidate spaces.
- **Also looks like:** a supportive member who's curious.
- **Respond:** structurally. Candidate prep happens at Tier 3 with small, logged membership. The norm for everyone: write as if it will be read aloud at a candidate debate. See Playbook 34.3.

#### Phishing the privileged
Unsolicited links or files sent to moderators and admins: "verify your account," "your server is about to be deleted," "can you test my game?"
- **Respond:** don't click; verify through another channel; report it to the mod team. See Playbook 34.1.

### 27. Attention Attacks: Side Quests and Process Sabotage

These patterns attack the core team's time (Section 7). Most aren't malicious. All of them are exploitable. The OSS *Simple Sabotage Field Manual* (1944) instructed saboteurs inside organizations to slow them through excess process: insist on channels, refer everything to committees, make long speeches, haggle over wording, reopen settled decisions, urge caution. The list reads like a description of an ordinary volunteer meeting, which is the point.

#### The side quest
An initiative with no owner, no deadline, and no link to the current objective.
- **Observe:** "we should" without "I will."
- **Respond:** the intake gate (Section 9).

#### The tooling side quest
"We need our own app / platform / CRM / website before we can really get started." Especially seductive for technical volunteers, because building feels like progress.
- **Observe:** build work displacing objective work; a tool with no users yet.
- **Respond:** use boring existing tools until the objective is met. Tool builds go through intake like anything else.

#### Bikeshedding
Disproportionate time spent on trivial decisions that everyone can have an opinion about: the logo, channel names, the wording of the welcome message. (Parkinson's law of triviality.)
- **Respond:** time-box it, or give trivial decisions to a single owner.

#### Proposal flooding
More proposals than the group can evaluate. Whether deliberate or enthusiastic, the effect is the same: deliberation capacity is exhausted, and nothing gets decided.
- **Respond:** the intake gate puts the cost on the proposer; the WIP limit caps the load.

#### Committee-ization
"Let's form a working group to look into it."
- **Respond:** a working group forms only with an owner, a deliverable, and a date.

#### Reopening settled decisions
Bringing back questions the group already decided.
- **Respond:** the reopening threshold (Section 10).

#### Wording wars
Haggling over the precise phrasing of statements, charters, and announcements.
- **Respond:** one drafter, one reviewer, one deadline.

#### Manufactured caution
Endless calls for more input on decisions that have real deadlines. See Section 11.

**Worst case.** A month before a petition deadline, a member proposes rewriting the group's charter "to make sure we're all aligned before we go further." The thread runs to four hundred messages over three weeks. Nobody collects signatures. The rewrite is never adopted. Whether the proposer was an operative or just anxious makes no difference to the outcome.

### 28. Weaponized Controls

Every defense in this guidebook can be aimed at your own people. Assume your adversaries have read it.

- **Detection baiting.** Getting a genuine member flagged by describing their behavior in pattern terms: "She keeps asking questions. That's information-gathering." *Defense:* pattern accusations from members go through the mod process, and the accuser's evidence is graded like anyone else's.
- **Fabricated evidence.** Doctored screenshots of DMs or of "deleted" messages. *Defense:* evidence grades (Section 20); fabrication is a rule-track offense.
- **Report flooding.** Coordinated reports against a target to trigger moderator or platform action. *Defense:* coordinated reports count as one.
- **Overreaction baiting.** Provoking moderators into a harsh public response, then circulating screenshots outside the group as proof that it's authoritarian or cultish. *Defense:* plain-language templates; content fast, people deliberately; nothing a moderator posts publicly should embarrass the group as a screenshot.
- **Pattern-name accusations.** "That's concern trolling," used by members to shut down legitimate dissent. *Defense:* public pattern accusations are warning tier (Section 18).
- **Lockout.** Triggering raid protection or tightening verification to keep genuine recruits out during a critical recruiting window. *Defense:* a manual path for vouched newcomers during lockdowns.
- **Appeals flooding.** Overwhelming reviewers with appeals. *Defense:* one appeal per action.
- **Vouch farming.** Getting a captured or careless member to vouch for several accounts. *Defense:* logged vouches and chain review (Section 13).

**The check, before any consequential action:** *If an adversary wanted us to do this, would it look exactly like this?*

### 29. Insider Threat: Moderator Capture and Drift

Most patterns in this part target the group from the outside. This one targets it from the inside. It's the failure mode where the moderation team itself becomes the disruption vector, either because someone hostile passed verification and now holds elevated access, or because honest moderators have drifted from disciplined pattern recognition into reflexive hostility. From the members' side, both look the same, and the response is similar too.

#### Capture
A patient, mission-fluent operator passes verification and obtains a moderator role. They now have visibility into mod-channel conversations, influence over borderline decisions, the ability to slow-walk actions against allies and speed up actions against targets, and a platform from which "concern for the community" carries unusual weight. This isn't paranoid. It's structurally true of any role with elevated access in any organization.

#### Drift
Honest moderators, worn down by real bad actors, start applying pattern recognition reflexively rather than carefully. The patterns are real and the training is real. What slips is the calibration between observed behavior and confident judgment.

#### Tells
- Bans accelerating without a matching rise in clear rule violations.
- Borderline decisions consistently going one way.
- One moderator driving most suspicion-based actions.
- Mod-channel conversation becoming steadily more suspicious, with less curiosity and more certainty.
- Containment holds being renewed without new evidence.
- Actions in the mod log with no evidence grade or no second moderator.
- New moderator recruits chosen mainly for alignment with one existing mod rather than independent vouching.
- The scope of "violating the spirit of the rules" growing without new written rules.
- **Members who raise concerns about moderator behavior being labeled bad-faith actors and removed.**

That last one matters most. A healthy mod team can take criticism without dissolving into debate, and can tell criticism apart from bad-faith pushback. A drifted or captured team treats all criticism as evidence of disruption.

#### Response
Apply zero trust to the mod team the same way you apply it to anyone else:

- **The immutable mod log** (Section 17) is what makes review possible. Without it, the captured mod controls the record.
- **Two moderators on every suspicion-track action** from Contain upward (Section 19).
- **Quarterly trajectory review.** Look at the quarter's suspicion-based actions together: who drove them, which way borderline calls went, how many holds were renewed.
- **Containment applies to insiders.** During a review, freeze the moderator's elevated permissions. It's routine, not punitive.
- **Escalation paths** to the founder and a non-implicated mod, set up before they're needed, through the out-of-band channel (Section 16).
- **Vouch independence.** A moderator can't be the sole voucher for a new moderator.

Sections 10 and 16 cover protecting the group from founder displacement. The other half of the job is the founder watching the mod team for drift, and the mod team having a way to raise concerns about the founder (Section 22).

See Playbook 34.6.

### 30. The Four Horsemen of Movement Collapse

Four patterns recur in accounts of failed movements, and in the collapse that prompted this guidebook. Watching for all four is more useful than watching for any one.

#### Horseman 1: Founder displacement
A charismatic newcomer slowly positions to replace the original leadership, usually by being "more pure" or "more effective" than the founders. The new figure builds loyalty through energy and availability while the founders look comparatively distant or slow.
- **Controls:** decision rights and the amendment process (Section 10); time-based tiers (Section 13).

#### Horseman 2: Mission drift
The stated mission gets quietly broadened or shifted, usually toward whatever a disruptive faction cares about, until the original purpose is lost. It often happens through a thousand small "reasonable" expansions, none of which seem worth contesting on their own.
- **Controls:** the current objective (Section 8); the intake gate and WIP limit (Section 9).

#### Horseman 3: Resource capture
Whoever controls the money, the platform, or the contact list ends up controlling the movement. Watch who volunteers to be treasurer, admin, or list-keeper. The mundane jobs are also the most powerful.
- **Controls:** asset ownership, the two-person rule, and exports (Section 16). See Playbook 34.4.

#### Horseman 4: Exhaustion of the committed
The original organizers burn out fighting fires that disruptors set, and fires the group sets for itself. They leave. Whoever has the most stamina inherits the structure. This is the most common ending: not a dramatic coup, but a quiet handover.
- **Controls:** all of Part II; rotating incident leads (Section 31); no single person as the only moderator on duty or the only holder of any asset. If one person leaving would end the group, you have a bus-factor problem, not a people problem.

---

## Part VI: Incident Handling

> *"Run a process, not a feeling."*

### 31. The Incident Lifecycle

This part borrows the six-phase incident cycle taught in SANS incident-handler training (often called PICERL). NIST SP 800-61r3 (2025) covers the same ground in a broader risk-management frame. The phases translate to a volunteer group with surprisingly little adaptation.

| Phase | Goal | In a group, that means |
|---|---|---|
| **1. Preparation** | Be ready before anything happens | Named roles, an out-of-band channel, backups, contacts, playbooks, tabletop exercises (Section 33) |
| **2. Identification** | Decide whether it's an incident, how bad, and what's affected | Triage and severity (Section 32); scope: which accounts, channels, assets, and people |
| **3. Containment** | Stop the damage spreading while preserving evidence | Short term: pause invites and DMs, freeze permissions, lock channels. Long term: tier holds while you investigate |
| **4. Eradication** | Remove the foothold | Bans, linked accounts, revoked vouches, rotated credentials, removed bots and webhooks |
| **5. Recovery** | Return to normal and watch for a return | Restore, re-verify affected accounts, communicate, support affected members |
| **6. Lessons learned** | Get better | An after-action review within two weeks; update detections, controls, and this guidebook (Section 35) |

#### Principles that carry across every incident

- **Containment isn't eradication.** Teams that jump straight to banning often miss the rest of the foothold: the other three sockpuppets, the vouches they gave, the webhook they created, the second mod who got the same phishing DM.
- **Don't tip off a coordinated actor before you've scoped it.** Banning one sockpuppet publicly tells the operator to switch accounts.
- **Preserve evidence first, except where waiting causes harm.** For doxxing and threats, capture in seconds and remove immediately.
- **Assign roles.** An **incident lead** decides. A **scribe** keeps the timeline and the evidence log. A **comms** person decides what members are told. In a small group one person can hold two roles, but the lead and the scribe should be different people.
- **Rotate the lead.** Nobody leads two incidents in a row if it can be avoided. Incident fatigue feeds Horseman 4.
- **If a moderator is implicated, they're off the incident team,** and the incident runs in the out-of-band channel.

### 32. Severity Levels

| Severity | Definition | Examples | Response |
|---|---|---|---|
| **SEV1: Critical** | A crown jewel is compromised, or someone's safety is at risk | Owner or admin takeover; doxxing; credible threats; funds at risk; a candidate's personal data leaked | Every available core member, in the out-of-band channel, immediately. Consider platform trust & safety, legal counsel, and law enforcement |
| **SEV2: Major** | A coordinated attack or insider abuse is in progress | Raid; sockpuppet campaign; jacketing campaign against a core member; captured or drifting moderator; leak of non-personal strategy material | Lead and scribe named within 24 hours; containment the same day |
| **SEV3: Moderate** | Sustained disruption by an individual or small group, or an attention attack threatening the objective | Persistent derailing across threads; side-quest overload with a deadline approaching | Handled at the next mod check-in, with a named lead |
| **SEV4: Minor** | A single clear rule violation | One personal attack; one spam post | Standard moderation. Not an incident |

When in doubt, declare one level higher. Downgrading costs nothing; under-reacting to a SEV1 can cost the group.

### 33. Preparation Checklist

Do all of this before you need it. Incident response that starts with "who has the owner password?" is already losing.

- [ ] **Roles named:** two or three rotating incident leads and a pool of scribes.
- [ ] **Out-of-band channel** exists, has been tested, and has current membership limited to Tier 4 and the founder. If one of its members is implicated in an incident, they're removed for the duration.
- [ ] **Contact list,** stored outside the main platform:
  - The platform's trust & safety reporting paths and hacked-account recovery process.
  - Registrar, email-service, and payment-processor support.
  - A lawyer or legal-aid contact. The National Lawyers Guild provides legal support to activists in many areas.
  - Local law enforcement's non-emergency line, for threats.
  - Access Now's Digital Security Helpline, for digital threats against members.
- [ ] **Backups:** member contact export, decision log, mod-log mirror, documented channel and role structure (or a server template).
- [ ] **Recovery tested:** owner-account recovery works; break-glass codes are where they're supposed to be.
- [ ] **Playbooks adapted** to your platform, with the exact settings paths for pausing invites, pausing DMs, raising verification, and locking channels.
- [ ] **Thresholds decided in advance:** what goes to law enforcement (credible threats of violence, doxxing with evident intent to harm, extortion), what goes to legal counsel (defamation exposure, financial loss), and who makes each call.
- [ ] **Tabletop exercises scheduled:** one playbook per quarter (Appendix A).

### 34. Playbooks

Each playbook gives a scenario, the indicators, the worst case, and what to do in each phase. Adapt the specifics to your platform. Run them as tabletop exercises before you need them for real.

#### 34.1 Privileged Account Takeover
**Severity:** SEV1

**Scenario.** A moderator gets a DM: "Your moderator status will be removed unless you verify your account." They click the link and log in. Twenty minutes later their account starts banning members.

**Indicators.** A burst of bans, kicks, channel deletions, or role changes in the audit log. Members reporting phishing DMs from a moderator. The moderator unreachable, or reporting that they're locked out.

**Worst case.** An attacker with admin rights deletes every channel, bans every member, and DMs the entire member list a phishing link from a trusted name, harvesting more accounts as they go. If the compromised account is the owner, the server can be deleted outright, and the member list goes with it.

**Contain.**
1. Any admin strips the compromised account's roles immediately. Don't wait to confirm. This is reversible.
2. Pause invites and member DMs.
3. Alert the core team in the out-of-band channel.
4. Post a short pinned notice: "Ignore DMs from [account]. Don't click links or download files. We're on it."
5. If the owner account is compromised, contact platform support immediately and use the split recovery codes (Section 16).

**Eradicate.**
- The account owner secures their account: password reset, revoke all sessions, re-enroll 2FA with a hardware key.
- Review the audit log for everything the account did, and undo it: webhooks created, bots added, roles and permissions changed, invites generated.
- Rotate every shared credential the account could see.
- Ask every other moderator whether they received the same DM.

**Recover.**
- Restore channels and roles from the documented structure.
- Unban members the attacker banned, using the audit log.
- Re-invite from the contact export if needed.
- Restore the moderator's roles only after their account is confirmed clean and secured.

**Prevent.** 2FA required for moderation; hardware keys for owner and admins; no more than two Administrator accounts; mods trained that platform staff don't DM them about verification.

#### 34.2 Bad-Jacketing a Core Organizer
**Severity:** SEV2

**Scenario.** Screenshots circulate in DMs suggesting the volunteer coordinator is secretly working for a rival campaign.

**Indicators.** Members asking moderators "is it true about [name]?" Side conversations going quiet when the coordinator joins. A new or mid-tenure member as the common source.

**Worst case.** The group splits into those who believe it and those who don't. The coordinator, exhausted and humiliated, quits, and a third of the members follow. The person who spread the screenshots offers to take over coordination. The screenshots were fabricated.

**Contain.**
- Move it out of public channels. Post: "We're aware of claims about a member. They're being reviewed through our process. Please don't repeat unverified accusations in the meantime." Don't name the target.
- **The target keeps their access** unless grade A or B evidence says otherwise. Containing the target on grade C evidence is the outcome the attacker wants.
- Talk to the target privately, and early.

**Identify.**
- Trace the screenshots: who shared them first, and who they got them from.
- Ask the sources for original message links.
- Look for signs of fabrication: impossible timestamps, the wrong interface version, display names that don't match the period.

**Eradicate.**
- If the evidence was fabricated or knowingly spread without any: rule-track ban for the originator (Section 18), and review everyone they vouched for.
- If the evidence holds up at grade A or B: handle the target on the suspicion track like anyone else.

**Recover.**
- Post a brief, factual statement: "We reviewed the claims and found no supporting evidence. Spreading unverified accusations about members violates [rule]."
- Support the target publicly if they want it.
- Check in with members who got drawn in. Most were manipulated, not malicious.

**Prevent.** Evidence standards (Section 20); the patterns-in-private norm (Section 21); members know that accusations go through moderators, not DMs.

#### 34.3 Opposition Research and Candidate Exposure
**Severity:** SEV1 if personal data is exposed; SEV2 otherwise

**Scenario.** A prospective candidate's frustrated post from eighteen months ago, venting about a local official, is published by an opponent's allies the week before the filing deadline.

**Indicators.** The post appears outside the group. The candidate is asked about things they only said inside.

**Worst case.** The candidate withdraws. Two other prospective candidates see it happen and quietly drop out. The group loses its cycle, and members stop speaking candidly anywhere.

**Contain.**
- The candidate comes first. They decide how to respond, and the group helps.
- Don't hunt for the leaker in public. A public hunt is a gift to the opponent and a jacketing risk.
- Check what else the leaking account could have seen. Assume more is coming and help the candidate prepare.

**Identify.** List who had access to that channel when the post was made. Tier and channel membership logs pay off here: you narrow the field by access, not by suspicion.

**Eradicate.** If the leaker is identified with grade A or B evidence, remove them and review their vouches. Tighten the channel's membership.

**Recover.** Support the candidate. Remind members of the norm without blaming them.

**Prevent.**
- Candidate-prep spaces at Tier 3, with small, logged membership.
- Prospective candidates review their own post history before they announce.
- The norm for everyone: write as if it will be read aloud at a candidate debate.
- Candidates' personal details stay off the platform.

#### 34.4 Resource Capture
**Severity:** SEV1

**Scenario.** The volunteer who set up the bank account, payment processor, and email list leaves after a dispute and stops responding. Or: the founder, who personally owns the server, burns out and disappears.

**Indicators.** One person is the only one who can access an asset. Requests for access get deflected ("I'll handle it"). Reconciliation doesn't happen.

**Worst case.** Funds frozen or gone. The member list held hostage, or taken to a rival group. The server deleted. The group can't recover any of it, because everything was in one person's name.

**Contain.**
- Contact the person directly, in writing, and keep a record.
- Freeze what you can. If an account is in the organization's name, notify the institution. Most platforms won't transfer ownership without the owner's cooperation.
- If the member list is at risk, notify members through the out-of-band channel or the last contact export.

**Eradicate and recover.** Get legal advice if money is involved. Rebuild from exports. Open new accounts in the organization's name, with two people on each.

**Prevent.** Section 16: org-owned accounts, two people per asset, no one person holding two, monthly exports, offboarding rotation. This is the playbook where prevention is almost the entire answer, because recovery is often impossible.

#### 34.5 Raid or Coordinated Flood
**Severity:** SEV1 with doxxing or threats; SEV2 otherwise

**Scenario.** A hundred and fifty new accounts join in an hour and flood every channel with slurs and a candidate's home address.

**Indicators.** A join spike. A platform raid alert. The same messages posted across many accounts.

**Worst case.** The address spreads. The candidate's family is harassed at home. Screenshots of the slurs "in" the group circulate as if members posted them.

**Contain.**
- Pause invites and member DMs.
- Raise the verification level. Lock public channels or turn on slowmode.
- Capture links and IDs for the doxxing, then remove it immediately.

**Eradicate.** Ban the cluster by join time, account age, and behavior. Report the raid to the platform.

**Recover.**
- Contact the person who was doxxed directly. Help with platform takedown requests and, if there are threats, with law enforcement.
- Reopen gradually.
- Review any accounts still sitting at Tier 0 from the raid window.

**Prevent.** Verification levels; Tier 0 posting limited to the welcome channel; raid alerts; expiring invites; candidates' personal details off the platform.

#### 34.6 Captured or Drifting Moderator
**Severity:** SEV2

**Scenario.** A moderator who joined eight months ago now drives most suspicion-based actions. Three members who questioned their calls have been removed as "bad faith." They've vouched for two new moderator candidates.

**Indicators.** The tells in Section 29, visible in the mod log.

**Worst case.** The two new moderators are approved. The faction now has a mod-team majority. The founder is outvoted on their own charter, and members who notice are removed. By the time anyone outside sees it, the group has a different mission and the same name.

**Contain.**
- The founder and one non-implicated moderator review the mod log in the out-of-band channel.
- Freeze the moderator's elevated permissions during the review. It's routine, and it's the same rule as for any member (Section 19).
- Pause any pending role grants they vouched for.

**Eradicate.**
- **If it's capture:** remove them from Tier 4; review all their actions and vouches; reverse wrongful removals.
- **If it's drift:** they step back from moderation for a defined period and pair with another moderator when they return.

**Recover.**
- Reinstate wrongly removed members, with an apology.
- Tell the group what changed, at the level of detail it needs.
- Tighten the second-moderator requirement and the log-review cadence.

**Prevent.** The two-moderator rule; the immutable mod log; quarterly trajectory reviews; independent vouching.

#### 34.7 Provocateur Pushes Escalation
**Severity:** SEV2

**Scenario.** A member, frustrated with "timid" leadership, pushes the group to publicly accuse a rival candidate of corruption based on a rumor, and to organize a protest outside the rival's home.

**Indicators.** Escalation framed as courage. Caution framed as cowardice. Urgency: "they'll get away with it."

**Worst case.** The group does it. The rumor is false. The group faces defamation claims and a news story about "the group that showed up at a candidate's house," and every candidate it backs carries that association.

**Contain.** Public statements and actions in the group's name require decision-rights sign-off (Section 10). Nothing goes out in the meantime.

**Eradicate.**
- If the member organizes it anyway in the group's name: rule-track action for misrepresenting the group.
- If it's sincere frustration: redirect the energy to the current objective.

**Recover.** If something already went out, correct it quickly, in writing, with legal advice.

**Prevent.** Decision rights for public statements; legal review before any claim about a named individual; a written norm about where the group does and doesn't take action.

#### 34.8 Attention Collapse
**Severity:** SEV3; SEV2 within 60 days of a hard external deadline

**Scenario.** Ten weeks before the filing deadline, the group has fourteen active initiatives, three meetings a week, and no candidate with a completed petition.

**Indicators.** Initiatives without owners or review dates. The output metric flat while activity metrics rise. Core members declining tasks. Meetings spent on proposals instead of progress.

**Worst case.** The deadline passes with nothing filed. The founder burns out. The most active side-project lead inherits a group with no wins and points it somewhere else.

**Contain.** Declare it. Yes, this is an incident. Freeze new intake.

**Eradicate.**
- Triage every initiative against the objective: keep (with an owner and a date), park, or kill. Most get parked.
- Reassign people from parked initiatives to objective work, each with a concrete task.

**Recover.** Report progress on the objective every week. Reopen intake after the deadline.

**Prevent.** All of Part II.

### 35. Lessons Learned

Run an after-action review within two weeks of closing any SEV1 or SEV2.

- **Blameless for honest mistakes; accountable for deliberate ones.** The goal is a better system, not a scapegoat. Scapegoating is how incident reviews turn into schisms.
- **Work from the scribe's timeline,** not from memory.

Questions to answer:

1. What happened, in order?
2. How did we detect it, and how late?
3. What did we contain well? What did we contain badly?
4. What did the adversary (or the circumstance) exploit?
5. Did any of our own controls get used against us?
6. Did we act against anyone who turned out to be innocent? What did that cost them, and us?
7. What changes: detections, controls, tiers, playbooks, this guidebook?

Track over time:

- Time to detect and time to contain.
- **False positives:** people contained or removed who shouldn't have been, and wrongful removals reversed.
- Repeat incidents of the same type.

Write it down, update the guidebook, and share sanitized lessons with other groups. The next group's preparation is your incident.

---

## Part VII: Quick Reference

> *"The parts moderators actually keep open while doing the work."*

### 36. Red Flag Detections

*None of these is conclusive. Every one has known false positives, and that column isn't optional. Several flags together open the suspicion track (Section 19). They never close it.*

| # | Observable | Might indicate | Known false positives | Default action |
|---|---|---|---|---|
| 01 | Rapid credential claims with no verifiable history | Manufactured legitimacy | Real experience; a nervous newcomer | Same pathway as everyone; don't fast-track |
| 02 | Volunteers for everything, especially sensitive roles | Access acquisition | Your most enthusiastic recruit | Small real tasks; sensitive roles follow the tiers |
| 03 | DMs that contradict public posts | Two-faced positioning | Private nuance; a fabricated screenshot | Grade the evidence; watch |
| 04 | Asks a lot, shares little | Information-gathering | Privacy-conscious member; introvert; journalist | None. Compartmentalization makes curiosity harmless |
| 05 | Shifts position at decision points | Faction-building or influence-testing | Was persuaded | Watch only if paired with coordination signals |
| 06 | Every objection framed as "concern for the mission" | Concern trolling | A real concern, awkwardly raised | "What would you propose, and would you own it?" |
| 07 | Speaks for absent or unnamed members | Triangulation | Relaying concerns from shy members | Ask for specifics; invite those members directly |
| 08 | Refuses small tasks while pushing for big roles | Status-seeking without service | Overqualified and impatient | Hold the pathway |
| 09 | Accuses leadership of being a "clique" early on | Positioning for displacement | Leadership really is a clique | Check honestly; answer with the decision-rights record |
| 10 | Pushes for more channels, subgroups, structure | Fragmentation | Trying to get organized | Intake gate |
| 11 | Manufactures urgency around decisions | Bypassing deliberation | A real external deadline | Ask for the link to the deadline |
| 12 | First and loudest on every topic | Conversation capture | Enthusiasm; ADHD | Structural: written proposals, turn-taking |
| 13 | Activity concentrated at unusual hours | Organizing around others | Shift work; parenting; other time zones | None. Decision cadence defends against this |
| 14 | Defends removed members with "hear them out" | Possible coordination | A fairness instinct | Point to the appeals path |
| 15 | Proposals faster than the group can evaluate | Proposal flooding | Enthusiasm | Intake gate and WIP limit |
| 16 | Sustained interest in who's running and their backgrounds | Opposition research | Supportive curiosity | Keep candidate details at Tier 3 |
| 17 | Spreads accusations about a member outside the mod process | Bad-jacketing | Genuine worry | Route to mods; grade the evidence; watch the spreader |
| 18 | Unsolicited links or files sent to mods or admins | Account-takeover attempt | A real request | Don't click; verify through another channel |
| 19 | Pushes for public actions naming individuals | Provocateuring | Righteous frustration | Decision rights for public actions |

### 37. Pattern-to-Response Reference Card

**Legend:** 🔴 Rule track, act now · 🟡 Rule track, warning tier · 🟢 Suspicion track, quiet

| If you see… | First response | If it continues… |
|---|---|---|
| 🔴 **Threats or doxxing** | Capture evidence, remove, ban. Declare SEV1. | Playbook 34.5; consider law enforcement |
| 🔴 **Raid or coordinated flood** | Pause invites and DMs; remove; ban the cluster | Playbook 34.5 |
| 🔴 **Personal attack** | Remove the message; state the rule once | Timeout, then **ban** |
| 🔴 **Fabricated evidence** | Verify, then **ban** the originator | Review their vouches |
| 🟡 **Sealioning / JAQ** | One direct answer, then redirect | Warning, then timeout |
| 🟡 **Whataboutism / derailing** | Warning plus a redirect to the topic | Timeout; document the pattern |
| 🟡 **Sourceless bomb-throwing** | Require a source for the claim to stand | Remove; log a formal warning |
| 🟡 **Public relitigation of mod decisions** | Point to the appeals path | Treat as derailing |
| 🟡 **Public pattern-name accusations** | Remove; cite the norm | Warning tier |
| 🟢 **Manufactured urgency** | "Send me the link to the deadline." If none: next check-in | Watch for the pattern |
| 🟢 **Triangulation ("a lot of people…")** | Ask for specifics; invite named members directly | Watch |
| 🟢 **Channel or initiative push** | Intake gate | Parking lot |
| 🟢 **Credential flex by a new member** | Acknowledge the experience; same pathway | **Hold the line** |
| 🟢 **Two-faced posting (reported)** | Grade the evidence; observe | **Contain** only on A or B evidence |
| 🟢 **Coordinated new accounts** | Hold at Tier 0 pending review; don't announce it | **Ban the cluster** if confirmed |
| 🟢 **Long-game persona activating** | Judge current behavior on its merits; check tier expiry | Standard escalation |
| 🟢 **Accusations against a member spreading** | Route to the mod process | Playbook 34.2 |

### 38. Mod Log Template

Every action gets an entry. A spreadsheet works; so does a structured file. The fields matter more than the format.

| Field | Contents |
|---|---|
| `id` | Unique identifier |
| `time` | When the action was taken |
| `mod` | Who acted |
| `second_mod` | Required for suspicion-track Contain and Eradicate, and for removing established members |
| `subject` | The account acted on |
| `track` | `rule` or `suspicion` |
| `level` | `remove`, `warn`, `timeout`, `ban`, `observe`, `watch`, `contain`, `eradicate` |
| `observable` | What they did, in plain words |
| `evidence` | Links, IDs, audit entries |
| `evidence_grade` | `A`, `B`, or `C` |
| `rule_or_pattern` | The rule broken or the pattern suspected |
| `action` | What was done |
| `expires` | Required for `watch` and `contain` |
| `outcome` | `open`, `renewed`, `lapsed`, `escalated`, `reversed`, `upheld` |

Example entry:

```yaml
- id: 2027-03-14-007
  time: 2027-03-14T21:14-05:00
  mod: "@alex"
  second_mod: "@sam"
  subject: "@user123"
  track: suspicion
  level: contain
  observable: >
    Asked three members in DMs which of them plan to run and
    where they work. Reported independently by two of them,
    with specifics and their own message links.
  evidence:
    - "report-2027-03-14-a (link to the reporter's message)"
    - "report-2027-03-14-b (link to the reporter's message)"
  evidence_grade: B
  rule_or_pattern: "Opposition research (Section 26)"
  action: "Held at Tier 1; removed from the #candidate-prep waitlist"
  expires: 2027-03-28
  outcome: open
```

### 39. Incident Quick Card

1. **Is anyone in danger, or is a crown jewel compromised?** Then it's SEV1. Move to the out-of-band channel now.
2. **Name a lead and a scribe.** Is a moderator implicated? Then they're off the team.
3. **Capture evidence:** links, IDs, timestamps, audit entries. Fast for doxxing and threats.
4. **Contain:** pause invites and DMs; freeze permissions; lock channels; hold tiers. Don't tip off a coordinated actor.
5. **Scope it:** which accounts, channels, assets, and people. Look for the rest of the foothold.
6. **Eradicate:** bans, linked accounts, vouches, credentials, bots, webhooks.
7. **Recover:** restore, re-verify, communicate, and support the people affected.
8. **Review within two weeks.** Update this guidebook.

Before any consequential action: ***If an adversary wanted us to do this, would it look exactly like this?***

### 40. Message Templates

#### Warning
> *"This violates our rule on [X], so it's been removed. Please adjust. Repeating it leads to a timeout."*

#### Removal notice
> *"Your post violated our rule on [X] and has been removed. If you think we got it wrong, you can request a review at [appeals path]."*

#### Response to moderation pushback
> *"If you want this decision reviewed, use [appeals path]. A moderator who wasn't involved will look at it within a week. We don't relitigate decisions in public channels."*

#### Response to manufactured urgency
> *"Thanks for raising this. If there's an external deadline, send me the link and we'll plan around it. Otherwise it goes on the agenda for [next check-in]."*

#### Response to a credential flex or fast-track request
> *"Welcome, and thanks for bringing that experience. Everyone here starts on the same pathway, and the fastest way up is to grab a first task from [link]. Experience like yours tends to show quickly."*

#### Response to triangulation
> *"Could you share which members have raised this? It's easier to address concerns when we hear them directly. They're welcome to message the mod team."*

#### Response to a new initiative
> *"Good idea. To start it, we need an owner, a definition of done, and which part of [current objective] it serves. If now isn't the time, it goes on the parking lot and we'll revisit it at [date]."*

#### Routing an accusation
> *"We take concerns about members seriously, and they go through the mod team, not public channels. Please send what you have, including original message links, to [mod-mail]. Please don't repeat unverified claims about members in the meantime."*

#### Account-compromise notice
> *"Heads up: [account] has been compromised. Don't click links or download files from DMs claiming to be from it, or from anyone claiming to be platform staff. We're handling it and will update here."*

#### After a jacketing review
> *"We reviewed recent claims about a member and found no supporting evidence. Spreading unverified accusations about members violates [rule]. If you have concerns about anyone, bring them to [mod-mail]."*

#### Public statement of moderation philosophy
> *"This community exists for one purpose: [your mission]. We protect that mission decisively. We moderate based on behavior, not on who someone is or what they believe. Access here is earned over time, the same way for everyone, including moderators. If you're here to build, you're welcome. If you're here to disrupt, you won't last long."*

---

## Appendix A: Adapting This Guidebook

This document is generic in places where your group needs specifics. Before using it, work through the following.

### 1. Write your mission sentence
One sentence. If it takes a paragraph, it's not a mission yet. Examples of the right format:

- "We exist to build cross-party dialogue on civic reform."
- "We exist to support independent candidates in their first congressional run."
- "We exist to coordinate mutual aid in our region."

### 2. Set your current objective
Concrete, countable, dated, and tied to an external calendar (Section 8). Put every external deadline for the cycle on a shared calendar now.

### 3. Fill in your threat model
Go through the actor table (Section 1) and the crown jewels (Section 2) for your group. Who is likely to oppose you? Which assets do you hold, and who holds them today? Fill in the blast-radius table (Section 16) with real names and accounts. Every row where one person holds everything is your first fix.

### 4. Define your tiers and decision rights
The five-tier model is a starting point. Smaller groups may collapse it to three tiers; larger ones may expand it. What matters is that each tier has different capabilities, movement between tiers has criteria, and elevated access expires. Fill in the decision-rights matrix (Section 10), including the sponsor threshold and standing period for reopening decisions.

### 5. Decide your enforcement style
This guidebook is decisive on content and deliberate on people. Some groups prefer a softer style on the rule track. Both can work. What fails is having no style at all, or one style for strangers and another for friends. Decide and document.

### 6. Build your platform-specific addendum
The technical controls here are generic. Add an appendix with your exact platform settings and paths, permission configurations, bot allowlist, verification flow, data-retention periods, and the specific steps for pausing invites and DMs.

### 7. Train your moderators on it
A guidebook nobody has read is decoration. Walk through it with each new moderator before they get permissions, including one tabletop exercise. Reference it in mod-channel discussions. Update it when you hit situations it doesn't cover.

### 8. Run tabletop exercises
Once a quarter, take 45 minutes and run one playbook from Section 34.

- A facilitator presents the scenario in stages: "It's 9 p.m. A member reports a weird DM from a moderator. Fifteen minutes later, the audit log shows twelve bans."
- The team decides what to do at each stage, using only what they'd actually have available.
- The scribe notes every gap: a missing setting, a password nobody has, an unclear role.
- Fix at least one gap before the next exercise.

Exercises are where you discover that the owner's recovery codes are in a drawer in a house nobody can reach.

### 9. Revisit periodically
Quarterly works well. Combine it with the access review: who has elevated permissions and whether they still need them; which bots are installed and what they do; audit logs for unusual patterns; the quarter's suspicion-track actions as a trajectory; and whether the charter still matches reality or reality has drifted.

---

## Appendix B: Prior Art and Further Reading

This guidebook stands on the shoulders of decades of work by activists, security researchers, trust & safety professionals, organizers, and scholars. We're not the first people to think about this, and we won't be the last. If anything here is useful, it's because of what came before.

This appendix is partly an acknowledgment and partly a map. Each tradition below approaches the problem from a different angle, and reading across them will make you a better moderator, organizer, or steward than reading this guidebook alone.

### The Activist Security Culture Tradition

The closest spiritual ancestor of this guidebook. Born from the lived experience of organizers who watched their movements be infiltrated, disrupted, and dismantled, most famously through the FBI's COINTELPRO program (1956–1971), and continuing to the present day. Strongest on infiltration patterns, informants, internal trust, and what disruption feels like from inside a movement.

- **"Security Culture: A Handbook for Activists."** The classic zine; its third edition was prepared in November 2001. Freely available online, including through the Internet Archive and Sprout Distro. Particularly strong on informants and infiltrators.
- **"Confidence. Courage. Connection. Trust: A Proposal for Security Culture."** A more recent zine focused on relational trust in organizing.
- **Activist Handbook** (activisthandbook.org). A modern, Creative Commons–licensed resource with a security culture section. It explicitly warns about the risks of security culture itself and argues for an open approach.
- **Ruckus Society, "Security Culture for Activists."** A practical, updated guide to assessing risk.
- ***The COINTELPRO Papers*** by Ward Churchill and Jim Vander Wall (1990). The foundational documentary history; reproduces original FBI memos.
- **National Lawyers Guild** publications on COINTELPRO and its digital-age descendants.

**Caveat:** much of this literature is pitched at direct-action contexts and assumes state-level adversaries. The patterns translate, but the threat model may not match yours. Its warnings against paranoia, gossip, and unfounded accusations matter as much as its warnings about infiltrators.

### Organizing and Group Structure

How groups actually build the capacity to get things done, and why self-organizing groups so often fail to.

- **"The Tyranny of Structurelessness"** by Jo Freeman (1970). The essential text for any self-organizing group. Groups without formal structure don't avoid hierarchy; they grow hidden, unaccountable elites. That's exactly the condition a charismatic newcomer exploits. Available on the author's website.
- ***How Organizations Develop Activists*** by Hahrie Han (Oxford University Press, 2014). Research on civic associations showing the difference between mobilizing people and organizing them, and why giving people meaningful work keeps them.
- ***Twitter and Tear Gas*** by Zeynep Tufekci (Yale University Press, 2017). Why networked movements can scale quickly but lack the capacity, decision-making, and resilience that slower organizing builds.
- **Marshall Ganz's work on organizing,** including ***Why David Sometimes Wins*** (Oxford University Press, 2009) and his teaching materials on distributed leadership teams.
- **OSS, *Simple Sabotage Field Manual*** (1944). A declassified U.S. government manual for sabotaging organizations from the inside through excess process. Public domain and widely available, including through Project Gutenberg. Read it, then look at your meeting agenda.

### Security Engineering and Incident Response

Where this guidebook's posture comes from.

- **NIST SP 800-207, *Zero Trust Architecture*** (2020). The reference definition of zero trust: no implicit trust based on location or position, explicit verification, least privilege. *csrc.nist.gov*
- **NIST SP 800-61r3, *Incident Response Recommendations and Considerations for Cybersecurity Risk Management*** (April 2025). The current NIST incident-response guidance, superseding the long-standing Revision 2. *csrc.nist.gov/pubs/sp/800/61/r3/final*
- **SANS Institute incident-handling materials,** including the *Incident Handler's Handbook*. The source of the six-phase cycle used in Part VI.

**Caveat:** these are written for IT systems, not people. The principles translate well; the specific procedures don't.

### Governance of Shared Resources

- ***Governing the Commons*** by Elinor Ostrom (Cambridge University Press, 1990). Nobel-winning research on how communities successfully manage shared resources without collapsing. Her design principles (clear boundaries, accountable monitoring, graduated sanctions, cheap conflict resolution, members' ability to change the rules) map closely onto Parts III and IV.

### The Trust & Safety Field

The professional discipline that has emerged over the past decade for operating large user-generated content platforms. Strongest on platform operations, policy design, enforcement workflows, and moderation at scale.

- **Trust & Safety Professional Association (TSPA).** A free, comprehensive Trust & Safety Curriculum covering content moderation, policy models, safety by design, and enforcement. The closest thing to an industry-standard reference. *tspa.org*
- **Trust & Safety Teaching Consortium.** Open teaching materials, reading lists, and course modules from a coalition of academic, industry, and nonprofit experts. *cornelltech.github.io/TeachingTrustSafety*
- **Integrity Institute.** Research and resources on platform integrity. *integrityinstitute.org*
- **All Tech Is Human.** A large practitioner community with a job board, events, and a resource library. *alltechishuman.org*

**Caveat:** most of this material is pitched at trust & safety teams inside platforms (Discord-the-company, not a community on Discord). Useful for principles, less useful for direct application.

### Digital Security and Surveillance Self-Defense

How individuals and groups protect themselves against surveillance, data exposure, and digital adversaries. Essential for any group handling sensitive organizing or with members who face real risk.

- **EFF Surveillance Self-Defense** (ssd.eff.org). The Electronic Frontier Foundation's guide to digital security, continuously updated for over fifteen years: tutorials, threat modeling, and tool recommendations, in many languages.
- **EFF Security Education Companion.** Materials for trainers teaching digital security to less technical audiences.
- **Access Now Digital Security Helpline.** A 24/7 helpline for activists, journalists, and human rights defenders facing digital threats. *accessnow.org/help*

### Codes of Conduct and Community Standards

The declaration side of community standards; this guidebook focuses on enforcement. Both are needed.

- **Contributor Covenant** (contributor-covenant.org). The most widely adopted open-source code of conduct, used by projects including Linux, Ruby on Rails, Swift, and Go. Created by Coraline Ada Ehmke in 2014. Version 3.0 is stewarded by the Organization for Ethical Source and licensed CC BY-SA 4.0. Its enforcement guidelines use a graduated ladder with repair steps, which is worth comparing against Part IV.
- **Citizen Code of Conduct** (citizencodeofconduct.org). Designed for civic-tech and non-software communities.
- **Django Code of Conduct.** A frequently cited example tailored to a specific community.
- **Open Source Guide on Codes of Conduct** (opensource.guide/code-of-conduct/). GitHub's practical guide to adopting and enforcing one.

### Academic and Research Resources

- **Berkman Klein Center for Internet & Society** at Harvard. Long-running research on internet governance. *cyber.harvard.edu*
- **Data & Society.** Research on the social implications of data-centric technologies. *datasociety.net*
- **Stanford Internet Observatory.** Published influential work on platform integrity and information operations. Its organizational status has changed; archived publications remain valuable.
- ***Custodians of the Internet*** by Tarleton Gillespie (2018). An academic book on the labor and politics of content moderation.

### Movement Disruption and Counterintelligence History

- ***Agents of Repression*** by Ward Churchill and Jim Vander Wall. A companion to *The COINTELPRO Papers*, focused on the FBI's campaigns against the Black Panther Party and the American Indian Movement.
- ***War at Home: Covert Action Against U.S. Activists*** by Brian Glick (1989). A concise, practical guide to recognizing and resisting government disruption, widely circulated in activist circles.
- **FBI COINTELPRO records.** Available through the FBI Vault (vault.fbi.gov) and FOIA-released collections at university libraries.
- **Active measures research.** Studies of Soviet-era disruption operations, many describing techniques that translate directly to modern online influence operations.

### Specific Platform Documentation

Generic principles only get you so far. Eventually you have to configure real settings on a real platform.

- **Discord Safety Center** (discord.com/safety). Official policies and moderator resources, including raid protection, Security Actions, and the 2FA requirement for moderation.
- **GitHub Building Communities** docs (docs.github.com/en/communities). Official guidance on community management, codes of conduct, and moderation tools on GitHub.
- **Slack** community guidelines and admin documentation, for Slack-based groups.

### Why This Guidebook Exists Alongside All of That

If so much already exists, why another document?

Because these resources sit in separate worlds that rarely talk to each other, and none of them speaks directly to the people who need this knowledge most:

- The **activist security tradition** is strong on infiltration and disruption, but it's pitched at radical and clandestine contexts.
- The **organizing literature** is strong on building capacity, but it rarely deals with adversaries.
- **Security engineering** is strong on adversaries, but it deals with systems, not people.
- The **trust & safety field** is strong on platform operations, but it's pitched at companies running platforms, not groups living on them.
- **Code-of-conduct templates** are essentially rule lists. They don't address infiltration, factionalism, or organizational dynamics.
- **EFF's guides** address technical threats to individuals and groups, not social dynamics inside a group.

A small or mid-size change-making group (an advocacy group's Discord, a civic forum, a candidate-recruitment effort, a volunteer coalition's Slack) has to defend against *all* of these threats at once, using *normal platform tools*, with *volunteer moderators*, on a *small budget*, while doing the actual work it exists for.

This guidebook tries to bridge those traditions for that audience. It isn't a replacement for any of them. Anyone serious about this work should read, at minimum:

1. **"The Tyranny of Structurelessness,"** for the structure mindset.
2. **"Security Culture: A Handbook for Activists,"** for the infiltration mindset.
3. **The TSPA Curriculum,** for the operations mindset.
4. **EFF Surveillance Self-Defense,** for the technical-threat mindset.
5. **Contributor Covenant,** as a baseline code of conduct before you customize.

If this guidebook does its job, it should make those documents *more* useful to you, not less.

### Contributing Back

If you adapt this guidebook, find what works, run into situations it doesn't cover, or develop better approaches, share them back. Sanitized after-action reviews are especially valuable. The communities listed above (Activist Handbook, TSPA, All Tech Is Human) all accept contributions. The patterns in this document aren't anyone's intellectual property. They belong to everyone who has fought to keep a mission-driven group alive.

The goal isn't for this guidebook to be definitive. The goal is for the next person who needs it to have something to start from.

---

## Closing

Building a group that can change things is harder than it looks. Most of the work is invisible: the quiet containment, the patient documentation, the unglamorous mod conversations, the slow building of trust that's earned rather than assumed. The visible drama (the bans, the controversies, the dramatic exits) is the smallest part of the job.

If you're doing this work, you're doing something valuable. The world needs more change-making groups that don't collapse under their own weight or get picked apart by people who showed up to break things. It also needs more people who, when their first group gets attacked, don't conclude that organizing is hopeless and walk away. Most of the time, what stands between someone trying again and someone giving up for good is knowing what they're seeing and what to do about it.

That's what this document is for. If it helps one person stay in the fight who would otherwise have quit, it was worth writing.

**Be firm. Be consistent. Verify everyone, including yourselves. Protect the mission.** The group will thank you by becoming the kind of place where real work can actually happen.

---

*The Community Resilience Guidebook, Version {{VERSION}} | Open source. Adapt freely. If you find improvements, share them back into the open pool.*
