# Image Update Between Two Registries

This repo is for Updating Docker image between two registries using shell script.

## How to Use

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