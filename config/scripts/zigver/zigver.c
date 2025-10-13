#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* getZlsPath() {
  char* targetPath = "/Downloads/zls";
  char* homeDir = getenv("HOME");
  if (!homeDir) {
    fprintf(stderr, "Couldn't find home directory");
    exit(1);
  }

  size_t pathLen = strlen(homeDir) + strlen(targetPath) + 1;
  char* zlsPath = malloc(pathLen);
  if (!zlsPath) {
    perror("Failed to allocate memory");
    exit(1);
  }
  snprintf(zlsPath, pathLen, "%s%s", homeDir, targetPath);
  return zlsPath;
}

int main(int argc, char* argv[]) {
  char* zlsPath = getZlsPath();

  char* latestZigVersion = "0.15.0-dev.1145+3ae0ba096";
  char* backupZigVesion = "0.14.0";

  char* chosenBranch = "";
  char* chosenVersion = "";

  if (argc > 1 && strcmp(argv[1], "old")) {
    chosenBranch = backupZigVesion;
    chosenVersion = backupZigVesion;
  } else if (argc > 1) {
    chosenBranch = argv[1];
    chosenVersion = argv[1];
  } else {
    chosenBranch = "master";
    chosenVersion = latestZigVersion;
  }

  const char* format = "cd %s && git checkout %s && zigup %s && zig build -Doptimize=ReleaseSafe";
  size_t commandLen = snprintf(NULL, 0, format, zlsPath, chosenBranch, chosenVersion) + 1;

  char* command = calloc(commandLen, sizeof(char));
  if (!command) {
    perror("Failed to allocate command");
    free(zlsPath);
    free(command);
    exit(1);
  }

  snprintf(
    command,
    commandLen,
    format,
    zlsPath, chosenBranch, chosenVersion
  );
  printf("Running: '%s'\n\n", command);
  int result = system(command);

  if (result != 0) {
    fprintf(stderr, "Failed to execute command, exited with code %d\n", result);
  } else {
    printf("Zig and Zls updated to version %s\n", chosenVersion);
  }

  free(zlsPath);
  free(command);
  return 0;
}
