# COMP 361 Project

## What is this project?
As a group of 7 people, we developed an online version of _Splendor_, a famous broad game. The backend server was implemented using Spring Boot framework, 
and we used JavaFX as our frontend framework. 
The game is deployed on a [lobby service](https://github.com/m5c/LobbyService), developed by the course instructor: [Maximilian Schiedermeier](https://github.com/m5c).

## How to run everything by yourself (server and client)
### Prerequisites
1. Make sure you have [maven](https://maven.apache.org/download.cgi) installed on your machine. It is required to run
the client.
2. Download and install [docker desktop](https://www.docker.com/) so that you can run the server and database in some isolated containers.
3. Due to copy right issue, we can not upload the game assets of the original game in this repository, thus you must download it
from [here](https://drive.google.com/drive/folders/1_qFamQnAU4fEEZqE0P-e6zrqeNkG2nRD). Download the folder `pictures` and
store it somewhere on your machine. We will put it in the right place afterwards.

### Server
Let's start with the setting up the servers and database using `docker`:

#### docker compose up
Follow the steps by typing the command into your `terminal` (`cmd` if you are using windows)
1. git clone this [repository](https://github.com/RuoyuDeng/M8-Docker-BGP.git) by typing: `git clone https://github.com/RuoyuDeng/M8-Docker-BGP.git`
2. Then you cd into the directory: `cd M8-Docker-BGP`
3. Run the update submodules script
   1. For mac/linux, type: `./updatesubmodules.sh`
   2. For windows, you can first open the folder in explorer, and then right-click on the file `updatesubmodules.ps1`,
   in the prompt, click `run with powershell`.
4. After that, type: `docker compose up`
   > make sure you have docker desktop up and running before typing this
5. Wait for around 2-3 minutes (max), then you should have the `Lobby Server` and `Game Server` both running on your machine.
#### Alternative Approach after docker compose up (for developer)
After you have build the `docker images`, you can choose to run the `database` inside the container and the `Lobby Service` and `Game Server`
outside of the container. This approach is usually taken when you feel like customizing and modifying the game server or lobby server by yourself frequently 
during game play (not recommended for gamers).
1. Make sure you have the container `BGP-Database` created from previous `docker compose up` running. You can do so through the dashboard of the docker desktop application. 
2. `cd M8-Docker-BGP/LobbyService`, and then type: `mvn clean spring-boot:run`
3. Go back to the root folder: `M8-Docker-BGP`, then type: `cd f2022-hexanome-08/server`. Start the server by typing: `mvn clean spring-boot:run`
4. Despite several more steps, you have achieved the same goal as above approach.

Now, you should have the backend servers ready, let's see how to run the client.
### Client
We have not yet configured a way to package our frontend code to a `jar` file so that
it can be played cross-platform by simply double-clicking on one file. So the only way to
run the client (frontend) is use mvn: `mvn clean javafx:run`. Note that according to how the server is deployed, you might need to change the client
configuration a bit.
1. Remember the `pictures` folder that you downloaded as part of the prerequisite? Now let's put it in the right place, which is under:
   `M8-Docker-BGP/f2022-hexanome-08/client/src/main/resources/project/pictures`
2. Now depending on how you started your server and how exactly you want to play this game, there is some configuration details you need to do. If you want to:
   1. Play with your friends under a same WI-FI:
      1. Find the json configuration file: `M8-Docker-BGP/f2022-hexanome-08/client/connectionConfig.json`, the default content is:
      ```
      {
      "defaultUserName": "ruoyu", 
      "defaultPassword": "abc123_ABC123", 
      "useDefaultUserInfo": "true",
      "hostIp": "76.66.139.161",
      "useLocalHost": "false"
      }
      ```
   2. Change the value of `hostIp` to the IP of which your machine that runs the servers.
      > For mac user, you can do so by `ipconfig getifaddr en0` in your terminal. For example, you got 10.111.111.111 as your IP, then you need to change this configuration file in all the client applications: `"hostIp": "10.111.111.111"`,
   2. Play with your friends under different WI-FI:
      1. [Port-forwarding](https://www.hellotech.com/guide/for/how-to-port-forward#:~:text=To%20forward%20ports%20on%20your%20router%2C%20log%20into%20your%20router,you%20might%20have%20to%20upgrade.) your local host so that you can play the game with your friends under different WI-FI.
      2. Say the IP you got after port-forwarding is: `http://33.23.123.456/`, then similarly, you will need to replace `hostIp` to `"33.23.123.456"`, which is your own server IP after port-forwarding.
3. Now you have configured the client IP correctly, we are just one command line away from playing! Now type: `cd M8-Docker-BGP/f2022-hexanome-08/client` 
4. Lastly, type: `mvn clean javafx:run`, and you should be able to see the game running!

### I just want to play the game (client)
You could've skipped all the steps mentioned above if you just want to play some game ASAP. Follow the steps below:
1. Remember the `pictures` folder that you downloaded as part of the prerequisite? Now let's put it in the right place, which is under:
`M8-Docker-BGP/f2022-hexanome-08/client/src/main/resources/project/pictures`
2. Open your terminal or cmd, type: `cd M8-Docker-BGP/f2022-hexanome-08/client`
3. Then, type: `mvn clean javafx:run` to start the game!


### Lastly, Log-in Account Management
As you have noticed, we have provided you a default admin account to start the game with. For the very first time that you log in, you can use this account to add more accounts as you go.
Afterwards, you can change `"defaultUserName"` and `"defaultPassword"` to your own account information. The flag value: `"useDefaultUserInfo": "true"` enables that your password and username
being pre-filled for you (save some time) when you log in. If you do not like this feature, then you can simply change it to "false": `"useDefaultUserInfo": "false"`


**_Congrats! You have finished all the steps you needed to play the game (a bit long, I admit). Now it's time to gather some friends around, and start playing!_**
