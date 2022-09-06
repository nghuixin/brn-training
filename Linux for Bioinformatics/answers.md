### Answers to Linux for Bioinformatics training req

- **Q1**. What is your home directory?  
```/home/ubuntu```

- **Q2**. What is the output of this command?  
```hello_world.txt```

- **Q3**. What is the output of each ls command?    
No output for ls my_folder
hello_world.txt for ls my_folder2

- **Q4**. What is the output of each?  
```ls my_folder my_folder2 my_folder3 
my_folder:
my_folder2:
my_folder3:
hello_world.txt
```

- **Q5**. What editor did you use and what was the command to save your file changes?
n

- **Q6**. What is the error?  
```Server refused our key
No supported authentication methods available (server sent: publickey)
```

- **Q7**. What was the solution?  
I followed instructions here: https://aws.amazon.com/premiumsupport/knowledge-center/new-user-accounts-linux-instance/
Essentially, I created a .ssh directory in the new sudouser home directory
and used chmod to 700 which allows sudouser to read, write and open the .ssh directiory.
Next I created the authorized_keys file and copied the public key displayed when I ran  ```ssh-keygen -y -f brn_training_ubuntu.pem``` on my local computer. brn_training_ubuntu.pem is the key pair file I had created earlier to connect to my EC2 instance.

- **Q8**. what does the sudo docker run do?    
sudo docker run runs the command 'docker run' using root privileges.
The docker run part of the command creates a container layer over an image and then starts container.
According to the commands list, salmon swim
performs super-secret operation

- **Q9**. What is the output of this command?  
sudo ls /root returns the output:
serveruser is not in the sudoers file. This incident will be reported.

- **Q10**. What is the output of flask --version?  
```Python 3.9.12
Flask 2.1.3
Werkzeug 2.0.3
```
- **Q11**. What is the output of mamba -V?  
```conda 4.14.0```

- **Q12**. What is the output of which python?  
After running ```mamba create -n salmonEnv=1.4.0 -c bioconda -c conda-forge``` and then ```mamba activate salmonEnv```. we get the output:  
```/home/serveruser/miniconda3/envs/py27/bin/python```

- **Q13**. What is the output of which python now?  
```/home/serveruser/miniconda3/bin/python```

- **Q14**. What is the output of salmon -h?  
```salmon v1.4.0
Usage: salmon -h|--help or
    salmon -v|--version or
    salmon -c|--cite or
    salmon [--no-version-check] <COMMAND> [-h | options]
Commands:
   index   : create a salmon index
   quant   : quantify a sample
   alevin  : single cell analysis
   swim   : perform super-secret operation
   quantmerge : merge multiple quantifications into a single file
```

- **Q15**. What does -o athal.fa.gz do?
```-o denotes the name the output file should be saved as.```

- **Q16**. What is a .gz file?  
Files affixed with the `.gz` extension are called Gnu zipped archive files, and a `.gz` file is implemented with encoding specifications and compression standards developed

- **Q17**. What does the `zcat` command do?  
It is used to view the contents of a compressed file without literally uncompressing it.

- **Q18**. what does the `head` command do?  
`head` command enables us to print/display the first `n` number of lines.

- Q19. what does the number `100` signify in the command?  
`100` is the number of lines displayed. 

- **Q20**. What is `|` doing? -- Hint using | in Linux is called "piping".  
The Pipe command is used to transfer the output of a command to another command. In other words the output of one command will act as input to another command, and this command output will act as input to the subsequent command.  

- **Q21**. What is a .`fa` file? What is this file format used for?  
`.fa` stands for FASTA Formatted Sequence File. This file extension is typically used for a special FASTA DNA format.

-  **Q22**. What format are the downloaded sequencing reads in?
SRR074122.sra is the downloaded file, and it is in `.sra` format. SRA is the native archive format for the INSDC SRA. 

- **Q23**. What is the total size of the disk? Q24. How much space is remaining on the disk?  
```/dev/root   7.6G 5.1G 2.5G 68% /```  
The total size of disk is 7.6G, and there is only 2.5G remaining.

-  **Q25**. What went wrong?  
The error produced is   ```storage exhausted while writing file within file system module```
This is due to the fact that FASTQ files are pure ASCII and very large, and there is not enough disk space.  

- **Q26**: What was your solution? Hint: consider Q16.  
In order to solve that problem, I used the following comamnd:
(base) serveruser@ip-172-31-28-63:~$ ```parallel-fastq-dump --sra-id SRR074122 --threads 8 --split-files --gzip```
```parallel-fastq-dump``` is a wrapper to ```fastq-dump```, which makes it run parallelly. By doing so, it splits the file based on number of threads, which is 8 here, and runs fastq-dump parallelly. The results are concatanated after each thread is done. The  `--gzip` option is important here because it compresses the output using gzip. This reduces the space taken up on the disk. 
