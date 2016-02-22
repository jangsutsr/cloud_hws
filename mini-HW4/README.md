# Mini-HW4: Elastic Infrastructure (ELB, Auto-Scale)  

You would use ELB and Auto-Scale to create an Elastic infrastructure. You could use UI, CLI or programming to accomplish this. The process is similar to what we discussed in the class. 

1. Create a ELB and configure Auto-Scale with the policy rules and configuration details in the slides. You need not choose exact names, parameters etc. You need to show that you have a ELB that is attached to a group and inside the group you have scaling policy. When CPU Util > 60%, it adds a new VM.

2. I recommend doing this using CLI. You may want to run a script inside the VM1 to generate load so that auto-scale adds another VM when CPU Util > 60%.

3. You submit the CLI files and/or any screen shots. 
