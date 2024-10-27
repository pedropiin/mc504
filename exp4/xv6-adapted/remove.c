#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

void remove_recursive(char *path);

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf(2, "Usage: remove <file|directory>\n");
        exit();
    }
    
    for (int i = 1; i < argc; i++) {
        struct stat st;
        
        if (stat(argv[i], &st) < 0) {
            printf(2, "remove: cannot stat %s\n", argv[i]);
            continue;
        }
        
        if (st.type == T_FILE) {
            if (unlink(argv[i]) < 0) {
                printf(2, "remove: failed to delete file %s\n", argv[i]);
            }
        } else if (st.type == T_DIR) {
            remove_recursive(argv[i]);
            if (unlink(argv[i]) < 0) {
                printf(2, "remove: failed to delete directory %s\n", argv[i]);
            }
        } else {
            printf(2, "remove: unknown type %s\n", argv[i]);
        }
    }
    
    exit();
}

void remove_recursive(char *path) {
    int fd;
    struct dirent de;
    struct stat st;
    char buf[512], *p;

    // Open the directory
    if ((fd = open(path, 0)) < 0) {
        printf(2, "remove: cannot open directory %s\n", path);
        return;
    }

    // Read each directory entry
    while (read(fd, &de, sizeof(de)) == sizeof(de)) {
        if (de.inum == 0) continue;

        // Skip "." and ".." to avoid infinite recursion
        if (strcmp(de.name, ".") == 0 || strcmp(de.name, "..") == 0) continue;

        // Construct the full path
        snprintf(buf, sizeof(buf), "%s/%s", path, de.name);

        // Get file status
        if (stat(buf, &st) < 0) {
            printf(2, "remove: cannot stat %s\n", buf);
            continue;
        }

        if (st.type == T_FILE) {
            if (unlink(buf) < 0) {
                printf(2, "remove: failed to delete file %s\n", buf);
            }
        } else if (st.type == T_DIR) {
            // Recursively remove directory contents
            remove_recursive(buf);
            if (unlink(buf) < 0) {
                printf(2, "remove: failed to delete directory %s\n", buf);
            }
        }
    }

    close(fd);
}