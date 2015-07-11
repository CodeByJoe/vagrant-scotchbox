# CodeByJoe Vagrant (based on Scotchbox.io)
This is a base vagrant package with NFS shares and permissions ready for Mac OSX Magento development.

## Requirements
Vagrant with bindfs plugin installed:

```
vagrant plugin install vagrant-bindfs
```

## File structure
Copy the Vagrantfile, Vagrantfile.sh and bootstrap.sh in to the root of your project. Your web files should be in a sub-folder 'public'.

<pre>
|-- Project Root
    |-- public
        |-- app
        |-- index.php
    |-- bootstrap.sh
    |-- Vagrantfile
    |-- Vagrantfile.sh
</pre>

## Configuration
- Required: Change the IP address and Hostname in Vagrantfile as you like for each project.
- Optional: You can also increase or decrease the memory allocation, I recommend 1024M.

## Usage
As with any Vagrant project, CD in to your Project Root and type:

```
vagrant up
```

## Performance
The MySQL and PHP tweaks, together with NFS shares, mean for a pretty rapid Magento instance (full install in 9 seconds). The Vagrant is optimised for Magento but can be used as a base for any project, I have had success with Symfony2, Wordpress, Drupal and Laravel projects.