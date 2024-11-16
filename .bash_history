ls -l
mkdir repogit
ls -l
cd repogit/
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
./UTN-FRA_SO_Examenes/202406/script_Precondicion.sh
source  ~/.bashrc  && history -a
ls -l
sudo apt update
sudo apt install ansible
sudo apt list --installed | grep ansible
ssh-keygen -t ed25519
pwd
cd ..
pwd
ls -la
cd .ssh/
ls -l
cat id_ed25519.pub >> authorized_keys 
cat authorized_keys 
cd ..
pwd
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
sudo usermod -a -G docker $(whoami)
grep docker /etc/group
exit
id
ls -l
mv ~/RTA_Examen_20241116 ~/repogit/
ls -l
cd repogit/
ls -l
cd RTA_Examen_20241116/
ls -l
VIM Punto_A.sh 
vim Punto_A.sh 
ls -l
cd ..
ls -l
cd UTN-FRA_SO_Examenes/
ls -l
cd 202406/
ls -l
cd docker
ls -l
vim index.html
docker login -u evelyneduards
docker build -t evelyneduards/web1:latest . 
ls -l
cat index.html
ls -l
find . -name "Dockerfile"
sudo find / -name "Dockerfile"
ls -l
vim Dockerfile
ls -l
docker build -t evelyneduards/web1:latest .
docker image list
docker push evelyneduards/web1 
cd ..
ls -l
cd ..
ls -l
RTA_Examen_20241116/
cd RTA_Examen_20241116/
ls -l
cd ..
ls -l
mv ~/repogit/UTN-FRA_SO_Examenes/202406/docker ~/RTA_Examen_20241116/
ls -l
cd RTA_Examen_20241116/
ls -l
cd ..
ls -l
mv ~/repogit/UTN-FRA_SO_Examenes/202406/docker ~/RTA_Examen_20241116/
ls -l ~/repogit/UTN-FRA_SO_Examenes/202406/
find ~/repogit -name "docker"
ls -l
cd RTA_Examen_20241116/
ls -l
ls -l ~/repogit/RTA_Examen_20241116/
find ~/repogit/RTA_Examen_20241116 -name "docker"
mv ~/repogit/UTN-FRA_SO_Examenes/202406/docker ~/repogit/RTA_Examen_20241116/
cd ..
ls -l
rm rm -rf ~/repogit/UTN-FRA_SO_Examenes/
ls -l ~/repogit/
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
ls -l
cd UTN-FRA_SO_Examenes/
ls -l
cd 202106/
cd 202406/
ls -l
cd docker
ls -l
vim index.html 
cd ..
ls -l
cd ..
ls -l
cd RTA_Examen_20241116/
LS -L
ls -l
mv ~/repogit/UTN-FRA_SO_Examenes/202406/docker ~/repogit/RTA_Examen_20241116/
ls -l ~/repogit/UTN-FRA_SO_Examenes/202406/
ls -l ~/repogit/RTA_Examen_20241116/
cd docker/
ls -l
vim index.html 
vim Dockerfile 
docker build -t evelyneduards/web1:latest . 
docker image list
docker push evelyneduards/web1 web1:latest
docker push evelyneduards/web1:latest
ls -l
touch run.sh
vim run.sh
chmod +x run.sh
cd ..
cat inventory
vagrant ssh-config
sudo vagrant ssh-config
cd ..
ip a
ls -l
cd RTA_Examen_20241116/
ls -l
cd docker/
ls -l
./run.sh 
ls -l
cat Dockerfile 
cat index.html 
ls -l
cd ..
ls -l
vim Punto_C.sh 
ls -l
cd ..
ls -l
cd UTN-FRA_SO_Examenes/
ls -l
cd 202406
ls -l
cd ..
ls -l
cd ..
ls -l
mv ~/repogit/UTN-FRA_SO_Examenes/202406 ~/repogit/
ls -l
cd 202406/
ls -l
cd ansible/
ls -l
cd ..
ls -l
cd ..
ls -l
cd ..
ls -l
ls -la
cd .ssh/
ls -l
cat authorized_keys 
cd ..
ls -l
cd repogit/
ls -l
cd RTA_Examen_20241116/
ls -l
cd ..
ls -l
cd 202406/
ls -l
cd ansible/
ls -l
mkdir -p /tmp/2do_parcial/alumno /tmp/2do_parcial/equipo
tree
apt install tree
sudo apt install tree
tree
ls -l
ls -l /tmp/2do_parcial/
ls -l /tmp/
ls -l
cd roles/
ls -l
cat 2do_parcial/
cd 2do_parcial/
ls -l
cd tasks/
ls -l
cat main.yml 
cd ..
ls -l
cd ..
ls -l
ls -l 
cd ..
ls -l
cd roles/
ls -l
cd 2do_parcial/
ls -l
cd tasks/
ls -l
vim main.yml 
cd ..
ls -l
mkdir templates
}
mkdir templates
ls -la
cd templates/
vim datos_alumno.txt.j2
vim datos_equipo.txt.j2
ls -l
cd ..
ls -l
cd tasks
ls -l
vim main.yml 
cd ..
vim playbook.yml
ansible-playbook -i localhost, playbook.yml
ls -la
cd playbook.yml
cat playbook.yml 
ls -la
vim playbook.yml 
ansible-playbook -i localhost, playbook.yml
ls -l
cd roles/
ls -l
cd 2do_parcial/
ls -l
cd tasks/
ls -l
vim main.yml 
cd ..
ansible-playbook -i localhost, playbook.yml
ls -l
cd roles/
ls -l
cd 2do_parcial/
ls -l
cd tasks/
ls -l
vim main.yml 
cd ..
ansible-playbook -i localhost, playbook.yml
cd ..
ls -l
cd RTA_Examen_20241116/
ls -l
vim Punto_D.sh 
cat /etc/group | grep sudo
cat /etc/group | grep 2PSupervisores
ls -l
cd ..
ls -l
cd 202406/
ls -l
cd ansible/
ls -l
cd roles/
ls -l
cd 2do_parcial/
ls -l
cd tasks/
ls -l
vim main.yml 
cd ..
ansible-playbook -i localhost, playbook.yml
ls -l
cd roles/
ls -l
cd 2do_parcial/
cd tasks/
ls -l
vim main.yml 
ansible-playbook -i localhost, playbook.yml
cd ..
ansible-playbook -i localhost, playbook.yml
ls -l
vim playbook.yml 
ansible-playbook -i localhost, playbook.yml
sudo cat /etc/sudoers | grep 2PSupervisores
cd ..
ls -l
cd RTA_Examen_20241116/
ls -l
cd ..
ls -l
cd 202406/
ls -l
cd ansible/
ls -l
cd roles/
ls -l
cd 2do_parcial/
cd tasks/
ls -l
cat main.yml 
cd ..
ls -l
cd RTA_Examen_20241116/
ls -l
vim Punto_D.sh 
cd ..
ls -l
mv ~/repogit/RTA_Examen_20241116/docker ~/repogit/202406/
ls -l ~/repogit/202406/
cd ..
ls -l
cd repogit/
ls -l
git clone https://github.com/EvelynEduards/UTNFRA_SO_2do_Parcial_Eduards.git
ls -l
cp -r ~/repogit/202406 ~/repogit/UTNFRA_SO_2do_Parcial_Eduards/
cp -r ~/repogit/RTA_Examen_20241116 ~/repogit/UTNFRA_SO_2do_Parcial_Eduards/
cd UTNFRA_SO_2do_Parcial_Eduards/
ls -l
cd ..
history -a
ls -l
cp ~/.bash_history ~/repogit/UTNFRA_SO_2do_Parcial_Eduards/
ls -l ~/repogit/UTNFRA_SO_2do_Parcial_Eduards/
history -a
cp ~/.bash_history ~/repogit/UTNFRA_SO_2do_Parcial_Eduards/
ls -l ~/repogit/UTNFRA_SO_2do_Parcial_Eduards/
echo $HISTFILE
ls
pwd
whoami
history -a
cat ~/.bash_history
