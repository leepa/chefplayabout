# Example Chef / Vagrant application

> Or, what happens when Lee wants to have a play ground to learn things in (in this case Chef)

There be dragons! I've literally never touched Chef before I made this. I've likely made lots of noob errors that I'll come back and correct at some point.

## Technologies (stuff needed to be installed)

* Vagrant 1.8.1
* Virtualbox
* ChefDK (Chef 0.12.0, Berkshelf 4.3.0)
* Berkshelf plugin (see below)

```
➜  ~ vagrant plugin install vagrant-vbguest
➜  ~ vagrant plugin install vagrant-berkshelf
```

## Usage

* Clone repo
* `vagrant up`

You will then be able to go to http://192.186.133.5 and you'll see:

```
➜  ~ curl http://192.168.133.5
Hi there, I'm served from worker-1!
➜  ~ curl http://192.168.133.5
Hi there, I'm served from worker-2!
➜  ~ curl http://192.168.133.5
Hi there, I'm served from worker-1!
➜  ~ curl http://192.168.133.5
Hi there, I'm served from worker-2!
➜  ~ curl http://192.168.133.5
Hi there, I'm served from worker-1!
```

You can use typical vagrant commands but, you can also go ahead and change the count of workers you want (if you want to wait for them to be made).
