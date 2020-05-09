# Image Update Between Two Registries

This repo is for Updating Docker image between two registries using shell script.

## How to Use

### Preperation

Before running, set `registry.config`. `pull_registry` writes the registry address to get the image, `push_registry` writes the image registry address to update. For example:  
```bash
pull_registry=192.xxx.xxx.xxx
push_registry=192.yyy.yyy.yyy
```  

### Usage

run `updateImage.sh` script. `all` and `img` are the execution factors. `all` is used to start Updating all Image, next is used to continue learning. For example:  
```bash
$ ./updateImage.sh
usage:
   ./updateImage.sh all
   ./updateImage.sh img hyperdata8.3_hd
```  

**all**: For example,   
```bash
$ ./updateImage.sh all
```  

**img**: Enter the image name. For example,  
```bash
$ ./updateImage.sh img
[PULL REGISTRY] 192.xxx.xxx.xxx
[PUSH REGISTRY] 192.yyy.yyy.yyy
Enter the image name :
```

---
made by *jaejun.lee*